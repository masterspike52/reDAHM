// ps_9447ac4ddcf2badc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 432 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006C0 10041A00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c21); // float4
float4 LowerSkyColor : register(c20); // float3
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 OpacityOverride : register(c18); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c12); // float
float4 UniformScalar_3 : register(c13); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UniformVector_8 : register(c10); // float4
float4 UpperSkyColor : register(c19); // float3
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
    float4 r26 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    ps = -r0.z;
    r17.w = UniformScalar_1.x * UniformVector_4.x;
    ps = 1.0 + ps;
    r6.zw = UniformVector_1.xy + UniformVector_1.xy;
    r21.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.x = r3.w - 4e+02;
    r6.y = ps;
    ps = r0.w + r0.w;
    r14.xy = r6.zw * r0.wz;
    r10.y = ps;
    ps = r0.z + r0.z;
    r6.zw = r0.wz * UniformVector_8.xy;
    r10.z = ps;
    ps = r0.w - r0.x;
    r9.yz = r0.wz * UniformVector_1.xy;
    r9.x = ps;
    ps = r0.z - r0.y;
    r7.x = dot(r4.zxy, r4.zxy);
    r9.w = ps;
    r7.yzw = r7.wyz * 2.0 - 1.0;
    r9.xw = r9.xw * UniformScalar_4.xx + r0.xy;
    ps = 0.00022222222 * r6.x;
    r9.xw = r9.wx * UniformVector_6.yx;
    r10.x = saturate(ps);
    ps = rsqrt(abs(r7.x));
    r20.yzw = r7.ywz * UniformVector_4.zyx;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r17.xyz = r6.xxx * r4.xyz;
    r4.x = ps;
    ps = 1.0 / UniformScalar_2.x;
    r11.xyz = r10.xyz * float3(-0.1, 6.0, 6.0);
    r11.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xyz = r17.xwy * r11.xwx;
    r4.y = ps;
    ps = UniformScalar_3.x * r7.y;
    r8.xy = r4.xy * abs(r8.xy);
    r7.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r7.xzw = r7.wxz + r9.wyz;
    r6.x = ps;
    ps = UniformVector_2.x * r6.y;
    r20.x = r7.w * r6.x;
    r6.x = ps;
    ps = r6.x;
    r21.yz = -r20.xy + 1.0;
    ps = r7.z * ps;
    r12.yz = r21.xy * UniformVector_2.yy;
    r12.w = ps;
    ps = UniformVector_2.x * r0.w;
    r15.xyz = UniformVector_5.xyz * 2e+01;
    r12.x = ps;
    r4 = r12 - 0.5;
    r24 = float4((r12 >= 0.5));
    r4 = r4 - r12;
    r4 = r4.xywz * r24.xywz + r12.xywz;
    ps = UniformVector_7.y + r9.x;
    r4 = r4 + r4;
    r7.y = ps;
    r13.xyz = tex2D(Texture2D_8, r7.zw).xyz;
    r16.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r19 = tex2D(Texture2D_3, r4.xy);
    r23 = tex2D(Texture2D_3, r4.zw);
    r12 = tex2D(Texture2D_2, r14.xy);
    r6.xyw = tex2D(Texture2D_9, r6.zw).xyz;
    r4.xyw = tex2D(Texture2D_0, r7.zw).xyz;
    r18.xyz = tex2D(Texture2D_1, r14.xy).xyz;
    r9 = tex2D(Texture2D_7, r7.xy);
    r22 = tex2D(Texture2D_6, r0.xy).xwyz;
    r11.xzw = tex2D(Texture2D_4, r11.yz).wxy;
    r10.xyz = tex2D(Texture2D_4, r10.yz).xyw;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r0.y = float((UniformScalar_17.x >= 1.0));
    ps = OpacityOverride.x;
    r7.y = dot(r2.zxy, r2.zxy);
    r15.w = saturate(ps);
    ps = r3.w;
    r7.z = dot(r5.zxy, r5.zxy);
    ps = 0.0001 * ps;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r6.z = saturate(ps);
    r0.zw = r10.xy * 2.0 - 1.0;
    r11.zw = r11.zw * 2.0 - 1.0;
    ps = r11.x;
    r7.w = float((UniformScalar_17.x > 1.0));
    ps = r10.z * ps;
    r0.x = -r22.y + 1.0;
    r7.x = ps;
    ps = r9.x * r9.w;
    r10.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz;
    r9.x = ps;
    r26.xyz = r18.zxy * 2.0 - 1.0;
    r18.yzw = r4.wxy * 2.0 - 1.0;
    r6.xyw = (-abs(r7.www) >= 0.0) ? r6.xyw : 1.0;
    ps = rsqrt(abs(r7.z));
    r25.xyz = r22.xzw * UniformScalar_18.xxx;
    r7.z = ps;
    ps = rsqrt(abs(r7.y));
    r5.xyz = r7.zzz * r5.xyz;
    r7.y = ps;
    ps = r9.y * r9.w;
    r7.yzw = r7.yyy * r2.xyz;
    r9.y = ps;
    r6.xyw = (-abs(r0.yyy) >= 0.0) ? 1.0 : r6.xyw;
    ps = r9.z * r9.w;
    r2.xyz = r26.xyz - r18.yzw;
    r9.z = ps;
    r18.x = r2.x * r12.w - 2.0;
    r18.yzw = r2.xyz * r12.www + r18.yzw;
    r4.xyz = r25.xyz * r6.xyw + UniformScalar_19.xxx;
    ps = r6.x;
    r2.xyz = r15.xyz * r9.xyz;
    ps = r22.x * ps;
    r2 = r2.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r22.y = ps;
    r22.x = dot(r2.yx, r0.xx) + 0.0;
    ps = r6.y;
    r9.xyw = r2.zwy * r0.xxx;
    r11.x = dot(r9.yx, float2(0.11, 0.59)) + 0.0;
    ps = r22.z * ps;
    r0.x = dot(r24.xyy, float3(1.0, 1.0, 1.0));
    r22.z = ps;
    ps = r6.w;
    r0.y = dot(r24.wzz, float3(1.0, 1.0, 1.0));
    r6.y = (r0.y == 0.0) ? r23.x : r23.y;
    r6.x = (r0.x == 0.0) ? r19.x : r19.y;
    ps = r22.w * ps;
    r2 = r0.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r22.w = ps;
    r6.x = (r2.y == 0.0) ? r19.z : r6.x;
    r6.y = (r2.z == 0.0) ? r23.z : r6.y;
    r16.z = (r2.w == 0.0) ? r23.w : r6.y;
    r6.x = (r2.x == 0.0) ? r19.w : r6.x;
    ps = r7.w;
    r6.w = max(r6.x, 0.0);
    r6.y = ps;
    ps = 0.1 + r6.y;
    r11.y = min(r6.w, 0.3);
    r0.x = ps;
    ps = (-1.0) + r7.x;
    r2.xyz = r11.zyw * float3(0.5, 3.3333333, 0.5);
    r0.y = ps;
    ps = 1.0 - r6.x;
    r0.zw = r0.zw + r2.xz;
    r2.x = ps;
    ps = 1.0 - r6.z;
    r19.xyz = r2.yyy * r0.yzw;
    r2.w = ps;
    ps = 2.5 * r2.x;
    r2.y = r19.x + 1.0;
    r2.z = ps;
    ps = 5.0 * r0.x;
    r6.yw = r2.yz * r2.xy;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r0.x = float((r6.y > 0.9));
    r6.z = ps;
    ps = (-0.5) + r6.w;
    r11.yzw = r9.wxy * r0.xxx;
    r0.y = saturate(ps);
    r9.xyz = r11.yzw * r0.yyy + UniformVector_0.xyz;
    ps = ModShadowGroupColor.x * r6.z;
    r11 = r22 + r11;
    r15.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r15.x = saturate(r11.x - r9.w);
    r15.z = ps;
    r6.z = r21.z * r15.x + r20.y;
    r6.xy = -r20.wz * r15.xx + r20.wz;
    r15 = -r15.wxyz + 1.0;
    ps = r4.x;
    r6.xy = r6.xy + r19.yz;
    ps = r15.y * ps;
    r0.x = float((r15.x >= 0.004));
    r4.x = ps;
    ps = r4.y;
    r6.xyz = -r18.yzw + r6.zxy;
    r6.yzw = r6.xyz * r0.yyy + r18.xzw;
    r6.x = r4.w * 2.0 + r6.y;
    ps = r15.y * ps;
    r6.xyw = r6.zwx * r2.www;
    r4.y = ps;
    ps = r4.z;
    r6.z = r6.w + 1.0;
    r6.xyz = (r2.www > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r2.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r15.y * ps;
    r6.x = dot(r6.wyz, r6.wyz);
    r4.z = ps;
    ps = rsqrt(abs(r6.x));
    r4.xyz = r4.xzy * r0.yyy;
    r6.x = ps;
    r2.xyz = r6.yzw * r6.xxx;
    r16.w = dot(r5.zxy, r2.zxy);
    r6.x = dot(r2.zxy, r17.zxy);
    r6.xyz = r2.xyz * r6.xxx;
    r5.yzw = r6.xyz * 2.0 - r17.xyz;
    r6 = r16.wwxy * float4(-0.5, 0.5, 0.875, 0.875);
    ps = r6.x;
    r2.xyz = r2.zzz * r1.xyz;
    r6.x = ps;
    ps = 0.5 + r6.x;
    r16.xy = r6.zw * r15.zw;
    r5.x = ps;
    ps = 0.5 + r6.y;
    r0.z = saturate(dot(r7.wyz, r5.wyz));
    r5.y = ps;
    ps = log2(r0.z);
    r5.zw = abs(r5.xy) * abs(r5.xy);
    r6.x = ps;
    ps = 15.0 * r6.x;
    r15.xyz = r16.xyz + float3(0.125, 0.125, 0.25);
    r6.w = ps;
    ps = r15.x * r15.y;
    r0.z = r15.z + r16.z;
    r6.x = ps;
    r6.xyz = r6.xxx * r14.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r7.x = saturate(r0.z - r7.x);
    r6.w = ps;
    ps = r6.w;
    r7.xyz = r7.xxx * r13.xyz;
    ps = r1.x * ps;
    r13.xyz = -r7.xzy + r12.xzy;
    r5.x = ps;
    r7.xyz = r13.xyz * r12.www + r7.xzy;
    ps = r6.w;
    r11.xyz = r11.yzw - r7.xzy;
    r0.yzw = r11.xyz * r0.yyy + r7.xzy;
    r7.xyz = r10.xyz * r0.yzw + r9.xyz;
    ps = r1.z * ps;
    r0.yzw = r0.yzw * r8.xyz;
    r5.y = ps;
    ps = r6.w;
    r8.xyz = r0.ywz * r5.zzz;
    ps = r1.y * ps;
    r9.xyz = r0.ywz * r5.www;
    r5.z = ps;
    r7.xyz = r9.xyz * UpperSkyColor.xzy + r7.xzy;
    r7.xyz = r8.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r5.xyz * r4.xyz + r7.xzy;
    r7.xyz = r2.xyz * r0.yzw + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r0.x + r3.w;
    r6.xyz = r7.xyz * r0.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
