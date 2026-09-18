// ps_c3b85da7c048f8cf.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 189 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002F4 10040C00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c6); // float4
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c8); // float2
float4 SpotDirection : register(c7); // float3
float4 UniformScalar_0 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_3 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ShadowTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r7.y = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r6.xx * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r6.zw = r6.zw * r5.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r10.y = tex2D(ShadowTexture, r0.xy).x;
    r8.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r1.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r7.zw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = -ModShadowColor.x;
    r6.x = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r6.z = r2.z + 0.1;
    r7.x = ps;
    ps = 5.0 * r6.z;
    r6.y = dot(r2.zxy, r2.zxy);
    r6.w = saturate(ps);
    ps = rsqrt(abs(r6.y));
    r7.zw = r7.zw * 0.875;
    r0.w = ps;
    ps = 1.0 - r6.x;
    r6.z = dot(r1.xzy, float3(1.0, 1.0, 1.0));
    r6.y = saturate(ps);
    r12.yzw = r0.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.y));
    r0.xyz = r12.wyz * float3(0.7, 1.0, 1.0);
    r7.y = ps;
    ps = rsqrt(abs(r6.x));
    r11.xyz = r7.yyy * r4.xyz;
    r6.x = ps;
    ps = log2(r6.y);
    r1.xyz = r6.xxx * -SpotDirection.xyz;
    r6.x = ps;
    ps = log2(abs(r6.z));
    r6.y = dot(r1.zxy, r3.zxy);
    r12.x = ps;
    ps = -SpotAngles.x - -r6.y;
    r6.z = dot(r11.zxy, r12.wyz);
    r7.y = ps;
    ps = r6.z;
    r3.xyz = r0.www * r2.xyz;
    r1.x = ps;
    ps = 0.0;
    r2 = r12.xwyz * float4(0.1, 0.7, 1.0, 1.0);
    r1.y = ps;
    ps = pow(2.0, r2.x);
    r6.z = dot(r2.yzw, r2.yzw);
    r6.y = ps;
    ps = rsqrt(abs(r6.z));
    r10.z = saturate(r7.y * SpotAngles.y);
    r6.z = ps;
    ps = 1.0 - r6.w;
    r4.xyz = r0.yzx * r6.zzz;
    r6.z = ps;
    ps = 1.0 - r6.y;
    r7.y = dot(r4.zxy, r11.zxy);
    r6.y = ps;
    ps = max(r1.x, r1.y);
    r0.xyz = r6.yyy * r8.xyz;
    r2.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r1.xyz = r0.xyz * UniformVector_3.www;
    r2.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r12.xyz = r4.xzy * r7.yyy;
    r2.y = ps;
    r1.xyz = r1.xyz * UniformVector_3.xyz - r0.xyz;
    ps = -ModShadowColor.y;
    r2.xyz = -r2.xyz + float3(1.0, 1.0, 0.45);
    r11.xyz = r12.xyz * 2.0 - r11.xzy;
    ps = 1.0 + ps;
    r10.x = saturate(dot(r3.zxy, r11.yxz));
    r7.y = ps;
    r6.zw = r7.zw * r2.xy + 0.125;
    ps = -ModShadowColor.z;
    r7.z = saturate(r2.z * 4.0);
    r1.xyz = r7.zzz * r1.xyz + r0.xyz;
    ps = 1.0 + ps;
    r6.z = r6.z * r6.w;
    r7.z = ps;
    r7.xyz = r6.zzz * r7.xyz + ModShadowColor.xyz;
    r0.xyz = r10.zxy * r10.zxy;
    r6.z = r0.y * r10.x;
    r2.xyz = r8.xyz * UniformScalar_0.xxx;
    r6.w = saturate(dot(r4.zxy, r3.zxy));
    r3.xyz = r2.xyz * r6.yyy;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r2.xyz = r1.xyz * r9.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r1.xyz = r0.zzz * r5.xyz;
    r6.x = ps;
    r1.xyz = r1.xzy * r6.xxx;
    r6.xyz = r3.xyz * r6.zzz;
    r6.xy = r2.xy * r6.ww + r6.xy;
    r6.z = r2.z * r6.w + r6.z;
    r6.xyz = r1.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r0.xxx;
    r6.xyz = r6.xzy * r7.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
