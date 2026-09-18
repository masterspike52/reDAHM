// ps_c3cf687fdf88ab61.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 39 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 0000009C 10000500 00000004 00000000 00003063 00070007 00000001 0000F050 0000F151 0000F252
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)

#include "xenos_common.hlsli"

float4 SampleWeights[5] : register(c3); // float4[5]
sampler2D FilterTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = 0.0;
    float4 r4 = 0.0;
    float4 r5 = 0.0;
    float4 oC0 = 0.0;

    r3 = tex2D(FilterTexture, r1.wz);
    r4 = tex2D(FilterTexture, r0.xy);
    r5 = tex2D(FilterTexture, r0.wz);
    r1 = tex2D(FilterTexture, r1.xy);
    r0 = tex2D(FilterTexture, r2.xy);
    r0 = r0 * SampleWeights[4];
    r0 = r1.xywz * SampleWeights[2].xywz + r0.xywz;
    r0 = r5.xzyw * SampleWeights[1].xzyw + r0.xwyz;
    r0 = r4.xywz * SampleWeights[0].xywz + r0.xzwy;
    oC0 = r3 * SampleWeights[3] + r0.xywz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
