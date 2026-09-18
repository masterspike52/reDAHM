// vs_cf942f6f475a3cdc.bin
// Xenos vertex shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1101, 18 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (vs_3_0)
// Shader header: 00000000 00000048 00010000 00000000 00000000 00000000 00000001 00000001 00000000 00000290 00000003
//   vertex element: instruction 3 -> POSITION0

#include "xenos_common.hlsli"

struct VS_INPUT
{
    float4 position0 : POSITION0;
};

struct VS_OUTPUT
{
    float4 position : POSITION;
};

VS_OUTPUT main(VS_INPUT In)
{
    float4 r0 = 0.0;
    float4 oPos = 0.0;

    r0 = In.position0;
    oPos = r0;

    VS_OUTPUT Out;
    Out.position = oPos;
    return Out;
}
