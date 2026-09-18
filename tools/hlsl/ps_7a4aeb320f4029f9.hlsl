// ps_7a4aeb320f4029f9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 117 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001D4 10040900 0000060A 00000000 000058C6 000F003F 00000001 00007054 0000F155 00007256 0000F357 0000F4A0 0000F5A2
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
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.w = r0.z + 0.1;
    r4.x = 1.0 / r3.w;
    r5.xy = r4.xx * ScreenPositionScaleBias.xy;
    r4.y = 1.0 / ModShadowAccumResolution.y;
    r4.z = dot(r1.zxy, r1.zxy);
    r4.x = 1.0 / ModShadowAccumResolution.x;
    r4.xy = r4.xy * abs(r6.xy);
    r5.xy = r5.xy * r3.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r4.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r3.yzw = -UniformVector_0.xyz + 1.0;
    r4.w = saturate(1.0 - r4.z);
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r8.x = 0.875 * r4.x;
    r5.w = dot(r0.zxy, r0.zxy);
    r8.y = 0.875 * r4.y;
    r4.x = saturate(r0.w * 5.0);
    r2.w = rsqrt(abs(r5.w));
    r5.w = dot(r2.zxy, r2.zxy);
    r4.y = 1.0 - r4.x;
    r0.w = saturate(r2.w * r0.z);
    r4.z = rsqrt(abs(r4.z));
    r7.xyz = r2.www * r0.zxy;
    r4.x = rsqrt(abs(r5.w));
    r0.xyz = r4.xxx * r2.xyz;
    r4.x = log2(r4.w);
    r9.xyz = r4.zzz * -SpotDirection.xyz;
    r2.y = -r0.x;
    r2.x = r0.z * 2.0 - r0.z;
    r4.zw = -r4.yy * ModShadowGroupColor.xy + 1.0;
    r4.y = dot(r9.zxy, r1.zxy);
    r2.z = -r0.y;
    r0.xy = r8.xy * r4.zw + 0.125;
    r5.w = saturate(dot(r7.yzx, r2.yzx));
    r4.w = LightColorAndFalloffExponent.w * r4.x;
    ps = -SpotAngles.x - -r4.y;
    r4.x = r0.x * r0.y;
    r0.x = ps;
    r4.xyz = r4.xxx * r6.xyz + ModShadowColor.xyz;
    ps = log2(r5.w);
    r0.x = saturate(r0.x * SpotAngles.y);
    r3.x = ps;
    ps = pow(2.0, r4.w);
    r1 = r3 * float4(15.0, 32.0, 2e+01, 0.5);
    r4.w = ps;
    ps = pow(2.0, r1.x);
    r0.y = r0.x * r0.x;
    r5.w = ps;
    r1.xyz = r1.yzw * r0.www + r5.www;
    r1.xyz = r1.xyz * r4.www;
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
