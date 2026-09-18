// ps_c4b11da48f8fc0d4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 63 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 000000FC 10000300 00000004 00000000 00003063 00070007 00000001 0000F050 0000F151 0000F252
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)

#include "xenos_common.hlsli"

float4 MaxOffset : register(c9); // float4
float4 MinOffset : register(c8); // float4
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
    float4 oC0 = 0.0;

    r3.xy = max(r2.xy, MinOffset.xy);
    r1 = max(r1.wzyx, MinOffset.wzyx);
    r2 = max(r0, MinOffset);
    r0.xy = min(r3.xy, MaxOffset.xy);
    r3 = min(r2, MaxOffset);
    r1 = min(r1.zxwy, MaxOffset.ywxz);
    r0.x = tex2D(FilterTexture, r0.xy).x;
    r2.x = tex2D(FilterTexture, r1.zx).x;
    r1.z = tex2D(FilterTexture, r3.wz).x;
    r1.x = tex2D(FilterTexture, r3.xy).x;
    r0.z = tex2D(FilterTexture, r1.yw).x;
    r1.y = r1.x * r1.x;
    r0.w = r0.z * r0.z;
    r0.y = r0.x * r0.x;
    r1.w = r1.z * r1.z;
    r0.xy = r0.xy * SampleWeights[4].xy;
    r2.y = r2.x * r2.x;
    r0.xy = r2.xy * SampleWeights[2].xy + r0.xy;
    r0.xy = r1.zw * SampleWeights[1].xy + r0.xy;
    r0.xy = r1.xy * SampleWeights[0].xy + r0.xy;
    oC0.xy = r0.zw * SampleWeights[3].xy + r0.xy;
    oC0.zw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
