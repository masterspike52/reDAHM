// ps_ca4b666ba4af8f8b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 135 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000021C 10040A00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r6.w = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = r1.z;
    r6.z = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    ps = 0.875 * r5.x;
    r4.xyz = r0.xyz * r7.xyz;
    r6.x = ps;
    ps = 0.875 * r5.y;
    r0.xyz = r10.xyz * r2.www;
    r6.y = ps;
    ps = rsqrt(abs(r5.z));
    r5.y = saturate(-r6.z + 1.0);
    r0.w = ps;
    ps = 5.0 * r5.w;
    r5.x = dot(r9.zxy, r9.zxy);
    r5.z = saturate(ps);
    ps = rsqrt(abs(r6.w));
    r1.xyz = r0.www * r1.xyz;
    r5.w = ps;
    ps = rsqrt(abs(r6.z));
    r3.xyz = r5.www * r3.xyz;
    r5.w = ps;
    ps = log2(r5.y);
    r10.xyz = r5.www * -SpotDirection.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r5.w = dot(r10.zxy, r2.zxy);
    r5.x = ps;
    ps = 1.0 - r5.z;
    r2.xyz = r5.xxx * r9.xyz;
    r5.x = ps;
    r5.xz = -r5.xx * ModShadowGroupColor.xy + 1.0;
    r6.zw = r6.xy * r5.xz + 0.125;
    r5.x = dot(r2.zxy, r3.zxy);
    ps = -SpotAngles.x - -r5.w;
    r9.xyz = r2.xzy * r5.xxx;
    r5.x = ps;
    r3.xyz = r9.xyz * 2.0 - r3.xzy;
    ps = SpotAngles.y * r5.x;
    r6.y = saturate(dot(r1.zxy, r3.yxz));
    r6.x = saturate(ps);
    ps = LightColorAndFalloffExponent.w * r5.y;
    r5.xw = r6.zx * r6.wx;
    r6.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    ps = log2(r6.y);
    r6.w = saturate(dot(r2.zxy, r1.zxy));
    r7.w = ps;
    ps = pow(2.0, r6.x);
    r1 = r7 * float4(4.0, 4.0, 4.0, 15.0);
    r6.x = ps;
    ps = pow(2.0, r1.w);
    r0.xyz = r0.xzy * r6.xxx;
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r4.xy * r6.ww + r6.xy;
    r6.z = r4.z * r6.w + r6.z;
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
