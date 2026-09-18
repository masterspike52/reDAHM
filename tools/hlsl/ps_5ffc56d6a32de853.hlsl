// ps_5ffc56d6a32de853.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 438 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006D8 10041800 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c16); // float4
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_6 : register(c9); // float
float4 UniformScalar_7 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
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
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r1.w + r1.w;
    r14.w = -r7.w + UniformScalar_9.x;
    r0.z = ps;
    ps = UniformScalar_13.x;
    r10.zw = r5.xy * ScreenPositionScaleBias.xy;
    ps = 0.05 * ps;
    r6 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r10.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r2.w = r5.w - 4e+02;
    r12.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = dot(r4.zxy, r4.zxy);
    r12.y = ps;
    ps = rsqrt(abs(r0.w));
    r9.x = saturate(r2.w * 0.00022222222);
    r0.w = ps;
    ps = 1.0 / r5.w;
    r14.xyz = r0.www * r4.xyz;
    r9.y = ps;
    ps = r1.z + r1.z;
    r13.xzw = r10.yzw * r9.xyy;
    r0.w = ps;
    r9.xy = r14.xy * r13.xx + r1.wz;
    ps = 1.0 - r1.z;
    r20.w = saturate(r7.w * 15.0);
    r9.w = ps;
    ps = r12.x;
    r9.z = -r9.y + 1.0;
    ps = abs(r8.x) * ps;
    r10.yzw = r9.wxz * UniformVector_1.yxy;
    r4.x = ps;
    ps = UniformVector_1.x * r1.w;
    r5.xyz = UniformVector_5.xzy * 2e+01;
    r10.x = ps;
    ps = r12.y;
    r11 = r10.wzxy - 0.5;
    ps = abs(r8.y) * ps;
    r23 = float4((r10.wzxy >= 0.5));
    r4.y = ps;
    ps = r9.x + r9.x;
    r8 = r11 - r10.wzxy;
    r12.x = ps;
    r8 = r8.yxzw * r23.yxzw + r10.zwxy;
    ps = r9.y + r9.y;
    r8 = r8 + r8;
    r12.y = ps;
    r13.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r9 = tex2D(Texture2D_9, r1.xy);
    r4.y = tex2D(ShadowTexture, r0.xy).x;
    r11 = tex2D(Texture2D_2, r0.zw);
    r21.xyz = tex2D(Texture2D_1, r0.zw).xyz;
    r22 = tex2D(Texture2D_3, r8.zw);
    r24 = tex2D(Texture2D_3, r8.xy);
    r19.yzw = tex2D(Texture2D_4, r6.zw).xyw;
    r17 = tex2D(Texture2D_6, r1.xy);
    r8 = tex2D(Texture2D_7, r1.xy);
    r0.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r18 = tex2D(Texture2D_4, r6.xy);
    r6.xyw = tex2D(Texture2D_0, r12.xy).xyz;
    ps = 0.0001 * r5.w;
    r20.z = saturate(ps);
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r10.xyz = UniformVector_4.xzy * 2e+01;
    r0.w = ps;
    r15.xyz = r6.xyw * 2.0 - 1.0;
    r16.zw = r18.xy * 2.0 - 1.0;
    r4.xzw = r0.xyz * 2.0 - 1.0;
    ps = r8.x * r8.w;
    r6.z = float((UniformScalar_8.x >= 1.0));
    r0.x = ps;
    ps = r8.z * r8.w;
    r1.xyz = r17.xzy * r17.www;
    r0.y = ps;
    r6.xy = r19.yz * 2.0 - 1.0;
    ps = r8.y * r8.w;
    r1.xyz = r10.xyz * r1.xyz;
    r0.z = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r0.xyz = r5.xyz * r0.xyz;
    r1.w = ps;
    ps = r2.z;
    r17.xyz = r4.xzw * UniformVector_3.xyz;
    r4.xzw = (abs(r1.www) > 0.0) ? r1.xzy : r0.xzy;
    r1.xyz = (-abs(r1.www) >= 0.0) ? r0.yxz : r1.yxz;
    r1.xyz = (-abs(r0.www) >= 0.0) ? r0.yxz : r1.xyz;
    r10.xyz = (abs(r0.www) > 0.0) ? r4.xzw : r0.xzy;
    r0.x = r14.w * r6.z + r7.w;
    ps = 0.1 + ps;
    r0.z = dot(r10.zxy, float3(0.11, 0.3, 0.59));
    r6.z = ps;
    ps = 5.0 * r6.z;
    r4.z = saturate(dot(r1.zxy, float3(0.59, 0.11, 0.3)));
    r20.x = saturate(ps);
    r0.yw = -r17.xy * r4.zz + r17.xy;
    ps = 0.5 * r6.x;
    r6.z = r0.z - r10.x;
    r5.x = ps;
    ps = 0.5 * r6.y;
    r20.y = saturate(r6.z + r10.x);
    r5.y = ps;
    ps = -r0.x;
    r8 = -r20.wzxy + 1.0;
    r0.xz = -r8.zz * ModShadowGroupColor.xy + 1.0;
    ps = r7.z + ps;
    r1.z = dot(r23.zww, float3(1.0, 1.0, 1.0));
    r6.z = ps;
    ps = r6.z;
    r1.y = dot(r23.yxx, float3(1.0, 1.0, 1.0));
    r1.x = ps;
    r7.x = (r1.y == 0.0) ? r24.x : r24.y;
    r6.z = (r1.z == 0.0) ? r22.x : r22.y;
    ps = UniformScalar_10.x;
    r23 = r1.yzzy + float4(-3.0, -2.0, -3.0, -2.0);
    r1.y = ps;
    r6.z = (r23.y == 0.0) ? r22.z : r6.z;
    r7.x = (r23.w == 0.0) ? r24.z : r7.x;
    r16.x = (r23.x == 0.0) ? r24.w : r7.x;
    r6.x = (r23.z == 0.0) ? r22.w : r6.z;
    ps = max(r1.x, r1.y);
    r7.x = max(r6.x, 0.0);
    r7.y = ps;
    ps = 1.0 / UniformScalar_11.x;
    r6.yz = min(r7.yx, float2(1.0, 0.3));
    r7.x = ps;
    ps = 3.3333333 * r6.z;
    r6.y = saturate(r6.y * r7.x);
    r16.y = ps;
    ps = 1.0 - r6.x;
    r6.z = dot(r2.zxy, r2.zxy);
    r7.x = ps;
    ps = 1.0 - r6.y;
    r4.xw = -r16.xy + 1.0;
    r7.y = ps;
    ps = r20.w;
    r1.xyz = r21.xyz + r21.xyz;
    ps = r4.w * ps;
    r19.x = r7.y * r7.w;
    r5.z = ps;
    r7.z = dot(r20.ww, r4.xx) + r16.x;
    ps = r7.z;
    r6.xy = r19.wx * r18.wz;
    ps = r16.x + ps;
    r5.xyz = r16.zyw + r5.xzy;
    r1.w = ps;
    r1 = r1 + float4(-1.0, -1.0, -1.0, 0.25);
    r17.w = float((r6.y >= 0.05));
    ps = (-1.0) - -r6.x;
    r16.xyz = r1.xyz - r15.xyz;
    r5.w = ps;
    r15.w = r16.z * r11.w - 2.0;
    r15.xyz = r16.xyz * r11.www + r15.xyz;
    r16.xy = r5.xy * r5.yz + r0.yw;
    r7.z = r5.w * r5.y + 1.0;
    ps = 2.5 * r7.x;
    r4.xw = -r17.zw + 1.0;
    r7.w = ps;
    r0.y = (UniformScalar_9.x > 0.0) ? r4.w : 1.0;
    r0.w = (UniformScalar_9.x >= 0.0) ? r0.y : r4.w;
    r7.xy = r7.zw * r7.xz;
    ps = rsqrt(abs(r6.z));
    r5.xw = r4.xy * r4.zy;
    r6.z = ps;
    ps = r17.z;
    r4.xyz = r6.zzz * r2.xyz;
    ps = r5.x + ps;
    r6.yz = r7.xy * r8.xx;
    r16.z = ps;
    ps = (-0.5) + r6.z;
    r7.xyz = -r15.xyz + r16.xyz;
    r0.y = saturate(ps);
    r7.xyz = r7.xyz * r0.yyy + r15.xyw;
    r7.w = r6.w * 2.0 + r7.z;
    r7.xyz = r7.wxy * r8.yyy;
    ps = 1.0 + r7.x;
    r6.w = saturate(r1.w - r6.x);
    r7.w = ps;
    r7.xyz = (r8.yyy > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r8.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r6.x));
    r7.xy = r13.zw + ScreenPositionScaleBias.wz;
    r6.x = ps;
    r5.xyz = r1.xyz * r6.xxx;
    r6.x = dot(r5.zxy, r14.zxy);
    r1.xyz = r5.xyz * r6.xxx;
    r1.xyz = r1.xyz * 2.0 - r14.xyz;
    r6.x = saturate(dot(r4.zxy, r1.zxy));
    ps = log2(r6.x);
    r0.w = r0.w * r9.w;
    r13.z = ps;
    r1.xyw = r13.xyz * float3(0.875, 0.875, 15.0);
    r0.xz = r1.xy * r0.xz;
    r0.xzw = r0.wxz + float3(-0.5, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    r2.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r8.xyz = tex2D(Texture2D_8, r12.xy).xyz;
    r6.x = dot(r3.zxy, r3.zxy);
    r3.xyz = r9.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = 1.0 - r6.x;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = saturate(ps);
    ps = log2(r6.x);
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    r3.xyz = r3.xyz * r8.www;
    r8.xyz = r6.www * r8.xyz;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r12.xyz = -r8.xyz + r11.xyz;
    r6.x = ps;
    r8.xyz = r12.xyz * r11.www + r8.xyz;
    ps = pow(2.0, r6.x);
    r2.xyz = r5.www * r2.xyz;
    r6.w = ps;
    ps = r2.x;
    r6.x = float((r6.y >= 0.9));
    ps = r6.w * ps;
    r3.xyz = r3.xyz * r0.yyy;
    r0.x = ps;
    r6.xyz = r6.xxx * r10.xyz + r9.xyz;
    ps = r2.z;
    r6.xyz = r6.xyz - r8.xyz;
    r6.xyz = r6.xyz * r0.yyy + r8.xyz;
    ps = r6.w * ps;
    r7.xyw = r6.xyz * r7.xyz;
    r0.y = ps;
    ps = pow(2.0, r1.w);
    r7.z = saturate(dot(r5.zyx, r4.zyx));
    r6.x = ps;
    ps = r2.y;
    r6.xyz = r3.xyz * r6.xxx;
    r7.xy = r7.xy * r7.zz + r6.xy;
    r7.z = r7.w * r7.z + r6.z;
    ps = r6.w * ps;
    r6.x = r0.z * r0.w;
    r0.z = ps;
    r6.xyz = r6.xxx * r1.xyz + ModShadowColor.xyz;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
