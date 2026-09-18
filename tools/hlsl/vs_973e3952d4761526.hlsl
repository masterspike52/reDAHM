// vs_973e3952d4761526.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 24 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 00000060 00010001 00000000 00000000 00000821 00000001 00000002 00000001 00000290 00100003 00305004 00003050 00001006
//   vertex element: instruction 3 -> POSITION0
//   vertex element: instruction 4 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)

#include "xenos_common.hlsli"

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
    float4 o0 = 0.0;
    float4 oPos = 0.0;

    r1.xy = In.position0.xy;
    r1.z = 0.0;
    r1.w = 1.0;
    r0.xy = In.texcoord0.xy;
    oPos = r1;
    o0.xy = r0.xy;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    return Out;
}
