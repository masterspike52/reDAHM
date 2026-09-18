// ps_81c84d775af9ef72.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10000A00 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 MinZ_MaxZRatio : register(c2); // float4
float4 OpacityOverride : register(c16); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_10 : register(c13); // float4
float4 UniformVector_11 : register(c14); // float4
float4 UniformVector_12 : register(c15); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
float4 UniformVector_6 : register(c9); // float4
float4 UniformVector_7 : register(c10); // float4
float4 UniformVector_8 : register(c11); // float4
float4 UniformVector_9 : register(c12); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);

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
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;

    r5.zw = r0.yx - 0.5;
    r4.w = 1.0 / r1.w;
    r5.y = dot(r5.zw, UniformVector_2.yx) + 0.5;
    r5.x = dot(r5.zw, UniformVector_1.yx) + 0.5;
    r6.y = dot(r5.zw, UniformVector_4.yx) + 0.5;
    r6.x = dot(r5.zw, UniformVector_3.yx) + 0.5;
    r7.y = dot(r5.zw, UniformVector_6.yx) + 0.5;
    r7.x = dot(r5.zw, UniformVector_5.yx) + 0.5;
    r8.y = dot(r5.zw, UniformVector_8.yx) + 0.5;
    r8.x = dot(r5.zw, UniformVector_7.yx) + 0.5;
    r2.w = dot(r5.zw, UniformVector_10.yx) + 0.5;
    r2.z = dot(r5.zw, UniformVector_9.yx) + 0.5;
    r2.y = dot(r5.zw, UniformVector_12.yx) + 0.5;
    r2.x = dot(r5.zw, UniformVector_11.yx) + 0.5;
    r5.zw = r4.ww * ScreenPositionScaleBias.xy;
    r10.xy = r5.wz * r1.yx + ScreenPositionScaleBias.zw;
    r5.yzw = tex2D(Texture2D_0, r5.xy).xyz;
    r0.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_2, r6.xy).xyz;
    r7.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r8.xyz = tex2D(Texture2D_4, r8.xy).xyz;
    r9.xyz = tex2D(Texture2D_5, r2.zw).xyz;
    r2.xyz = tex2D(Texture2D_6, r2.xy).xyz;
    r4.w = tex2D(SceneDepthTexture, r10.yx).x;
    r4.w = r4.w * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r2.xyz = r9.xyz * float3(5.0, 1e+01, 4e+01) + r2.xyz;
    r2.xyz = r8.xzy * float3(5.0, 5e+01, 1e+01) + r2.xzy;
    r5.x = r3.w * SCENE_COLOR_BIAS_FACTOR.x;
    r4.w = 1.0 / r4.w;
    r0.w = float((r4.w != 1.0));
    r2.yzw = r7.yzx * float3(5.0, 2e+01, 1.0) + r2.zyx;
    r4.w = r4.w - r1.w;
    r2.x = r2.w + r6.x;
    r4.w = saturate(0.002 * r4.w);
    r4.w = (r0.w == 0.0) ? 1.0 : r4.w;
    r1.xyz = r6.xyz * float3(1.0, 5.0, 3e+01) + r2.xyz;
    r0.xyz = r1.xyz + r0.xyz;
    r4.xyz = r0.xyz * r4.xyz;
    r4.xyz = r4.xyz * r5.yzw + UniformVector_0.xyz;
    oC0.xyz = r5.xxx * r4.xyz;
    oC0.w = OpacityOverride.x * r4.w;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
