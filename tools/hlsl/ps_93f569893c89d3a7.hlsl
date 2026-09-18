// ps_93f569893c89d3a7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 429 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006B4 10041500 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_14 : register(c17); // float
float4 UniformScalar_16 : register(c18); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.z = UniformScalar_16.x * 0.05;
    ps = r2.z;
    r0.w = UniformScalar_3.x * UniformVector_4.x;
    ps = 0.1 + ps;
    r0.z = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r0.z));
    r4.w = r0.w * UniformScalar_4.x;
    r2.w = ps;
    ps = floor(r4.w);
    r0.zw = r1.xy * UniformVector_2.xy;
    r11.w = ps;
    ps = 1.0 - r1.z;
    r6.x = r5.w - 4e+02;
    r6.w = ps;
    ps = 0.00022222222 * r6.x;
    r10 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r9.w = saturate(ps);
    ps = 5.0 * r6.y;
    r11.xyz = r2.www * r4.xyz;
    r9.x = saturate(ps);
    ps = 1.0 / UniformScalar_1.x;
    r6.x = r6.z * r9.w;
    r6.y = ps;
    r4.xyw = r11.wxy * r6.yxx + r1.xwz;
    ps = 1.0 - r4.w;
    r6.y = r1.w * UniformVector_1.x;
    r6.z = ps;
    ps = UniformVector_1.x * r4.y;
    r6.zw = r6.zw * UniformVector_1.yy;
    r6.x = ps;
    r13 = r6.xzwy - 0.5;
    r12 = float4((r6.zwxy >= 0.5));
    r13 = r13 - r6.xzwy;
    r6 = r13 * r12.zxyw + r6.xzwy;
    r13 = r6.xywz + r6.xywz;
    r14 = tex2D(Texture2D_9, r0.zw);
    r17 = tex2D(Texture2D_4, r10.xy);
    r16.yzw = tex2D(Texture2D_4, r10.zw).xyw;
    r6 = tex2D(Texture2D_3, r13.zw).zwyx;
    r9.z = tex2D(Texture2D_6, r0.zw).x;
    r18.xyw = tex2D(Texture2D_5, r0.zw).yxz;
    r10.z = saturate(r5.w * 0.0001);
    ps = r7.w;
    r0.w = -r7.w + UniformScalar_12.x;
    ps = 15.0 * ps;
    r0.z = float((UniformScalar_11.x >= 1.0));
    r9.y = saturate(ps);
    r0.z = r0.w * r0.z + r7.w;
    ps = r18.y + r18.y;
    r7.x = -r0.z + r7.z;
    r18.y = ps;
    ps = r7.x;
    r15.x = dot(r12.zxx, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    ps = UniformScalar_13.x;
    r15.y = dot(r12.wyy, float3(1.0, 1.0, 1.0));
    r0.w = ps;
    r7.x = (r15.y == 0.0) ? r6.w : r6.z;
    ps = max(r0.z, r0.w);
    r12 = r15.yyxx + float4(-2.0, -3.0, -3.0, -2.0);
    r6.w = ps;
    r6.x = (r12.x == 0.0) ? r6.x : r7.x;
    r6.y = (r12.y == 0.0) ? r6.y : r6.x;
    ps = r9.y;
    r6.z = max(r6.y, 0.0);
    r6.x = ps;
    ps = 1.0 / UniformScalar_14.x;
    r12.xy = min(r6.zw, float2(0.3, 1.0));
    r6.z = ps;
    ps = 1.0 - r6.x;
    r6.z = saturate(r12.y * r6.z);
    r0.z = ps;
    ps = 1.0 - r9.x;
    r7.xy = -r6.yz + 1.0;
    r6.z = ps;
    ps = 1.0 - r9.z;
    r16.x = r7.y * r7.w;
    r0.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r6.xy = r16.wx * r17.wz;
    r10.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r10.w = float((r6.y >= 0.05));
    r10.y = ps;
    ps = r18.x + r18.x;
    r10 = -r10.wxyz + 1.0;
    r18.z = ps;
    r6.z = (UniformScalar_12.x > 0.0) ? r10.x : 1.0;
    r6.z = (UniformScalar_12.x >= 0.0) ? r6.z : r10.x;
    ps = r18.w + r18.w;
    r18.x = r6.z * r14.w;
    r18.w = ps;
    r19 = r18 + float4(-0.5, -1.0, -1.0, -1.0);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r19.xxxx)) clip(-1.0);
    r13 = tex2D(Texture2D_3, r13.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.zw = r1.wz + r1.wz;
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.z = r1.y + UniformScalar_8.x;
    r7.w = ps;
    ps = r16.y + r16.y;
    r18.zw = r5.xy * ScreenPositionScaleBias.xy;
    r1.x = ps;
    r15.zw = r17.xy * 2.0 - 1.0;
    ps = r16.z + r16.z;
    r8.xy = r7.zw * abs(r8.xy);
    r1.y = ps;
    r7.z = (r15.x == 0.0) ? r13.x : r13.y;
    r7.z = (r12.w == 0.0) ? r13.z : r7.z;
    r15.x = (r12.z == 0.0) ? r13.w : r7.z;
    ps = r4.y + r4.y;
    r15.y = r12.x * 3.3333333;
    r12.x = ps;
    ps = r4.w + r4.w;
    r7.zw = -r15.yx + 1.0;
    r12.y = ps;
    r1.z = dot(r9.yy, r7.ww) + r15.x;
    ps = 2.5 * r7.x;
    r1.z = r1.z + r15.x;
    r7.w = ps;
    ps = r9.y;
    r1.xyw = r1.xyz + float3(-1.0, -1.0, 0.25);
    ps = r7.z * ps;
    r13.xy = r1.xy * 0.5;
    r13.z = ps;
    ps = (-1.0) - -r6.x;
    r16.xyz = r15.zyw + r13.xzy;
    r16.w = ps;
    r7.z = r16.w * r16.y + 1.0;
    ps = 1.0 / r5.w;
    r18.xy = r7.zw * r7.xz;
    r6.y = ps;
    r7.xy = r18.zw * r6.yy + ScreenPositionScaleBias.wz;
    r5.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r13.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r12.z = tex2D(ShadowTexture, r0.xy).x;
    r8.xyz = tex2D(Texture2D_8, r12.xy).xyz;
    r20 = tex2D(Texture2D_2, r6.zw);
    r7.xyw = tex2D(Texture2D_0, r12.xy).xyz;
    r21.xyz = tex2D(Texture2D_1, r6.zw).xyz;
    r15 = tex2D(Texture2D_7, r4.xz);
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r17.xyz = UniformVector_5.xyz * 2e+01;
    r6.z = dot(r2.zxy, r2.zxy);
    r6.y = dot(r3.zxy, r3.zxy);
    r15.xyz = r15.xyz * r15.www;
    r12.xyw = r14.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r21.xyz = r21.xyz * 2.0 - 1.0;
    r3.xyz = r7.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r6.y = saturate(-r6.y + 1.0);
    r6.z = ps;
    r2.xyz = r6.zzz * r2.xyz;
    ps = log2(r6.y);
    r21.xyz = r21.xyz - r3.xyz;
    r6.y = ps;
    r8.w = r21.z * r20.w - 2.0;
    r3.xyz = r21.xyz * r20.www + r3.xyz;
    ps = r12.x;
    r15.xyz = r17.xyz * r15.xyz;
    ps = r0.w * ps;
    r6.x = saturate(r1.w - r6.x);
    r17.x = ps;
    ps = r12.y;
    r6.xzw = r6.xxx * r8.xyz;
    ps = r0.w * ps;
    r8.xyz = -r6.xzw + r20.xyz;
    r17.y = ps;
    r8.xyz = r8.xyz * r20.www + r6.xzw;
    ps = r12.w;
    r6.xzw = r19.yzw * UniformVector_4.xyz;
    ps = r0.w * ps;
    r1.w = float((r18.x >= 0.9));
    r17.z = ps;
    r0.xy = r6.xz * r9.zz - r3.xy;
    r12.w = saturate(r18.y * r0.z - 0.5);
    ps = (-1.0) - -r6.w;
    r7.xyz = r17.xyz * r12.www;
    r15.w = ps;
    r12.xy = r16.xy * r16.yz + r0.xy;
    r0 = r15 * r9.zzzz;
    r9.xyz = r0.xyz * r1.www + r14.xyz;
    r6.xzw = r12.xyz * r12.wwz;
    ps = -r3.z;
    r3.xy = r3.xy + r6.xz;
    ps = r0.w + ps;
    r0.xyz = r6.www * r13.xyz;
    r6.x = ps;
    ps = 1.0 + r6.x;
    r9.xyz = r9.xyz - r8.xyz;
    r9.w = ps;
    r8 = r9 * r12.wwww + r8;
    r3.z = r7.w * 2.0 + r8.w;
    r3.xyw = r3.xyz * r10.www;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r3.z = r3.w + 1.0;
    r7.w = ps;
    r6.xyz = (r10.www > 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r10.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r7.w);
    r6.x = dot(r6.wyz, r6.wyz);
    r7.w = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r0.xzy * r7.www;
    r6.x = ps;
    r3.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r3.zxy, r11.zxy);
    r6.xyz = r3.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r11.xyz;
    r6.x = saturate(dot(r2.zxy, r6.zxy));
    ps = log2(r6.x);
    r1.xyz = r8.xyz * r1.xyz;
    r5.z = ps;
    r6.xyz = r5.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r6.z);
    r6.w = saturate(dot(r3.zyx, r2.zyx));
    r6.z = ps;
    r6.xy = r6.xy * r10.yz + 0.125;
    ps = r6.x * r6.y;
    r7.xyz = r7.xyz * r6.zzz;
    r6.x = ps;
    r6.xyz = r6.xxx * r4.xyz + ModShadowColor.xyz;
    r7.xy = r1.xy * r6.ww + r7.xy;
    r7.z = r1.z * r6.w + r7.z;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
