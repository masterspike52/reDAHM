// ps_b036b97144738df2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 648 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000A20 10041C00 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c22); // float4
float4 LightMapScale : register(c23); // float3
float4 LowerSkyColor : register(c21); // float3
float4 ModShadowAccumResolution : register(c26); // float2
float4 ModShadowColor : register(c24); // float3
float4 ModShadowGroupColor : register(c25); // float3
float4 OpacityOverride : register(c19); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_11 : register(c16); // float
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_14 : register(c18); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
float4 UpperSkyColor : register(c20); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D LightMapTexture : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
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
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
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
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 r25 = 0.0;
    float4 r26 = 0.0;
    float4 r27 = 0.0;
    float4 r28 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r1.w;
    ps = UniformVector_1.x * ps;
    r6.x = -r1.z + 1.0;
    r10.x = ps;
    ps = OpacityOverride.x;
    r10.zw = r1.wz * 3.0;
    r2.w = saturate(ps);
    ps = r7.w;
    r10.y = r6.x * UniformVector_1.y;
    ps = 0.16 * ps;
    r6.zw = r10.xy - 0.5;
    r9.z = ps;
    ps = r7.w;
    r6.xy = float2((r10.xy >= 0.5));
    ps = (-0.8) * ps;
    r6.zw = r6.zw - r10.xy;
    r9.w = ps;
    r9.xy = r6.zw * r6.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10 = r10 + r9;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r21.x = saturate(r7.w * 15.0);
    r6.w = ps;
    ps = r10.x + r10.x;
    r8.xy = r6.zw * abs(r8.xy);
    r6.z = ps;
    ps = r10.y + r10.y;
    r7.xy = r10.zw * 6.0;
    r6.w = ps;
    r3.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r15.xyz = tex2D(Texture2D_3, r7.xy).xyw;
    r9 = tex2D(Texture2D_4, r6.zw);
    ps = r15.y + r15.y;
    r8.x = dot(r6.xyy, float3(1.0, 1.0, 1.0));
    r8.z = ps;
    r6.x = (r8.x == 0.0) ? r9.x : r9.y;
    ps = UniformScalar_14.x;
    r6.y = dot(r4.zxy, r4.zxy);
    ps = 0.05 * ps;
    r6.z = ps;
    ps = r15.x + r15.x;
    r21.yz = saturate(r3.ww * float2(0.0001, 5e-05));
    r8.y = ps;
    r11 = r8.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r7.y = (r11.y == 0.0) ? r9.z : r6.x;
    r16 = tex2D(Texture2D_3, r10.zw);
    ps = rsqrt(abs(r6.y));
    r6.x = r3.w - 4e+02;
    r3.z = ps;
    ps = r16.z;
    r6.y = ps;
    ps = (-0.3) * r6.y;
    r6.x = saturate(r6.x * 0.00022222222);
    r7.x = ps;
    ps = r3.x;
    r6.z = r6.z * r6.x;
    ps = 0.875 * ps;
    r6.xw = r11.zw * 0.5;
    r10.x = ps;
    r8.zw = r16.xy * 2.0 + r6.xw;
    r6.y = (r11.x == 0.0) ? r9.w : r7.y;
    ps = r3.y;
    r7.y = max(r6.y, 0.0);
    ps = 0.875 * ps;
    r7.y = min(r7.y, 0.3);
    r10.y = ps;
    ps = r3.z;
    ps = (-0.125) * ps;
    r21.w = r7.y * 3.3333333;
    r10.z = ps;
    r8.xy = r16.xy * 2.0 - 1.0;
    r23 = r8.yzwx + r6.wxwx;
    ps = r23.w;
    r13.yzw = -r21.xyw + 1.0;
    r6.x = ps;
    ps = r3.z;
    r0.zw = r13.ww * float2(3.0, 1.0);
    ps = 1.0 * ps;
    r26.xy = r21.zx * r0.zw;
    r10.w = ps;
    ps = 0.01 * r6.x;
    r22.w = r21.w + r26.y;
    r7.y = ps;
    ps = r22.w;
    r12 = r10.zwww * r4.xxyz;
    ps = r23.x * ps;
    r8.xy = r7.xy * r22.ww;
    r0.w = ps;
    r8.zw = r12.yz * r6.zz;
    ps = 0.025 * r0.w;
    r4.xyw = r8.yzx + r1.xwy;
    r7.x = ps;
    ps = r7.x;
    r3.z = float((UniformScalar_7.x >= 1.0));
    ps = r8.x + ps;
    r6.xzw = saturate(UniformVector_3.xyz);
    r7.y = ps;
    r6.xzw = r6.xwz * UniformScalar_5.xxx;
    ps = 1.0 / UniformScalar_5.x;
    r9.xyz = floor(-r6.xzw);
    r6.x = ps;
    ps = -r7.z;
    r6.xzw = -r9.xyz * r6.xxx;
    ps = 1.0 + ps;
    r9.yzw = r6.xzw + UniformScalar_6.xxx;
    r9.x = ps;
    ps = 1.0 - r16.w;
    r8.xz = r8.yw + r1.xz;
    r8.w = ps;
    ps = r4.w;
    r8.y = r7.y + r1.y;
    ps = r7.x + ps;
    r28 = r9.xywz - r6.xxwz;
    r4.z = ps;
    r14 = tex2D(Texture2D_5, r4.xz);
    ps = 1.0 / r28.w;
    r3.x = -r14.w + 1.0;
    r7.x = ps;
    ps = 1.0 / r28.z;
    r1.xy = r9.xx - r6.zw;
    r7.y = ps;
    r6.x = tex2D(Texture2D_5, r8.xy).w;
    r9.yz = saturate(r1.xy * r7.xy);
    ps = 1.0 - r6.x;
    r9.x = -r7.w + UniformScalar_8.x;
    r3.y = ps;
    ps = 1.0 * r3.x;
    r6.z = dot(r2.zxy, r2.zxy);
    r17.z = ps;
    ps = 0.3 * r3.x;
    r18 = r9.xyzz * r3.zxxy;
    r17.y = ps;
    ps = rsqrt(abs(r6.z));
    r7.x = r18.w + r6.x;
    r6.x = ps;
    ps = (UniformScalar_0.x > 0.0) ? 1.0 : 0.0;
    r11.xyz = r6.xxx * r2.xyz;
    r3.z = ps;
    r6.x = r18.x + r7.w;
    r7.z = -r6.x + r7.z;
    ps = 1.0 / UniformScalar_1.x;
    r7.y = max(r7.z, UniformScalar_9.x);
    r6.x = ps;
    ps = 1.0;
    r17.xw = -r8.wz + 1.0;
    r7.z = ps;
    ps = UniformVector_1.x * r4.y;
    r6.w = r17.w * UniformVector_1.y;
    r6.z = ps;
    r24.xy = float2((r6.zw >= 0.5));
    ps = r7.y;
    r11.w = dot(r24.xyy, float3(1.0, 1.0, 1.0));
    r7.y = ps;
    ps = min(r7.y, r7.z);
    r27.xyz = r11.zww + float3(0.1, -3.0, -2.0);
    r7.z = ps;
    ps = r7.z;
    r7.y = saturate(r27.x * 5.0);
    ps = r6.x * ps;
    r9.yz = -r7.xy + 1.0;
    r2.x = saturate(ps);
    ps = (-0.5) + r6.z;
    r2.yz = r9.zz * ModShadowGroupColor.xy;
    r7.x = ps;
    r2 = -r2 + 1.0;
    ps = r2.x;
    r20.zw = r10.xy * r2.yz;
    ps = r7.w * ps;
    r10.xw = r18.yz + r14.ww;
    r15.w = ps;
    r20.xy = r15.zw * r16.wz;
    ps = r1.z + r1.z;
    r6.x = float((r20.y >= 0.05));
    r15.z = ps;
    ps = 1.0 - r6.x;
    r22.xyz = r20.xzw + float3(-1.0, 0.125, 0.125);
    r1.x = ps;
    r26.zw = r22.xy * r22.wz;
    ps = (-0.5) + r6.w;
    r24.zw = r26.xz + 1.0;
    r7.y = ps;
    ps = 1.0 - r6.y;
    r25.xy = r7.xy - r6.zw;
    r1.y = ps;
    ps = 2.5 * r1.y;
    r7.w = float((UniformScalar_0.x >= 0.0));
    r25.z = ps;
    r6.zw = r25.xy * r24.xy + r6.zw;
    ps = r1.w + r1.w;
    r6.xy = r23.yz - 2.0;
    r15.y = ps;
    ps = 1.0 / r28.y;
    r10.yz = r6.xy + r16.xy;
    r6.x = ps;
    ps = r1.z;
    r6.yz = r6.zw + r6.zw;
    r7.y = ps;
    r19 = tex2D(Texture2D_4, r6.yz);
    ps = r28.x;
    r7.x = r12.x + r1.w;
    ps = r6.x * ps;
    r1.z = saturate(ps);
    r6.y = (r11.w == 0.0) ? r19.x : r19.y;
    r16.xyz = r10.xyz + r16.zxy;
    r1.w = float((r16.x >= 0.5));
    r18.xyz = (-abs(r3.zzz) >= 0.0) ? 1.0 : r1.zwx;
    r10.xy = (-abs(r7.ww) >= 0.0) ? r1.zx : r18.xz;
    r6.xzw = tex2D(Texture2D_6, r4.xz).xyz;
    r6.xzw = r6.wxz * 2.0 - 1.0;
    r6.xzw = r6.xzw * UniformVector_5.zxy;
    ps = (-1.0) - -r6.x;
    r9.x = -r10.w + 1.0;
    r10.w = ps;
    r6.x = (r27.z == 0.0) ? r19.z : r6.y;
    r10.z = (r27.y == 0.0) ? r19.w : r6.x;
    ps = r14.w;
    r19.yz = r10.yz + float2(-0.5, -1.0);
    r6.y = ps;
    ps = r4.y + r4.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r19.yyyy)) clip(-1.0);
    r3.y = ps;
    ps = (-0.5) + r6.y;
    r27 = r16.yzyz * r9.yyxx;
    r6.x = ps;
    r16.xyz = tex2D(Texture2D_1, r15.yz).xyz;
    r7.xyz = tex2D(Texture2D_7, r7.xy).zxy;
    ps = 0.5 * r7.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    ps = 3.3333333 * r6.x;
    r13.x = saturate(ps);
    r6.xy = (-abs(r3.zz) >= 0.0) ? 0.0 : r27.xy;
    r6.xy = (-abs(r7.ww) >= 0.0) ? r27.zw : r6.xy;
    r4.xyz = r26.www * r4.xyz + ModShadowColor.xyz;
    r9.x = (-abs(r7.w) >= 0.0) ? r1.w : r18.y;
    ps = r8.z + r8.z;
    r3.z = ps;
    r1.xzw = tex2D(Texture2D_0, r3.yz).xyz;
    r18.xyz = r16.zxy * 2.0 - 1.0;
    r16.xyz = r1.wxz * 2.0 - 1.0;
    r7.xyz = r24.zzz * r7.yzx - r0.zzz;
    r19.x = saturate(r25.z * r24.w - 0.5);
    r15.xw = r13.xw * r10.wx;
    r10.xyz = r15.www * r7.xyz + r0.zzz;
    r3.x = dot(r19.zz, r13.yy) + 2.25;
    r7 = r17.zyzz * UniformVector_6.xxyz;
    ps = abs(r24.w) * abs(r24.w);
    r10 = r7.yxwz * r10.xxzy;
    r17.y = ps;
    ps = r3.x;
    ps = -r20.x + ps;
    r17.z = saturate(ps);
    r4.w = dot(r10.zw, float2(0.11, 0.59)) + r10.x;
    ps = r17.x * r17.z;
    r3.x = ps;
    ps = r17.y * r17.y;
    r20.xyz = r4.www - r10.ywz;
    r4.w = ps;
    r5.w = r8.w + r3.x;
    r8.xyz = tex2D(Texture2D_8, r3.yz).xyz;
    r3.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r8.xyz = r5.www * r8.xyz;
    r17 = tex2D(Texture2D_2, r15.yz);
    r19.yzw = -r8.xzy + r17.xzy;
    r8.yzw = r19.yzw * r17.www + r8.xzy;
    r7.yzw = r14.www * UniformScalar_11.xxx + r7.xwz;
    ps = r4.w * r4.w;
    r9.yzw = UniformVector_7.xyz * UniformVector_7.www;
    r4.w = ps;
    r19.yzw = r9.yzw * r14.xyz;
    ps = r23.w;
    r18.xyz = r18.xyz - r16.xyz;
    ps = r22.w * ps;
    r7.x = dot(r5.zxy, r5.zxy);
    r0.x = ps;
    r14 = r19.yzwx * r14.wwww;
    r7.yzw = r14.xyz * UniformScalar_12.xxx + r7.ywz;
    r20.w = -r19.x + r14.w;
    r10.xyz = r21.www * r20.xyz + r10.ywz;
    r0.y = r21.x * r20.w + r19.x;
    ps = abs(r1.y) * abs(r1.y);
    r7.yzw = r4.www * r7.ywz;
    r1.y = ps;
    ps = rsqrt(abs(r7.x));
    r9.yzw = r14.xyz - r0.zzz;
    r7.x = ps;
    r14.xyz = r9.yzw * r9.xxx + r0.zzz;
    r9.yzw = r0.yxw * r9.xxx;
    r14.yzw = r1.yyy * r14.xyz - r8.ywz;
    r6.zw = r6.zw * r13.xx + r9.zw;
    r15.yz = r6.xy * r9.xx + r6.zw;
    r8.x = r18.x * r17.w - 2.0;
    r0.xzw = r18.xyz * r17.www + r16.xyz;
    r6.xyz = -r0.xzw + r15.xyz;
    r6.yw = r6.yz * r0.yy + r0.zw;
    ps = 1.0 + r6.x;
    r3.xyz = r3.xyz * LightMapScale.xyz;
    r14.x = ps;
    r8 = r14.yzwx * r0.yyyy + r8.ywzx;
    r10.w = r1.w * 2.0 + r8.w;
    r14 = r10.xzyw * r13.yyyz;
    r0.xzw = r14.xzy * r1.yyy;
    ps = r14.w;
    r10.yzw = r0.zwx * r9.yyx;
    r6.x = ps;
    ps = 1.0 + r6.x;
    r7.yzw = r7.ywz * r1.yyy;
    r6.z = ps;
    ps = r10.w;
    r6.xy = r6.yw * r13.zz;
    r6.xyz = (r13.zzz > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r13.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r0.y * ps;
    r6.x = dot(r6.wyz, r6.wyz);
    r10.x = ps;
    ps = rsqrt(abs(r6.x));
    r5.xyz = r7.xxx * r5.xyz;
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.w = dot(r6.zxy, r12.wyz);
    r0.xzw = r6.xyz * r6.www;
    r0.xzw = r0.xzw * 2.0 - r12.yzw;
    r6.w = saturate(dot(r11.zxy, r0.wxz));
    r7.x = dot(r5.zxy, r6.zxy);
    ps = log2(r6.w);
    r1.yzw = r7.zwy * r9.yyx;
    r7.y = ps;
    r7.xyz = r7.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r7.z);
    r5.xy = r7.xy + 0.5;
    r6.w = ps;
    r0.xzw = r3.xzy * r6.zzz;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r9.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz;
    r6.xyz = r10.xzy + UniformVector_0.xzy;
    r6.xyz = r9.xzy * r8.xzy + r6.xyz;
    ps = abs(r5.x) * abs(r5.x);
    r7.xyz = r8.xyz * r7.xyz;
    r7.w = ps;
    ps = abs(r5.y) * abs(r5.y);
    r3.xyz = r3.xzy * r6.www;
    r6.w = ps;
    ps = r1.w;
    r5.xyz = r7.xzy * r7.www;
    ps = r0.y * ps;
    r8.xyz = r7.xzy * r6.www;
    r1.x = ps;
    r6.xyz = r8.xyz * UpperSkyColor.xzy + r6.xyz;
    r6.xyz = r5.xyz * LowerSkyColor.xzy + r6.xyz;
    r6.xyz = r3.xyz * r1.xzy + r6.xyz;
    r6.xyz = r0.xzw * r7.xzy + r6.xyz;
    r6.xyz = r6.xyz * r4.xzy;
    ps = -r3.w;
    r6.w = float((r2.w >= 0.004));
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
