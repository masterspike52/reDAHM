// ps_1b5d044b7d5eb830.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 30 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000078 10000100 00000004 00000000 00000821 00010001 00000001 00003050
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

sampler2D SceneColorTexture : register(s0);
sampler2D AccumulatedDistortionTexture : register(s1);

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

    r1 = tex2D(AccumulatedDistortionTexture, r0.xy);
    r1 = r1.zxyw * 0.25;
    r0.z = -r1.x + r0.x;
    r0.z = r0.z + r1.y;
    r0.w = r1.z - r1.w;
    r0.w = r0.w * (-1.0) + r0.y;
    r0.xyz = tex2D(SceneColorTexture, r0.zw).xyz;
    r0.w = 0.0;
    oC0 = r0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
