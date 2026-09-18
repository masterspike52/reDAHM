// ps_5ce6f874e18db330.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040A00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.y = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r6.xx * ScreenPositionScaleBias.xy;
    r6.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = dot(r3.zxy, r3.zxy);
    r6.z = ps;
    r6.zw = r6.zw * abs(r8.xy);
    r7.xy = r7.xy * r5.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r7.y = tex2D(ShadowTexture, r0.xy).x;
    r9.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r0.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    ps = rsqrt(abs(r6.y));
    r7.w = saturate(-r6.x + 1.0);
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r0.x = saturate(r6.z * r2.z);
    r7.x = ps;
    ps = r2.z;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r6.y = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r8.xyz = r8.xyz * r0.yzw;
    r7.z = ps;
    ps = rsqrt(abs(r6.y));
    r10.xyz = r6.zzz * r2.zxy;
    r6.x = ps;
    ps = log2(r7.w);
    r6.yzw = r6.xxx * r4.xyz;
    r6.x = ps;
    r7.zw = -r7.zz * ModShadowGroupColor.xy + 1.0;
    ps = -r6.y;
    r4.xyz = r7.xxx * -SpotDirection.xyz;
    r2.y = ps;
    r2.x = r6.w * 2.0 - r6.w;
    ps = -r6.z;
    r6.y = dot(r4.zxy, r3.zxy);
    r2.z = ps;
    ps = -SpotAngles.x - -r6.y;
    r6.z = saturate(dot(r10.yzx, r2.yzx));
    r6.y = ps;
    ps = log2(r6.z);
    r7.x = saturate(r6.y * SpotAngles.y);
    r9.z = ps;
    r6.yzw = r9.xyz * float3(0.875, 0.875, 15.0);
    r7.zw = r6.yz * r7.zw + 0.125;
    ps = pow(2.0, r6.w);
    r7.xyz = r7.zxy * r7.wxy;
    r8.w = ps;
    r0 = r8 * r0.xxxw;
    r6.yzw = r7.xxx * r1.xyz + ModShadowColor.xyz;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r0.xyz = r0.xyw + r0.wwz;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r1.xyz = r7.zzz * r5.xyz;
    r6.x = ps;
    r1.xyz = r1.xzy * r6.xxx;
    r0.xyz = r1.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r0.xzy * r7.yyy;
    r6.xyz = r7.xzy * r6.yzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
