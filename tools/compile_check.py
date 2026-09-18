"""Compile every .hlsl in a folder with d3dcompiler_47 (vs_3_0 / ps_3_0) to validate syntax."""
import ctypes
import glob
import os
import sys
from ctypes import wintypes

d3dc = ctypes.WinDLL('d3dcompiler_47.dll')


class ID3DBlobVtbl(ctypes.Structure):
    _fields_ = [('QueryInterface', ctypes.c_void_p), ('AddRef', ctypes.c_void_p),
                ('Release', ctypes.WINFUNCTYPE(ctypes.c_ulong, ctypes.c_void_p)),
                ('GetBufferPointer', ctypes.WINFUNCTYPE(ctypes.c_void_p, ctypes.c_void_p)),
                ('GetBufferSize', ctypes.WINFUNCTYPE(ctypes.c_size_t, ctypes.c_void_p))]


class ID3DBlob(ctypes.Structure):
    _fields_ = [('lpVtbl', ctypes.POINTER(ID3DBlobVtbl))]


def blob_text(p):
    if not p:
        return ''
    b = ctypes.cast(p, ctypes.POINTER(ID3DBlob))
    ptr = b.contents.lpVtbl.contents.GetBufferPointer(p)
    size = b.contents.lpVtbl.contents.GetBufferSize(p)
    s = ctypes.string_at(ptr, size).decode('latin-1').rstrip('\0')
    b.contents.lpVtbl.contents.Release(p)
    return s


D3DCompileFromFile = d3dc.D3DCompileFromFile
D3DCompileFromFile.argtypes = [wintypes.LPCWSTR, ctypes.c_void_p, ctypes.c_void_p, ctypes.c_char_p,
                               ctypes.c_char_p, ctypes.c_uint, ctypes.c_uint,
                               ctypes.POINTER(ctypes.c_void_p), ctypes.POINTER(ctypes.c_void_p)]
D3DCompileFromFile.restype = ctypes.c_long

ok = bad = 0
for path in sorted(glob.glob(os.path.join(sys.argv[1], '*.hlsl'))):
    target = b'vs_3_0' if os.path.basename(path).startswith('vs') else b'ps_3_0'
    code, err = ctypes.c_void_p(), ctypes.c_void_p()
    hr = D3DCompileFromFile(path, None, ctypes.c_void_p(1), b'main', target, 0, 0,
                            ctypes.byref(code), ctypes.byref(err))
    msg = blob_text(err.value)
    blob_text(code.value)
    if hr < 0 and 'X4509' in msg:
        # Xbox 360 register ranges exceed PC SM3 (PS c224+, PS s16+, VS s4+): re-check with
        # the register bindings removed so everything else is still validated.
        import re
        src = open(path).read()
        src = re.sub(r'\s*:\s*register\([^)]*\)', '', src)
        D3DCompile = d3dc.D3DCompile
        D3DCompile.argtypes = [ctypes.c_char_p, ctypes.c_size_t, ctypes.c_char_p, ctypes.c_void_p,
                               ctypes.c_void_p, ctypes.c_char_p, ctypes.c_char_p, ctypes.c_uint,
                               ctypes.c_uint, ctypes.POINTER(ctypes.c_void_p), ctypes.POINTER(ctypes.c_void_p)]
        data = src.encode()
        code, err = ctypes.c_void_p(), ctypes.c_void_p()
        hr = D3DCompile(data, len(data), path.encode(), None, ctypes.c_void_p(1), b'main', target, 0, 0,
                        ctypes.byref(code), ctypes.byref(err))
        msg = blob_text(err.value)
        blob_text(code.value)
        if hr >= 0:
            print('OK (Xbox-only register range)', os.path.basename(path))
    if hr < 0:
        bad += 1
        print('FAIL', os.path.basename(path), hex(hr & 0xFFFFFFFF))
        print('   ', msg.strip().replace('\n', '\n    ')[:600])
    else:
        ok += 1
        if msg.strip() and '-v' in sys.argv:
            print('WARN', os.path.basename(path), msg.strip()[:300])
print('ok', ok, 'failed', bad)
