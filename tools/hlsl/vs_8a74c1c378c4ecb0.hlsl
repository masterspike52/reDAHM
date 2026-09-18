// vs_8a74c1c378c4ecb0.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 24 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 00000060 00010001 00000000 00000000 00001021 00000001 00000002 00000001 00000290 00000003 00005005 0000F050 00001006
//   vertex element: instruction 3 -> POSITION0
//   vertex element: instruction 5 -> TEXCOORD0
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
    float4 o0 = 0.0;
    float4 oPos = 0.0;

    r1 = In.position0;
    oPos = r1;
    r0 = In.texcoord0;
    o0 = r0;

    VS_OUTPUT Out;
    Out.position = oPos;
    Out.texcoord0 = o0;
    return Out;
}
