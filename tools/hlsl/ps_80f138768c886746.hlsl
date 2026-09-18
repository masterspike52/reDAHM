// ps_80f138768c886746.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 243 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003CC 10040E00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r11.w - 0.5;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.w = dot(r2.zxy, r2.zxy);
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r13 = tex2D(Texture2D_1, r0.xy);
    r7 = tex2D(Texture2D_2, r0.xy).xzyw;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r6.z = saturate(r4.w * 0.0001);
    r6.w = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r5.z = r1.z + 0.1;
    r3.w = ps;
    ps = 5.0 * r5.z;
    r9.xy = r0.wz * UniformVector_5.xy;
    r6.x = saturate(ps);
    ps = 0.875 * r5.x;
    r8.xyz = UniformVector_4.xzy * 2e+01;
    r10.x = ps;
    ps = r7.x * r7.w;
    r12.xyz = UniformVector_3.xzy * 2e+01;
    r7.x = ps;
    ps = r7.y * r7.w;
    r10.yzw = r13.xzy * r13.www;
    r7.y = ps;
    ps = r7.z * r7.w;
    r13.xyz = r12.xyz * r10.yzw;
    r7.z = ps;
    ps = 0.875 * r5.y;
    r12.xyz = r8.xyz * r7.xyz;
    r10.y = ps;
    r7.xyz = (abs(r3.www) > 0.0) ? r13.xzy : r12.xzy;
    ps = 1.0 - r6.x;
    r10.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r8.xyz = (abs(r6.www) > 0.0) ? r7.xyz : r12.xzy;
    ps = 1.0 - r6.z;
    r5.x = dot(r8.zxy, float3(0.11, 0.3, 0.59));
    r6.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r5.x = r5.x - r8.x;
    r7.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r7.z = saturate(r5.x + r8.x);
    r7.y = ps;
    ps = 1.0 / r4.w;
    r7.xyz = -r7.xyz + 1.0;
    r7.w = ps;
    r5.xy = r10.zw * r7.ww + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_3, r9.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r5.z = float((UniformScalar_8.x >= 1.0));
    r6.z = dot(r1.zxy, r1.zxy);
    ps = -ModShadowColor.x;
    r5.x = float((UniformScalar_8.x > 1.0));
    ps = 1.0 + ps;
    r5.y = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r5.y));
    r0.xyz = r0.xyz * r2.www;
    r5.y = ps;
    r14.xyz = (-abs(r5.xxx) >= 0.0) ? r9.xyz : 1.0;
    ps = 1.0 - r5.w;
    r2.xyz = r11.xyz * UniformScalar_9.xxx;
    r5.x = saturate(ps);
    r4.xyz = r4.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r9.xyz = r4.xyz * UniformVector_2.xyz;
    r5.w = ps;
    ps = log2(r5.x);
    r4.xyz = r5.www * r1.xyz;
    r5.x = ps;
    r1.yzw = (-abs(r5.zzz) >= 0.0) ? 1.0 : r14.xyz;
    r2.xyz = r2.xyz * r1.yzw + UniformScalar_10.xxx;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r3.xyz = r5.yyy * r3.xyz;
    r5.w = ps;
    r5.xyz = (-abs(r3.www) >= 0.0) ? r12.yxz : r13.yxz;
    r5.xyz = (-abs(r6.www) >= 0.0) ? r12.yxz : r5.xyz;
    ps = pow(2.0, r5.w);
    r1.x = -r9.z + 1.0;
    r5.w = ps;
    ps = -ModShadowColor.y;
    r0.xyz = r0.xzy * r5.www;
    r8.xyz = r1.yzw * r11.xyz + r8.xyz;
    ps = 1.0 + ps;
    r1.w = saturate(dot(r5.zxy, float3(0.59, 0.11, 0.3)));
    r6.z = ps;
    ps = -ModShadowColor.z;
    r5.xy = -r9.xy * r1.ww;
    r1.yz = r10.xy * r7.xy + 0.125;
    ps = 1.0 + ps;
    r5.zw = r1.xy * r1.wz;
    r6.w = ps;
    r6.yzw = r5.www * r6.yzw + ModShadowColor.xyz;
    r5.xyz = r9.zxy + r5.zxy;
    ps = (-1.0) - -r5.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = r5.wyz * r6.xxx;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r6.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r6.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r1.xyz = r8.xyz * r1.xyz;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r3.zxy);
    r8.xyz = r5.yzw * r5.xxx;
    r3.xyz = r8.xyz * 2.0 - r3.xyz;
    r5.x = saturate(dot(r4.zxy, r3.zxy));
    ps = log2(r5.x);
    r2.xyz = r2.xyz * r7.zzz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r4.zyx));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r0.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.ywz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
