// ps_32f38d804663d1be.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 18 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000048 10000100 00000004 00000000 00000821 00010001 00000001 00003050
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ShadowModulateColor : register(c0); // float4
sampler2D ModShadowAccumTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = 0.0;
    float4 oC0 = 0.0;

    r0.xy = tex2D(ModShadowAccumTexture, r0.xy).xy;
    r1.xy = r0.xy * 0.875 + 0.125;
    r0 = -ShadowModulateColor + 1.0;
    r1.x = r1.x * r1.y;
    oC0 = r1.xxxx * r0 + ShadowModulateColor;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
