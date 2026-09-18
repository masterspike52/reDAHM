// vs_1fcfc1c79649a419.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 30 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 00000078 00010002 00000000 00000000 00001021 00000001 00000002 00000001 00000290 00100003 00205004 0000F050 00001008
//   vertex element: instruction 3 -> POSITION0
//   vertex element: instruction 4 -> TEXCOORD0
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)

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
    float4 r2 = 0.0;
    float4 o0 = 0.0;
    float4 oPos = 0.0;

    r1 = In.position0;
    r2.zw = In.texcoord0.xy;
    r0 = r1;
    oPos = r0;
    r2.xy = r1.xy;
    o0 = r2;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    return Out;
}
