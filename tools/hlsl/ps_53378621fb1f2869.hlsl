// ps_53378621fb1f2869.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 117 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001D4 10040800 0000070A 00000000 000060E7 001F007F 00000001 00003050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
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
sampler2D ShadowTexture : register(s1);
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

    r6.x = r1.z + 0.1;
    r5.x = 1.0 / r4.w;
    r6.yz = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = 1.0 / ModShadowAccumResolution.y;
    r5.z = dot(r2.zxy, r2.zxy);
    r5.x = 1.0 / ModShadowAccumResolution.x;
    r5.xy = r5.xy * abs(r7.xy);
    r6.yz = r6.yz * r4.xy + ScreenPositionScaleBias.wz;
    r7.xyz = tex2D(LightAttenuationTexture, r6.yz).xyz;
    r0.z = tex2D(ShadowTexture, r0.xy).x;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = saturate(1.0 - r5.z);
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = 0.875 * r5.x;
    ps = 0.875 * r5.y;
    r5.w = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    ps = rsqrt(abs(r5.w));
    r5.x = saturate(r6.x * 5.0);
    r6.z = ps;
    ps = 1.0 - r5.x;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r6.y = saturate(r6.z * r1.z);
    r5.y = ps;
    ps = rsqrt(abs(r6.x));
    r1.xyz = r6.zzz * r1.zxy;
    r5.x = ps;
    ps = log2(r0.w);
    r6.xzw = r5.xxx * r3.zxy;
    r5.x = ps;
    ps = -r6.z;
    r3.xyz = r5.yyy * -SpotDirection.xyz;
    r6.z = ps;
    r6.x = r6.x * 2.0 - r6.x;
    ps = -r6.w;
    r5.y = dot(r3.zxy, r2.zxy);
    r6.w = ps;
    r5.zw = -r5.ww * ModShadowGroupColor.xy + 1.0;
    r0.xy = r0.xy * r5.zw + 0.125;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.z = saturate(dot(r1.yzx, r6.zwx));
    r6.x = ps;
    ps = -SpotAngles.x - -r5.y;
    r0.xy = r0.xz * r0.yz;
    r5.x = ps;
    r5.yzw = r0.xxx * r8.xyz + ModShadowColor.xyz;
    ps = log2(r6.z);
    r0.xyz = r0.yyy * r7.xyz;
    r4.w = ps;
    ps = pow(2.0, r6.x);
    r1 = r4 * float4(32.0, 2e+01, 0.5, 15.0);
    r6.x = ps;
    ps = pow(2.0, r1.w);
    r0.xyz = r0.xyz * r6.xxx;
    r6.x = ps;
    r6.xyz = r1.xyz * r6.yyy + r6.xxx;
    ps = SpotAngles.y * r5.x;
    r6.xyz = r0.xyz * r6.xyz;
    r0.x = saturate(ps);
    ps = r0.x * r0.x;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r0.y = ps;
    r6.yzw = r6.yzx * r0.yyx;
    r6.x = r6.w * r0.x;
    r5.xyz = r6.xzy * r5.ywz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
