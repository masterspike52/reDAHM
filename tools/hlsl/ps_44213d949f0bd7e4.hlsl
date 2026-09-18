// ps_44213d949f0bd7e4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 156 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000270 10040900 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c7); // float4
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c9); // float2
float4 SpotDirection : register(c8); // float3
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D ShadowTexture : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = r1.xy * 2.0 + UniformVector_1.xy;
    r7.xz = r1.xy * 0.5 + UniformVector_2.xy;
    ps = 1.0 / r5.w;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.yw = r6.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    r0.zw = r0.zw * abs(r8.xy);
    r7.yw = r7.yw * r5.xy + ScreenPositionScaleBias.wz;
    r1.xyz = tex2D(LightAttenuationTexture, r7.yw).xyz;
    r7.y = tex2D(ShadowTexture, r0.xy).x;
    r5.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r8.xyz = tex2D(Texture2D_0, r7.xz).xyz;
    r7.xzw = tex2D(Texture2D_0, r6.xy).xyz;
    ps = r2.z;
    r0.w = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r1.w = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.z = ps;
    ps = 1.0 - r6.x;
    r0.xyz = r0.xyz * UniformVector_3.xyz;
    r6.y = saturate(ps);
    r7.xzw = r7.xzw * 4.0 - 4.0;
    ps = rsqrt(abs(r0.w));
    r6.x = saturate(r1.w * 5.0);
    r0.w = ps;
    ps = rsqrt(abs(r6.w));
    r2.xyz = r0.www * r2.xyz;
    r6.w = ps;
    r8.xyz = r8.xyz * 4.0 + r7.xzw;
    ps = 1.0 - r6.x;
    r4.xyz = r6.www * r4.xyz;
    r6.x = ps;
    ps = log2(r6.y);
    r7.xzw = r6.zzz * -SpotDirection.xyz;
    r6.y = ps;
    r6.zw = -r6.xx * ModShadowGroupColor.xy + 1.0;
    r7.x = dot(r7.wxz, r3.zxy);
    r6.x = dot(r8.zxy, r8.zxy);
    ps = rsqrt(abs(r6.x));
    r7.x = r7.x - SpotAngles.x;
    r6.x = ps;
    r3.xyz = r8.xyz * r6.xxx;
    r6.x = dot(r3.zxy, r4.zxy);
    r8.xyz = r3.xzy * r6.xxx;
    r4.xyz = r8.xyz * 2.0 - r4.xzy;
    r6.x = saturate(dot(r2.zxy, r4.yxz));
    ps = log2(r6.x);
    r7.x = saturate(r7.x * SpotAngles.y);
    r6.x = ps;
    ps = 15.0 * r6.x;
    r7.z = ps;
    ps = pow(2.0, r7.z);
    r6.x = saturate(dot(r3.zxy, r2.zxy));
    r5.x = ps;
    r2.xyz = r5.xyz * float3(0.21952, 0.875, 0.875);
    r0.xyz = r0.xyz * r6.xxx + r2.xxx;
    r7.zw = r2.yz * r6.zw + 0.125;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r7.xyz = r7.zxy * r7.wxy;
    r6.w = ps;
    r6.xyz = r7.xxx * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r1.xyz = r7.zzz * r1.xyz;
    r6.w = ps;
    r1.xyz = r1.xyz * r6.www;
    r0.xyz = r1.xyz * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r0.xyz * r7.yyy;
    r6.xyz = r7.xyz * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
