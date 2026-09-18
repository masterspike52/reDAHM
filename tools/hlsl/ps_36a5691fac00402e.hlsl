// ps_36a5691fac00402e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 396 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000630 10041500 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_13 : register(c14); // float
float4 UniformScalar_8 : register(c11); // float
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
    float4 r21 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_8, r1.xy);
    ps = UniformVector_2.x * r1.w;
    r6.x = r10.w - 0.5;
    r6.z = ps;
    ps = 1.0 - r1.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r13.y = ps;
    r0.x = tex2D(ShadowTexture, r0.xy).x;
    r7.xy = r1.wz * 6.0;
    ps = r2.z;
    r7.zw = r1.wz * UniformVector_7.xy;
    ps = 0.1 + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = 1.0 / r5.w;
    r0.yz = r5.xy * ScreenPositionScaleBias.xy;
    r6.y = ps;
    r12.xy = r0.yz * r6.yy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.w));
    r6.y = r5.w - 4e+02;
    r0.w = ps;
    ps = 5.0 * r6.x;
    r0.yz = r1.wz * UniformVector_1.xy;
    r6.w = saturate(ps);
    ps = 0.00022222222 * r6.y;
    r9.xyz = r0.www * r4.xyz;
    r6.y = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r6.x = r6.y * (-0.025);
    r0.w = ps;
    r0.yz = r9.xy * r6.xx + r0.yz;
    r11.xw = r0.zx * r0.wx;
    ps = 1.0 / UniformVector_1.x;
    r13.x = -r11.x + 1.0;
    r13.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.xyw = r13.zxy * UniformVector_2.xyy;
    r11.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.zw = r4.yw - 0.5;
    r11.z = ps;
    ps = r4.x;
    r11.yz = r11.yz * abs(r8.xy);
    ps = r0.y * ps;
    r20.xy = float2((r4.yw >= 0.5));
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r8.xy = r12.zw - r4.yw;
    r8.z = ps;
    ps = (-0.5) + r6.z;
    r20.zw = float2((r6.xz >= 0.5));
    r8.w = ps;
    r8.zw = r8.zw - r6.xz;
    r4.xz = r8.zw * r20.zw + r6.xz;
    r4.yw = r8.xy * r20.xy + r4.yw;
    r8 = r4 + r4;
    r16.xyz = tex2D(Texture2D_6, r0.yz).xyz;
    r4.yzw = tex2D(LightAttenuationTexture, r12.xy).xyz;
    r13.xy = tex2D(ModShadowAccumTexture, r11.yz).xy;
    r12 = tex2D(Texture2D_1, r8.zw);
    r18 = tex2D(Texture2D_1, r8.xy);
    r21 = tex2D(Texture2D_5, r1.xy);
    r8 = tex2D(Texture2D_4, r1.xy).xzyw;
    r0.xyw = tex2D(Texture2D_0, r0.yz).xyz;
    r15.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r14.xyz = tex2D(Texture2D_7, r7.zw).xyz;
    r11.xyz = tex2D(Texture2D_2, r7.xy).xyw;
    r7.xyz = tex2D(Texture2D_2, r1.wz).xyw;
    r6.x = dot(r3.zxy, r3.zxy);
    r6.z = float((UniformScalar_11.x > 1.0));
    r13.zw = r11.xy * 2.0 - 1.0;
    r14.xyz = (-abs(r6.zzz) >= 0.0) ? r14.xyz : 1.0;
    r6.z = r11.z * r7.z;
    r7.z = dot(r2.zxy, r2.zxy);
    r17.xyw = UniformVector_5.xzy * 2e+01;
    r19.xyz = UniformVector_6.xzy * 2e+01;
    ps = r5.w;
    r7.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = 0.0001 * ps;
    r0.z = float((UniformScalar_11.x >= 1.0));
    r4.x = saturate(ps);
    r15.xyz = r15.xyz * 2.0 - 1.0;
    ps = r7.x + r7.x;
    r1.xyz = r0.xyw + r0.xyw;
    r17.z = ps;
    ps = r8.x * r8.w;
    r3.xyz = r10.xyz * UniformScalar_12.xxx;
    r8.x = ps;
    ps = r8.y * r8.w;
    r5.xyz = r21.xzy * r21.www;
    r8.y = ps;
    ps = r8.z * r8.w;
    r5.xyz = r19.xyz * r5.xyz;
    r8.z = ps;
    ps = 1.0 - r6.x;
    r8.xyz = r17.xyw * r8.xyz;
    r6.x = saturate(ps);
    ps = log2(r6.x);
    r15.xyz = r15.xyz * UniformVector_4.xyz;
    r6.x = ps;
    r11.xyz = (-abs(r0.zzz) >= 0.0) ? 1.0 : r14.xyz;
    r19.xyz = r3.xyz * r11.xyz + UniformScalar_13.xxx;
    r3.xyz = (-abs(r7.www) >= 0.0) ? r5.yxz : r8.yxz;
    r8.xyz = (abs(r7.www) > 0.0) ? r8.xzy : r5.xzy;
    ps = r7.y + r7.y;
    r7.x = dot(r8.zxy, float3(0.11, 0.3, 0.59));
    r17.w = ps;
    ps = (-1.0) - -r6.z;
    r5.w = saturate(dot(r3.zxy, float3(0.59, 0.11, 0.3)));
    r5.x = ps;
    r14.xy = -r15.xy * r5.ww + r15.xy;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r7.w = r7.x - r8.x;
    r7.x = ps;
    r3.xy = r20.xy * 2.0 + r20.zw;
    r7.y = (r3.x == 0.0) ? r18.x : r18.y;
    r6.x = (r3.y == 0.0) ? r12.x : r12.y;
    ps = r7.w;
    r3 = r3.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r6.x = (r3.z == 0.0) ? r12.z : r6.x;
    r7.y = (r3.y == 0.0) ? r18.z : r7.y;
    r1.w = (r3.x == 0.0) ? r18.w : r7.y;
    r6.x = (r3.w == 0.0) ? r12.w : r6.x;
    ps = r8.x + ps;
    r12 = r1 + float4(-1.0, -1.0, -1.0, 0.25);
    r15.w = saturate(ps);
    ps = rsqrt(abs(r7.z));
    r7.y = r12.w + r1.w;
    r1.w = ps;
    ps = pow(2.0, r7.x);
    r7.w = saturate(r7.y - r6.z);
    r0.z = ps;
    ps = r6.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r5.y = ps;
    ps = 0.0;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = ps;
    ps = max(r5.y, r5.z);
    r3.xyz = r1.www * r2.xyz;
    r1.w = ps;
    ps = 1.0 - r6.x;
    r18 = r13 * float4(0.875, 0.875, 0.5, 0.5);
    r6.y = ps;
    ps = 1.0 - r6.w;
    r2.xyz = r11.www * r4.yzw;
    r6.z = ps;
    ps = r1.w;
    r13.xz = -r15.zw + 1.0;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r0.xyz = r2.xzy * r0.zzz;
    r4.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.xyz = r19.xyz * r13.zzz;
    r4.z = ps;
    ps = 0.3;
    r4.xyw = -r4.yzx + 1.0;
    r6.w = ps;
    ps = min(r6.x, r6.w);
    r17.xy = r18.xy * r4.xy;
    r6.x = ps;
    ps = 3.3333333 * r6.x;
    r17 = r17 + float4(0.125, 0.125, -1.0, -1.0);
    r13.y = ps;
    ps = r17.x * r17.y;
    r5.yz = r17.zw + r18.zw;
    r6.x = ps;
    r7.xyz = r6.xxx * r7.xyz + ModShadowColor.xyz;
    ps = 2.5 * r6.y;
    r13 = r13.yyxy * r5.yzwx;
    r6.w = ps;
    ps = r15.z;
    r5.xyz = r7.www * r16.xyz;
    ps = r13.z + ps;
    r6.x = r13.w + 1.0;
    r13.z = ps;
    ps = r6.x * r6.y;
    r13.xy = r14.xy + r13.xy;
    r6.y = ps;
    ps = r6.w * r6.x;
    r4.xyz = -r12.xyz + r13.xyz;
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r6.z = float((r6.y > 0.9));
    r7.w = saturate(ps);
    r6.xy = r4.xy * r7.ww + r12.xy;
    r8.xyz = r6.zzz * r8.xyz - r5.xyz;
    r6.z = r4.z * r7.w - 2.0;
    r6.z = r0.w * 2.0 + r6.z;
    r8.xyz = r11.xyz * r10.xyz + r8.xyz;
    r4.xyz = r8.xyz * r7.www + r5.xyz;
    r6.xyz = r6.zxy * r4.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r4.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r4.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
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
    r1.xyz = r4.xyz * r1.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r3.zyx));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r7.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
