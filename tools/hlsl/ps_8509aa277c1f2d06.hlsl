// ps_8509aa277c1f2d06.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 402 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000648 10041400 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D ShadowTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_7, r1.xy);
    ps = UniformVector_2.x * r1.w;
    r6.x = r11.w - 0.5;
    r6.z = ps;
    ps = 1.0 - r1.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r13.y = ps;
    r10.x = tex2D(ShadowTexture, r0.xy).x;
    r7.xw = r1.wz * 6.0;
    ps = r2.z;
    r0.xy = r1.wz * UniformVector_7.xy;
    ps = 0.1 + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = 1.0 / r5.w;
    r7.yz = r5.xy * ScreenPositionScaleBias.xy;
    r6.y = ps;
    r12.xy = r7.yz * r6.yy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.w));
    r6.y = r5.w - 4e+02;
    r6.w = ps;
    ps = 5.0 * r6.x;
    r0.zw = r1.wz * UniformVector_1.xy;
    r7.z = saturate(ps);
    ps = 0.00022222222 * r6.y;
    r9.xyz = r6.www * r4.xyz;
    r7.y = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r6.x = r7.y * (-0.025);
    r10.w = ps;
    r10.yz = r9.xy * r6.xx + r0.zw;
    r6.xw = r10.zx * r10.wx;
    ps = 1.0 / UniformVector_1.x;
    r13.x = -r6.x + 1.0;
    r13.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.xyw = r13.zxy * UniformVector_2.xyy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.zw = r4.yw - 0.5;
    r0.w = ps;
    ps = r4.x;
    r0.zw = r0.zw * abs(r8.xy);
    ps = r10.y * ps;
    r17.zw = float2((r4.yw >= 0.5));
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r8.zw = r12.zw - r4.yw;
    r8.x = ps;
    ps = (-0.5) + r6.z;
    r17.xy = float2((r6.xz >= 0.5));
    r8.y = ps;
    r8.xy = r8.xy - r6.xz;
    r4.xz = r8.xy * r17.xy + r6.xz;
    r4.yw = r8.zw * r17.zw + r4.yw;
    r4 = r4 + r4;
    r8.xyz = tex2D(Texture2D_6, r10.yz).xyz;
    r16.xyz = tex2D(LightAttenuationTexture, r12.xy).xyz;
    r19.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r12 = tex2D(Texture2D_1, r4.zw);
    r20 = tex2D(Texture2D_1, r4.xy);
    r4.xyw = tex2D(Texture2D_0, r10.yz).xyz;
    r0.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    r18 = tex2D(Texture2D_4, r1.xy);
    r13 = tex2D(Texture2D_5, r1.xy).xzyw;
    r15.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r10.xyw = tex2D(Texture2D_2, r7.xw).xyw;
    r1.yzw = tex2D(Texture2D_2, r1.wz).xyw;
    r14.xyz = UniformVector_5.xzy * 2e+01;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r6.x = dot(r3.zxy, r3.zxy);
    r7.x = ps;
    r19.zw = r10.xy * 2.0 - 1.0;
    r15.xyz = r15.xyz * 2.0 - 1.0;
    ps = 1.0 - r6.x;
    r6.z = float((UniformScalar_8.x >= 1.0));
    r6.y = saturate(ps);
    ps = r13.x * r13.w;
    r7.w = float((UniformScalar_8.x > 1.0));
    r13.x = ps;
    ps = r13.y * r13.w;
    r3.xyz = r18.xzy * r18.www;
    r13.y = ps;
    r0.xyz = (-abs(r7.www) >= 0.0) ? r0.xyz : 1.0;
    r0.xyz = (-abs(r6.zzz) >= 0.0) ? 1.0 : r0.yxz;
    ps = r13.z * r13.w;
    r3.xyz = r14.xyz * r3.xyz;
    r13.z = ps;
    ps = UniformScalar_9.x * r0.y;
    r14.xyz = UniformVector_6.xzy * 2e+01;
    r6.z = ps;
    ps = log2(r6.y);
    r13.xyz = r14.xyz * r13.xyz;
    r6.y = ps;
    r14.xyz = (abs(r7.xxx) > 0.0) ? r3.xzy : r13.xzy;
    r3.xyz = (-abs(r7.xxx) >= 0.0) ? r13.yxz : r3.yxz;
    r1.x = r6.z * r11.x;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r15.xyz = r15.xyz * UniformVector_4.xyz;
    r6.z = ps;
    r3.xyz = (-abs(r6.zzz) >= 0.0) ? r13.yxz : r3.xyz;
    r10.xyz = (abs(r6.zzz) > 0.0) ? r14.xyz : r13.xzy;
    ps = r5.w;
    r6.z = dot(r10.zxy, float3(0.11, 0.3, 0.59));
    ps = 0.0001 * ps;
    r13.w = saturate(dot(r3.zxy, float3(0.59, 0.11, 0.3)));
    r5.x = saturate(ps);
    r14.xy = -r15.xy * r13.ww + r15.xy;
    ps = r1.y + r1.y;
    r0.w = r6.z - r10.x;
    r18.z = ps;
    ps = r1.z + r1.z;
    r6.z = dot(r2.zxy, r2.zxy);
    r18.w = ps;
    ps = r10.w;
    r3.xyz = r4.xyw + r4.xyw;
    r5.yz = r17.zw * 2.0 + r17.xy;
    r7.w = (r5.y == 0.0) ? r20.x : r20.y;
    r7.x = (r5.z == 0.0) ? r12.x : r12.y;
    ps = r1.w * ps;
    r17 = r5.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r6.x = ps;
    r7.x = (r17.z == 0.0) ? r12.z : r7.x;
    r7.w = (r17.y == 0.0) ? r20.z : r7.w;
    r3.w = (r17.x == 0.0) ? r20.w : r7.w;
    r7.x = (r17.w == 0.0) ? r12.w : r7.x;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r12 = r3 + float4(-1.0, -1.0, -1.0, 0.25);
    r6.y = ps;
    ps = rsqrt(abs(r6.z));
    r7.w = r12.w + r3.w;
    r6.z = ps;
    ps = pow(2.0, r6.y);
    r7.w = saturate(r7.w - r6.x);
    r6.y = ps;
    ps = (-1.0) - -r6.x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r13.x = ps;
    ps = r0.w;
    r17.xyz = -ModShadowColor.xyz + 1.0;
    ps = r10.x + ps;
    r1.yz = r11.yz * UniformScalar_9.xx;
    r15.w = saturate(ps);
    ps = r7.x;
    r3.xyz = r6.zzz * r2.xyz;
    r2.x = ps;
    ps = 0.0;
    r1.yz = r1.yz * r0.xz;
    r2.y = ps;
    ps = max(r2.x, r2.y);
    r19 = r19 * float4(0.875, 0.875, 0.5, 0.5);
    r6.x = ps;
    ps = 1.0 - r7.x;
    r2.xyz = r1.xyz + UniformScalar_10.xxx;
    r6.z = ps;
    ps = 1.0 - r7.z;
    r1.xyz = r6.www * r16.xyz;
    r6.w = ps;
    ps = r6.x;
    r1.xyz = r1.xzy * r6.yyy;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.w;
    r16.xz = -r15.zw + 1.0;
    r5.y = ps;
    ps = ModShadowGroupColor.y * r6.w;
    r2.xyz = r2.xyz * r16.zzz;
    r5.z = ps;
    ps = 0.3;
    r5.xyz = -r5.xyz + 1.0;
    r6.y = ps;
    ps = min(r6.x, r6.y);
    r18.xy = r19.xy * r5.yz;
    r6.x = ps;
    ps = 3.3333333 * r6.x;
    r18 = r18 + float4(0.125, 0.125, -1.0, -1.0);
    r16.y = ps;
    ps = r18.x * r18.y;
    r13.yz = r18.zw + r19.zw;
    r6.x = ps;
    r7.xyz = r6.xxx * r17.xyz + ModShadowColor.xyz;
    ps = 2.5 * r6.z;
    r13 = r16.yyxy * r13.yzwx;
    r6.y = ps;
    ps = r15.z;
    r8.xyz = r7.www * r8.xyz;
    ps = r13.z + ps;
    r6.x = r13.w + 1.0;
    r13.z = ps;
    ps = r6.x * r6.z;
    r13.xy = r14.xy + r13.xy;
    r6.z = ps;
    ps = r6.y * r6.x;
    r5.yzw = -r12.xyz + r13.xyz;
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r6.z = float((r6.z > 0.9));
    r7.w = saturate(ps);
    r6.xy = r5.yz * r7.ww + r12.xy;
    r10.xyz = r6.zzz * r10.xyz - r8.xyz;
    r6.z = r5.w * r7.w - 2.0;
    r6.z = r4.w * 2.0 + r6.z;
    r0.xyz = r0.yxz * r11.xyz + r10.xyz;
    r0.xyz = r0.xyz * r7.www + r8.xyz;
    r6.xyz = r6.zxy * r5.xxx;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r5.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r5.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r2.xyz = r2.xyz * r7.www;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r9.zxy);
    r5.xyz = r6.yzw * r6.xxx;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    r6.x = saturate(dot(r3.zxy, r5.zxy));
    ps = log2(r6.x);
    r0.xyz = r0.xyz * r4.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r3.zyx));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r1.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r7.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
