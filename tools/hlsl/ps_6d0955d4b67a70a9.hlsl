// ps_6d0955d4b67a70a9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 111 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001BC 10040800 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
sampler2D ModShadowAccumTexture : register(s2);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.yzw = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r5.xx * ScreenPositionScaleBias.xy;
    r6.w = ps;
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.w = dot(r3.zxy, r3.zxy);
    r6.z = ps;
    r6.zw = r6.zw * abs(r7.xy);
    r4.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r7.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r6.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r5.x = dot(r1.zxy, r1.zxy);
    r6.x = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r5.x));
    r0.z = saturate(-r6.x + 1.0);
    r0.x = ps;
    r6.x = saturate(r0.x * r1.z);
    ps = r1.z;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r6.yzw = r8.xyz * r6.yzw;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r2.xyz = r7.xyz * r2.www;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r1.w));
    r7.xyz = r0.xxx * r1.zxy;
    r0.x = ps;
    ps = 1.0 - r5.x;
    r1.xyz = r0.xxx * r3.zxy;
    r5.x = ps;
    r0.xy = -r5.xx * ModShadowGroupColor.xy + 1.0;
    r1.yz = -r1.yz;
    r1.x = r1.x * 2.0 - r1.x;
    ps = log2(r0.z);
    r5.x = saturate(dot(r7.yzx, r1.yzx));
    r0.z = ps;
    ps = log2(r5.x);
    r0.z = r0.z * LightColorAndFalloffExponent.w;
    r5.x = ps;
    ps = pow(2.0, r0.z);
    r5.x = r5.x * 15.0;
    r0.z = ps;
    ps = pow(2.0, r5.x);
    r1.xyz = r2.xyz * r0.zzz;
    r4.z = ps;
    r2.xyz = r4.xyz * float3(0.875, 0.875, 0.21952);
    r6.xyz = r6.yzw * r6.xxx + r2.zzz;
    r0.xy = r2.xy * r0.xy + 0.125;
    ps = r0.x * r0.y;
    r6.xyz = r1.xyz * r6.xyz;
    r5.x = ps;
    r5.xyz = r5.xxx * r5.yzw + ModShadowColor.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
