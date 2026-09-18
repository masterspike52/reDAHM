// ps_52ee99ee38d1dccc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 603 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 0000096C 10041E00 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c22); // float4
float4 ConstantLighting : register(c23); // float3
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
sampler2D ModShadowAccumTexture : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
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
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
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
    float4 r25 = 0.0;
    float4 r26 = 0.0;
    float4 r27 = 0.0;
    float4 r28 = 0.0;
    float4 r29 = 0.0;
    float4 r30 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.w;
    r5.x = -r0.z + 1.0;
    ps = UniformVector_1.x * ps;
    r9.zw = r0.wz * 3.0;
    r9.x = ps;
    ps = r6.w;
    r9.y = r5.x * UniformVector_1.y;
    ps = 0.16 * ps;
    r5.xy = r9.xy - 0.5;
    r8.z = ps;
    ps = r6.w;
    r5.zw = float2((r9.xy >= 0.5));
    ps = (-0.8) * ps;
    r5.xy = r5.xy - r9.xy;
    r8.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xy = r5.xy * r5.zw;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8 = r9 + r8;
    r5.y = ps;
    ps = r8.x + r8.x;
    r7.zw = r5.xy * abs(r7.xy);
    r7.x = ps;
    ps = r8.y + r8.y;
    r5.xy = r8.zw * 6.0;
    r7.y = ps;
    r11.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r7 = tex2D(Texture2D_4, r7.xy).xywz;
    r10.xyz = tex2D(Texture2D_3, r5.xy).xyw;
    r17 = tex2D(Texture2D_3, r8.zw);
    r9.w = UniformScalar_14.x * 0.05;
    r22.yz = saturate(r2.ww * float2(0.0001, 5e-05));
    ps = r2.w;
    r8.z = dot(r3.zxy, r3.zxy);
    ps = (-4e+02) + ps;
    r9.x = float((UniformScalar_7.x >= 1.0));
    r5.x = ps;
    r8.xy = r17.xy * 2.0 - 1.0;
    ps = 0.00022222222 * r5.x;
    r9.z = -r6.w + UniformScalar_8.x;
    r9.y = saturate(ps);
    ps = r10.x + r10.x;
    r9.xy = r9.zw * r9.xy;
    r5.y = ps;
    ps = r10.y + r10.y;
    r5.x = dot(r5.zww, float3(1.0, 1.0, 1.0));
    r5.z = ps;
    ps = rsqrt(abs(r8.z));
    r5.w = r9.x + r6.w;
    r11.z = ps;
    r8.w = (r5.x == 0.0) ? r7.x : r7.y;
    ps = -r5.w;
    r12 = r11.xyzz * float4(0.875, 0.875, -0.125, 1.0);
    ps = r6.z + ps;
    r5 = r5.yxxz + float4(-1.0, -2.0, -3.0, -1.0);
    r8.z = ps;
    r5.y = (r5.y == 0.0) ? r7.w : r8.w;
    ps = r8.z;
    r7.xy = r5.xw * 0.5;
    r5.x = ps;
    r8.zw = r17.xy * 2.0 + r7.xy;
    r5.w = (r5.z == 0.0) ? r7.z : r5.y;
    ps = UniformScalar_9.x;
    r5.y = max(r5.w, 0.0);
    r5.z = ps;
    ps = max(r5.x, r5.z);
    r7 = r8 + r7.xyxy;
    r5.x = ps;
    ps = r6.w;
    r11.xz = min(r5.yx, float2(0.3, 1.0));
    ps = 15.0 * ps;
    r22.w = r11.x * 3.3333333;
    r22.x = saturate(ps);
    ps = r17.z;
    r13.yzw = -r22.xyw + 1.0;
    r5.y = ps;
    ps = (-0.3) * r5.y;
    r5.xz = r13.ww * float2(3.0, 1.0);
    r5.y = ps;
    ps = r7.x;
    r27.xy = r22.zx * r5.xz;
    r5.x = ps;
    ps = 0.01 * r5.x;
    r19.w = r22.w + r27.y;
    r5.z = ps;
    ps = r19.w;
    r8 = r12.zwww * r3.xxyz;
    ps = r7.y * ps;
    r3.xy = r5.yz * r19.ww;
    r7.y = ps;
    ps = r17.w;
    r5.z = r7.y * 0.025;
    r5.x = ps;
    ps = r5.z;
    r3.zw = r8.yz * r9.yy;
    ps = r3.x + ps;
    r23.xz = r3.yw + r0.xz;
    r5.y = ps;
    ps = 1.0 - r5.x;
    r23.y = r5.y + r0.y;
    r23.w = ps;
    r9.x = tex2D(Texture2D_5, r23.xy).w;
    r5.y = dot(r1.zxy, r1.zxy);
    r9.yzw = saturate(UniformVector_3.xyz);
    r9.yzw = r9.ywz * UniformScalar_5.xxx;
    ps = 1.0 / UniformScalar_5.x;
    r9.yzw = floor(-r9.yzw);
    r5.x = ps;
    ps = -r6.z;
    r11.xyw = -r9.yzw * r5.xxx;
    ps = 1.0 + ps;
    r15.yzw = r11.xyw + UniformScalar_6.xxx;
    r15.x = ps;
    r14 = r15.xywz - r11.xxwy;
    ps = 1.0 / r14.w;
    r9.y = -r9.x + 1.0;
    r9.z = ps;
    ps = 1.0 / r14.z;
    r11.yw = r15.xx - r11.yw;
    r9.w = ps;
    ps = 1.0 / UniformScalar_1.x;
    r12.zw = saturate(r11.yw * r9.zw);
    r5.x = ps;
    r11.x = r12.w * r9.y + r9.x;
    r3.xyw = r3.yzx + r0.xwy;
    ps = rsqrt(abs(r5.y));
    r3.z = r3.w + r5.z;
    r5.y = ps;
    r9.xyz = r5.yyy * r1.xyz;
    r24.xw = -r23.wz + 1.0;
    ps = UniformVector_1.x * r3.y;
    r5.z = r24.w * UniformVector_1.y;
    r5.y = ps;
    r25.xy = float2((r5.yz >= 0.5));
    r9.w = dot(r25.xyy, float3(1.0, 1.0, 1.0));
    ps = OpacityOverride.x;
    r1.xyz = r9.wwz + float3(-3.0, -2.0, 0.1);
    r11.w = saturate(ps);
    ps = r11.z;
    r11.y = saturate(r1.z * 5.0);
    ps = r5.x * ps;
    r28.yz = -r11.xy + 1.0;
    r11.x = saturate(ps);
    ps = (-0.5) + r5.y;
    r11.yz = r28.zz * ModShadowGroupColor.xy;
    r0.x = ps;
    ps = (-0.5) + r5.z;
    r11 = -r11 + 1.0;
    r0.y = ps;
    ps = r11.x;
    r21.xy = r0.xy - r5.yz;
    ps = r6.w * ps;
    r15.zw = r12.xy * r11.yz;
    r10.w = ps;
    r15.xy = r10.zw * r17.wz;
    r5.x = float((r15.y >= 0.05));
    ps = 1.0 - r5.x;
    r19.xyz = r15.xzw + float3(-1.0, 0.125, 0.125);
    r0.x = ps;
    ps = 1.0 - r5.w;
    r27.zw = r19.xy * r19.wz;
    r0.y = ps;
    ps = 2.5 * r0.y;
    r25.zw = r27.xz + 1.0;
    r21.z = ps;
    r5.xy = r21.xy * r25.xy + r5.yz;
    r5.xy = r5.xy + r5.xy;
    r10 = tex2D(Texture2D_4, r5.xy);
    r5.xyw = tex2D(Texture2D_6, r3.xz).xyz;
    r16 = tex2D(Texture2D_5, r3.xz);
    ps = r0.z;
    r12.x = float((UniformScalar_0.x >= 0.0));
    r6.z = ps;
    ps = (UniformScalar_0.x > 0.0) ? 1.0 : 0.0;
    r5.z = -r16.w + 1.0;
    r1.z = ps;
    r5.xyw = r5.wxy * 2.0 - 1.0;
    ps = r0.w + r0.w;
    r5.xyw = r5.yxw * UniformVector_5.xzy;
    r12.y = ps;
    ps = 1.0 / r14.y;
    r6.y = r8.x + r0.w;
    r6.x = ps;
    r30.xw = r12.zw * r5.zz + r16.ww;
    ps = r0.z + r0.z;
    r18.xy = r7.zw - 2.0;
    r12.z = ps;
    ps = (-1.0) - -r5.y;
    r30.yz = r18.xy + r17.xy;
    r17.w = ps;
    ps = r14.x;
    r29.xyz = r30.xyz + r17.zxy;
    ps = r6.x * ps;
    r0.w = float((r29.x >= 0.5));
    r0.z = saturate(ps);
    r5.y = (r9.w == 0.0) ? r10.x : r10.y;
    r5.y = (r1.y == 0.0) ? r10.z : r5.y;
    r17.z = (r1.x == 0.0) ? r10.w : r5.y;
    r11.xyz = (-abs(r1.zzz) >= 0.0) ? 1.0 : r0.zwx;
    r17.xy = (-abs(r12.xx) >= 0.0) ? r0.zx : r11.xz;
    ps = r23.z + r23.z;
    r6.xw = r17.yz + float2(-0.5, -1.0);
    r1.y = ps;
    ps = r3.y + r3.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r1.x = ps;
    r10.yzw = tex2D(Texture2D_8, r1.xy).xyz;
    r18 = tex2D(Texture2D_2, r12.yz);
    r1.xyw = tex2D(Texture2D_0, r1.xy).xyz;
    r14.xyz = tex2D(Texture2D_1, r12.yz).xyz;
    r6.xyz = tex2D(Texture2D_7, r6.yz).zxy;
    r3.xyw = UniformVector_7.xyz * UniformVector_7.www;
    ps = 0.5 * r6.x;
    r12.yzw = -ModShadowColor.xyz + 1.0;
    r3.z = ps;
    r26.xyz = r14.zxy * 2.0 - 1.0;
    r14.xyz = r1.wxy * 2.0 - 1.0;
    ps = 0.3 * r5.z;
    r20.yzw = r3.xyw * r16.xyz;
    r3.x = ps;
    ps = 1.0 * r5.z;
    r26.xyz = r26.xyz - r14.xyz;
    r3.y = ps;
    r10.x = r26.x * r18.w - 2.0;
    r16.xyz = r26.xyz * r18.www + r14.xyz;
    ps = r16.w;
    r14 = r3.yxyy * UniformVector_6.xxyz;
    r5.y = ps;
    r26.xyz = r16.www * UniformScalar_11.xxx + r14.xwz;
    ps = (-0.5) + r5.y;
    r28.x = -r30.w + 1.0;
    r5.y = ps;
    ps = 3.3333333 * r5.y;
    r28 = r29.yzyz * r28.xxyy;
    r13.x = saturate(ps);
    r3.xy = (-abs(r1.zz) >= 0.0) ? 0.0 : r28.zw;
    r3.xy = (-abs(r12.xx) >= 0.0) ? r28.xy : r3.xy;
    r1.xyz = r27.www * r12.yzw + ModShadowColor.xyz;
    r12.x = (-abs(r12.x) >= 0.0) ? r0.w : r11.y;
    r12.yzw = r25.zzz * r6.yzx - r3.zzz;
    r20.x = saturate(r21.z * r25.w - 0.5);
    r17.xw = r13.xw * r17.wx;
    r12.yzw = r17.www * r12.yzw + r3.zzz;
    r5.z = dot(r6.ww, r13.yy) + 2.25;
    r21 = r20.yzwx * r16.wwww;
    r6.xyz = r21.xyz * UniformScalar_12.xxx + r26.xzy;
    ps = abs(r25.w) * abs(r25.w);
    r21.w = -r20.x + r21.w;
    r24.y = ps;
    ps = r5.z;
    r14 = r14.yxwz * r12.yywz;
    r6.w = dot(r14.zw, float2(0.11, 0.59)) + r14.x;
    ps = -r15.x + ps;
    r12.yzw = r21.xyz - r3.zzz;
    r24.z = saturate(ps);
    r15.xyz = r12.yzw * r12.xxx + r3.zzz;
    ps = r24.x * r24.z;
    r5.z = dot(r4.zxy, r4.zxy);
    r3.z = ps;
    ps = r24.y * r24.y;
    r21.xyz = r6.www - r14.ywz;
    r6.w = ps;
    r3.z = r23.w + r3.z;
    r14.xyz = r22.www * r21.xyz + r14.ywz;
    r7.z = r22.x * r21.w + r20.x;
    ps = r6.w * r6.w;
    r10.yzw = r3.zzz * r10.yzw;
    r6.w = ps;
    ps = abs(r0.y) * abs(r0.y);
    r6.xyz = r6.www * r6.xzy;
    r0.z = ps;
    ps = r7.x;
    r6.xyz = r6.xzy * r0.zzz;
    ps = r19.w * ps;
    r0.xyw = -r10.ywz + r18.xzy;
    r7.x = ps;
    r12.yzw = r7.zxy * r12.xxx;
    r10.yzw = r0.xyw * r18.www + r10.ywz;
    r15.yzw = r0.zzz * r15.xyz - r10.ywz;
    r5.xy = r5.xw * r13.xx + r12.zw;
    r17.yz = r3.xy * r12.xx + r5.xy;
    ps = rsqrt(abs(r5.z));
    r3.yzw = r6.yzx * r12.yyx;
    r5.x = ps;
    r6.yzw = -UniformVector_0.xyz + 1.0;
    r11.xyz = r6.yzw * AmbientColorAndSkyFactor.xyz;
    r4.xyz = r5.xxx * r4.xyz;
    r5.xyz = -r16.xyz + r17.xyz;
    r0.xy = r5.yz * r7.zz + r16.yz;
    ps = 1.0 + r5.x;
    r6.x = float((r11.w >= 0.004));
    r15.x = ps;
    r10 = r15 * r7.zzzz + r10.xywz;
    r14.w = r1.w * 2.0 + r10.x;
    r5 = r14.wxzy * r13.zyyy;
    ps = r5.x;
    r5.yzw = r5.ywz * r0.zzz;
    r5.x = ps;
    ps = 1.0 + r5.x;
    r12.yzw = r5.zwy * r12.yyx;
    r5.z = ps;
    ps = r12.w;
    r5.xy = r0.xy * r13.zz;
    r5.xyz = (r13.zzz > 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r0.xyz = (r13.zzz >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = r7.z * ps;
    r5.w = dot(r0.zxy, r0.zxy);
    r12.x = ps;
    r5.xyz = r12.xzy + UniformVector_0.xzy;
    r5.xyz = r11.xzy * r10.ywz + r5.xyz;
    ps = rsqrt(abs(r5.w));
    r6.yzw = r10.yzw * r6.yzw;
    r5.w = ps;
    r0.xyz = r0.xyz * r5.www;
    r5.w = dot(r0.zxy, r8.wyz);
    r10.xyz = r0.xyz * r5.www;
    r8.xyz = r10.xyz * 2.0 - r8.yzw;
    r5.w = saturate(dot(r9.zxy, r8.zxy));
    ps = log2(r5.w);
    r4.x = dot(r4.zxy, r0.zxy);
    r4.y = ps;
    ps = r3.w;
    r0.xyw = r4.xxy * float3(-0.5, 0.5, 15.0);
    ps = r7.z * ps;
    r4.xy = r0.xy + 0.5;
    r3.x = ps;
    ps = pow(2.0, r0.w);
    r4.yz = abs(r4.xy) * abs(r4.xy);
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r0.xyz = r0.zzz * ConstantLighting.xyz;
    r4.x = ps;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r6.ywz * r4.yyy;
    r4.y = ps;
    ps = ConstantLighting.y * r5.w;
    r8.xyz = r6.ywz * r4.zzz;
    r4.z = ps;
    r5.xyz = r8.xyz * UpperSkyColor.xzy + r5.xyz;
    r5.xyz = r7.xyz * LowerSkyColor.xzy + r5.xyz;
    r5.xyz = r4.xyz * r3.xzy + r5.xyz;
    r5.xyz = r0.xzy * r6.ywz + r5.xyz;
    ps = -r2.w;
    r5.xyz = r5.xyz * r1.xzy;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xzy - r5.xzy;
    r0.w = ps;
    oC0.w = r0.w * r6.x + r2.w;
    r5.xyz = r0.xyz * r6.xxx + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
