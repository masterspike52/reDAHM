// ps_936b2893fed53152.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 162 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000288 10040D00 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c4); // float4
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c6); // float2
float4 SpotDirection : register(c5); // float3
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_5 : register(s2);
sampler2D Texture2D_6 : register(s3);
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
    float4 color1 : COLOR1; // r7
    float4 color2 : COLOR2; // r8
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
    float4 r7 = In.color1;
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r6.xx * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    r6.xy = r6.xy * abs(r9.xy);
    r6.zw = r6.zw * r5.xy + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r12.x = tex2D(ShadowTexture, r0.xy).x;
    r0.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r6.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r11.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r7.yzw = tex2D(Texture2D_6, r1.xy).xyz;
    ps = r2.z;
    r7.x = dot(r4.zxy, r4.zxy);
    ps = 0.1 + ps;
    r6.w = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    ps = 1.0 - r6.w;
    r8.x = dot(r2.zxy, r2.zxy);
    r8.w = saturate(ps);
    ps = 0.4 * r7.y;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = 0.4 * r7.z;
    r1.xyz = r1.xyz * r11.xyz;
    r5.y = ps;
    r13.xyz = r0.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r8.x));
    r6.x = saturate(r6.x * 5.0);
    r8.x = ps;
    ps = rsqrt(abs(r7.x));
    r0.xyz = r8.xxx * r2.xyz;
    r7.x = ps;
    ps = 0.875 * r6.y;
    r8.xyz = r7.xxx * r4.xyz;
    r2.x = ps;
    ps = rsqrt(abs(r6.w));
    r7.x = dot(r13.zxy, r13.zxy);
    r6.w = ps;
    ps = 0.875 * r6.z;
    r4.xyz = r6.www * -SpotDirection.xyz;
    r2.y = ps;
    ps = 1.0 - r6.x;
    r6.y = dot(r4.zxy, r3.zxy);
    r6.x = ps;
    r6.xz = -r6.xx * ModShadowGroupColor.xy + 1.0;
    r12.zw = r2.xy * r6.xz + 0.125;
    ps = rsqrt(abs(r7.x));
    r6.x = r6.y - SpotAngles.x;
    r6.y = ps;
    ps = SpotAngles.y * r6.x;
    r3.xyz = r13.xyz * r6.yyy;
    r12.y = saturate(ps);
    ps = log2(abs(r11.z));
    r6.x = dot(r3.zxy, r8.zxy);
    r2.y = ps;
    ps = log2(abs(r11.x));
    r6.xyz = r3.xzy * r6.xxx;
    r2.z = ps;
    r4.xyz = r6.xyz * 2.0 - r8.xzy;
    ps = log2(abs(r11.y));
    r8.xyz = r12.zxy * r12.wxy;
    r2.w = ps;
    r6.xyz = r8.xxx * r10.xyz + ModShadowColor.xyz;
    ps = log2(r8.w);
    r7.x = saturate(dot(r0.zxy, r4.yxz));
    r6.w = ps;
    ps = log2(r7.x);
    r6.w = r6.w * LightColorAndFalloffExponent.w;
    r2.x = ps;
    ps = pow(2.0, r6.w);
    r2 = r2 * float4(2e+01, 0.3, 0.3, 0.3);
    r7.x = ps;
    ps = pow(2.0, r2.z);
    r6.w = saturate(dot(r3.zxy, r0.zxy));
    r3.x = ps;
    ps = pow(2.0, r2.w);
    r0.xyz = r8.yyy * r9.xyz;
    r3.y = ps;
    ps = pow(2.0, r2.y);
    r0.xyz = r0.xyz * r7.xxx;
    r3.z = ps;
    ps = 0.4 * r7.w;
    r3.xyz = saturate(r3.xyz - 0.2);
    r5.z = ps;
    ps = pow(2.0, r2.x);
    r7.yzw = r5.xyz * r3.xyz;
    r7.x = ps;
    r7.xyz = r7.yzw * r7.xxx;
    r7.xy = r1.xy * r6.ww + r7.xy;
    r7.z = r1.z * r6.w + r7.z;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r7.xyz * r8.zzz;
    r6.xyz = r7.xyz * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
