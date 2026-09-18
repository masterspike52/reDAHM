// ps_9cfb1f57681d62e6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 132 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000210 10040900 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c7); // float4
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
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
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.xy * 2.0 + UniformVector_1.xy;
    r6.zw = r0.xy * 0.5 + UniformVector_2.xy;
    ps = 1.0 / r4.w;
    r5.z = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r5.ww * ScreenPositionScaleBias.xy;
    r0.y = ps;
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.w = dot(r1.zxy, r1.zxy);
    r0.x = ps;
    r0.xy = r0.xy * abs(r7.xy);
    r4.yz = tex2D(ModShadowAccumTexture, r0.xy).xy;
    r9.xyz = tex2D(Texture2D_0, r6.zw).xyz;
    r8.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r7.xyz = tex2D(Texture2D_0, r5.xy).xyz;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    ps = r1.z;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    ps = 0.1 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    r7.xyz = r7.xyz * 4.0 - 4.0;
    ps = rsqrt(abs(r5.w));
    r8.xyz = r8.xyz * r2.www;
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r2.xyz = r5.www * r1.xyz;
    r5.z = ps;
    ps = 5.0 * r5.y;
    r1.xyz = r5.zzz * r3.xyz;
    r5.y = saturate(ps);
    r3.xyz = r9.xyz * 4.0 + r7.xyz;
    ps = 1.0 - r5.x;
    r5.y = -r5.y + 1.0;
    r5.w = saturate(ps);
    r5.xy = -r5.yy * ModShadowGroupColor.xy + 1.0;
    ps = log2(r5.w);
    r5.z = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r5.w = r5.w * LightColorAndFalloffExponent.w;
    r5.z = ps;
    r7.xyz = r3.xyz * r5.zzz;
    r5.z = dot(r7.zxy, r1.zxy);
    ps = UniformVector_3.x * r6.y;
    r3.yzw = r7.xzy * r5.zzz;
    r3.x = ps;
    r1.xyz = r3.yzw * 2.0 - r1.xzy;
    ps = pow(2.0, r5.w);
    r5.z = saturate(dot(r2.zxy, r1.yxz));
    r5.w = ps;
    ps = log2(r5.z);
    r1.xyz = r8.xyz * r5.www;
    r5.z = ps;
    ps = UniformVector_3.y * r6.z;
    r5.w = r5.z * 15.0;
    r3.y = ps;
    ps = pow(2.0, r5.w);
    r5.z = saturate(dot(r7.zxy, r2.zxy));
    r4.x = ps;
    ps = UniformVector_3.z * r6.x;
    r2.xyz = r4.xyz * float3(0.21952, 0.875, 0.875);
    r3.z = ps;
    r6.xyz = r3.xyz * r5.zzz + r2.xxx;
    r5.xy = r2.yz * r5.xy + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r1.xyz * r6.xyz;
    r5.x = ps;
    r5.xyz = r5.xxx * r0.xyz + ModShadowColor.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
