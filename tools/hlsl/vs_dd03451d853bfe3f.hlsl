// vs_dd03451d853bfe3f.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 27 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 0000006C 00110001 00000000 00000000 00002042 00000001 00000002 00000002 00000290 00100003 00305004 0000F050 0001F151 00001006 00001007
//   vertex element: instruction 3 -> POSITION0
//   vertex element: instruction 4 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)

#include "xenos_common.hlsli"

float4 SampleOffsets[2] : register(c5); // float4[2]

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
    float4 o0 = 0.0;
    float4 o1 = 0.0;
    float4 oPos = 0.0;

    r1 = In.position0;
    r0.xy = In.texcoord0.xy;
    oPos = r1;
    o0 = r0.xyyx + SampleOffsets[0];
    o1 = r0.xyyx + SampleOffsets[1];

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    Out.texcoord1 = o1;
    return Out;
}
