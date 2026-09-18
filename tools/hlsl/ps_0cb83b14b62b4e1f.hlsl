// ps_0cb83b14b62b4e1f.bin
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

    r4.y = dot(r1.zxy, r1.zxy);
    r4.x = 1.0 / r3.w;
    r5.xy = r4.xx * ScreenPositionScaleBias.xy;
    r4.z = 1.0 / ModShadowAccumResolution.y;
    r7.zw = -UniformVector_0.xy + 1.0;
    r4.x = 1.0 / ModShadowAccumResolution.x;
    r4.xz = r4.xz * abs(r6.xy);
    r5.xy = r5.xy * r3.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r4.xz).xy;
    r4.z = dot(r0.zxy, r0.zxy);
    r4.x = 0.1 - -r0.z;
    r2.w = saturate(-r4.y + 1.0);
    r4.z = rsqrt(abs(r4.z));
    r6.w = saturate(r4.z * r0.z);
    r5.w = rsqrt(abs(r4.y));
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r4.x = saturate(5.0 * r4.x);
    ps = 1.0 - r4.x;
    r4.y = dot(r2.zxy, r2.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r4.y));
    r8.xyz = r4.zzz * r0.zxy;
    r4.x = ps;
    ps = log2(r2.w);
    r4.yzw = r4.xxx * r2.xyz;
    r4.x = ps;
    r7.xy = -r0.ww * ModShadowGroupColor.xy + 1.0;
    ps = -r4.y;
    r2.xyz = r5.www * -SpotDirection.xyz;
    r0.y = ps;
    r0.x = r4.w * 2.0 - r4.w;
    ps = -r4.z;
    r4.y = dot(r2.zxy, r1.zxy);
    r0.z = ps;
    ps = -SpotAngles.x - -r4.y;
    r4.z = saturate(dot(r8.yzx, r0.yzx));
    r4.y = ps;
    ps = log2(r4.z);
    r0.x = saturate(r4.y * SpotAngles.y);
    r6.z = ps;
    r6.xyz = r6.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r6.z);
    r0.y = r0.x * r0.x;
    r4.y = ps;
    r4.zw = r6.xy * r7.xy + 0.125;
    ps = LightColorAndFalloffExponent.w * r4.x;
    r1.z = r4.y * 0.21952;
    r4.y = ps;
    r1.xy = r6.ww * r7.zw + r1.zz;
    ps = pow(2.0, r4.y);
    r4.x = r4.z * r4.w;
    r4.w = ps;
    r4.xyz = r4.xxx * r3.xyz + ModShadowColor.xyz;
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
