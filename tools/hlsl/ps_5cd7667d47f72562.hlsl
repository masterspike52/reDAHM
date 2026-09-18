// ps_5cd7667d47f72562.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 438 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006D8 10041700 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
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
float4 LightMapScale : register(c22); // float3
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
sampler2D LightMapTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    ps = r1.w;
    r21.x = -r1.z + 1.0;
    ps = UniformVector_2.x * ps;
    r7.yz = r1.wz + r1.wz;
    r10.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.z = r3.w - 4e+02;
    r6.y = ps;
    ps = UniformVector_2.x * r6.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r7.x = saturate(r6.z * 0.00022222222);
    r7.w = ps;
    r6.xyz = r9.zxy * 2.0 - 1.0;
    ps = UniformVector_4.z * r6.x;
    r0.zw = r1.wz * UniformVector_1.xy;
    r20.y = ps;
    ps = UniformVector_4.y * r6.z;
    r11.xyz = r7.www * r4.xyz;
    r20.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r9.xyz = r7.xyz * float3(-0.1, 6.0, 6.0);
    r7.w = ps;
    r0.zw = r11.xy * r9.xx + r0.zw;
    ps = UniformVector_4.x * r6.y;
    r20.x = r0.w * r7.w;
    r20.w = ps;
    ps = r6.w;
    r21.yz = -r20.xy + 1.0;
    ps = r0.z * ps;
    r10.yz = r21.xy * UniformVector_2.yy;
    r10.w = ps;
    r6 = r10 - 0.5;
    r12 = float4((r10 >= 0.5));
    r6 = r6 - r10;
    r6 = r6.xywz * r12.xywz + r10.xywz;
    r4 = r6 + r6;
    r15 = tex2D(Texture2D_3, r4.xy);
    r10.xzw = tex2D(Texture2D_4, r9.yz).wxy;
    r7.xyz = tex2D(Texture2D_4, r7.yz).xyw;
    ps = UniformScalar_1.x;
    r4.xy = r1.wz * UniformVector_8.xy;
    ps = UniformVector_4.x * ps;
    r6.zw = UniformVector_1.xy + UniformVector_1.xy;
    r14.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r1.wz - r1.xy;
    r13.x = ps;
    r9.zw = r7.xy * 2.0 - 1.0;
    r10.zw = r10.zw * 2.0 - 1.0;
    r6.xy = r6.yx * UniformScalar_4.xx + r1.yx;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.w = r10.x * r7.z;
    r13.w = ps;
    ps = (-1.0) - -r7.w;
    r7.xy = r6.zw * r1.wz;
    r10.x = ps;
    ps = UniformVector_6.x * r6.y;
    r13.z = dot(r12.wzz, float3(1.0, 1.0, 1.0));
    r6.y = ps;
    ps = UniformVector_6.y * r6.x;
    r13.y = dot(r12.xyy, float3(1.0, 1.0, 1.0));
    r6.z = ps;
    r6.x = (r13.y == 0.0) ? r15.x : r15.y;
    ps = r13.x;
    r12 = r13.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r6.x = (r12.y == 0.0) ? r15.z : r6.x;
    r6.x = (r12.x == 0.0) ? r15.w : r6.x;
    ps = abs(r8.x) * ps;
    r6.w = max(r6.x, 0.0);
    r9.x = ps;
    ps = r13.w;
    r10.y = min(r6.w, 0.3);
    ps = abs(r8.y) * ps;
    r14.xyz = r10.yzw * float3(3.3333333, 0.5, 0.5);
    r9.y = ps;
    ps = 1.0 / UniformScalar_2.x;
    r10.yz = r9.zw + r14.yz;
    r10.w = ps;
    ps = UniformVector_7.y + r6.z;
    r15 = r14.xxwx * r10.xywz;
    r6.w = ps;
    r6.z = r15.z * UniformScalar_3.x + r6.y;
    r12.xy = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r9.xyz = tex2D(Texture2D_8, r0.zw).xyz;
    r23 = tex2D(Texture2D_3, r4.zw);
    r22 = tex2D(Texture2D_2, r7.xy);
    r10 = tex2D(Texture2D_7, r6.zw);
    r16.xyz = tex2D(Texture2D_9, r4.xy).xyz;
    r8.xyw = tex2D(Texture2D_0, r0.zw).xyz;
    r4.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    r0.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r18 = tex2D(Texture2D_6, r1.xy);
    r19.xyz = UniformVector_5.xyz * 2e+01;
    r0.w = float((UniformScalar_17.x >= 1.0));
    ps = OpacityOverride.x;
    r1.x = dot(r5.zxy, r5.zxy);
    r9.w = saturate(ps);
    ps = r3.w;
    r6.y = dot(r2.zxy, r2.zxy);
    ps = 0.0001 * ps;
    r7.xyz = -UniformVector_0.zxy + 1.0;
    r6.z = saturate(ps);
    ps = r18.w;
    r1.y = float((UniformScalar_17.x > 1.0));
    r6.w = ps;
    r4.yzw = r4.zxy * 2.0 - 1.0;
    r14.yzw = r8.wxy * 2.0 - 1.0;
    r17.xyz = (-abs(r1.yyy) >= 0.0) ? r16.xyz : 1.0;
    ps = rsqrt(abs(r6.y));
    r16.xyz = r18.xyz * UniformScalar_18.xxx;
    r6.y = ps;
    ps = rsqrt(abs(r1.x));
    r1.yzw = r10.xyz * r10.www;
    r1.x = ps;
    ps = 1.0 - r6.w;
    r10.xyz = r6.yyy * r2.xyz;
    r6.y = ps;
    ps = LightMapScale.x * r0.y;
    r1.yzw = r19.xyz * r1.yzw;
    r4.x = ps;
    r19.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r17.xyz;
    ps = LightMapScale.y * r0.z;
    r2.xyz = r4.yzw - r14.yzw;
    r4.y = ps;
    r14.x = r2.x * r22.w - 2.0;
    r14.yzw = r2.xyz * r22.www + r14.yzw;
    r16.xyw = r16.xyz * r19.xyz + UniformScalar_19.xxx;
    ps = LightMapScale.z * r0.x;
    r2 = r1.yyzw * float4(0.3, 1.0, 1.0, 1.0);
    r4.z = ps;
    r13.x = dot(r2.yx, r6.yy) + 0.0;
    ps = AmbientColorAndSkyFactor.x * r7.y;
    r17.xyz = r2.yzw * r6.yyy;
    r1.y = ps;
    r2.x = dot(r17.zy, float2(0.11, 0.59)) + 0.0;
    r6.y = (r13.z == 0.0) ? r23.x : r23.y;
    r6.y = (r12.z == 0.0) ? r23.z : r6.y;
    r10.w = (r12.w == 0.0) ? r23.w : r6.y;
    ps = AmbientColorAndSkyFactor.y * r7.z;
    r6.yw = r10.wz + float2(0.25, 0.1);
    r1.z = ps;
    ps = AmbientColorAndSkyFactor.z * r7.x;
    r0.x = r6.y + r10.w;
    r1.w = ps;
    ps = 1.0 - r6.x;
    r7.w = saturate(r0.x - r7.w);
    r0.x = ps;
    ps = 1.0 - r6.z;
    r13.yzw = r7.www * r9.xyz;
    r0.w = ps;
    ps = 2.5 * r0.x;
    r2.yzw = -r13.ywz + r22.xzy;
    r0.z = ps;
    ps = 5.0 * r6.w;
    r2.yzw = r2.ywz * r22.www;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r0.y = r15.x + 1.0;
    r6.z = ps;
    ps = r0.y * r0.x;
    r13 = r13.xywz + r2.xywz;
    r6.y = ps;
    ps = r0.z * r0.y;
    r9.x = saturate(r13.x - r17.x);
    r6.x = ps;
    r16.z = r21.z * r9.x + r20.y;
    ps = ModShadowGroupColor.x * r6.z;
    r6.y = float((r6.y > 0.9));
    r9.y = ps;
    r2.xw = -r20.wz * r9.xx + r20.wz;
    ps = ModShadowGroupColor.y * r6.z;
    r17.xyz = r17.xyz * r6.yyy;
    r9.z = ps;
    ps = (-0.5) + r6.x;
    r9 = -r9.wxyz + 1.0;
    r7.w = saturate(ps);
    ps = r2.x;
    r6.w = float((r9.x >= 0.004));
    r6.xyz = r17.xyz * r7.www + UniformVector_0.xyz;
    r17.xyz = r19.xyz * r18.xyz + r17.xyz;
    ps = r15.y + ps;
    r18.xyz = r16.xyw * r9.yyy;
    r16.x = ps;
    ps = r2.w;
    r2.xyz = r18.xzy * r7.www;
    ps = r15.w + ps;
    r15.xyz = r17.xyz - r13.ywz;
    r16.y = ps;
    ps = r1.x;
    r16.xyz = -r14.yzw + r16.zxy;
    r14.yzw = r16.xyz * r7.www + r14.xzw;
    r13.xyz = r15.xyz * r7.www + r13.ywz;
    r8.xyz = r1.yzw * r13.xyz + r6.xyz;
    r14.x = r8.w * 2.0 + r14.y;
    ps = r5.x * ps;
    r14.xyw = r14.zwx * r0.www;
    r6.x = ps;
    ps = r1.x;
    r14.z = r14.w + 1.0;
    r1.yzw = (r0.www > 0.0) ? r14.xyz : float3(0.0, 0.0, 1.0);
    r1.yzw = (r0.www >= 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    ps = r5.y * ps;
    r6.z = dot(r1.wyz, r1.wyz);
    r6.y = ps;
    ps = rsqrt(abs(r6.z));
    r0.xyz = r13.xyz * r7.yzx;
    r6.z = ps;
    ps = r1.x;
    r7.xyz = r1.yzw * r6.zzz;
    ps = r5.z * ps;
    r1.xyz = r4.xzy * r7.zzz;
    r6.z = ps;
    r12.z = dot(r6.zxy, r7.zxy);
    ps = -ModShadowColor.x;
    r6.x = dot(r7.zxy, r11.zxy);
    ps = 1.0 + ps;
    r6.xyz = r7.xyz * r6.xxx;
    r7.x = ps;
    ps = -ModShadowColor.y;
    r5 = r12.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r6.xyz = r6.xyz * 2.0 - r11.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r10.zxy, r6.zxy));
    r7.y = ps;
    r6.yz = r5.xy * r9.zw + 0.125;
    ps = -ModShadowColor.z;
    r7.zw = r5.zw + 0.5;
    ps = 1.0 + ps;
    r5.xy = abs(r7.zw) * abs(r7.zw);
    r7.z = ps;
    ps = log2(r6.x);
    r6.y = r6.y * r6.z;
    r6.x = ps;
    r7.xyz = r6.yyy * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r9.xyz = r0.xzy * r5.yyy;
    r7.w = ps;
    r6.xyz = r9.xyz * UpperSkyColor.xzy + r8.xzy;
    ps = pow(2.0, r7.w);
    r5.xyz = r0.xzy * r5.xxx;
    r7.w = ps;
    r4.xyz = r4.xzy * r7.www;
    r6.xyz = r5.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r4.xyz * r2.xyz + r6.xzy;
    r6.xyz = r1.xzy * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
