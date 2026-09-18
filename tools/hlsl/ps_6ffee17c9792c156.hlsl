// ps_6ffee17c9792c156.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 18 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 00000048 10000100 00000004 00000000 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)

#include "xenos_common.hlsli"

float4 SampleWeights[2] : register(c3); // float4[2]
sampler2D FilterTexture : register(s0);

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

    r1 = tex2D(FilterTexture, r0.xy);
    r0 = tex2D(FilterTexture, r0.wz);
    r0 = r0 * SampleWeights[1];
    oC0 = r1 * SampleWeights[0] + r0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
