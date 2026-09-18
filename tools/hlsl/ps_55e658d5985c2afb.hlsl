// ps_55e658d5985c2afb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 135 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000021C 10040B00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c4); // float4
float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
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
    r11.z = -UniformVector_0.z + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r7.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r4.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = r1.z;
    r6.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r5.y = dot(r2.zxy, r2.zxy);
    r5.w = ps;
    ps = 1.0 - r5.y;
    r4.zw = r4.xy * 0.875;
    r5.x = saturate(ps);
    r10.xyz = r0.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r11.xy = r8.xy * float2(0.5, 3.0);
    r6.w = ps;
    ps = rsqrt(abs(r5.z));
    r5.y = saturate(r5.w * 5.0);
    r1.w = ps;
    ps = 1.0 - r5.y;
    r4.xy = -UniformVector_0.xy + 1.0;
    r0.w = ps;
    ps = r1.w;
    r5.yzw = -ModShadowColor.xyz + 1.0;
    ps = r1.x * ps;
    r9.xyz = r6.www * r3.xyz;
    r2.x = ps;
    ps = log2(r5.x);
    r6.w = dot(r10.zxy, r10.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r6.w));
    r0.xyz = r11.xyz * r7.xyz;
    r6.w = ps;
    r2.yz = -r0.ww * ModShadowGroupColor.xy + 1.0;
    r2.zw = r4.zw * r2.yz + 0.125;
    ps = r1.w;
    r3.xyz = r10.xyz * r6.www;
    ps = r1.y * ps;
    r6.w = dot(r3.zxy, r9.zxy);
    r2.y = ps;
    ps = r1.w;
    r0.w = r2.z * r2.w;
    r5.yzw = r0.www * r5.yzw + ModShadowColor.xyz;
    ps = r1.z * ps;
    r10.xyz = r3.xzy * r6.www;
    r2.z = ps;
    r1.xyz = r10.xyz * 2.0 - r9.xzy;
    r6.w = saturate(dot(r2.zxy, r1.yxz));
    ps = log2(r6.w);
    r1.y = saturate(dot(r3.zxy, r2.zxy));
    r8.w = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r4.zw = r8.zw * float2(4.0, 3e+01);
    r5.x = ps;
    ps = pow(2.0, r4.w);
    r2.xyz = r4.xyz * r7.xyz;
    r1.x = ps;
    ps = pow(2.0, r5.x);
    r0.xyz = r0.xyz * r1.xxy;
    r5.x = ps;
    r0.xyz = r2.xyz * r1.yyx + r0.xyz;
    r0.xyz = r0.xyz * r5.xxx;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xyz * r5.yzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
