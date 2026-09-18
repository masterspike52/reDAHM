// ps_3c59cd22adfcbbf3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 453 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000714 10041900 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c20); // float4
float4 LowerSkyColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 OpacityOverride : register(c17); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_13 : register(c14); // float
float4 UniformScalar_14 : register(c15); // float
float4 UniformScalar_16 : register(c16); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c18); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D Texture2D_9 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_16.x;
    r6.x = r3.w - 4e+02;
    ps = 0.05 * ps;
    r6.y = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = saturate(r6.x * 0.00022222222);
    r6.y = ps;
    ps = r6.z;
    r9 = r0.wzwz * float4(18.0, 18.0, 3.0, 3.0);
    ps = r6.x * ps;
    r11.xyz = r6.yyy * r4.xyz;
    r6.x = ps;
    ps = UniformScalar_12.x - r7.w;
    r22.xyz = UniformVector_4.xzy * 2e+01;
    r11.w = ps;
    r17.yz = r11.xy * r6.xx + r0.wz;
    ps = 1.0 - r0.z;
    r24.xyz = UniformVector_5.xzy * 2e+01;
    r17.w = ps;
    ps = r0.w;
    r17.x = -r17.z + 1.0;
    ps = UniformVector_1.x * ps;
    r4.yzw = r17.wxy * UniformVector_1.yyx;
    r4.x = ps;
    r10 = r4.wzxy - 0.5;
    r6 = float4((r4.wxyz >= 0.5));
    r10 = r10 - r4.wzxy;
    r4 = r10.zwxy * r6.yzxw + r4.xywz;
    r13 = r4.xywz + r4.xywz;
    r18 = tex2D(Texture2D_9, r0.xy);
    r14 = tex2D(Texture2D_4, r9.zw);
    r9.xyz = tex2D(Texture2D_4, r9.xy).xyw;
    r16 = tex2D(Texture2D_3, r13.xy);
    r10.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15.y = saturate(r7.w * 15.0);
    r4.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.x = float((UniformScalar_11.x >= 1.0));
    r4.z = ps;
    r4.x = r11.w * r4.x + r7.w;
    ps = -r4.x;
    r12.xy = r4.yz * abs(r8.xy);
    ps = r7.z + ps;
    r12.w = dot(r6.xww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r6.x;
    r12.z = dot(r6.yzz, float3(1.0, 1.0, 1.0));
    r6.y = ps;
    r6.x = (r12.z == 0.0) ? r16.x : r16.y;
    ps = UniformScalar_13.x;
    r4 = r12.zwwz + float4(-3.0, -2.0, -3.0, -2.0);
    r6.z = ps;
    r6.x = (r4.w == 0.0) ? r16.z : r6.x;
    r6.w = (r4.x == 0.0) ? r16.w : r6.x;
    ps = max(r6.y, r6.z);
    r6.x = max(r6.w, 0.0);
    r6.y = ps;
    ps = 1.0 / UniformScalar_14.x;
    r6.xz = min(r6.yx, float2(1.0, 0.3));
    r6.y = ps;
    ps = r0.w + r0.w;
    r6.y = saturate(r6.x * r6.y);
    r16.x = ps;
    ps = r0.z + r0.z;
    r4.xw = -r6.wy + 1.0;
    r16.y = ps;
    ps = r3.w;
    r9.w = r4.w * r7.w;
    ps = 0.0001 * ps;
    r6.xy = r9.wz * r14.zw;
    r15.x = saturate(ps);
    ps = r10.z + r10.z;
    r15.z = float((r6.x >= 0.05));
    r7.x = ps;
    ps = r10.x + r10.x;
    r8.xyw = -r15.zyx + 1.0;
    r7.y = ps;
    r6.w = (UniformScalar_12.x > 0.0) ? r8.x : 1.0;
    r6.w = (UniformScalar_12.x >= 0.0) ? r6.w : r8.x;
    ps = r10.y + r10.y;
    r7.w = r6.w * r18.w;
    r7.z = ps;
    ps = r17.y + r17.y;
    r10 = r7 + float4(-1.0, -1.0, -1.0, -0.5);
    r7.x = ps;
    ps = r17.z + r17.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r10.wwww)) clip(-1.0);
    r7.y = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r12.xy).xy;
    r21.xyz = tex2D(Texture2D_8, r7.xy).xyz;
    r23 = tex2D(Texture2D_3, r13.wz);
    r20 = tex2D(Texture2D_2, r16.xy);
    r13 = tex2D(Texture2D_7, r0.xy);
    r25 = tex2D(Texture2D_6, r0.xy);
    r0.xyw = tex2D(Texture2D_0, r7.xy).xyz;
    r7.xzw = tex2D(Texture2D_1, r16.xy).xyz;
    r6.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    r7.y = dot(r2.zxy, r2.zxy);
    r19.xyz = r18.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r17.zw = r14.xy * 2.0 - 1.0;
    r16.xyz = r7.wxz * 2.0 - 1.0;
    r14.xyz = r0.wxy * 2.0 - 1.0;
    r7.xzw = r25.xzy * r25.www;
    ps = rsqrt(abs(r7.y));
    r13.xyz = r13.xzy * r13.www;
    r7.y = ps;
    r13.xyz = r24.xyz * r13.xyz;
    r7.xzw = r22.xyz * r7.xzw;
    ps = OpacityOverride.x;
    r16.yzw = r16.xyz - r14.xyz;
    r10.w = saturate(ps);
    r16.x = r16.y * r20.w - 2.0;
    r16.yzw = r16.yzw * r20.www + r14.xyz;
    r13.xyz = (-abs(r6.www) >= 0.0) ? r13.xyz : r7.xzw;
    ps = r9.x + r9.x;
    r6.w = dot(r13.yxz, float3(0.11, 0.3, 0.59));
    r22.y = ps;
    ps = r9.y + r9.y;
    r7.w = r6.w - r13.x;
    r22.z = ps;
    ps = r7.y;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = r2.x * ps;
    r6.w = dot(r5.zxy, r5.zxy);
    r7.x = ps;
    ps = r7.y;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = r2.y * ps;
    r14.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r7.z = ps;
    ps = r7.y;
    r21.w = saturate(dot(r13.zyx, float3(0.59, 0.11, 0.3)));
    r7.y = (r12.w == 0.0) ? r23.x : r23.y;
    r7.y = (r4.y == 0.0) ? r23.z : r7.y;
    r17.y = (r4.z == 0.0) ? r23.w : r7.y;
    ps = r2.z * ps;
    r17.x = r6.z * 3.3333333;
    r7.y = ps;
    ps = 0.1 - -r7.y;
    r2.xw = -r17.yx + 1.0;
    r6.x = ps;
    r6.z = dot(r15.yy, r2.xx) + r17.y;
    ps = 2.5 * r4.x;
    r22.x = r6.z + r17.y;
    r4.z = ps;
    ps = r15.y;
    r2.xyz = r22.xyz + float3(0.25, -1.0, -1.0);
    ps = r2.w * ps;
    r15.xy = r2.yz * 0.5;
    r15.z = ps;
    ps = (-1.0) - -r6.y;
    r17.xyz = r17.zxw + r15.xzy;
    r17.w = ps;
    r4.y = r17.w * r17.y + 1.0;
    ps = 5.0 * r6.x;
    r4.xy = r4.yz * r4.xy;
    r15.w = saturate(ps);
    ps = r7.w;
    r6.xz = r4.xy * r8.yy;
    ps = r13.x + ps;
    r15.xyz = r10.xzy * UniformVector_3.zyx;
    r10.x = saturate(ps);
    ps = r2.x;
    r7.w = float((r6.x >= 0.9));
    r2.xy = -r15.zy * r21.ww + r15.zy;
    r17.xy = r17.xy * r17.yz + r2.xy;
    ps = -r6.y + ps;
    r2.yz = -r15.xw + 1.0;
    r2.x = saturate(ps);
    ps = (-0.5) + r6.z;
    r8.xyz = r7.www * r13.xzy;
    r6.x = saturate(ps);
    r13.xyz = r8.xyz * r6.xxx + UniformVector_0.xyz;
    ps = rsqrt(abs(r6.w));
    r10.yz = r2.zz * ModShadowGroupColor.xy;
    r6.y = ps;
    ps = r8.x;
    r5.xyz = r6.yyy * r5.xyz;
    ps = r18.x + ps;
    r2 = r2.xxxy * r21;
    r6.y = ps;
    ps = r8.y;
    r4.xyz = -r2.xzy + r20.xzy;
    ps = r18.y + ps;
    r10 = -r10.wxyz + 1.0;
    r6.z = ps;
    ps = r8.z;
    r7.w = float((r10.x >= 0.004));
    r2.xyz = r4.xyz * r20.www + r2.xzy;
    ps = r18.z + ps;
    r4.xyz = r19.xyz * r10.yyy;
    r6.w = ps;
    ps = r15.x;
    r4.xyz = r4.xzy * r6.xxx;
    ps = r2.w + ps;
    r15.xyz = r6.yzw - r2.xzy;
    r17.z = ps;
    r6.yzw = -r16.yzw + r17.zxy;
    r6.yzw = r6.yzw * r6.xxx + r16.xzw;
    r2.xyz = r15.xyz * r6.xxx + r2.xzy;
    r8.xyz = r14.xyz * r2.xyz + r13.xyz;
    r6.x = r0.w * 2.0 + r6.y;
    r6.xyz = r6.xzw * r8.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r8.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r8.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r0.xyz = r2.xyz * r0.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r2.xyz = r6.www * r1.xyz;
    r12.z = dot(r5.zxy, r6.wyz);
    r6.x = dot(r6.wyz, r11.zxy);
    r6.xyz = r6.yzw * r6.xxx;
    r5 = r12.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r6.xyz = r6.xyz * 2.0 - r11.xyz;
    r6.y = saturate(dot(r7.yxz, r6.zxy));
    r6.xz = r5.xy * r10.zw + 0.125;
    r7.xy = r5.zw + 0.5;
    r5.xy = abs(r7.xy) * abs(r7.xy);
    ps = log2(r6.y);
    r6.x = r6.x * r6.z;
    r6.y = ps;
    r6.xzw = r6.xxx * r9.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.y;
    r7.xyz = r0.xzy * r5.yyy;
    r6.y = ps;
    r7.xyz = r7.xyz * UpperSkyColor.xzy + r8.xzy;
    ps = pow(2.0, r6.y);
    r5.xyz = r0.xzy * r5.xxx;
    r6.y = ps;
    r1.xyz = r6.yyy * r1.xzy;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r1.xyz * r4.xyz + r7.xzy;
    r7.xyz = r2.xyz * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.w + r3.w;
    r6.xyz = r0.xyz * r7.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
