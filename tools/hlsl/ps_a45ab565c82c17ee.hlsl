// ps_a45ab565c82c17ee.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 51 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 000000CC 10000700 00000004 00000000 00004084 000F000F 00000001 0000F050 0000F151 0000F252 0000F353
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)

#include "xenos_common.hlsli"

float4 SampleWeights[7] : register(c3); // float4[7]
sampler2D FilterTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
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
    float4 r3 = In.texcoord3;
    float4 r4 = 0.0;
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 oC0 = 0.0;

    r4 = tex2D(FilterTexture, r1.wz);
    r5 = tex2D(FilterTexture, r0.xy);
    r6 = tex2D(FilterTexture, r0.wz);
    r1 = tex2D(FilterTexture, r1.xy);
    r7 = tex2D(FilterTexture, r2.xy);
    r2 = tex2D(FilterTexture, r2.wz);
    r0 = tex2D(FilterTexture, r3.xy);
    r0 = r0 * SampleWeights[6];
    r0 = r2.xwzy * SampleWeights[5].xwzy + r0.xwzy;
    r0 = r7.xzyw * SampleWeights[4].xzyw + r0.xzwy;
    r0 = r1.xywz * SampleWeights[2].xywz + r0.xzwy;
    r0 = r6.xzyw * SampleWeights[1].xzyw + r0.xwyz;
    r0 = r5.xywz * SampleWeights[0].xywz + r0.xzwy;
    oC0 = r4 * SampleWeights[3] + r0.xywz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
