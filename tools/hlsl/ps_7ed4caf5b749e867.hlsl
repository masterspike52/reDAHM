// ps_7ed4caf5b749e867.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 423 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000069C 10041600 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_11 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
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
sampler2D ShadowTexture : register(s11);
sampler2D ModShadowAccumTexture : register(s12);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_1.x * r1.w;
    r0.zw = r1.wz + r1.wz;
    r9.x = ps;
    ps = -r1.z;
    r10.y = UniformScalar_2.x * UniformVector_5.y;
    ps = 1.0 + ps;
    r10.x = UniformScalar_13.x * 0.05;
    r9.z = ps;
    ps = UniformVector_5.y;
    r10.zw = r5.xy * ScreenPositionScaleBias.xy;
    ps = UniformScalar_5.x * ps;
    r6.y = UniformVector_3.x * UniformScalar_4.x;
    r3.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = r5.w - 4e+02;
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = UniformScalar_1.x * UniformVector_3.x;
    r3.y = ps;
    ps = 0.00022222222 * r6.z;
    r12 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r6.x = saturate(ps);
    ps = UniformVector_5.x * r6.y;
    r6.z = dot(r4.zxy, r4.zxy);
    r3.z = ps;
    ps = rsqrt(abs(r6.z));
    r3.xy = r3.xy * abs(r8.xy);
    r6.y = ps;
    ps = 1.0 / r5.w;
    r13.xyz = r6.yyy * r4.xyz;
    r6.z = ps;
    ps = UniformVector_5.x * r6.w;
    r11.xzw = r10.xzw * r6.xzz;
    r10.x = ps;
    ps = r3.z;
    r10.zw = r13.xy * r11.xx;
    ps = r1.x + ps;
    r4 = r10.zxyw + r1.wxyz;
    r6.x = ps;
    ps = r4.x;
    r9.y = -r4.w + 1.0;
    r6.y = ps;
    ps = UniformVector_1.x * r6.y;
    r9.yz = r9.zy * UniformVector_1.yy;
    r9.w = ps;
    ps = r3.w;
    r8 = r9.wzxy - 0.5;
    ps = r1.y + ps;
    r19 = float4((r9.wzxy >= 0.5));
    r6.z = ps;
    ps = r4.x + r4.x;
    r8 = r8 - r9.wzxy;
    r10.x = ps;
    r8 = r8 * r19 + r9.wzxy;
    ps = r4.w + r4.w;
    r14 = r8 + r8;
    r10.y = ps;
    r11.xy = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r9 = tex2D(Texture2D_9, r1.xy);
    r16.y = tex2D(ShadowTexture, r0.xy).x;
    r8 = tex2D(Texture2D_2, r0.zw);
    r3.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r17.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r18 = tex2D(Texture2D_3, r14.zw);
    r20 = tex2D(Texture2D_3, r14.xy);
    r22 = tex2D(Texture2D_6, r4.yz);
    r15.yzw = tex2D(Texture2D_4, r12.zw).xyw;
    r6 = tex2D(Texture2D_7, r6.xz);
    r4 = tex2D(Texture2D_4, r12.xy);
    r1.xzw = tex2D(Texture2D_0, r10.xy).zxy;
    r10.xyz = tex2D(Texture2D_1, r0.zw).xyz;
    ps = -r7.w;
    r21.xyz = UniformVector_4.xyz * 2e+01;
    ps = UniformScalar_9.x + ps;
    r10.w = float((UniformScalar_8.x >= 1.0));
    r21.w = ps;
    r12.yzw = r10.xyz * 2.0 - 1.0;
    r14.xyz = r1.zwx * 2.0 - 1.0;
    ps = 0.0001 * r5.w;
    r0.x = saturate(r7.w * 15.0);
    r0.w = saturate(ps);
    r5.zw = r4.xy * 2.0 - 1.0;
    ps = r2.z;
    r10.xyz = r6.xyz * r6.www;
    r6.yw = r15.yz * 2.0 - 1.0;
    r10.xyz = r22.xyz * r22.www + r10.xyz;
    ps = 0.1 + ps;
    r10 = r21 * r10;
    r6.x = ps;
    ps = r10.w;
    r6.z = dot(r10.zxy, float3(0.11, 0.3, 0.59));
    ps = r7.w + ps;
    r0.y = r6.z - r10.x;
    r6.z = ps;
    ps = -r6.z;
    r16.z = saturate(r0.y + r10.x);
    ps = r7.z + ps;
    r0.z = dot(r19.zww, float3(1.0, 1.0, 1.0));
    r6.z = ps;
    ps = r6.z;
    r0.y = dot(r19.xyy, float3(1.0, 1.0, 1.0));
    r16.x = ps;
    r7.x = (r0.y == 0.0) ? r20.x : r20.y;
    r6.z = (r0.z == 0.0) ? r18.x : r18.y;
    ps = UniformScalar_10.x;
    r19 = r0.yzzy + float4(-3.0, -2.0, -3.0, -2.0);
    r16.w = ps;
    r6.z = (r19.y == 0.0) ? r18.z : r6.z;
    r7.x = (r19.w == 0.0) ? r20.z : r7.x;
    r5.x = (r19.x == 0.0) ? r20.w : r7.x;
    r0.z = (r19.z == 0.0) ? r18.w : r6.z;
    ps = max(r16.x, r16.w);
    r7.x = max(r0.z, 0.0);
    r7.y = ps;
    ps = 1.0 / UniformScalar_11.x;
    r7.xy = min(r7.xy, float2(0.3, 1.0));
    r6.z = ps;
    ps = 5.0 * r6.x;
    r6.z = saturate(r7.y * r6.z);
    r16.w = saturate(ps);
    ps = 0.5 * r6.y;
    r6.x = -r6.z + 1.0;
    r4.x = ps;
    ps = 3.3333333 * r7.x;
    r15.x = r6.x * r7.w;
    r5.y = ps;
    ps = 0.5 * r6.w;
    r1.yz = -r5.xy + 1.0;
    r4.y = ps;
    ps = r0.x;
    r7.yzw = r17.xyz + r17.xyz;
    r6.z = dot(r0.xx, r1.yy) + r5.x;
    ps = r1.z * ps;
    r6.xy = r15.wx * r4.wz;
    r4.z = ps;
    ps = r6.z;
    r4.xyz = r5.zyw + r4.xzy;
    ps = r5.x + ps;
    r0.y = float((r6.y >= 0.05));
    r7.x = ps;
    ps = (-1.0) - -r6.x;
    r5 = r7 + float4(0.25, -1.0, -1.0, -1.0);
    r4.w = ps;
    r7.y = r4.w * r4.y + 1.0;
    ps = r5.x;
    r7.xw = -r0.zy + 1.0;
    ps = -r6.x + ps;
    r6.yzw = r5.wyz * UniformVector_3.zxy;
    r7.z = saturate(ps);
    ps = 1.0 - r6.y;
    r6.x = dot(r2.zxy, r2.zxy);
    r16.x = ps;
    ps = 2.5 * r7.x;
    r3.xyw = r7.zzz * r3.xyz;
    r7.z = ps;
    r0.yz = -r6.zw * r16.zz + r6.zw;
    r6.z = (UniformScalar_9.x > 0.0) ? r7.w : 1.0;
    r1.z = (UniformScalar_9.x >= 0.0) ? r6.z : r7.w;
    r5.xy = r4.xy * r4.yz + r0.yz;
    ps = rsqrt(abs(r6.x));
    r15.y = -r3.w + r8.z;
    r6.x = ps;
    ps = r7.y * r7.x;
    r4.xyz = r6.xxx * r2.xyz;
    r12.x = ps;
    ps = r16.x * r16.z;
    r15.xzw = r12.wyz - r14.zxy;
    r0.y = ps;
    ps = r16.y * r16.y;
    r6.xz = -r16.zw + 1.0;
    r1.w = ps;
    ps = r7.z * r7.y;
    r5.z = r6.y + r0.y;
    r12.y = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r2 = r15.zwxy * r8.wwww;
    r0.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r7.xyz = r14.xyz + r2.xyz;
    r0.z = ps;
    ps = r2.z;
    r0 = -r0.yxzw + 1.0;
    r6.z = ps;
    ps = (-2.0) + r6.z;
    r6.yw = r12.yx * r0.yy;
    r7.w = ps;
    ps = (-0.5) + r6.y;
    r5.xyz = -r7.xyz + r5.xyz;
    r0.y = saturate(ps);
    r7.xyz = r5.xyz * r0.yyy + r7.xyw;
    r7.w = r1.x * 2.0 + r7.z;
    r7.xyz = r7.wxy * r0.www;
    ps = 1.0 + r7.x;
    r12.xy = -r3.xy + r8.xy;
    r7.w = ps;
    r7.xyz = (r0.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.yzw = (r0.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r7.x = dot(r7.wyz, r7.wyz);
    ps = rsqrt(abs(r7.x));
    r1.xy = r11.zw + ScreenPositionScaleBias.wz;
    r7.x = ps;
    r5.xyz = r7.yzw * r7.xxx;
    r7.x = dot(r5.zxy, r13.zxy);
    r7.xyz = r5.xyz * r7.xxx;
    r7.xyz = r7.xyz * 2.0 - r13.xyz;
    r7.x = saturate(dot(r4.zxy, r7.zxy));
    ps = log2(r7.x);
    r0.w = r1.z * r9.w;
    r11.z = ps;
    r7.xyz = r11.xyz * float3(0.875, 0.875, 15.0);
    r0.xz = r7.xy * r0.xz;
    r0.xzw = r0.wxz + float3(-0.5, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    r7.xyw = tex2D(LightAttenuationTexture, r1.xy).xyz;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r11.xyz = r9.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r8.xy = r12.xy * r8.ww + r3.xy;
    ps = r1.w;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    ps = r7.x * ps;
    r3.xyz = r11.xyz * r6.xxx;
    r0.x = ps;
    ps = r3.w;
    r6.x = float((r6.w >= 0.9));
    ps = r2.w + ps;
    r3.xyz = r3.xyz * r0.yyy;
    r8.z = ps;
    r6.xyz = r10.xyz * r6.xxx + r9.xyz;
    ps = r1.w;
    r6.xyz = r6.xyz - r8.xyz;
    r6.xyz = r6.xyz * r0.yyy + r8.xyz;
    ps = r7.y * ps;
    r2.xyz = r6.xyz * r2.xyz;
    r0.y = ps;
    ps = pow(2.0, r7.z);
    r6.w = saturate(dot(r5.zyx, r4.zyx));
    r6.x = ps;
    ps = r1.w;
    r6.xyz = r3.xyz * r6.xxx;
    r7.y = r2.z * r6.w + r6.z;
    r7.xz = r2.xy * r6.ww + r6.xy;
    ps = r7.w * ps;
    r6.x = r0.z * r0.w;
    r0.z = ps;
    r6.xyz = r6.xxx * r1.xyz + ModShadowColor.xyz;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
