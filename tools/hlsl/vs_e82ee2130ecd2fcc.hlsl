// vs_e82ee2130ecd2fcc.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 36 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 00000090 00110002 00000000 00000000 00001042 00000001 00000002 00000002 00000290 00100003 00205004 00003050 00013151 0000100A 00001009
//   vertex element: instruction 3 -> POSITION0
//   vertex element: instruction 4 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)

#include "xenos_common.hlsli"

float4 ScreenPositionScaleBias : register(c5); // float4

struct VS_INPUT
{
    float4 position0 : POSITION0;
    float4 texcoord0 : TEXCOORD0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
    float4 texcoord0 : TEXCOORD0;
    float4 texcoord1 : TEXCOORD1;
};

VS_OUTPUT main(VS_INPUT In)
{
    float4 r0 = 0.0;
    float4 r1 = 0.0;
    float4 r2 = 0.0;
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 oPos = 0.0;

    r1 = In.position0;
    r2.xy = In.texcoord0.xy;
    r0 = r1;
    oPos = r0;
    r0.x = 1.0 / r1.w;
    r0.xy = r0.xx * r1.xy;
    o1.xy = r2.xy;
    o0.xy = r0.xy * ScreenPositionScaleBias.xy + ScreenPositionScaleBias.wz;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    return Out;
}
