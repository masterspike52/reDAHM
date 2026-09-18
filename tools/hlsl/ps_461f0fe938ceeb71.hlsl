// ps_461f0fe938ceeb71.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 399 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000063C 10041800 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c17); // float2
float4 SpotDirection : register(c16); // float3
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
sampler2D ModShadowAccumTexture : register(s10);

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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_8, r0.xy);
    ps = r4.w;
    r5.zw = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.y = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = r12.w - 0.5;
    r6.y = ps;
    ps = 0.1 - -r1.z;
    r6.zw = r0.wz * UniformVector_7.xy;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r9.xyz = r6.yyy * r3.xyz;
    r5.x = saturate(ps);
    ps = 0.00022222222 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r5.y = saturate(ps);
    ps = (-0.025) * r5.y;
    r1.w = saturate(r4.w * 0.0001);
    r6.x = ps;
    r8.xy = r9.xy * r6.xx + r5.zw;
    r3.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    ps = r0.w;
    r6.xy = r0.wz * 6.0;
    ps = UniformVector_2.x * ps;
    r13.z = -r0.z + 1.0;
    r13.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.zw = r4.xy * ScreenPositionScaleBias.xy;
    r10.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.z = dot(r2.zxy, r2.zxy);
    r13.w = ps;
    ps = rsqrt(abs(r5.z));
    r11.xyz = r3.xyw + r3.xyw;
    r5.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r10.xyw = r5.www * -SpotDirection.xyz;
    r3.z = ps;
    ps = 1.0 / r4.w;
    r5.w = dot(r10.wxy, r2.zxy);
    r2.x = ps;
    r10.xy = r8.zw * r2.xx + ScreenPositionScaleBias.wz;
    r13.y = -r8.y * r3.z + 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.yzw = r13.zyw * UniformVector_2.yyx;
    r10.w = ps;
    ps = r13.w;
    r2.zw = r10.zw * abs(r7.xy);
    ps = r8.x * ps;
    r4.xyz = r13.zxy - 0.5;
    r11.w = ps;
    r21.z = float((r11.w >= 0.5));
    r22.xyz = float3((r13.xzy >= 0.5));
    r4.xyz = r4.xzy - r13.zyx;
    ps = -SpotAngles.x - -r5.w;
    r15 = r11 + float4(-1.0, -1.0, -1.0, -0.5);
    r5.w = ps;
    r4.yzw = r4.xzy * r22.yxz + r13.zxy;
    ps = SpotAngles.y * r5.w;
    r21.x = r15.w - r11.w;
    r21.y = saturate(ps);
    r2.xy = r21.xy * r21.zy;
    r4.x = r11.w + r2.x;
    r4 = r4.zwxy + r4.zwxy;
    r3.xyz = tex2D(LightAttenuationTexture, r10.xy).xyz;
    r10.xzw = tex2D(Texture2D_6, r8.xy).xyz;
    r11.xy = tex2D(ModShadowAccumTexture, r2.zw).xy;
    r7 = tex2D(Texture2D_1, r4.xy);
    r20 = tex2D(Texture2D_1, r4.zw);
    r23 = tex2D(Texture2D_5, r0.xy);
    r14.xyz = tex2D(Texture2D_7, r6.zw).xyz;
    r24 = tex2D(Texture2D_4, r0.xy);
    r18.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r13.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    r4.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    ps = -ModShadowColor.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r0.x = dot(r1.zxy, r1.zxy);
    r6.y = ps;
    ps = -ModShadowColor.y;
    r16.xyz = UniformVector_5.xzy * 2e+01;
    ps = 1.0 + ps;
    r17.xyz = UniformVector_6.xzy * 2e+01;
    r6.z = ps;
    ps = -ModShadowColor.z;
    r2.z = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = 1.0 + ps;
    r6.x = float((UniformScalar_11.x >= 1.0));
    r6.w = ps;
    ps = r4.x + r4.x;
    r5.w = float((UniformScalar_11.x > 1.0));
    r19.z = ps;
    r11.zw = r13.xy * 2.0 - 1.0;
    ps = r4.y + r4.y;
    r18.yzw = r18.xyz + r18.xyz;
    r19.w = ps;
    ps = 1.0 - r5.z;
    r4.xyz = r24.xzy * r24.www;
    r5.z = saturate(ps);
    r13.xyz = (-abs(r5.www) >= 0.0) ? r14.xyz : 1.0;
    ps = r13.w;
    r14.xyz = r12.xyz * UniformScalar_12.xxx;
    ps = r4.w * ps;
    r0.yzw = r23.xzy * r23.www;
    r5.w = ps;
    ps = (-1.0) - -r5.w;
    r0.yzw = r17.xyz * r0.yzw;
    r17.x = ps;
    r13.xyz = (-abs(r6.xxx) >= 0.0) ? 1.0 : r13.xyz;
    ps = log2(r5.z);
    r4.xyz = r16.xyz * r4.xyz;
    r6.x = ps;
    r16.xyz = r14.xyz * r13.xyz + UniformScalar_13.xxx;
    r17.yzw = (-abs(r2.zzz) >= 0.0) ? r0.zyw : r4.yxz;
    r14.xyz = (abs(r2.zzz) > 0.0) ? r4.xzy : r0.ywz;
    ps = rsqrt(abs(r0.x));
    r5.z = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    r0.x = ps;
    ps = r5.z;
    r4.xyz = r0.xxx * r1.xyz;
    ps = -r14.x + ps;
    r0.y = dot(r22.xzz, float3(1.0, 1.0, 1.0));
    r1.y = ps;
    r0.x = r22.y * 2.0 + r21.z;
    r1.x = (r0.x == 0.0) ? r20.x : r20.y;
    r5.z = (r0.y == 0.0) ? r7.x : r7.y;
    ps = r1.y;
    r0 = r0.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r5.z = (r0.z == 0.0) ? r7.z : r5.z;
    r1.x = (r0.y == 0.0) ? r20.z : r1.x;
    r18.x = (r0.x == 0.0) ? r20.w : r1.x;
    r5.z = (r0.w == 0.0) ? r7.w : r5.z;
    ps = r14.x + ps;
    r0.x = max(r5.z, 0.0);
    r7.z = saturate(ps);
    ps = 1.0 - r5.x;
    r5.y = min(r0.x, 0.3);
    r0.w = ps;
    ps = 1.0 - r5.z;
    r20 = r18 + float4(0.25, -1.0, -1.0, -1.0);
    r0.x = ps;
    ps = 3.3333333 * r5.y;
    r7.xy = r0.ww * ModShadowGroupColor.xy;
    r10.y = ps;
    ps = r20.x;
    r17.w = saturate(dot(r17.wyz, float3(0.59, 0.11, 0.3)));
    ps = r18.x + ps;
    r1.xyz = r20.yzw * UniformVector_4.xyz;
    r5.x = ps;
    r2.zw = -r1.xy * r17.ww + r1.xy;
    ps = r5.x;
    r18 = r11 * float4(0.875, 0.875, 0.5, 0.5);
    ps = -r5.w + ps;
    r7.xyz = -r7.xyz + 1.0;
    r5.x = saturate(ps);
    ps = r1.z;
    r11.xyz = r5.xxx * r10.xzw;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r19.xy = r18.xy * r7.xy;
    r10.x = ps;
    ps = 1.0 - r1.w;
    r5 = r19 + float4(0.125, 0.125, -1.0, -1.0);
    r10.z = ps;
    ps = r5.x * r5.y;
    r17.yz = r5.zw + r18.zw;
    r5.x = ps;
    r6.yzw = r5.xxx * r6.yzw + ModShadowColor.xyz;
    ps = 2.5 * r0.x;
    r5 = r10.yyyx * r17.yzxw;
    r0.z = ps;
    ps = r1.z;
    r7.xyz = r16.xyz * r7.zzz;
    ps = r5.w + ps;
    r0.y = r5.z + 1.0;
    r5.w = ps;
    ps = r0.y * r0.x;
    r5.xz = r2.zw + r5.xy;
    r5.y = ps;
    ps = r0.z * r0.y;
    r1.xyz = -r15.xyz + r5.xzw;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r5.z = float((r5.y > 0.9));
    r0.w = saturate(ps);
    r5.xy = r1.xy * r0.ww + r15.xy;
    r0.xyz = r5.zzz * r14.xyz - r11.xyz;
    r5.z = r1.z * r0.w - 2.0;
    r5.z = r3.w * 2.0 + r5.z;
    r0.xyz = r13.xyz * r12.xyz + r0.xyz;
    r0.xyz = r0.xyz * r0.www + r11.xyz;
    r5.xyz = r5.zxy * r10.zzz;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r10.zzz > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r10.zzz >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r1.xyz = r7.xyz * r0.www;
    r5.x = ps;
    r7.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r7.zxy, r9.zxy);
    r5.xyz = r7.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    r5.x = saturate(dot(r4.zxy, r5.zxy));
    ps = log2(r5.x);
    r0.xyz = r0.xyz * r8.xyz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r5.y = r5.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.x = saturate(dot(r7.zyx, r4.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r1.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r0.xy * r6.xx + r5.yz;
    r5.w = r0.z * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r2.yyy;
    r5.xyz = r5.xzy * r6.yzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
