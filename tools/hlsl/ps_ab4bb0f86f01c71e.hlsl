// ps_ab4bb0f86f01c71e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 15 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000003C 18000200 00000008 00000000 00003063 00010007 00000011 0000F057 0000F1A0 0000F2A2
//   interpolator: r0 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r1 <-> COLOR0 (flags 0xF)
//   interpolator: r2 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

struct PS_INPUT
{
    float4 texcoord7 : TEXCOORD7; // r0
    float4 color0 : COLOR0; // r1
    float4 color2 : COLOR2; // r2
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
    float depth : DEPTH;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord7;
    float4 r1 = In.color0;
    float4 r2 = In.color2;
    float4 oC0 = 0.0;
    float4 oDepth = 0.0;

    r1.x = saturate(1.0);
    oC0.x = 1.0;
    oC0.yzw = 1.0;
    oDepth.x = saturate(r1.x);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    Out.depth = oDepth.x;
    return Out;
}
