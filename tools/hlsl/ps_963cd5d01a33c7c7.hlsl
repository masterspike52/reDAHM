// ps_963cd5d01a33c7c7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10000A00 00000004 00000000 00005CE7 007F007F 00000001 00003050 00003151 0000F252 0000F353 0000F455 00007556 0000F657
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord5 : TEXCOORD5; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
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
    float4 r4 = In.texcoord5;
    float4 r5 = In.texcoord6;
    float4 r6 = In.texcoord7;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;

    r2.xy = r0.yx - 0.5;
    r1.z = 1.0 / r4.w;
    r1.y = dot(r2.xy, UniformVector_2.yx) + 0.5;
    r1.x = dot(r2.xy, UniformVector_1.yx) + 0.5;
    r7.y = dot(r2.xy, UniformVector_4.yx) + 0.5;
    r7.x = dot(r2.xy, UniformVector_3.yx) + 0.5;
    r5.w = dot(r2.xy, UniformVector_6.yx) + 0.5;
    r5.z = dot(r2.xy, UniformVector_5.yx) + 0.5;
    r5.y = dot(r2.xy, UniformVector_8.yx) + 0.5;
    r5.x = dot(r2.xy, UniformVector_7.yx) + 0.5;
    r9.y = dot(r2.xy, UniformVector_10.yx) + 0.5;
    r9.x = dot(r2.xy, UniformVector_9.yx) + 0.5;
    r0.w = dot(r2.xy, UniformVector_12.yx) + 0.5;
    r0.z = dot(r2.xy, UniformVector_11.yx) + 0.5;
    r1.zw = r1.zz * ScreenPositionScaleBias.xy;
    r10.xy = r1.wz * r4.yx + ScreenPositionScaleBias.zw;
    r1.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r2.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_2, r7.xy).xyz;
    r8.xyz = tex2D(Texture2D_3, r5.zw).xyz;
    r5.xyz = tex2D(Texture2D_4, r5.xy).xyz;
    r9.xyz = tex2D(Texture2D_5, r9.xy).xyz;
    r0.yzw = tex2D(Texture2D_6, r0.zw).xyz;
    r0.x = tex2D(SceneDepthTexture, r10.yx).x;
    r0.x = r0.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r0.yzw = r9.xyz * float3(5.0, 1e+01, 4e+01) + r0.yzw;
    r5.xyz = r5.xzy * float3(5.0, 5e+01, 1e+01) + r0.ywz;
    r1.x = r6.w * SCENE_COLOR_BIAS_FACTOR.x;
    r0.x = 1.0 / r0.x;
    r0.z = float((r0.x != 1.0));
    r5.yzw = r8.yzx * float3(5.0, 2e+01, 1.0) + r5.zyx;
    r0.y = r0.x - r4.w;
    r5.x = r5.w + r7.x;
    r0.x = saturate(0.002 * r0.y);
    r0.y = (r0.z == 0.0) ? 1.0 : r0.x;
    r0.xzw = r7.xyz * float3(1.0, 5.0, 3e+01) + r5.xyz;
    r0.xzw = r0.xzw + r2.xyz;
    r0.xzw = r0.xzw * r3.xyz;
    r0.xzw = r0.xzw * r1.yzw + UniformVector_0.xyz;
    oC0.xyz = r1.xxx * r0.xzw;
    oC0.w = OpacityOverride.x * r0.y;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
