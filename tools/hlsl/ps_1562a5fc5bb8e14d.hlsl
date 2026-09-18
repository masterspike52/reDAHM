// ps_1562a5fc5bb8e14d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 399 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000063C 10041700 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c21); // float4
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c17); // float
float4 UniformScalar_11 : register(c18); // float
float4 UniformScalar_12 : register(c19); // float
float4 UniformScalar_13 : register(c20); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_3 : register(c10); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformScalar_8 : register(c15); // float
float4 UniformScalar_9 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
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
sampler2D Texture2D_9 : register(s10);
sampler2D Texture2D_10 : register(s11);
sampler2D Texture2D_11 : register(s12);
sampler2D ShadowTexture : register(s13);
sampler2D ModShadowAccumTexture : register(s14);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r1.x;
    r6.xz = UniformVector_1.xy * 1.7;
    ps = UniformScalar_3.x * ps;
    r7 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r6.y = ps;
    ps = r1.y;
    r6.xz = r6.xz * r1.wz;
    ps = UniformScalar_3.x * ps;
    r7 = r7 * r1.wzwz;
    r6.w = ps;
    r20.yzw = tex2D(Texture2D_3, r6.xz).xyw;
    r17.xyz = tex2D(Texture2D_1, r7.zw).xyz;
    r12.xyz = tex2D(Texture2D_5, r6.yw).zxy;
    ps = -r1.z;
    r0.zw = r1.wz * UniformScalar_0.xx;
    ps = 1.0 + ps;
    r11.xy = r1.xy * UniformScalar_2.xx;
    r10.w = ps;
    ps = r2.z;
    r9.xy = r1.wz * UniformScalar_7.xx;
    ps = 0.1 + ps;
    r9.zw = r1.wz * UniformScalar_9.xx;
    r6.x = ps;
    ps = 1.0 / r5.w;
    r10.xy = r5.xy * ScreenPositionScaleBias.xy;
    r6.z = ps;
    r10.xy = r10.xy * r6.zz + ScreenPositionScaleBias.wz;
    ps = 5.0 * r6.x;
    r17.w = float((r1.w >= 0.5));
    r10.z = saturate(ps);
    ps = r12.y + r12.y;
    r16.x = float((r10.w >= 0.5));
    r12.y = ps;
    ps = r12.z + r12.z;
    r5.xyz = r17.xyw * float3(4.0, 4.0, -0.5);
    r12.z = ps;
    ps = r12.x + r12.x;
    r20.x = r5.z + r1.w;
    r12.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xz = -r10.wz + float2(0.5, 1.0);
    r10.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r6.x - r1.z;
    r10.w = ps;
    ps = r20.x + r20.x;
    r8.xy = r10.zw * abs(r8.xy);
    r22.x = ps;
    r12.x = dot(r6.xx, r16.xx) - r1.z;
    ps = r20.y + r20.y;
    r21 = r12 + float4(2.0, -1.0, -1.0, -1.0);
    r22.z = ps;
    ps = r20.z + r20.z;
    r22.y = r21.x - r1.z;
    r22.w = ps;
    r15.xyz = tex2D(LightAttenuationTexture, r10.xy).xyz;
    r12.z = tex2D(ShadowTexture, r0.xy).x;
    r18.xyz = tex2D(Texture2D_7, r7.zw).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r10.xyz = tex2D(Texture2D_11, r9.zw).xyz;
    r9.xyz = tex2D(Texture2D_9, r9.xy).xyz;
    r8 = tex2D(Texture2D_2, r22.xy);
    r16.yzw = tex2D(Texture2D_4, r11.xy).xyz;
    r19.xyz = tex2D(Texture2D_3, r7.xy).xyw;
    r7.xyz = tex2D(Texture2D_10, r6.yw).xyz;
    r6.y = tex2D(Texture2D_6, r1.wz).x;
    r14.xyz = tex2D(Texture2D_8, r11.xy).xyz;
    r1.yzw = tex2D(Texture2D_0, r0.zw).xyw;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = dot(r4.zxy, r4.zxy);
    r0.z = dot(r2.zxy, r2.zxy);
    ps = r5.w;
    r6.x = dot(r3.zxy, r3.zxy);
    ps = 0.0001 * ps;
    r3.xy = r1.yz + r1.yz;
    r0.y = saturate(ps);
    ps = 1.0 - r6.x;
    r6.w = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    r6.x = saturate(ps);
    ps = UniformScalar_4.x * r6.y;
    r0.w = dot(r7.zxy, float3(0.11, 0.3, 0.59));
    r6.y = saturate(ps);
    ps = rsqrt(abs(r0.z));
    r0.x = r19.z * r20.w;
    r0.z = ps;
    ps = log2(r6.y);
    r20.xyz = r0.www - r7.xyz;
    r6.y = ps;
    ps = log2(r6.x);
    r23.xyz = r6.www - r14.xyz;
    r6.x = ps;
    r12.xyw = r16.yzw * 2.0 - 1.0;
    r14.yzw = r23.xyz * UniformScalar_6.xxx + r14.xyz;
    r7.xyz = r20.zxy * UniformScalar_8.xxx + r7.zxy;
    r3.z = r16.x * 2.0 + r17.w;
    r6.w = (r3.z == 0.0) ? r8.x : r8.y;
    ps = UniformVector_3.x * r7.y;
    r2.xyz = r0.zzz * r2.xyz;
    r14.x = ps;
    ps = UniformVector_3.y * r7.z;
    r20.xyz = r14.yzw * UniformVector_2.xyz;
    r14.y = ps;
    ps = UniformVector_3.z * r7.x;
    r9.xyz = r20.xyz * r9.xyz;
    r14.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r20.xyw = r14.xyz * r10.xyz;
    r0.z = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r14 = r3.zzxy + float4(-3.0, -2.0, -1.0, -1.0);
    r0.w = ps;
    r3.xyz = r20.xyw * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r7.xyz = r9.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = (-2.0) + r5.x;
    r10 = -r0.yzwx + 1.0;
    r20.z = ps;
    r6.z = (r14.y == 0.0) ? r8.z : r6.w;
    ps = UniformScalar_5.x * r6.y;
    r13.xw = r22.zw - 3.0;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r20.xyw = r20.xyw - r9.xyz;
    r6.w = ps;
    r9.xyz = r20.xyw * r6.www + r9.xyz;
    r19.xy = r19.xy * 4.0 + r13.xw;
    r1.x = (r14.x == 0.0) ? r8.w : r6.z;
    ps = (-2.0) + r5.y;
    r2.w = r10.x * UniformScalar_1.x;
    r20.w = ps;
    ps = rsqrt(abs(r7.w));
    r3.xyz = r3.xyz - r7.xyz;
    r6.y = ps;
    r7.yzw = r3.xyz * r6.www + r7.xyz;
    r14.xy = r2.ww * r14.zw - 2.0;
    ps = r1.x;
    r8.xyz = r6.yyy * r4.xyz;
    r6.y = ps;
    ps = 0.0;
    r3.xyw = r21.yzw - r12.xyw;
    r6.z = ps;
    r20.xy = r3.xy * r6.ww + r12.xy;
    ps = max(r6.y, r6.z);
    r12.xw = r1.wx + float2(-1.0, -0.75);
    r6.y = ps;
    ps = r12.w;
    r13.x = min(r6.y, 0.3);
    r4 = r2.wwww * r14.zwzw + r20;
    ps = r1.x + ps;
    r13.yzw = r13.xyz * float3(3.3333333, 0.875, 0.875);
    r6.y = ps;
    r6.y = saturate(r10.w * 0.5 + r6.y);
    ps = (-1.0) - -r0.x;
    r18.xyz = r6.yyy * r18.xyz;
    r19.z = ps;
    r0.yzw = r13.yyy * r19.xyz;
    ps = r17.z + r17.z;
    r3.xyz = r18.xyz * r1.www;
    r0.x = ps;
    r6.yz = r0.yz * 4.0 + r4.xy;
    r0.xz = r0.xw + float2(-1.0, 1.0);
    ps = 1.0 - r1.x;
    r6.yz = r6.yz - r4.zw;
    r0.y = ps;
    ps = abs(r0.z) * abs(r0.z);
    r14.zw = r0.xy * float2(0.5, 2.5);
    r12.y = ps;
    r7.x = saturate(r14.w * r0.z - 0.5);
    ps = LightColorAndFalloffExponent.w * r6.x;
    r4.xy = r12.yz * r12.yz;
    r0.x = ps;
    r6.x = r3.w * r6.w - r14.z;
    r6.x = r16.w * 2.0 + r6.x;
    ps = (-1.0) + r6.x;
    r0.yzw = r4.yyy * r15.xyz;
    r6.w = ps;
    r6.xyz = r6.wyz * r7.xxx + r14.zxy;
    ps = (-1.0) - -r6.x;
    r12.yz = r6.yz + r5.xy;
    r13.x = ps;
    r4.zw = r13.zw * r10.yz + 0.125;
    r6.w = r13.x * r10.x + 1.0;
    ps = pow(2.0, r0.x);
    r6.xyz = r12.xyz * r10.xxx;
    r0.x = ps;
    ps = 1.0 + r6.x;
    r0.xyz = r0.ywz * r0.xxx;
    r0.w = ps;
    r1.xyz = (r10.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.y = (r2.w > 0.0) ? r0.w : 1.0;
    r4.xy = r4.xz * r4.xw;
    r6.xzw = r4.yyy * r11.xyz + ModShadowColor.xyz;
    ps = -UniformVector_0.x;
    r7.yzw = r4.xxx * r7.yzw;
    r0.w = (r2.w >= 0.0) ? r6.y : 1.0;
    r1.yzw = (r10.xxx >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r6.y = dot(r1.wyz, r1.wyz);
    r1.x = ps;
    r4.xyz = r9.xyz * r0.www - r3.xyz;
    r4.xyz = r4.xyz * r7.xxx + r3.xyz;
    ps = rsqrt(abs(r6.y));
    r7.yzw = r7.yzw * r7.xxx;
    r6.y = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r1.yzw * r6.yyy;
    ps = 1.0 + ps;
    r6.y = dot(r3.zxy, r8.zxy);
    r1.y = ps;
    ps = -UniformVector_0.z;
    r5.xyz = r3.xyz * r6.yyy;
    r5.xyz = r5.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r6.y = saturate(dot(r2.zxy, r5.zxy));
    r1.z = ps;
    ps = log2(r6.y);
    r1.xyz = r4.xyz * r1.xyz;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r7.x = ps;
    ps = pow(2.0, r7.x);
    r6.y = saturate(dot(r3.zyx, r2.zyx));
    r7.x = ps;
    r7.xyz = r7.yzw * r7.xxx;
    r7.xy = r1.xy * r6.yy + r7.xy;
    r7.z = r1.z * r6.y + r7.z;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xwz;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
