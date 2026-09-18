// ps_baadf2e762d926db.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 399 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000063C 10041800 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
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
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_4.x - r7.w;
    r9.w = ps;
    ps = UniformScalar_8.x;
    r6.y = r2.z + 0.1;
    ps = 0.05 * ps;
    r6.z = dot(r4.zxy, r4.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r6.x = r5.w - 4e+02;
    r6.z = ps;
    ps = 5.0 * r6.y;
    r11 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r6.y = saturate(ps);
    ps = 0.00022222222 * r6.x;
    r9.xyz = r6.zzz * r4.xyz;
    r6.z = saturate(ps);
    ps = -r1.z;
    r6.x = r6.w * r6.z;
    r12.xy = r9.xy * r6.xx + r1.wz;
    ps = 1.0 + ps;
    r12.z = -r12.y + 1.0;
    r12.w = ps;
    ps = UniformVector_1.x * r1.w;
    r3.yzw = r12.wxz * UniformVector_1.yxy;
    r3.x = ps;
    r10 = r3.wzxy - 0.5;
    r4 = float4((r3.wzxy >= 0.5));
    ps = r1.w + r1.w;
    r13 = r10 - r3.wzxy;
    r10.x = ps;
    r3 = r13.yxzw * r4.yxzw + r3.zwxy;
    ps = r1.z + r1.z;
    r3 = r3 + r3;
    r10.y = ps;
    r15 = tex2D(Texture2D_8, r1.xy);
    r18 = tex2D(Texture2D_4, r11.xy).xzyw;
    r23.yzw = tex2D(Texture2D_4, r11.zw).xyw;
    r14 = tex2D(Texture2D_3, r3.zw);
    r13.xyw = tex2D(Texture2D_1, r10.xy).yxz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r21.w = saturate(r7.w * 15.0);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = float((UniformScalar_3.x >= 1.0));
    r0.w = ps;
    ps = 1.0 / r5.w;
    r10.zw = r5.xy * ScreenPositionScaleBias.xy;
    r6.w = ps;
    r10.zw = r10.zw * r6.ww + ScreenPositionScaleBias.wz;
    r6.x = r9.w * r6.x + r7.w;
    ps = -r6.x;
    r11.xy = r0.zw * abs(r8.xy);
    ps = r7.z + ps;
    r11.z = dot(r4.yxx, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r6.x;
    r11.w = dot(r4.zww, float3(1.0, 1.0, 1.0));
    r4.x = ps;
    r6.x = (r11.w == 0.0) ? r14.x : r14.y;
    ps = UniformScalar_5.x;
    r8 = r11.wwzz + float4(-2.0, -3.0, -3.0, -2.0);
    r4.y = ps;
    r6.x = (r8.x == 0.0) ? r14.z : r6.x;
    r6.x = (r8.y == 0.0) ? r14.w : r6.x;
    ps = max(r4.x, r4.y);
    r0.w = max(r6.x, 0.0);
    r0.z = ps;
    ps = 1.0 / UniformScalar_6.x;
    r0.zw = min(r0.wz, float2(0.3, 1.0));
    r6.w = ps;
    ps = r13.y + r13.y;
    r6.w = saturate(r0.w * r6.w);
    r13.y = ps;
    ps = 1.0 - r6.y;
    r2.w = -r6.w + 1.0;
    r6.w = ps;
    ps = 1.0 - r6.x;
    r23.x = r2.w * r7.w;
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.w;
    r7.xy = r23.wx * r18.wy;
    r21.y = ps;
    ps = ModShadowGroupColor.y * r6.w;
    r21.x = float((r7.y >= 0.05));
    r21.z = ps;
    ps = r13.x + r13.x;
    r4 = -r21.wxyz + 1.0;
    r13.z = ps;
    r6.x = (UniformScalar_4.x > 0.0) ? r4.y : 1.0;
    r6.x = (UniformScalar_4.x >= 0.0) ? r6.x : r4.y;
    ps = r13.w + r13.w;
    r13.x = r6.x * r15.w;
    r13.w = ps;
    ps = r12.x + r12.x;
    r14 = r13.yxzw + float4(-1.0, -0.5, -1.0, -1.0);
    r6.x = ps;
    ps = r12.y + r12.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r14.yyyy)) clip(-1.0);
    r6.y = ps;
    r8.xy = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r17.xyz = tex2D(LightAttenuationTexture, r10.zw).xyz;
    r18.y = tex2D(ShadowTexture, r0.xy).x;
    r10 = tex2D(Texture2D_2, r10.xy);
    r12.xyz = tex2D(Texture2D_7, r6.xy).xyz;
    r20.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r22 = tex2D(Texture2D_3, r3.xy);
    r24 = tex2D(Texture2D_6, r1.xy);
    r0.xyw = tex2D(Texture2D_0, r6.xy).xyz;
    ps = r5.w;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r16.xyz = UniformVector_4.xyz * 2e+01;
    r18.w = saturate(ps);
    r13.xyz = r0.xyw * 2.0 - 1.0;
    r1.yzw = r15.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    r19.zw = r18.xz * 2.0 - 1.0;
    ps = -UniformVector_0.x;
    r5.xyz = r24.xyz * r24.www;
    r6.xy = r23.yz * 2.0 - 1.0;
    ps = 1.0 + ps;
    r16.xyz = r16.xyz * r5.xyz;
    r1.x = ps;
    ps = 0.5 * r6.x;
    r7.z = dot(r16.zxy, float3(0.11, 0.3, 0.59));
    r11.x = ps;
    ps = 0.5 * r6.y;
    r7.z = r7.z - r16.x;
    r11.y = ps;
    r6.x = (r11.z == 0.0) ? r22.x : r22.y;
    r6.x = (r8.w == 0.0) ? r22.z : r6.x;
    r19.x = (r8.z == 0.0) ? r22.w : r6.x;
    ps = r7.z;
    r19.y = r0.z * 3.3333333;
    ps = r16.x + ps;
    r6.xy = -r19.xy + 1.0;
    r18.z = saturate(ps);
    ps = 2.5 * r6.z;
    r11.z = r21.w * r6.y;
    r6.y = ps;
    r6.x = dot(r21.ww, r6.xx) + r19.x;
    ps = r6.x;
    r5.yzw = r20.xyz + r20.xyz;
    ps = r19.x + ps;
    r11.xyz = r19.zyw + r11.xzy;
    r5.x = ps;
    ps = (-1.0) - -r7.x;
    r5 = r5 + float4(0.25, -1.0, -1.0, -1.0);
    r11.w = ps;
    r6.x = r11.w * r11.y + 1.0;
    ps = r5.x;
    r0.z = dot(r2.zxy, r2.zxy);
    ps = -r7.x + ps;
    r7.yzw = r5.wyz * UniformVector_3.zxy;
    r7.x = saturate(ps);
    ps = 1.0 - r7.y;
    r5.xyz = r7.xxx * r12.xyz;
    r18.x = ps;
    r8.zw = -r7.zw * r18.zz + r7.zw;
    r12.xy = r11.xy * r11.yz + r8.zw;
    ps = rsqrt(abs(r0.z));
    r14.y = -r5.z + r10.z;
    r7.x = ps;
    ps = r6.x * r6.z;
    r2.xyz = r7.xxx * r2.xyz;
    r8.z = ps;
    ps = r6.y * r6.x;
    r11.xy = -r5.xy + r10.xy;
    r8.w = ps;
    r11.xy = r11.xy * r10.ww + r5.xy;
    ps = r18.x * r18.z;
    r5.xy = -r18.zw + 1.0;
    r2.w = ps;
    ps = r18.y * r18.y;
    r6.xy = r8.wz * r4.xx;
    r6.z = ps;
    ps = (-0.5) + r6.x;
    r0.xyz = r6.zzz * r17.xyz;
    r7.x = saturate(ps);
    ps = r7.y;
    r6.x = float((r6.y >= 0.9));
    r6.yzw = r16.xyz * r6.xxx + r15.xyz;
    ps = r2.w + ps;
    r14.xzw = r14.wxz - r13.zxy;
    r12.z = ps;
    ps = r1.y;
    r10 = r14.zwyx * r10.wwww;
    ps = r5.x * ps;
    r11.z = r5.z + r10.z;
    r7.y = ps;
    ps = r10.w;
    r10.xyz = r13.xyz + r10.xyw;
    r6.x = ps;
    ps = (-2.0) + r6.x;
    r12.xyz = -r10.xyz + r12.xyz;
    r10.w = ps;
    r10.xyz = r12.xyz * r7.xxx + r10.xyw;
    ps = r1.z;
    r6.xyz = r6.yzw - r11.xyz;
    r6.yzw = r6.xyz * r7.xxx + r11.xyz;
    r10.w = r0.w * 2.0 + r10.z;
    ps = r5.x * ps;
    r10.xyw = r10.xyw * r5.yyy;
    r7.z = ps;
    ps = r1.w;
    r10.z = r10.w + 1.0;
    r1.yzw = (r5.yyy > 0.0) ? r10.xyz : float3(0.0, 0.0, 1.0);
    r1.yzw = (r5.yyy >= 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    ps = r5.x * ps;
    r6.x = dot(r1.wyz, r1.wyz);
    r7.w = ps;
    ps = rsqrt(abs(r6.x));
    r7.xyz = r7.yzw * r7.xxx;
    r6.x = ps;
    ps = -UniformVector_0.y;
    r5.xyz = r1.yzw * r6.xxx;
    ps = 1.0 + ps;
    r6.x = dot(r5.zxy, r9.zxy);
    r1.y = ps;
    ps = -UniformVector_0.z;
    r10.xyz = r5.xyz * r6.xxx;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r2.zxy, r9.zxy));
    r1.z = ps;
    ps = log2(r6.x);
    r1.xyz = r6.yzw * r1.xyz;
    r8.z = ps;
    r6.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r6.z);
    r6.w = saturate(dot(r5.zyx, r2.zyx));
    r6.z = ps;
    r6.xy = r6.xy * r4.zw + 0.125;
    ps = r6.x * r6.y;
    r7.xyz = r7.xzy * r6.zzz;
    r6.x = ps;
    r6.xyz = r6.xxx * r3.xyz + ModShadowColor.xyz;
    r7.y = r1.z * r6.w + r7.y;
    r7.xz = r1.xy * r6.ww + r7.xz;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
