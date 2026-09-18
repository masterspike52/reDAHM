// ps_1a4b67bd6dd369ee.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 636 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 000009F0 10041A00 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
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
float4 LowerSkyColor : register(c21); // float3
float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
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
sampler2D ModShadowAccumTexture : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord3 : TEXCOORD3; // r1
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
    float4 r1 = In.texcoord3;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.w;
    ps = UniformVector_1.x * ps;
    r6.x = -r0.z + 1.0;
    r9.x = ps;
    ps = OpacityOverride.x;
    r9.zw = r0.wz * 3.0;
    r2.w = saturate(ps);
    ps = r7.w;
    r9.y = r6.x * UniformVector_1.y;
    ps = 0.16 * ps;
    r6.xy = r9.xy - 0.5;
    r6.z = ps;
    ps = r7.w;
    r3.xy = float2((r9.xy >= 0.5));
    ps = (-0.8) * ps;
    r6.xy = r6.xy - r9.xy;
    r6.w = ps;
    r6.xy = r6.xy * r3.xy;
    r10 = r9 + r6;
    r11 = tex2D(Texture2D_3, r10.zw);
    ps = r3.w;
    r6.z = dot(r4.zxy, r4.zxy);
    ps = (-4e+02) + ps;
    r6.y = float((UniformScalar_7.x >= 1.0));
    r6.x = ps;
    r9.xy = r11.xy * 2.0 - 1.0;
    ps = 0.00022222222 * r6.x;
    r7.x = -r7.w + UniformScalar_8.x;
    r6.w = saturate(ps);
    ps = rsqrt(abs(r6.z));
    r7.y = UniformScalar_14.x * 0.05;
    r3.z = ps;
    r7.xy = r7.xy * r6.yw;
    ps = r10.y + r10.y;
    r6.xy = r10.zw * 6.0;
    r8.w = ps;
    r16.xyz = tex2D(Texture2D_3, r6.xy).xyw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.w = r7.x + r7.w;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = ps;
    ps = r10.x + r10.x;
    r8.xy = r6.xy * abs(r8.xy);
    r8.z = ps;
    ps = r16.y + r16.y;
    r6.y = dot(r3.xyy, float3(1.0, 1.0, 1.0));
    r6.w = ps;
    r3.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r8 = tex2D(Texture2D_4, r8.zw);
    r6.x = (r6.y == 0.0) ? r8.x : r8.y;
    ps = r16.x + r16.x;
    r6.z = ps;
    ps = -r1.w;
    ps = r7.z + ps;
    r10 = r6.yyzw + float4(-3.0, -2.0, -1.0, -1.0);
    r1.w = ps;
    r6.y = (r10.y == 0.0) ? r8.z : r6.x;
    ps = UniformScalar_9.x;
    r6.xz = r10.zw * 0.5;
    r8.y = ps;
    r9.zw = r11.xy * 2.0 + r6.xz;
    r6.w = (r10.x == 0.0) ? r8.w : r6.y;
    ps = r1.w;
    r8.x = ps;
    ps = max(r8.x, r8.y);
    r8.y = max(r6.w, 0.0);
    r8.x = ps;
    r8.xy = min(r8.xy, float2(1.0, 0.3));
    ps = r7.w;
    r22.yz = saturate(r3.ww * float2(0.0001, 5e-05));
    ps = 15.0 * ps;
    r22.w = r8.y * 3.3333333;
    r22.x = saturate(ps);
    ps = r11.z;
    r13.yzw = -r22.xyw + 1.0;
    r6.y = ps;
    ps = (-0.3) * r6.y;
    r8.zw = r13.ww * float2(3.0, 1.0);
    r6.y = ps;
    r24 = r9 + r6.xzxz;
    ps = r24.x;
    r6.x = ps;
    ps = 0.01 * r6.x;
    r15 = r3.xyzz * float4(0.875, 0.875, -0.125, 1.0);
    r6.z = ps;
    r12 = r15.zwww * r4.xxyz;
    ps = r11.w;
    r14.xy = r22.zx * r8.zw;
    r6.x = ps;
    ps = r0.w + r0.w;
    r23.w = r22.w + r14.y;
    r9.x = ps;
    ps = r23.w;
    r4.zw = r12.yz * r7.yy;
    ps = r24.y * ps;
    r4.xy = r6.yz * r23.ww;
    r9.y = ps;
    ps = 0.025 * r9.y;
    r3.xyz = saturate(UniformVector_3.xyz);
    r1.w = ps;
    ps = r1.w;
    r3.xyz = r3.xzy * UniformScalar_5.xxx;
    ps = r4.x + ps;
    r18.xz = r4.yw + r0.xz;
    r6.y = ps;
    ps = 1.0 - r6.x;
    r18.y = r6.y + r0.y;
    r18.w = ps;
    r6.y = tex2D(Texture2D_5, r18.xy).w;
    ps = 1.0 / UniformScalar_5.x;
    r3.xyz = floor(-r3.xyz);
    r6.x = ps;
    ps = -r7.z;
    r3.xyz = -r3.xyz * r6.xxx;
    ps = 1.0 + ps;
    r10.yzw = r3.xyz + UniformScalar_6.xxx;
    r10.x = ps;
    r17 = r10.xywz - r3.xxzy;
    ps = 1.0 / r17.w;
    r6.z = -r6.y + 1.0;
    r7.x = ps;
    ps = 1.0 / r17.z;
    r3.xy = r10.xx - r3.yz;
    r7.y = ps;
    ps = 1.0 / UniformScalar_1.x;
    r7.xy = saturate(r3.xy * r7.xy);
    r6.x = ps;
    r3.x = r7.y * r6.z + r6.y;
    r6.y = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r6.y));
    r4.xyw = r4.yzx + r0.xwy;
    r6.y = ps;
    r10.xyz = r6.yyy * r2.xyz;
    r25.xw = -r18.wz + 1.0;
    ps = UniformVector_1.x * r4.y;
    r6.z = r25.w * UniformVector_1.y;
    r6.y = ps;
    r26.xy = float2((r6.yz >= 0.5));
    r10.w = dot(r26.xyy, float3(1.0, 1.0, 1.0));
    r19.xyz = r10.zww + float3(0.1, -3.0, -2.0);
    ps = r8.x;
    r3.y = saturate(r19.x * 5.0);
    ps = r6.x * ps;
    r3.yz = -r3.xy + 1.0;
    r2.x = saturate(ps);
    ps = (-0.5) + r6.y;
    r2.yz = r3.zz * ModShadowGroupColor.xy;
    r8.x = ps;
    r2 = -r2 + 1.0;
    ps = r2.x;
    r4.z = r4.w + r1.w;
    ps = r7.w * ps;
    r21.zw = r15.xy * r2.yz;
    r16.w = ps;
    r21.xy = r16.zw * r11.wz;
    r6.x = float((r21.y >= 0.05));
    ps = 1.0 - r6.x;
    r23.xyz = r21.xzw + float3(-1.0, 0.125, 0.125);
    r0.x = ps;
    r14.zw = r23.xy * r23.wz;
    ps = (-0.5) + r6.z;
    r26.zw = r14.xz + 1.0;
    r8.y = ps;
    ps = 1.0 - r6.w;
    r20.xy = r8.xy - r6.yz;
    r0.y = ps;
    ps = 2.5 * r0.y;
    r7.w = float((UniformScalar_0.x >= 0.0));
    r20.z = ps;
    r6.yz = r20.xy * r26.xy + r6.yz;
    r8.yz = r6.yz + r6.yz;
    r6.xyw = tex2D(Texture2D_6, r4.xz).xyz;
    r15 = tex2D(Texture2D_5, r4.xz);
    ps = 1.0 / r17.y;
    r6.z = -r15.w + 1.0;
    r7.z = ps;
    r8.xw = r7.xy * r6.zz + r15.ww;
    ps = r0.z + r0.z;
    r4.xz = r24.zw - 2.0;
    r9.z = ps;
    ps = r0.z;
    r7.x = r12.x + r0.w;
    r7.y = ps;
    r16 = tex2D(Texture2D_4, r8.yz);
    ps = r17.x;
    r8.yz = r4.xz + r11.xy;
    ps = r7.z * ps;
    r0.z = saturate(ps);
    r7.z = (r10.w == 0.0) ? r16.x : r16.y;
    ps = (UniformScalar_0.x > 0.0) ? 1.0 : 0.0;
    r17.xyz = r8.xyz + r11.zxy;
    r4.x = ps;
    ps = 1.0 - r8.w;
    r0.w = float((r17.x >= 0.5));
    r3.x = ps;
    r8.yzw = (-abs(r4.xxx) >= 0.0) ? 1.0 : r0.zwx;
    r11.xy = (-abs(r7.ww) >= 0.0) ? r0.zx : r8.yw;
    r6.xyw = r6.wxy * 2.0 - 1.0;
    ps = 1.0 * r6.z;
    r6.xyw = r6.yxw * UniformVector_5.xzy;
    r8.w = ps;
    ps = (-1.0) - -r6.y;
    r11.w = ps;
    r6.y = (r19.z == 0.0) ? r16.z : r7.z;
    r11.z = (r19.y == 0.0) ? r16.w : r6.y;
    ps = r18.z + r18.z;
    r16.yz = r11.yz + float2(-0.5, -1.0);
    r8.y = ps;
    ps = r4.y + r4.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r16.yyyy)) clip(-1.0);
    r8.x = ps;
    r19 = r17.yzyz * r3.xxyy;
    r17.xyz = tex2D(Texture2D_1, r9.xz).xyz;
    r7.xyz = tex2D(Texture2D_7, r7.xy).zxy;
    ps = 0.5 * r7.x;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r1.w = ps;
    ps = r15.w;
    r4.yzw = UniformVector_7.xyz * UniformVector_7.www;
    r6.y = ps;
    r0.xz = (-abs(r4.xx) >= 0.0) ? 0.0 : r19.zw;
    r0.xz = (-abs(r7.ww) >= 0.0) ? r19.xy : r0.xz;
    r3.xyz = r14.www * r3.xyz + ModShadowColor.xyz;
    r4.x = (-abs(r7.w) >= 0.0) ? r0.w : r8.z;
    r14.xyz = tex2D(Texture2D_0, r8.xy).xyz;
    r19.xyz = r17.zxy * 2.0 - 1.0;
    r17.xyz = r14.zxy * 2.0 - 1.0;
    r7.xyz = r26.zzz * r7.yzx - r1.www;
    r20.x = saturate(r20.z * r26.w - 0.5);
    ps = (-0.5) + r6.y;
    r19.xyz = r19.xyz - r17.xyz;
    r6.y = ps;
    ps = 3.3333333 * r6.y;
    r20.yzw = r4.yzw * r15.xyz;
    r13.x = saturate(ps);
    ps = 0.3 * r6.z;
    r16.xw = r13.xw * r11.wx;
    r8.z = ps;
    r11.xyz = r16.www * r7.xyz + r1.www;
    r6.y = dot(r16.zz, r13.yy) + 2.25;
    r7 = r8.wzww * UniformVector_6.xxyz;
    ps = abs(r26.w) * abs(r26.w);
    r11 = r7.yxwz * r11.xxzy;
    r25.y = ps;
    ps = r6.y;
    ps = -r21.x + ps;
    r25.z = saturate(ps);
    r6.z = dot(r11.zw, float2(0.11, 0.59)) + r11.x;
    ps = r25.x * r25.z;
    r6.y = ps;
    ps = r25.y * r25.y;
    r21.xyz = r6.zzz - r11.ywz;
    r6.z = ps;
    r8.xyz = tex2D(Texture2D_8, r8.xy).xyz;
    ps = r6.z * r6.z;
    r6.y = r18.w + r6.y;
    r6.z = ps;
    r18 = tex2D(Texture2D_2, r9.xz);
    ps = r24.x;
    r8.xyz = r6.yyy * r8.xyz;
    r9.xzw = -r8.xzy + r18.xzy;
    r8.yzw = r9.xzw * r18.www + r8.xzy;
    r7.xyz = r15.www * UniformScalar_11.xxx + r7.xwz;
    ps = r23.w * ps;
    r6.y = dot(r5.zxy, r5.zxy);
    r9.x = ps;
    r15 = r20 * r15.wwww;
    r7.xyz = r15.yzw * UniformScalar_12.xxx + r7.xzy;
    r21.w = -r20.x + r15.x;
    r11.xyz = r22.www * r21.xyz + r11.ywz;
    r9.z = r22.x * r21.w + r20.x;
    ps = abs(r0.y) * abs(r0.y);
    r7.yzw = r6.zzz * r7.xzy;
    r7.x = ps;
    ps = rsqrt(abs(r6.y));
    r4.yzw = r15.yzw - r1.www;
    r0.w = ps;
    r15.xyz = r4.yzw * r4.xxx + r1.www;
    r4.yzw = r9.zxy * r4.xxx;
    r15.yzw = r7.xxx * r15.xyz - r8.ywz;
    r6.xw = r6.xw * r13.xx + r4.zw;
    r16.yz = r0.xz * r4.xx + r6.xw;
    r8.x = r19.x * r18.w - 2.0;
    r0.xyz = r19.xyz * r18.www + r17.xyz;
    r6.xyz = -r0.xyz + r16.xyz;
    r6.yw = r6.yz * r9.zz + r0.yz;
    ps = 1.0 + r6.x;
    r5.xyz = r0.www * r5.xyz;
    r15.x = ps;
    r8 = r15 * r9.zzzz + r8.xywz;
    r11.w = r14.z * 2.0 + r8.x;
    r14 = r11.xzyw * r13.yyyz;
    r0.xyz = r14.xzy * r7.xxx;
    ps = r14.w;
    r11.yzw = r0.yzx * r4.yyx;
    r6.x = ps;
    ps = 1.0 + r6.x;
    r7.xyz = r7.ywz * r7.xxx;
    r6.z = ps;
    ps = r11.w;
    r6.xy = r6.yw * r13.zz;
    r6.xyz = (r13.zzz > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r13.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r9.z * ps;
    r6.x = dot(r6.wyz, r6.wyz);
    r11.x = ps;
    ps = rsqrt(abs(r6.x));
    r6.x = ps;
    r0.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r0.zxy, r12.wyz);
    r6.xyz = r0.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r12.yzw;
    r6.y = saturate(dot(r10.zxy, r6.zxy));
    r6.x = dot(r5.zxy, r0.zxy);
    ps = log2(r6.y);
    r4.yzw = r7.yzx * r4.yyx;
    r6.y = ps;
    r6.xyz = r6.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r6.z);
    r5.xy = r6.xy + 0.5;
    r6.w = ps;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r10.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz;
    r6.xyz = r11.xzy + UniformVector_0.xzy;
    r6.xyz = r10.xzy * r8.ywz + r6.xyz;
    r7.xyz = r8.yzw * r7.xyz;
    ps = abs(r5.x) * abs(r5.x);
    r0.xyz = r0.zzz * r1.xyz;
    r7.w = ps;
    ps = abs(r5.y) * abs(r5.y);
    r1.xyz = r6.www * r1.xzy;
    r6.w = ps;
    ps = r4.w;
    r5.xyz = r7.xzy * r7.www;
    ps = r9.z * ps;
    r8.xyz = r7.xzy * r6.www;
    r4.x = ps;
    r6.xyz = r8.xyz * UpperSkyColor.xzy + r6.xyz;
    r6.xyz = r5.xyz * LowerSkyColor.xzy + r6.xyz;
    r6.xyz = r1.xyz * r4.xzy + r6.xyz;
    r6.xyz = r0.xzy * r7.xzy + r6.xyz;
    r6.xyz = r6.xyz * r3.xzy;
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
