// ps_ea1c9918449d1fdb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 51 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000CC 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c4); // float
float4 UniformVector_0 : register(c3); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 color0 : COLOR0; // r4
    float4 color2 : COLOR2; // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord5;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 oC0 = 0.0;

    r5.w = r0.x * 5.0 + UniformScalar_1.x;
    r5.x = r3.w * SCENE_COLOR_BIAS_FACTOR.x;
    r5.y = 1.0 / r1.w;
    r5.yz = r5.yy * ScreenPositionScaleBias.xy;
    r5.yz = r5.yz * r1.xy + ScreenPositionScaleBias.wz;
    r5.yzw = r5.wyz * float3(1.0000007, 1e+01, 1e+01) + float3(0.5, 1e+01, 1e+01);
    r1.x = frac(r5.y);
    r1.x = r1.x * 6.2831855 - 3.1415927;
    r1.x = sin(r1.x);
    r0.xy = r1.xx * 0.008 + r0.xy;
    r5.y = tex2D(Texture2D_1, r0.xy).x;
    r0.xyz = tex2D(Texture2D_0, r5.zw).xyz;
    r4.xzw = r0.xyz * r4.xyz + UniformVector_0.xyz;
    r4.y = saturate(r5.y * 7e+01 - 2e+01);
    oC0.xyz = r5.xxx * r4.xzw;
    oC0.w = OpacityOverride.x * r4.y;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
