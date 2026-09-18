// ps_ea5736516c7330ce.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 180 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002D0 10040E00 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c12); // float2
float4 SpotDirection : register(c11); // float3
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ShadowTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
    float4 color2 : COLOR2; // r8
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
    float4 r7 = In.color1;
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r6.xx * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    r6.xy = r6.xy * abs(r9.xy);
    r6.zw = r6.zw * r5.xy + ScreenPositionScaleBias.wz;
    r13.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r5.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r14.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r12.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r7.z = tex2D(ShadowTexture, r0.xy).x;
    r7.xyw = tex2D(Texture2D_0, r1.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    ps = r2.z;
    r6.z = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r11.xy = r6.xy * 0.875;
    r6.x = ps;
    r9.xyz = r7.xyw * 2.0 - 1.0;
    ps = 1.0 - r6.z;
    r7.x = dot(r2.zxy, r2.zxy);
    r6.y = saturate(ps);
    ps = r7.z * r7.z;
    r7.y = dot(r4.zxy, r4.zxy);
    r8.w = ps;
    ps = 5.0 * r6.x;
    r1.xyz = r12.zzz * UniformVector_3.xyz;
    r6.x = saturate(ps);
    ps = rsqrt(abs(r7.y));
    r0.xyz = -r5.xyz + r14.xyz;
    r7.y = ps;
    r5.xyz = r0.xyz * UniformScalar_0.xxx + r5.xyz;
    ps = rsqrt(abs(r7.x));
    r4.xyz = r7.yyy * r4.xyz;
    r7.x = ps;
    ps = 1.0 - r6.x;
    r7.xyz = r7.xxx * r2.xyz;
    r7.w = ps;
    ps = rsqrt(abs(r6.z));
    r0.xyz = r8.www * r13.xyz;
    r6.x = ps;
    r1.xyz = r12.yyy * UniformVector_2.xyz + r1.xyz;
    ps = log2(r6.y);
    r2.xyz = r6.xxx * -SpotDirection.xyz;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r6.z = dot(r9.zxy, r9.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.z));
    r6.y = dot(r2.zxy, r3.zxy);
    r6.z = ps;
    r1.xyz = r12.xxx * UniformVector_1.xyz + r1.xyz;
    r2.xy = -r7.ww * ModShadowGroupColor.xy + 1.0;
    r3.xy = r11.xy * r2.xy + 0.125;
    r1.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r1.xyz;
    ps = pow(2.0, r6.x);
    r9.xyz = r9.xyz * r6.zzz;
    r6.x = ps;
    r0.xyz = r0.xzy * r6.xxx;
    r6.w = saturate(dot(r9.zxy, r7.zxy));
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r6.z = dot(r9.zxy, r4.zxy);
    r6.x = ps;
    r1.xyz = (-abs(r6.xxx) >= 0.0) ? 1.0 : r1.xyz;
    ps = -SpotAngles.x - -r6.y;
    r2.xyz = r1.xyz * UniformScalar_5.xxx;
    r6.x = ps;
    ps = SpotAngles.y * r6.x;
    r1.xyz = r5.xyz * r1.xyz;
    r3.z = saturate(ps);
    ps = r1.x;
    r6.xyz = r9.xzy * r6.zzz;
    ps = r8.x * ps;
    r2.xyz = r2.xyz * r5.xyz;
    r1.x = ps;
    r6.xyz = r6.xyz * 2.0 - r4.xzy;
    ps = r1.y;
    r3.w = saturate(dot(r7.zxy, r6.yxz));
    ps = r8.y * ps;
    r7.xyz = r3.wxz * r3.wyz;
    r1.y = ps;
    r6.xyz = r7.yyy * r10.xyz + ModShadowColor.xyz;
    ps = r1.z;
    r7.w = r7.x * r3.w;
    ps = r8.z * ps;
    r7.xyw = r2.xyz * r7.www;
    r1.z = ps;
    r8.xy = r1.xy * r6.ww + r7.xy;
    r8.z = r1.z * r6.w + r7.w;
    r8.xyz = r0.xzy * r8.xyz;
    r8.xyz = r8.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r8.xzy * r7.zzz;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
