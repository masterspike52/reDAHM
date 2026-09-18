// ps_094176da49b4b65d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003A8 10041100 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_11 : register(c10); // float
float4 UniformScalar_12 : register(c11); // float
float4 UniformScalar_13 : register(c12); // float
float4 UniformScalar_8 : register(c9); // float
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
sampler2D ShadowTexture : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

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
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_4, r1.xy);
    ps = 1.0 / r5.w;
    r6.yz = r5.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    r7.xy = r6.yz * r6.xx + ScreenPositionScaleBias.wz;
    ps = r13.w;
    r6.xz = r1.wz * UniformVector_5.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15.xyz = UniformVector_3.xzy * 2e+01;
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r7.w = ps;
    ps = (-0.5) + r6.y;
    r7.zw = r7.zw * abs(r8.xy);
    r6.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r8.yz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r11.xyw = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r0.y = tex2D(ShadowTexture, r0.xy).x;
    r10 = tex2D(Texture2D_2, r1.xy);
    r17.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r14 = tex2D(Texture2D_1, r1.xy);
    r0.xzw = tex2D(Texture2D_3, r6.xz).xyz;
    r11.z = saturate(r5.w * 0.0001);
    r5.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformVector_4.x;
    r7.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = 2e+01 * ps;
    r1.w = float((UniformScalar_11.x >= 1.0));
    r16.x = ps;
    ps = UniformVector_4.z;
    r7.x = dot(r4.zxy, r4.zxy);
    ps = 2e+01 * ps;
    r6.z = dot(r2.zxy, r2.zxy);
    r16.y = ps;
    ps = UniformVector_4.y;
    r6.x = dot(r3.zxy, r3.zxy);
    ps = 2e+01 * ps;
    r6.y = r2.z + 0.1;
    r16.z = ps;
    ps = 5.0 * r6.y;
    r7.y = float((UniformScalar_11.x > 1.0));
    r6.w = saturate(ps);
    r0.xzw = (-abs(r7.yyy) >= 0.0) ? r0.xzw : 1.0;
    ps = 1.0 - r6.x;
    r9.xyz = r13.xyz * UniformScalar_12.xxx;
    r2.w = saturate(ps);
    ps = rsqrt(abs(r6.z));
    r14.xyz = r14.xzy * r14.www;
    r7.z = ps;
    r6.xyz = r17.zxy * 2.0 - 1.0;
    ps = UniformVector_2.x * r6.y;
    r1.xyz = r10.xzy * r10.www;
    r7.y = ps;
    ps = rsqrt(abs(r7.x));
    r3.xyz = r7.zzz * r2.xyz;
    r7.x = ps;
    ps = UniformVector_2.y * r6.z;
    r10.xyz = r7.xxx * r4.xyz;
    r7.z = ps;
    ps = UniformVector_2.z * r6.x;
    r1.xyz = r16.xyz * r1.xyz;
    r7.x = ps;
    ps = log2(r2.w);
    r4.xyz = r15.xyz * r14.xyz;
    r6.x = ps;
    r0.xzw = (-abs(r1.www) >= 0.0) ? 1.0 : r0.xzw;
    r9.xyz = r9.xyz * r0.xzw + UniformScalar_13.xxx;
    r2.xyz = (-abs(r7.www) >= 0.0) ? r1.yxz : r4.yxz;
    r1.xyw = (abs(r7.www) > 0.0) ? r4.zyx : r1.zyx;
    r4.xyz = r0.xzw * r13.xyz + r1.wxy;
    ps = 1.0 - r7.x;
    r6.y = dot(r1.ywx, float3(0.11, 0.3, 0.59));
    r0.x = ps;
    ps = r6.y;
    r0.z = saturate(dot(r2.zxy, float3(0.59, 0.11, 0.3)));
    ps = -r1.w + ps;
    r2.xy = -r7.yz * r0.zz;
    r6.y = ps;
    ps = r0.x * r0.z;
    r1.xyz = r4.xyz * r12.xyz;
    r2.z = ps;
    ps = r0.y * r0.y;
    r6.z = saturate(r6.y + r1.w);
    r2.w = ps;
    ps = 1.0 - r6.w;
    r0.xyz = r2.www * r11.xyw;
    r7.w = ps;
    ps = 1.0 - r6.z;
    r7.xyz = r7.xyz + r2.zxy;
    r6.y = ps;
    r11.xy = r7.ww * ModShadowGroupColor.xy;
    ps = (-1.0) - -r7.x;
    r2.xyz = -r11.xyz + 1.0;
    r7.w = ps;
    r7.xyw = r7.yzw * r2.zzz;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r7.z = r7.w + 1.0;
    r6.z = ps;
    r7.xyz = (r2.zzz > 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r7.xyz = (r2.zzz >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r6.z);
    r6.x = dot(r7.zxy, r7.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r0.xzy * r6.zzz;
    r6.x = ps;
    r4.xyz = r7.xyz * r6.xxx;
    r6.x = dot(r4.zxy, r10.zxy);
    r6.xzw = r4.xyz * r6.xxx;
    r6.xzw = r6.xzw * 2.0 - r10.xyz;
    r6.x = saturate(dot(r3.zxy, r6.wxz));
    ps = log2(r6.x);
    r7.xyz = r9.xyz * r6.yyy;
    r8.x = ps;
    r6.xyz = r8.yzx * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r6.z);
    r6.w = saturate(dot(r4.zyx, r3.zyx));
    r6.z = ps;
    r6.xy = r6.xy * r2.xy + 0.125;
    ps = r6.x * r6.y;
    r7.xyz = r7.xyz * r6.zzz;
    r6.x = ps;
    r6.xyz = r6.xxx * r5.xyz + ModShadowColor.xyz;
    r7.xy = r1.xy * r6.ww + r7.xy;
    r7.z = r1.z * r6.w + r7.z;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
