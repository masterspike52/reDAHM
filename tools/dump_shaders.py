#!/usr/bin/env python3
"""
Dump Xbox 360 (Xenos) shader binaries out of the Destroy All Humans! Path of the
Furon UE3 asset packages.

The game ships no shaders inside default.xex; they live in the cooked UE3
packages under KronosGame/CookedXenon as ShaderCache payloads. Those packages
are big-endian UE3 v455/licensee 90, and roughly a third of them are LZO1X
compressed, so the shader containers are not visible to a raw byte scan of the
files on disk.

This script:
  1. reads each package, undoing UE3 compression (fully-compressed wrapper and
     per-chunk COMPRESS_LZO) where present,
  2. scans the decompressed image for Xenos shader containers,
  3. writes each unique container to <out>/vs/ or <out>/ps/ as a .bin,
  4. writes a manifest.json describing every shader and where it came from.

Usage:
    python tools/dump_shaders.py [--assets DIR] [--out DIR] [--filter GLOB]
                                 [--jobs N] [--quiet]

Defaults assume it is run from the repo root.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import fnmatch
import hashlib
import json
import os
import struct
import sys
import time

UE3_TAG = 0x9E2A83C1
SHADER_SIG_MASK = 0xFFFFFF00
SHADER_SIG = 0x102A1100
CTAB_VS = 0xFFFE
CTAB_PS = 0xFFFF

# UE3 ECompressionFlags
COMPRESS_ZLIB = 0x01
COMPRESS_LZO = 0x02
COMPRESS_LZX = 0x04


# ---------------------------------------------------------------------------
# LZO1X decompression (pure Python, no third-party module required)
# ---------------------------------------------------------------------------

def lzo1x_decompress(src: bytes, expected_size: int | None = None) -> bytes:
    """Decompress an LZO1X stream. Mirrors minilzo's lzo1x_decompress."""
    out = bytearray(expected_size) if expected_size else bytearray()
    if expected_size:
        out_len = 0

        def emit_lit(n: int):
            nonlocal ip, out_len
            out[out_len:out_len + n] = src[ip:ip + n]
            ip += n
            out_len += n

        def emit_match(m: int, n: int):
            nonlocal out_len
            if m < 0:
                raise ValueError("LZO match underflow")
            if out_len - m >= n:              # non-overlapping: bulk copy
                out[out_len:out_len + n] = out[m:m + n]
                out_len += n
            else:                             # overlapping: byte-wise
                for _ in range(n):
                    out[out_len] = out[m]
                    out_len += 1
                    m += 1
    else:
        raise ValueError("expected_size is required")

    ip = 0
    t = 0

    first = src[0]
    if first > 17:
        t = first - 17
        ip = 1
        if t < 4:
            state = "match_next"
        else:
            emit_lit(t)
            state = "first_literal_run"
    else:
        state = "top"

    while True:
        if state == "top":
            t = src[ip]; ip += 1
            if t >= 16:
                state = "match"
                continue
            if t == 0:
                while src[ip] == 0:
                    t += 255; ip += 1
                t += 15 + src[ip]; ip += 1
            emit_lit(t + 3)
            state = "first_literal_run"
            continue

        if state == "first_literal_run":
            t = src[ip]; ip += 1
            if t >= 16:
                state = "match"
                continue
            m = out_len - (1 + 0x0800) - (t >> 2) - (src[ip] << 2); ip += 1
            emit_match(m, 3)
            state = "match_done"
            continue

        if state == "match":
            if t >= 64:
                m = out_len - 1 - ((t >> 2) & 7) - (src[ip] << 3); ip += 1
                n = (t >> 5) - 1 + 2
            elif t >= 32:
                t &= 31
                if t == 0:
                    while src[ip] == 0:
                        t += 255; ip += 1
                    t += 31 + src[ip]; ip += 1
                m = out_len - 1 - ((src[ip] >> 2) + (src[ip + 1] << 6)); ip += 2
                n = t + 2
            elif t >= 16:
                m = out_len - ((t & 8) << 11)
                t &= 7
                if t == 0:
                    while src[ip] == 0:
                        t += 255; ip += 1
                    t += 7 + src[ip]; ip += 1
                m -= (src[ip] >> 2) + (src[ip + 1] << 6); ip += 2
                if m == out_len:
                    break                     # end of stream
                m -= 0x4000
                n = t + 2
            else:
                m = out_len - 1 - (t >> 2) - (src[ip] << 2); ip += 1
                emit_match(m, 2)
                state = "match_done"
                continue
            emit_match(m, n)
            state = "match_done"
            continue

        if state == "match_done":
            t = src[ip - 2] & 3
            if t == 0:
                state = "top"
                continue
            state = "match_next"
            continue

        if state == "match_next":
            emit_lit(t)
            t = src[ip]; ip += 1
            state = "match"
            continue

        raise RuntimeError(f"bad LZO state {state!r}")

    if out_len != len(out):
        raise ValueError(f"LZO size mismatch: got {out_len}, expected {len(out)}")
    return bytes(out)


def decompress_blocks(data: bytes, offset: int) -> bytes:
    """Decode a UE3 compressed-block stream (tag, block size, block table, data)."""
    tag, block_size, total_comp, total_uncomp = struct.unpack_from(">4I", data, offset)
    if tag != UE3_TAG:
        raise ValueError(f"bad compressed-block tag 0x{tag:08X} at 0x{offset:X}")
    n_blocks = (total_uncomp + block_size - 1) // block_size
    table_off = offset + 16
    blocks = []
    for i in range(n_blocks):
        c, u = struct.unpack_from(">2I", data, table_off + i * 8)
        blocks.append((c, u))
    cursor = table_off + n_blocks * 8
    out = bytearray()
    for comp_size, uncomp_size in blocks:
        chunk = data[cursor:cursor + comp_size]
        cursor += comp_size
        if comp_size == uncomp_size:          # stored verbatim
            out += chunk
        else:
            out += lzo1x_decompress(chunk, uncomp_size)
    if len(out) != total_uncomp:
        raise ValueError(f"block stream size mismatch: {len(out)} != {total_uncomp}")
    return bytes(out)


# ---------------------------------------------------------------------------
# UE3 package loading
# ---------------------------------------------------------------------------

class PackageError(Exception):
    pass


def read_summary(data: bytes) -> dict:
    """Parse enough of the UE3 v455 package summary to find compressed chunks."""
    off = 0
    tag, = struct.unpack_from(">I", data, off); off += 4
    if tag != UE3_TAG:
        raise PackageError(f"not a UE3 package (tag 0x{tag:08X})")
    version, = struct.unpack_from(">I", data, off); off += 4
    file_version = version & 0xFFFF
    licensee_version = version >> 16
    total_header_size, = struct.unpack_from(">I", data, off); off += 4
    name_len, = struct.unpack_from(">i", data, off); off += 4
    off += name_len                                   # FolderName
    package_flags, = struct.unpack_from(">I", data, off); off += 4
    off += 24                                         # name/export/import count+offset
    off += 4                                          # DependsOffset
    off += 16                                         # Guid
    n_gen, = struct.unpack_from(">I", data, off); off += 4
    off += n_gen * 12                                 # FGenerationInfo[]
    engine_version, cooked_version, compression_flags = struct.unpack_from(">3I", data, off)
    off += 12
    n_chunks, = struct.unpack_from(">I", data, off); off += 4
    chunks = []
    for _ in range(n_chunks):
        uo, us, co, cs = struct.unpack_from(">4I", data, off); off += 16
        chunks.append((uo, us, co, cs))
    return {
        "file_version": file_version,
        "licensee_version": licensee_version,
        "total_header_size": total_header_size,
        "package_flags": package_flags,
        "engine_version": engine_version,
        "cooked_version": cooked_version,
        "compression_flags": compression_flags,
        "chunks": chunks,
    }


def load_package(path: str) -> tuple[bytes, str]:
    """Return (decompressed package image, storage kind)."""
    with open(path, "rb") as fh:
        data = fh.read()
    if len(data) < 16:
        raise PackageError("file too small")
    tag, = struct.unpack_from(">I", data, 0)
    if tag != UE3_TAG:
        raise PackageError("not a UE3 package")

    version, = struct.unpack_from(">I", data, 4)
    if (version & 0xFFFF) == 0:
        # Fully-compressed file: the whole package is one compressed-block stream.
        return decompress_blocks(data, 0), "fully-compressed"

    summary = read_summary(data)
    chunks = summary["chunks"]
    if not chunks:
        return data, "plain"

    if summary["compression_flags"] not in (COMPRESS_LZO, COMPRESS_ZLIB, COMPRESS_LZX):
        raise PackageError(f"unsupported compression flags {summary['compression_flags']}")
    if summary["compression_flags"] != COMPRESS_LZO:
        raise PackageError(f"compression flags {summary['compression_flags']} not implemented")

    total = max(uo + us for uo, us, _, _ in chunks)
    total = max(total, summary["total_header_size"])
    out = bytearray(total)
    header_end = min(summary["total_header_size"], len(data))
    out[0:header_end] = data[0:header_end]
    for uo, us, co, cs in chunks:
        blob = decompress_blocks(data, co)
        if len(blob) != us:
            raise PackageError(f"chunk size mismatch {len(blob)} != {us}")
        out[uo:uo + us] = blob
    return bytes(out), "lzo-chunks"


# ---------------------------------------------------------------------------
# Xenos shader container scanning
# ---------------------------------------------------------------------------

def cstring(buf: bytes, pos: int, limit: int = 256) -> str:
    end = buf.find(b"\x00", pos, pos + limit)
    if end < 0:
        return ""
    return buf[pos:end].decode("latin-1", "replace")


def parse_ctab(blob: bytes, ct_off: int) -> dict | None:
    """Parse the D3DX constant table embedded in a Xenos shader container."""
    # The container's constantTableOffset points 4 bytes ahead of the CTAB header.
    base = ct_off + 4
    if base + 28 > len(blob):
        return None
    size, creator, version, n_const, const_info, flags, target = struct.unpack_from(
        ">7I", blob, base)
    if size != 0x1C:
        return None
    hi = version >> 16
    if hi not in (CTAB_VS, CTAB_PS):
        return None
    info = {
        "target": cstring(blob, base + target) if target else "",
        "creator": cstring(blob, base + creator) if creator else "",
        "version": f"0x{version:08X}",
        "is_pixel": hi == CTAB_PS,
        "constants": [],
    }
    for i in range(min(n_const, 512)):
        off = base + const_info + i * 20
        if off + 20 > len(blob):
            break
        name_off, reg_set, reg_index, reg_count, type_info, default = struct.unpack_from(
            ">IHHHHI", blob, off)
        info["constants"].append({
            "name": cstring(blob, base + name_off) if name_off else "",
            "register_set": reg_set,
            "register_index": reg_index,
            "register_count": reg_count,
        })
    return info


def scan_containers(buf: bytes):
    """Yield (offset, blob, ctab) for every Xenos shader container in buf."""
    n = len(buf)
    pos = 0
    needle = b"\x10\x2A\x11"
    while True:
        pos = buf.find(needle, pos)
        if pos < 0:
            return
        if pos + 36 <= n:
            (flags, virtual_size, physical_size, _field0c, ct_off,
             _def_off, _sh_off, field1c, field20) = struct.unpack_from(">9I", buf, pos)
            size = virtual_size + physical_size
            if ((flags & SHADER_SIG_MASK) == SHADER_SIG and field1c == 0 and field20 == 0
                    and 0 < size <= n - pos):
                blob = buf[pos:pos + size]
                ctab = parse_ctab(blob, ct_off)
                if ctab is not None:
                    yield pos, blob, ctab
                    pos += size
                    continue
        pos += 1


# ---------------------------------------------------------------------------
# Driver
# ---------------------------------------------------------------------------

def collect_packages(assets_dir: str, pattern: str) -> list[str]:
    found = []
    for dirpath, _dirnames, filenames in os.walk(assets_dir):
        for name in sorted(filenames):
            if not name.lower().endswith(".xxx"):
                continue
            if pattern and not fnmatch.fnmatch(name, pattern):
                continue
            found.append(os.path.join(dirpath, name))
    return sorted(found)


def process_package(path: str):
    """Worker: returns (path, kind, [(offset, blob, ctab)], error)."""
    try:
        buf, kind = load_package(path)
    except Exception as exc:                          # noqa: BLE001
        return path, None, [], f"{type(exc).__name__}: {exc}"
    try:
        return path, kind, list(scan_containers(buf)), None
    except Exception as exc:                          # noqa: BLE001
        return path, kind, [], f"scan failed: {type(exc).__name__}: {exc}"


def main(argv=None) -> int:
    here = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    ap = argparse.ArgumentParser(description="Dump Xenos shader binaries from UE3 packages.")
    ap.add_argument("--assets", default=os.path.join(here, "assets", "KronosGame"),
                    help="directory to search for .xxx packages")
    ap.add_argument("--out", default=os.path.join(here, "assets", "shaders"),
                    help="output directory")
    ap.add_argument("--filter", default="", help="glob applied to package file names")
    ap.add_argument("--jobs", type=int, default=max(1, (os.cpu_count() or 4) - 1),
                    help="worker processes")
    ap.add_argument("--quiet", action="store_true")
    args = ap.parse_args(argv)

    packages = collect_packages(args.assets, args.filter)
    if not packages:
        print(f"no .xxx packages found under {args.assets}", file=sys.stderr)
        return 1

    vs_dir = os.path.join(args.out, "vs")
    ps_dir = os.path.join(args.out, "ps")
    os.makedirs(vs_dir, exist_ok=True)
    os.makedirs(ps_dir, exist_ok=True)

    shaders: dict[str, dict] = {}
    errors: list[tuple[str, str]] = []
    kinds: dict[str, int] = {}
    started = time.time()
    done = 0

    def handle(result):
        nonlocal done
        path, kind, found, error = result
        done += 1
        rel = os.path.relpath(path, args.assets).replace("\\", "/")
        if error:
            errors.append((rel, error))
        if kind:
            kinds[kind] = kinds.get(kind, 0) + 1
        for offset, blob, ctab in found:
            digest = hashlib.sha1(blob).hexdigest()[:16]
            entry = shaders.get(digest)
            if entry is None:
                kind_dir = ps_dir if ctab["is_pixel"] else vs_dir
                prefix = "ps" if ctab["is_pixel"] else "vs"
                name = f"{prefix}_{digest}.bin"
                with open(os.path.join(kind_dir, name), "wb") as fh:
                    fh.write(blob)
                entry = {
                    "file": f"{prefix}/{name}",
                    "hash": digest,
                    "type": prefix,
                    "target": ctab["target"],
                    "creator": ctab["creator"],
                    "size": len(blob),
                    "constants": ctab["constants"],
                    "sources": [],
                }
                shaders[digest] = entry
            if len(entry["sources"]) < 32:
                entry["sources"].append({"package": rel, "offset": offset})
        if not args.quiet:
            print(f"[{done}/{len(packages)}] {rel} ({kind or 'error'}) "
                  f"+{len(found)} -> {len(shaders)} unique", flush=True)

    if args.jobs > 1:
        with concurrent.futures.ProcessPoolExecutor(max_workers=args.jobs) as pool:
            for result in pool.map(process_package, packages, chunksize=1):
                handle(result)
    else:
        for path in packages:
            handle(process_package(path))

    manifest = {
        "generated_by": "tools/dump_shaders.py",
        "assets_dir": os.path.relpath(args.assets, here).replace("\\", "/"),
        "hash": "sha1(container bytes), first 16 hex chars",
        "container_signature": "0x102A1100 (ps_3_0) / 0x102A1101 (vs_3_0)",
        "package_kinds": kinds,
        "package_count": len(packages),
        "shader_count": len(shaders),
        "vertex_shaders": sum(1 for s in shaders.values() if s["type"] == "vs"),
        "pixel_shaders": sum(1 for s in shaders.values() if s["type"] == "ps"),
        "errors": [{"package": p, "error": e} for p, e in errors],
        "shaders": sorted(shaders.values(), key=lambda s: (s["type"], s["hash"])),
    }
    with open(os.path.join(args.out, "manifest.json"), "w", encoding="utf-8") as fh:
        json.dump(manifest, fh, indent=1)

    elapsed = time.time() - started
    print(f"\n{len(shaders)} unique shaders "
          f"({manifest['vertex_shaders']} vs, {manifest['pixel_shaders']} ps) "
          f"from {len(packages)} packages in {elapsed:.1f}s")
    print(f"package storage: {kinds}")
    print(f"output: {args.out}")
    if errors:
        print(f"{len(errors)} package(s) failed:", file=sys.stderr)
        for rel, err in errors[:20]:
            print(f"  {rel}: {err}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
