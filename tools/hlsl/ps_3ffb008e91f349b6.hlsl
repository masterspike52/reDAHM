// ps_3ffb008e91f349b6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 42 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000A8 10000400 00000008 00000000 00004CA5 0007001F 00000001 0000F055 00007156 0000F257 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 MaxIntegral : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D AccumulatedFrontfacesLineIntegralTexture : register(s0);
sampler2D AccumulatedBackfacesLineIntegralTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord5 : TEXCOORD5; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 texcoord7 : TEXCOORD7; // r2
    float4 color0 : COLOR0; // r3
    float4 color2 : COLOR2; // r4
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord5;
    float4 r1 = In.texcoord6;
    float4 r2 = In.texcoord7;
    float4 r3 = In.color0;
    float4 r4 = In.color2;
    float4 oC0 = 0.0;

    r3.xyz = UniformVector_0.xyz + float3(0.5, 0.5, 0.7);
    r3.w = 1.0 / r0.w;
    r4.xy = r3.ww * ScreenPositionScaleBias.xy;
    r4.xy = r4.xy * r0.xy + ScreenPositionScaleBias.wz;
    r0 = tex2D(AccumulatedFrontfacesLineIntegralTexture, r4.xy);
    r4 = tex2D(AccumulatedBackfacesLineIntegralTexture, r4.xy);
    r3.yzw = r3.xyz * r2.www + r2.xyz;
    r4.x = dot(r4.wzxy, float4(4.0, 0.0625, 1.5258789e-05, 0.0009765625));
    r4.y = dot(r0.wzxy, float4(4.0, 0.0625, 1.5258789e-05, 0.0009765625));
    r4.xy = r4.xy * MaxIntegral.xx;
    r3.x = r4.x - r4.y;
    oC0.xyz = r3.yzw * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = saturate(pow(2.0, -r3.x));

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
