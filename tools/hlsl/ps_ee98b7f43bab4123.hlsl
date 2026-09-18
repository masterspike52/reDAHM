// ps_ee98b7f43bab4123.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 117 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001D4 10040800 0000060A 00000000 000058C6 000F003F 00000001 00007054 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
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
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord4 : TEXCOORD4; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 color0 : COLOR0; // r4
    float4 color2 : COLOR2; // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord4;
    float4 r1 = In.texcoord5;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r3.w;
    r4.w = dot(r2.zxy, r2.zxy);
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.xy = r4.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r4.xy = r4.xy * r3.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.z = dot(r0.zxy, r0.zxy);
    r5.x = ps;
    r5.xy = r5.xy * abs(r6.xy);
    r6.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r3.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    ps = r0.z;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r4.x = dot(r1.zxy, r1.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r4.x));
    r5.xyz = r5.xyz * float3(32.0, 2e+01, 0.5);
    r4.y = ps;
    ps = 1.0 - r4.x;
    r7.xyz = r3.xyz * r1.www;
    r4.x = saturate(ps);
    ps = rsqrt(abs(r4.z));
    r0.w = saturate(r5.w * 5.0);
    r5.w = ps;
    ps = rsqrt(abs(r4.w));
    r4.z = saturate(r5.w * r0.z);
    r4.w = ps;
    ps = log2(r4.x);
    r0.w = -r0.w + 1.0;
    r4.x = ps;
    r3.xy = -r0.ww * ModShadowGroupColor.xy + 1.0;
    ps = LightColorAndFalloffExponent.w * r4.x;
    r2.xyz = r4.www * r2.zxy;
    r4.w = ps;
    ps = -r2.y;
    r8.xyz = r4.yyy * -SpotDirection.xyz;
    r2.y = ps;
    r2.x = r2.x * 2.0 - r2.x;
    ps = -r2.z;
    r4.y = dot(r8.zxy, r1.zxy);
    r2.z = ps;
    ps = -SpotAngles.x - -r4.y;
    r0.xyz = r5.www * r0.zxy;
    r4.x = ps;
    ps = pow(2.0, r4.w);
    r4.y = saturate(dot(r0.yzx, r2.yzx));
    r4.w = ps;
    ps = log2(r4.y);
    r1.xyz = r7.xyz * r4.www;
    r6.z = ps;
    ps = SpotAngles.y * r4.x;
    r2.xyz = r6.xyz * float3(0.875, 0.875, 15.0);
    r0.x = saturate(ps);
    r0.zw = r2.xy * r3.xy + 0.125;
    ps = pow(2.0, r2.z);
    r0.y = r0.x * r0.x;
    r4.x = ps;
    r5.xyz = r5.xyz * r4.zzz + r4.xxx;
    ps = r0.z * r0.w;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r4.w = ps;
    r4.xyz = r4.www * r4.xyz + ModShadowColor.xyz;
    r5.xyz = r1.xyz * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.yzw = r5.yzx * r0.yyx;
    r5.x = r5.w * r0.x;
    r4.xyz = r5.xzy * r4.xzy;
    oC0.xyz = r4.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
