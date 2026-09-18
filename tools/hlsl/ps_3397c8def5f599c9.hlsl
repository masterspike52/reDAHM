// ps_3397c8def5f599c9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000264 10040B00 0000070A 00000000 000060E7 001F007F 00000001 00003050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
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
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
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
    float4 r6 = In.color1;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r10.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r0.zw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r4.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = r1.z;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    ps = 1.0 - r5.x;
    r5.w = dot(r1.zxy, r1.zxy);
    r6.w = saturate(ps);
    r7.xyz = r4.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r0.xy = r0.zw * 0.875;
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r4.xyz = r5.www * r1.xyz;
    r5.z = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r5.zzz * r3.xyz;
    r5.x = ps;
    ps = 5.0 * r5.y;
    r3.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r5.w = dot(r7.zxy, r7.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.w));
    r5.y = dot(r3.zxy, r2.zxy);
    r5.x = ps;
    r5.zw = -r5.zz * ModShadowGroupColor.xy + 1.0;
    r0.xz = r0.xy * r5.zw + 0.125;
    ps = -SpotAngles.x - -r5.y;
    r7.xyz = r7.xyz * r5.xxx;
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r5.y = dot(r7.zxy, r1.zxy);
    r0.w = saturate(ps);
    ps = log2(abs(r8.z));
    r5.xyz = r7.xzy * r5.yyy;
    r0.y = ps;
    r1.xyz = r5.xyz * 2.0 - r1.xzy;
    ps = log2(abs(r8.x));
    r5.xw = r0.xw * r0.zw;
    r0.z = ps;
    r5.xyz = r5.xxx * r11.xyz + ModShadowColor.xyz;
    ps = log2(abs(r8.y));
    r0.x = saturate(dot(r4.zxy, r1.yxz));
    r0.w = ps;
    ps = log2(r0.x);
    r3.xyz = r10.xyz * 0.4;
    r0.x = ps;
    ps = log2(r6.w);
    r0 = r0.xywz * float4(2e+01, 0.3, 0.3, 0.3);
    r6.w = ps;
    ps = pow(2.0, r0.w);
    r1.xyz = r9.xyz * r8.xyz;
    r2.x = ps;
    ps = pow(2.0, r0.z);
    r6.w = r6.w * LightColorAndFalloffExponent.w;
    r2.y = ps;
    ps = pow(2.0, r0.y);
    r0.w = saturate(dot(r7.zxy, r4.zxy));
    r2.z = ps;
    r2.xyz = saturate(r2.xyz - 0.2);
    ps = pow(2.0, r0.x);
    r2.xyz = r3.xyz * r2.xyz;
    r0.x = ps;
    ps = pow(2.0, r6.w);
    r0.xyz = r2.xyz * r0.xxx;
    r6.w = ps;
    r0.xy = r1.xy * r0.ww + r0.xy;
    r0.z = r1.z * r0.w + r0.z;
    r0.xyz = r0.xyz * r6.www;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xyz * r5.www;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
