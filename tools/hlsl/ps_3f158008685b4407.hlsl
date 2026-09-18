// ps_3f158008685b4407.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 363 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005AC 10041300 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ShadowTexture : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 0.1 - -r2.z;
    r6.z = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.z));
    r6.y = r5.w - 4e+02;
    r7.x = ps;
    ps = 5.0 * r6.x;
    r6.zw = r1.wz * UniformVector_1.xy;
    r7.y = saturate(ps);
    ps = 0.00022222222 * r6.y;
    r9.xyz = r7.xxx * r4.xyz;
    r7.z = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r6.y = r7.z * (-0.025);
    r6.x = ps;
    r4.xy = r9.xy * r6.yy + r6.zw;
    r7.x = r4.y * r6.x;
    ps = 1.0 / UniformVector_1.x;
    r6.yw = -r7.xy + 1.0;
    r6.x = ps;
    r6.yz = r6.yx * UniformVector_2.yx;
    r6.x = r6.z * r4.x;
    r7 = tex2D(Texture2D_1, r6.xy).zwxy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = r1.w * UniformVector_2.x;
    r10.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r17.y = trunc(UniformScalar_1.x);
    r10.w = ps;
    r2.w = (r17.y == 0.0) ? r7.z : r7.w;
    ps = -r1.z;
    r4.zw = r1.wz * 6.0;
    ps = 1.0 + ps;
    r0.zw = r1.wz * UniformVector_6.xy;
    r6.z = ps;
    ps = UniformVector_2.y * r6.z;
    r12.zw = r5.xy * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = (-0.5) + r6.x;
    r11.xy = float2((r6.xy >= 0.5));
    r10.x = ps;
    ps = (-0.5) + r6.y;
    r17.x = dot(r11.xyy, float3(1.0, 1.0, 1.0));
    r10.y = ps;
    ps = 1.0 / r5.w;
    r12.xy = r10.xy - r6.xy;
    r11.z = ps;
    r10.xy = r12.zw * r11.zz + ScreenPositionScaleBias.wz;
    r7.zw = r12.xy * r11.xy + r6.xy;
    r15 = r17.xxyy + float4(-3.0, -2.0, -3.0, -2.0);
    r6.x = (r15.w == 0.0) ? r7.x : r2.w;
    r7.x = (r15.z == 0.0) ? r7.y : r6.x;
    ps = 0.25 + r7.x;
    r6.xy = r10.zw * abs(r8.xy);
    r7.y = ps;
    r7.xyw = r7.zwy + r7.zwx;
    r11.xyz = tex2D(LightAttenuationTexture, r10.xy).xyz;
    r12.y = tex2D(ShadowTexture, r0.xy).x;
    r10.xyz = tex2D(Texture2D_5, r4.xy).xyz;
    r13 = tex2D(Texture2D_1, r7.xy);
    r16.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r18 = tex2D(Texture2D_4, r1.xy);
    r19.xyz = tex2D(Texture2D_7, r0.zw).xyz;
    r12.xzw = tex2D(Texture2D_3, r1.xy).xyz;
    r0.xzw = tex2D(Texture2D_6, r1.xy).yzx;
    r14.xyw = tex2D(Texture2D_2, r4.zw).xyw;
    r1.yzw = tex2D(Texture2D_2, r1.wz).xwy;
    r8.xyz = tex2D(Texture2D_0, r4.xy).xyz;
    r1.x = saturate(r5.w * 0.0001);
    ps = UniformVector_5.x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    ps = 2e+01 * ps;
    r6.z = float((UniformScalar_4.x >= 1.0));
    r5.x = ps;
    ps = UniformVector_5.z;
    r7.z = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r0.y = float((UniformScalar_4.x > 1.0));
    r5.y = ps;
    ps = UniformVector_5.y;
    r6.x = dot(r3.zxy, r3.zxy);
    r8.xyw = r8.xyz * 2.0 - 1.0;
    ps = 2e+01 * ps;
    r15.zw = r1.yw + r1.yw;
    r5.z = ps;
    r16.zw = r14.xy * 2.0 - 1.0;
    ps = 1.0 - r6.x;
    r1.yw = r0.xz * UniformScalar_5.xx;
    r6.y = saturate(ps);
    r12.xzw = r12.xzw * 2.0 - 1.0;
    r14.xyz = (-abs(r0.yyy) >= 0.0) ? r19.xyz : 1.0;
    ps = rsqrt(abs(r7.z));
    r6.x = r14.w * r1.z;
    r1.z = ps;
    ps = (-1.0) - -r6.x;
    r3.xyz = r18.xyz * r18.www;
    r0.y = ps;
    r18.xyz = (-abs(r6.zzz) >= 0.0) ? 1.0 : r14.xyz;
    ps = log2(r6.y);
    r7.xyz = r12.wxz * UniformVector_4.zxy;
    r6.y = ps;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r5.yzw = r5.xzy * r3.xyz;
    r6.z = ps;
    r14.xyz = r18.xyz * r0.wxz + r5.yzw;
    ps = 1.0 - r7.x;
    r12.xzw = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = r1.y;
    r3.xyz = r1.zzz * r2.xyz;
    ps = r18.y * ps;
    r16 = r16 * float4(0.875, 0.875, 0.5, 0.5);
    r1.z = ps;
    ps = r1.w;
    r1.y = dot(r5.wyz, float3(0.11, 0.3, 0.59));
    ps = r18.z * ps;
    r2.x = r18.x * UniformScalar_5.x;
    r1.w = ps;
    ps = r2.x;
    r1.y = r1.y - r5.y;
    r0.z = (r17.x == 0.0) ? r13.x : r13.y;
    ps = r0.w * ps;
    r0.x = saturate(r1.y + r5.y);
    r1.y = ps;
    r13.xy = -r7.yz * r0.xx + r7.yz;
    ps = 1.0 - r0.x;
    r1.yzw = r1.yzw + UniformScalar_6.xxx;
    r0.w = ps;
    r0.z = (r15.y == 0.0) ? r13.z : r0.z;
    ps = ModShadowGroupColor.x * r6.w;
    r2.xyz = r1.yzw * r0.www;
    r1.y = ps;
    r1.w = (r15.x == 0.0) ? r13.w : r0.z;
    ps = ModShadowGroupColor.y * r6.w;
    r0.z = max(r1.w, 0.0);
    r1.z = ps;
    ps = r0.z;
    r1 = -r1.wyzx + 1.0;
    r6.y = ps;
    ps = 0.3;
    r15.xy = r16.xy * r1.yz;
    r6.w = ps;
    ps = min(r6.y, r6.w);
    r6.x = saturate(r7.w - r6.x);
    r6.y = ps;
    ps = 3.3333333 * r6.y;
    r10.xyz = r6.xxx * r10.xyz;
    r5.y = ps;
    ps = r1.x;
    r15 = r15 + float4(0.125, 0.125, -1.0, -1.0);
    r6.x = ps;
    ps = r15.x * r15.y;
    r0.zw = r15.zw + r16.zw;
    r6.y = ps;
    r1.xyz = r6.yyy * r12.xzw + ModShadowColor.xyz;
    ps = 2.5 * r6.x;
    r5 = r5.xyyy * r0;
    r12.x = ps;
    ps = r7.x;
    r0.xyz = r14.xyz - r10.xyz;
    ps = r5.x + ps;
    r12.z = r5.y + 1.0;
    r7.z = ps;
    ps = r12.x * r12.z;
    r7.xy = r13.xy + r5.zw;
    r6.x = ps;
    ps = r12.y * r12.y;
    r5.xyz = -r8.xyw + r7.xyz;
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r7.xyz = r6.yyy * r11.xyz;
    r6.y = ps;
    ps = (-0.5) + r6.x;
    r7.xyz = r7.xzy * r6.yyy;
    r7.w = saturate(ps);
    r0.xyz = r0.xyz * r7.www + r10.xyz;
    r6.xy = r5.xy * r7.ww + r8.xy;
    r6.z = r5.z * r7.w - 2.0;
    r6.z = r8.z * 2.0 + r6.z;
    r6.xyz = r6.zxy * r1.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r1.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r1.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
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
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r1.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
