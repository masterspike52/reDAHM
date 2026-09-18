#!/usr/bin/env python3
"""
Xenos (Xbox 360 GPU) shader microcode disassembler.

Reads the raw shader containers produced by tools/dump_shaders.py and prints the
control-flow program, ALU instructions and fetch instructions in a readable
form, so the microcode can be translated to HLSL by hand.

Encoding notes (all verified against the 3921 shaders extracted from this game,
see the invariant checks in the repo notes):

  * The container header is 9 big-endian u32s; microcode lives at
    container[virtualSize + Shader.physicalOffset ..][Shader.size], and its
    length is always a multiple of 12 (96-bit instruction slots).
  * Each 3-dword slot holds either two 48-bit control-flow instructions,
    one ALU instruction, or one fetch instruction.
      cf0 = dw0 | ((dw1 & 0xFFFF) << 32)
      cf1 = (dw1 >> 16) | (dw2 << 16)
    CF opcode is bits 44..47.  Confirmed: every shader terminates in an
    EXEC_END, every vertex shader ALLOCs position(1) and interpolators(2),
    every pixel shader ALLOCs colors(2).
  * ALU dword order is forward (dw0 = word0).  Confirmed: vertex shaders
    export to dest 62 (position) exactly once each, pixel shaders export only
    to 0..3 (oC0..oC3) and 61 (oDepth).

Usage:
    python tools/xenos_disasm.py <shader.bin> [...]
    python tools/xenos_disasm.py --dir shaders/ps --limit 20
"""

from __future__ import annotations

import argparse
import glob
import os
import struct
import sys

# --- control flow ----------------------------------------------------------

CF_NAMES = {
    0: "nop", 1: "exec", 2: "exec_end", 3: "cond_exec", 4: "cond_exec_end",
    5: "cond_pred_exec", 6: "cond_pred_exec_end", 7: "loop_start",
    8: "loop_end", 9: "cond_call", 10: "return", 11: "cond_jmp",
    12: "alloc", 13: "cond_exec_pred_clean", 14: "cond_exec_pred_clean_end",
    15: "mark_vs_fetch_done",
}
CF_EXEC = {1, 2, 3, 4, 5, 6, 13, 14}
CF_END = {2, 4, 6, 14}
ALLOC_TYPE = {0: "none", 1: "position", 2: "interpolators/colors", 3: "memory"}

# --- ALU opcodes -----------------------------------------------------------

VECTOR_OPS = {
    0: "add", 1: "mul", 2: "max", 3: "min", 4: "seq", 5: "sgt", 6: "sge",
    7: "sne", 8: "frc", 9: "trunc", 10: "floor", 11: "mad", 12: "cndeq",
    13: "cndge", 14: "cndgt", 15: "dp4", 16: "dp3", 17: "dp2add", 18: "cube",
    19: "max4", 20: "setp_eq_push", 21: "setp_ne_push", 22: "setp_gt_push",
    23: "setp_ge_push", 24: "kill_eq", 25: "kill_gt", 26: "kill_ge",
    27: "kill_ne", 28: "dst", 29: "maxa",
}
SCALAR_OPS = {
    0: "adds", 1: "adds_prev", 2: "muls", 3: "muls_prev", 4: "muls_prev2",
    5: "maxs", 6: "mins", 7: "seqs", 8: "sgts", 9: "sges", 10: "snes",
    11: "frcs", 12: "truncs", 13: "floors", 14: "exp", 15: "logc", 16: "log",
    17: "rcpc", 18: "rcpf", 19: "rcp", 20: "rsqc", 21: "rsqf", 22: "rsq",
    23: "maxas", 24: "maxasf", 25: "subs", 26: "subs_prev", 27: "setp_eq",
    28: "setp_ne", 29: "setp_gt", 30: "setp_ge", 31: "setp_inv",
    32: "setp_pop", 33: "setp_clr", 34: "setp_rstr", 35: "kills_eq",
    36: "kills_gt", 37: "kills_ge", 38: "kills_ne", 39: "kills_one",
    40: "sqrt", 42: "mulsc", 43: "mulsc", 44: "addsc", 45: "addsc",
    46: "subsc", 47: "subsc", 48: "sin", 49: "cos", 50: "retain_prev",
}
# Vector ops that only consume src1/src2 (src3 unused) -- for pretty printing.
VECTOR_SRC_COUNT = {11: 3, 12: 3, 13: 3, 14: 3, 17: 3}

COMPS = "xyzw"


def export_name(dest: int, is_pixel: bool) -> str:
    if is_pixel:
        if dest <= 3:
            return f"oC{dest}"
        if dest == 61:
            return "oDepth"
        return f"oEXP{dest}"
    if dest == 62:
        return "oPos"
    if dest == 63:
        return "oPointSize"
    return f"oI{dest}"


def swizzle_vector(swiz: int, mask: int) -> str:
    """Vector source swizzle: 2 bits per component, added to the component index."""
    out = []
    for i in range(4):
        if not (mask >> i) & 1:
            continue
        sel = (swiz >> (i * 2)) & 3
        out.append(COMPS[(sel + i) & 3])
    return "".join(out) or "____"


def swizzle_scalar(swiz: int) -> str:
    """Scalar source: component index is ((swiz >> 6) + 3) & 3."""
    return COMPS[((swiz >> 6) + 3) & 3]


def mask_str(mask: int) -> str:
    return "".join(COMPS[i] for i in range(4) if (mask >> i) & 1) or "_"


def src_str(sel: int, reg: int, swiz: int, negate: int, abs_const: int,
            scalar: bool = False) -> str:
    """sel: 1 = temp register, 0 = constant register."""
    idx = reg & 0x3F
    if sel:
        base = f"r{idx}"
    else:
        base = f"c{reg & 0xFF}"
    sw = swizzle_scalar(swiz) if scalar else swizzle_vector(swiz, 0xF)
    text = f"{base}.{sw}"
    if not sel and abs_const:
        text = f"|{text}|"
    if negate:
        text = f"-{text}"
    return text


class Shader:
    def __init__(self, path: str):
        self.path = path
        self.data = open(path, "rb").read()
        (self.flags, self.virtual_size, self.physical_size, self.field0c,
         self.ct_off, self.def_off, self.shader_off, _a, _b) = struct.unpack_from(
            ">9I", self.data, 0)
        (self.phys_off, self.code_size, self.field8, self.fieldc, self.field10,
         self.interp_info) = struct.unpack_from(">6I", self.data, self.shader_off)
        self.is_pixel = (self.flags & 0xFF) == 0
        start = self.virtual_size + self.phys_off
        code = self.data[start:start + self.code_size]
        self.dwords = list(struct.unpack(">%dI" % (len(code) // 4), code))
        self.slots = len(self.dwords) // 3

    # -- constant table ----------------------------------------------------
    def constants(self):
        base = self.ct_off + 4
        size, creator, version, n_const, const_info, _flags, target = struct.unpack_from(
            ">7I", self.data, base)
        out = []
        for i in range(n_const):
            off = base + const_info + i * 20
            name_off, reg_set, reg_index, reg_count, _ti, _d = struct.unpack_from(
                ">IHHHHI", self.data, off)
            end = self.data.find(b"\x00", base + name_off)
            out.append((self.data[base + name_off:end].decode("latin-1"),
                        reg_set, reg_index, reg_count))
        def cstr(o):
            e = self.data.find(b"\x00", base + o)
            return self.data[base + o:e].decode("latin-1")
        return cstr(target), out

    # -- control flow ------------------------------------------------------
    def cf_instructions(self):
        out = []
        for s in range(self.slots):
            d0, d1, d2 = self.dwords[s * 3:s * 3 + 3]
            out.append(d0 | ((d1 & 0xFFFF) << 32))
            out.append((d1 >> 16) | (d2 << 16))
        return out

    def disassemble(self) -> str:
        lines = []
        target, consts = self.constants()
        lines.append(f"; {os.path.basename(self.path)}")
        lines.append(f"; target={target} flags=0x{self.flags:08X} "
                     f"slots={self.slots} codeSize={self.code_size}")
        if not self.is_pixel:
            n_interp = (self.interp_info >> 5) & 0x1F
            lines.append(f"; interpolators={n_interp}")
        else:
            lines.append(f"; svPos register={(self.fieldc >> 8) & 0xFF}")
        if consts:
            lines.append("; constants:")
            for name, rset, ridx, rcount in consts:
                kind = {0: "bool", 1: "int4", 2: "float4", 3: "sampler"}.get(rset, f"set{rset}")
                lines.append(f";   {name:<40} {kind} c{ridx}"
                             + (f"..c{ridx + rcount - 1}" if rcount > 1 else ""))
        lines.append("")

        alu_slots = {}
        fetch_slots = {}
        cfs = self.cf_instructions()
        for i, cf in enumerate(cfs):
            op = (cf >> 44) & 0xF
            name = CF_NAMES[op]
            if op == 12:
                atype = (cf >> 41) & 3
                lines.append(f"{i:04d}  alloc {ALLOC_TYPE[atype]} size={cf & 7}")
            elif op in CF_EXEC:
                addr = cf & 0xFFF
                count = (cf >> 12) & 7
                seq = (cf >> 16) & 0xFFF
                lines.append(f"{i:04d}  {name} addr={addr} count={count} seq=0x{seq:03X}")
                for k in range(count):
                    slot = addr + k
                    if (seq >> (k * 2)) & 1:
                        fetch_slots[slot] = True
                    else:
                        alu_slots[slot] = True
            elif op == 11:
                lines.append(f"{i:04d}  cond_jmp addr={cf & 0xFFF} "
                             f"bool=b{(cf >> 20) & 0xFF} cond={(cf >> 28) & 1}")
            elif op in (7, 8):
                lines.append(f"{i:04d}  {name} loop={(cf >> 32) & 0x1F} addr={cf & 0xFFF}")
            elif op == 0:
                continue
            else:
                lines.append(f"{i:04d}  {name} raw=0x{cf:012X}")
            if op in CF_END:
                break
        lines.append("")

        for slot in sorted(set(alu_slots) | set(fetch_slots)):
            if slot * 3 + 3 > len(self.dwords):
                continue
            w0, w1, w2 = self.dwords[slot * 3:slot * 3 + 3]
            if slot in fetch_slots:
                lines.append(f"  [{slot:03d}] {self.fetch_str(w0, w1, w2)}")
            else:
                lines.extend(f"  [{slot:03d}] {t}" for t in self.alu_str(w0, w1, w2))
        return "\n".join(lines)

    # -- ALU ---------------------------------------------------------------
    def alu_str(self, w0: int, w1: int, w2: int):
        vdest = w0 & 0x3F
        abs_const = (w0 >> 7) & 1
        sdest = (w0 >> 8) & 0x3F
        export = (w0 >> 15) & 1
        vmask = (w0 >> 16) & 0xF
        smask = (w0 >> 20) & 0xF
        vclamp = (w0 >> 24) & 1
        sclamp = (w0 >> 25) & 1
        sop = (w0 >> 26) & 0x3F

        src3_swiz = w1 & 0xFF
        src2_swiz = (w1 >> 8) & 0xFF
        src1_swiz = (w1 >> 16) & 0xFF
        neg3 = (w1 >> 24) & 1
        neg2 = (w1 >> 25) & 1
        neg1 = (w1 >> 26) & 1
        pred_cond = (w1 >> 27) & 1
        predicated = (w1 >> 28) & 1

        src3_reg = w2 & 0xFF
        src2_reg = (w2 >> 8) & 0xFF
        src1_reg = (w2 >> 16) & 0xFF
        vop = (w2 >> 24) & 0x1F
        sel3 = (w2 >> 29) & 1
        sel2 = (w2 >> 30) & 1
        sel1 = (w2 >> 31) & 1

        pred = f" (p{'' if pred_cond else '!'})" if predicated else ""
        out = []

        if vmask:
            dst = (export_name(vdest, self.is_pixel) if export else f"r{vdest}")
            n_src = VECTOR_SRC_COUNT.get(vop, 2)
            srcs = [src_str(sel1, src1_reg, src1_swiz, neg1, abs_const),
                    src_str(sel2, src2_reg, src2_swiz, neg2, abs_const)]
            if n_src == 3:
                srcs.append(src_str(sel3, src3_reg, src3_swiz, neg3, abs_const))
            name = VECTOR_OPS.get(vop, f"vop{vop}")
            out.append(f"{name}{'_sat' if vclamp else ''}{pred} "
                       f"{dst}.{mask_str(vmask)}, " + ", ".join(srcs))
        if smask or (sop != 50 and not vmask):
            dst = (export_name(sdest, self.is_pixel) if export else f"r{sdest}")
            name = SCALAR_OPS.get(sop, f"sop{sop}")
            src = src_str(sel3, src3_reg, src3_swiz, neg3, abs_const, scalar=True)
            out.append(f"{name}{'_sat' if sclamp else ''}{pred} "
                       f"{dst}.{mask_str(smask)}, {src}")
        return out or ["(nop)"]

    # -- fetch -------------------------------------------------------------
    def fetch_str(self, w0: int, w1: int, w2: int) -> str:
        op = w0 & 0x1F
        src_reg = (w0 >> 5) & 0x3F
        dst_reg = (w0 >> 12) & 0x3F
        must_be_one = (w0 >> 19) & 1
        const_index = (w0 >> 20) & 0x1F
        const_sel = (w0 >> 25) & 3
        src_swiz = (w0 >> 30) & 3
        if op == 0:                                   # vertex fetch
            dst_swiz = w1 & 0xFFF
            fmt = (w1 >> 16) & 0x3F
            sign = (w1 >> 14) & 1
            stride = w2 & 0xFF
            offset = (w2 >> 8) & 0x7FFFFF
            comps = "".join(COMPS[(dst_swiz >> (i * 3)) & 7]
                            if ((dst_swiz >> (i * 3)) & 7) < 4 else "_"
                            for i in range(4))
            flag = "" if must_be_one else "  ; WARNING must_be_one=0"
            return (f"vfetch r{dst_reg}.{comps}, r{src_reg}.{COMPS[src_swiz]}, "
                    f"vf{const_index * 3 + const_sel} fmt={fmt} stride={stride} "
                    f"offset={offset}{'' if not sign else ' signed'}{flag}")
        if op == 1:                                   # texture fetch
            dim = {0: "1D", 1: "2D", 2: "3D", 3: "Cube"}.get((w1 >> 9) & 3, "?")
            return (f"tfetch{dim} r{dst_reg}, r{src_reg}.{COMPS[src_swiz]}, "
                    f"tf{const_index * 3 + const_sel}  [raw {w0:08X} {w1:08X} {w2:08X}]")
        return f"fetch op={op} [raw {w0:08X} {w1:08X} {w2:08X}]"


def main(argv=None) -> int:
    ap = argparse.ArgumentParser(description="Disassemble Xenos shader microcode.")
    ap.add_argument("files", nargs="*")
    ap.add_argument("--dir", help="disassemble every .bin in this directory")
    ap.add_argument("--limit", type=int, default=0)
    ap.add_argument("--out", help="write one .txt per shader into this directory")
    args = ap.parse_args(argv)

    paths = list(args.files)
    if args.dir:
        paths += sorted(glob.glob(os.path.join(args.dir, "*.bin")))
    if args.limit:
        paths = paths[:args.limit]
    if not paths:
        ap.error("no input shaders")

    if args.out:
        os.makedirs(args.out, exist_ok=True)
    for path in paths:
        text = Shader(path).disassemble()
        if args.out:
            name = os.path.splitext(os.path.basename(path))[0] + ".txt"
            with open(os.path.join(args.out, name), "w", encoding="utf-8") as fh:
                fh.write(text + "\n")
        else:
            print(text)
            print()
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
