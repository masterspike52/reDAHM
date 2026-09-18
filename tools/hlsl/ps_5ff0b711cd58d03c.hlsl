// ps_5ff0b711cd58d03c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10040B00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    r6.y = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r5.xy = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.z = ps;
    r5.zw = r5.zw * abs(r7.xy);
    r9.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r8.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.yzw = tex2D(Texture2D_1, r0.xy).xyz;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    ps = r1.z;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = 1.0 - r5.x;
    r7.xyz = r0.xyz * r5.yzw;
    r6.z = saturate(ps);
    r10.xyz = r10.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r0.xyz = r8.xyz * r2.www;
    r6.w = ps;
    ps = rsqrt(abs(r6.y));
    r8.xyz = r6.www * r1.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r6.yyy * r3.xyz;
    r5.x = ps;
    ps = 5.0 * r6.x;
    r11.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = saturate(ps);
    ps = UniformVector_1.x * r5.y;
    r6.y = dot(r10.zxy, r10.zxy);
    r6.x = ps;
    ps = log2(r6.z);
    r5.y = -r5.x + 1.0;
    r5.x = ps;
    r3.xy = -r5.yy * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r6.y));
    r5.y = dot(r11.zxy, r2.zxy);
    r6.y = ps;
    ps = UniformVector_1.y * r5.z;
    r2.xyz = r10.xyz * r6.yyy;
    r6.y = ps;
    ps = UniformVector_1.z * r5.w;
    r6.w = dot(r2.zxy, r1.zxy);
    r6.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r10.xyz = r2.xzy * r6.www;
    r5.z = ps;
    r1.xyz = r10.xyz * 2.0 - r1.xzy;
    ps = pow(2.0, r5.z);
    r5.x = saturate(dot(r8.zxy, r1.yxz));
    r5.z = ps;
    ps = log2(r5.x);
    r0.xyz = r0.xzy * r5.zzz;
    r9.x = ps;
    ps = -SpotAngles.x - -r5.y;
    r1.xyz = r9.xyz * float3(15.0, 0.875, 0.875);
    r5.x = ps;
    r5.zw = r1.yz * r3.xy + 0.125;
    ps = pow(2.0, r1.x);
    r6.w = saturate(dot(r2.zxy, r8.zxy));
    r5.y = ps;
    ps = SpotAngles.y * r5.x;
    r6.xyz = r6.xyz * r5.yyy;
    r5.y = saturate(ps);
    r6.xy = r7.xy * r6.ww + r6.xy;
    r6.z = r7.z * r6.w + r6.z;
    r5.xw = r5.zy * r5.wy;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
