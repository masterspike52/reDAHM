// ps_89318f3d6a57522c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000264 10040B00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    r6.w = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r7.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r8.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r6.xyz = tex2D(Texture2D_4, r0.xy).yxz;
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.yw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = r1.z;
    r0.y = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r5.z = dot(r2.zxy, r2.zxy);
    r5.x = ps;
    ps = 1.0 - r5.z;
    r0.zw = r5.yw * 0.875;
    r5.y = saturate(ps);
    r10.xyz = r10.xyz * 2.0 - 1.0;
    ps = 5e+01 * r6.y;
    r5.x = saturate(r5.x * 5.0);
    r0.x = ps;
    ps = 1.0 - r5.x;
    r8.xyz = r8.xyz * r2.www;
    r5.w = ps;
    ps = r0.x;
    r4.xyz = r7.xyz + r4.xyz;
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r4.xyz = r4.xyz * r11.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r6.w));
    r7.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r5.z));
    r1.xyz = r5.xxx * r3.xyz;
    r5.x = ps;
    ps = 0.0001;
    r3.xyz = r5.xxx * -SpotDirection.xyz;
    r0.y = ps;
    ps = log2(r5.y);
    r5.z = dot(r10.zxy, r10.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.z));
    r5.y = dot(r3.zxy, r2.zxy);
    r6.w = ps;
    r5.zw = -r5.ww * ModShadowGroupColor.xy + 1.0;
    r5.zw = r0.zw * r5.zw + 0.125;
    ps = max(r0.x, r0.y);
    r2.xyz = r10.xyz * r6.www;
    r0.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.y = dot(r2.zxy, r1.zxy);
    r6.w = ps;
    ps = -SpotAngles.x - -r5.y;
    r5.z = r5.z * r5.w;
    r5.x = ps;
    r5.yzw = r5.zzz * r9.xyz + ModShadowColor.xyz;
    ps = SpotAngles.y * r5.x;
    r3.xyz = r2.xzy * r0.yyy;
    r0.y = saturate(ps);
    r1.xyz = r3.xyz * 2.0 - r1.xzy;
    ps = pow(2.0, r6.w);
    r5.x = saturate(dot(r7.zxy, r1.yxz));
    r6.w = ps;
    ps = log2(r5.x);
    r1.xyz = r8.xyz * r6.www;
    r0.z = ps;
    r0.xy = r0.xy * r0.zy;
    ps = pow(2.0, r0.x);
    r5.x = saturate(dot(r2.zxy, r7.zxy));
    r6.w = ps;
    r6.xyz = r6.www * r6.yxz;
    r6.xy = r4.xy * r5.xx + r6.xy;
    r6.z = r4.z * r5.x + r6.z;
    r6.xyz = r1.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xyz * r0.yyy;
    r5.xyz = r6.xyz * r5.yzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
