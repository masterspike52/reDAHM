// ps_8b06445937394c23.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 72 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 00000120 10000A00 00000004 00000000 000050A5 001F001F 00000001 0000F050 0000F151 0000F252 0000F353 0000F454
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD4 (flags 0xF)

#include "xenos_common.hlsli"

float4 SampleWeights[10] : register(c3); // float4[10]
sampler2D FilterTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord4 : TEXCOORD4; // r4
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
    float4 r4 = In.texcoord4;
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;

    r5 = tex2D(FilterTexture, r3.wz);
    r6 = tex2D(FilterTexture, r0.xy);
    r7 = tex2D(FilterTexture, r0.wz);
    r8 = tex2D(FilterTexture, r1.xy);
    r1 = tex2D(FilterTexture, r1.wz);
    r9 = tex2D(FilterTexture, r2.xy);
    r2 = tex2D(FilterTexture, r2.wz);
    r3 = tex2D(FilterTexture, r3.xy);
    r10 = tex2D(FilterTexture, r4.xy);
    r0 = tex2D(FilterTexture, r4.wz);
    r0 = r0 * SampleWeights[9];
    r0 = r10.xwzy * SampleWeights[8].xwzy + r0.xwzy;
    r0 = r3.xzyw * SampleWeights[6].xzyw + r0.xzwy;
    r0 = r2.xwzy * SampleWeights[5].xwzy + r0.xwyz;
    r0 = r9.xzyw * SampleWeights[4].xzyw + r0.xzwy;
    r0 = r1.xywz * SampleWeights[3].xywz + r0.xzwy;
    r0 = r8.xwzy * SampleWeights[2].xwzy + r0.xzwy;
    r0 = r7.xzyw * SampleWeights[1].xzyw + r0.xzwy;
    r0 = r6.xywz * SampleWeights[0].xywz + r0.xzwy;
    oC0 = r5 * SampleWeights[7] + r0.xywz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
