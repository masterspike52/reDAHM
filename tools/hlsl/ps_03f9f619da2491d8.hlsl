// ps_03f9f619da2491d8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 432 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006C0 10041900 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c21); // float4
float4 ConstantLighting : register(c22); // float3
float4 LowerSkyColor : register(c20); // float3
float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    ps = -r0.z;
    r16.w = UniformScalar_1.x * UniformVector_4.x;
    ps = 1.0 + ps;
    r5.zw = UniformVector_1.xy + UniformVector_1.xy;
    r20.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.x = r2.w - 4e+02;
    r5.y = ps;
    ps = r0.w + r0.w;
    r13.xy = r5.zw * r0.wz;
    r9.y = ps;
    ps = r0.z + r0.z;
    r5.zw = r0.wz * UniformVector_8.xy;
    r9.z = ps;
    ps = r0.w - r0.x;
    r8.yz = r0.wz * UniformVector_1.xy;
    r8.x = ps;
    ps = r0.z - r0.y;
    r6.x = dot(r3.zxy, r3.zxy);
    r8.w = ps;
    r6.yzw = r6.wyz * 2.0 - 1.0;
    r8.xw = r8.xw * UniformScalar_4.xx + r0.xy;
    ps = 0.00022222222 * r5.x;
    r8.xw = r8.wx * UniformVector_6.yx;
    r9.x = saturate(ps);
    ps = rsqrt(abs(r6.x));
    r19.yzw = r6.ywz * UniformVector_4.zyx;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r16.xyz = r5.xxx * r3.xyz;
    r3.x = ps;
    ps = 1.0 / UniformScalar_2.x;
    r10.xyz = r9.xyz * float3(-0.1, 6.0, 6.0);
    r10.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xyz = r16.xwy * r10.xwx;
    r3.y = ps;
    ps = UniformScalar_3.x * r6.y;
    r7.xy = r3.xy * abs(r7.xy);
    r6.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r6.xzw = r6.wxz + r8.wyz;
    r5.x = ps;
    ps = UniformVector_2.x * r5.y;
    r19.x = r6.w * r5.x;
    r5.x = ps;
    ps = r5.x;
    r20.yz = -r19.xy + 1.0;
    ps = r6.z * ps;
    r11.yz = r20.xy * UniformVector_2.yy;
    r11.w = ps;
    ps = UniformVector_2.x * r0.w;
    r14.xyz = UniformVector_5.xyz * 2e+01;
    r11.x = ps;
    r3 = r11 - 0.5;
    r23 = float4((r11 >= 0.5));
    r3 = r3 - r11;
    r3 = r3.xywz * r23.xywz + r11.xywz;
    ps = UniformVector_7.y + r8.x;
    r3 = r3 + r3;
    r6.y = ps;
    r12.xyz = tex2D(Texture2D_8, r6.zw).xyz;
    r15.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r18 = tex2D(Texture2D_3, r3.xy);
    r22 = tex2D(Texture2D_3, r3.zw);
    r11 = tex2D(Texture2D_2, r13.xy);
    r5.xyw = tex2D(Texture2D_9, r5.zw).xyz;
    r3.xyw = tex2D(Texture2D_0, r6.zw).xyz;
    r17.xyz = tex2D(Texture2D_1, r13.xy).xyz;
    r8 = tex2D(Texture2D_7, r6.xy);
    r21 = tex2D(Texture2D_6, r0.xy).xwyz;
    r10.xzw = tex2D(Texture2D_4, r10.yz).wxy;
    r9.xyz = tex2D(Texture2D_4, r9.yz).xyw;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r0.y = float((UniformScalar_17.x >= 1.0));
    ps = OpacityOverride.x;
    r6.y = dot(r1.zxy, r1.zxy);
    r14.w = saturate(ps);
    ps = r2.w;
    r6.z = dot(r4.zxy, r4.zxy);
    ps = 0.0001 * ps;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r5.z = saturate(ps);
    r0.zw = r9.xy * 2.0 - 1.0;
    r10.zw = r10.zw * 2.0 - 1.0;
    ps = r10.x;
    r6.w = float((UniformScalar_17.x > 1.0));
    ps = r9.z * ps;
    r0.x = -r21.y + 1.0;
    r6.x = ps;
    ps = r8.x * r8.w;
    r9.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz;
    r8.x = ps;
    r25.xyz = r17.zxy * 2.0 - 1.0;
    r17.yzw = r3.wxy * 2.0 - 1.0;
    r5.xyw = (-abs(r6.www) >= 0.0) ? r5.xyw : 1.0;
    ps = rsqrt(abs(r6.z));
    r24.xyz = r21.xzw * UniformScalar_18.xxx;
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r4.xyz = r6.zzz * r4.xyz;
    r6.y = ps;
    ps = r8.y * r8.w;
    r6.yzw = r6.yyy * r1.xyz;
    r8.y = ps;
    r5.xyw = (-abs(r0.yyy) >= 0.0) ? 1.0 : r5.xyw;
    ps = r8.z * r8.w;
    r1.xyz = r25.xyz - r17.yzw;
    r8.z = ps;
    r17.x = r1.x * r11.w - 2.0;
    r17.yzw = r1.xyz * r11.www + r17.yzw;
    r3.xyz = r24.xyz * r5.xyw + UniformScalar_19.xxx;
    ps = r5.x;
    r1.xyz = r14.xyz * r8.xyz;
    ps = r21.x * ps;
    r1 = r1.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r21.y = ps;
    r21.x = dot(r1.yx, r0.xx) + 0.0;
    ps = r5.y;
    r8.xyw = r1.zwy * r0.xxx;
    r10.x = dot(r8.yx, float2(0.11, 0.59)) + 0.0;
    ps = r21.z * ps;
    r0.x = dot(r23.xyy, float3(1.0, 1.0, 1.0));
    r21.z = ps;
    ps = r5.w;
    r0.y = dot(r23.wzz, float3(1.0, 1.0, 1.0));
    r5.y = (r0.y == 0.0) ? r22.x : r22.y;
    r5.x = (r0.x == 0.0) ? r18.x : r18.y;
    ps = r21.w * ps;
    r1 = r0.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r21.w = ps;
    r5.x = (r1.y == 0.0) ? r18.z : r5.x;
    r5.y = (r1.z == 0.0) ? r22.z : r5.y;
    r15.z = (r1.w == 0.0) ? r22.w : r5.y;
    r5.x = (r1.x == 0.0) ? r18.w : r5.x;
    ps = r6.w;
    r5.w = max(r5.x, 0.0);
    r5.y = ps;
    ps = 0.1 + r5.y;
    r10.y = min(r5.w, 0.3);
    r0.x = ps;
    ps = (-1.0) + r6.x;
    r1.xyz = r10.zyw * float3(0.5, 3.3333333, 0.5);
    r0.y = ps;
    ps = 1.0 - r5.x;
    r0.zw = r0.zw + r1.xz;
    r1.x = ps;
    ps = 1.0 - r5.z;
    r18.xyz = r1.yyy * r0.yzw;
    r1.w = ps;
    ps = 2.5 * r1.x;
    r1.y = r18.x + 1.0;
    r1.z = ps;
    ps = 5.0 * r0.x;
    r5.yw = r1.yz * r1.xy;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r0.x = float((r5.y > 0.9));
    r5.z = ps;
    ps = (-0.5) + r5.w;
    r10.yzw = r8.wxy * r0.xxx;
    r0.y = saturate(ps);
    r8.xyz = r10.yzw * r0.yyy + UniformVector_0.xyz;
    ps = ModShadowGroupColor.x * r5.z;
    r10 = r21 + r10;
    r14.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r14.x = saturate(r10.x - r8.w);
    r14.z = ps;
    r5.z = r20.z * r14.x + r19.y;
    r5.xy = -r19.wz * r14.xx + r19.wz;
    r14 = -r14.wxyz + 1.0;
    ps = r3.x;
    r5.xy = r5.xy + r18.yz;
    ps = r14.y * ps;
    r0.x = float((r14.x >= 0.004));
    r3.x = ps;
    ps = r3.y;
    r5.xyz = -r17.yzw + r5.zxy;
    r5.yzw = r5.xyz * r0.yyy + r17.xzw;
    r5.x = r3.w * 2.0 + r5.y;
    ps = r14.y * ps;
    r5.xyw = r5.zwx * r1.www;
    r3.y = ps;
    ps = r3.z;
    r5.z = r5.w + 1.0;
    r5.xyz = (r1.www > 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.yzw = (r1.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = r14.y * ps;
    r5.x = dot(r5.wyz, r5.wyz);
    r3.z = ps;
    ps = rsqrt(abs(r5.x));
    r3.xyz = r3.xzy * r0.yyy;
    r5.x = ps;
    r1.xyz = r5.yzw * r5.xxx;
    r15.w = dot(r4.zxy, r1.zxy);
    r5.x = dot(r1.zxy, r16.zxy);
    r5.xyz = r1.xyz * r5.xxx;
    r4.yzw = r5.xyz * 2.0 - r16.xyz;
    r5 = r15.wwxy * float4(-0.5, 0.5, 0.875, 0.875);
    ps = r5.x;
    r1.xyz = r1.zzz * ConstantLighting.xyz;
    r5.x = ps;
    ps = 0.5 + r5.x;
    r15.xy = r5.zw * r14.zw;
    r4.x = ps;
    ps = 0.5 + r5.y;
    r0.z = saturate(dot(r6.wyz, r4.wyz));
    r4.y = ps;
    ps = log2(r0.z);
    r4.yz = abs(r4.xy) * abs(r4.xy);
    r5.x = ps;
    ps = 15.0 * r5.x;
    r14.xyz = r15.xyz + float3(0.125, 0.125, 0.25);
    r5.w = ps;
    ps = r14.x * r14.y;
    r0.z = r14.z + r15.z;
    r5.x = ps;
    r5.xyz = r5.xxx * r13.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r5.w);
    r6.x = saturate(r0.z - r6.x);
    r5.w = ps;
    r6.xyz = r6.xxx * r12.xyz;
    r12.xyz = -r6.xzy + r11.xzy;
    r6.xyz = r12.xyz * r11.www + r6.xzy;
    r10.xyz = r10.yzw - r6.xzy;
    r0.yzw = r10.xyz * r0.yyy + r6.xzy;
    r6.xyz = r9.xyz * r0.yzw + r8.xyz;
    ps = ConstantLighting.x * r5.w;
    r0.yzw = r0.yzw * r7.xyz;
    r4.x = ps;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r0.ywz * r4.yyy;
    r4.y = ps;
    ps = ConstantLighting.y * r5.w;
    r8.xyz = r0.ywz * r4.zzz;
    r4.z = ps;
    r6.xyz = r8.xyz * UpperSkyColor.xzy + r6.xzy;
    r6.xyz = r7.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r4.xyz * r3.xyz + r6.xzy;
    r6.xyz = r1.xyz * r0.yzw + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r0.x + r2.w;
    r5.xyz = r6.xyz * r0.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
