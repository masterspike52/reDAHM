// vs_ee887effc23a0e9b.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 36 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 00000090 00010002 00000000 00000000 00000821 00000001 00000002 00000001 00000290 00100003 00205004 00003050 0000100A
//   vertex element: instruction 3 -> POSITION0
//   vertex element: instruction 4 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)

#include "xenos_common.hlsli"

float4 Transform[4] : register(c5); // float4x4 (matrix_columns)

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 texcoord0 : TEXCOORD0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
};

VS_OUTPUT main(VS_INPUT In)
{
    float4 r0 = 0.0;
    float4 r1 = 0.0;
    float4 r2 = 0.0;
    float4 o0 = 0.0;
    float4 oPos = 0.0;

    r1 = In.position0;
    r2.xy = In.texcoord0.xy;
    r0 = r1.wwww * Transform[3].xwzy;
    r0 = r1.zzzz * Transform[2].xwzy + r0;
    r0 = r1.yyyy * Transform[1].xzyw + r0.xzwy;
    r0 = r1.xxxx * Transform[0] + r0.xzyw;
    oPos = r0;
    o0.xy = r2.xy;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    return Out;
}
