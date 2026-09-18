// ps_3b4817e76cadaf2d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 33 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 00000084 10000400 00000004 00000000 00002042 00030003 00000001 0000F050 0000F151
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)

#include "xenos_common.hlsli"

float4 SampleWeights[4] : register(c3); // float4[4]
sampler2D FilterTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = 0.0;
    float4 r3 = 0.0;
    float4 r4 = 0.0;
    float4 oC0 = 0.0;

    r2 = tex2D(FilterTexture, r1.wz);
    r3 = tex2D(FilterTexture, r0.xy);
    r4 = tex2D(FilterTexture, r0.wz);
    r0 = tex2D(FilterTexture, r1.xy);
    r0 = r0 * SampleWeights[2];
    r0 = r4.xzyw * SampleWeights[1].xzyw + r0.xzyw;
    r0 = r3.xywz * SampleWeights[0].xywz + r0.xzwy;
    oC0 = r2 * SampleWeights[3] + r0.xywz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
