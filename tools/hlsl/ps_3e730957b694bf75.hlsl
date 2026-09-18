// ps_3e730957b694bf75.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 150 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000258 10040B00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c5); // float4
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c7); // float2
float4 SpotDirection : register(c6); // float3
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_3 : register(s2);
sampler2D Texture2D_4 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r8.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = r1.z;
    r6.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r5.z = dot(r2.zxy, r2.zxy);
    r0.y = ps;
    ps = 1.0 - r5.z;
    r0.x = dot(r3.zxy, r3.zxy);
    r5.w = saturate(ps);
    ps = 0.875 * r5.x;
    r9.yzw = -UniformVector_0.xyz + 1.0;
    r9.x = ps;
    ps = 0.875 * r5.y;
    r7.xyz = r9.yzw * r7.xyz;
    r9.y = ps;
    ps = rsqrt(abs(r5.z));
    r3.w = dot(r11.zxy, r11.zxy);
    r1.w = ps;
    ps = rsqrt(abs(r0.x));
    r5.x = saturate(r0.y * 5.0);
    r5.z = ps;
    ps = 1.0 - r5.x;
    r0 = r8.xyxz * float4(5.0, 5.0, 5e+01, 5.0);
    r5.y = ps;
    ps = rsqrt(abs(r6.w));
    r8.y = max(r0.z, 0.0001);
    r6.w = ps;
    ps = rsqrt(abs(r3.w));
    r8.xzw = r5.zzz * r3.xyz;
    r5.z = ps;
    ps = log2(r5.w);
    r10.xyz = r1.www * -SpotDirection.xyz;
    r5.x = ps;
    ps = r6.w;
    r3.xyz = r5.zzz * r11.xyz;
    r5.zw = -r5.yy * ModShadowGroupColor.xy + 1.0;
    ps = r1.x * ps;
    r5.y = dot(r10.zxy, r2.zxy);
    r2.x = ps;
    r2.zw = r9.xy * r5.zw + 0.125;
    ps = r6.w;
    r3.xyz = r3.xyz * TwoSidedSign.xxx;
    ps = r1.y * ps;
    r5.z = dot(r3.zxy, r8.wxz);
    r2.y = ps;
    ps = r6.w;
    r5.w = r2.z * r2.w;
    r6.xyz = r5.www * r6.xyz + ModShadowColor.xyz;
    ps = r1.z * ps;
    r9.xyz = r3.xzy * r5.zzz;
    r2.z = ps;
    r1.xyz = r9.xyz * 2.0 - r8.xwz;
    ps = -SpotAngles.x - -r5.y;
    r5.z = saturate(dot(r2.zxy, r1.yxz));
    r5.y = ps;
    ps = log2(r5.z);
    r8.x = saturate(r5.y * SpotAngles.y);
    r8.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.yz = r8.xy * r8.xz;
    r5.x = ps;
    ps = pow(2.0, r5.z);
    r5.w = saturate(dot(r3.zxy, r2.zxy));
    r6.w = ps;
    ps = pow(2.0, r5.x);
    r0.xyz = r0.xyw * r6.www;
    r5.x = ps;
    r0.xy = r7.xy * r5.ww + r0.xy;
    r0.z = r7.z * r5.w + r0.z;
    r0.xyz = r0.xyz * r5.xxx;
    r0.xyz = r0.xyz * r4.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r0.xzy * r5.yyy;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
