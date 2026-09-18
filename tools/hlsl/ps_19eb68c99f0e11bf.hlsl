// ps_19eb68c99f0e11bf.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 315 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004EC 10041900 0000090A 00000000 00009129 003F01FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c13); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 OpacityOverride : register(c10); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_6 : register(c9); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UpperSkyColor : register(c11); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
samplerCUBE TextureCube_0 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord3 : TEXCOORD3; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
    float4 color2 : COLOR2; // r8
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
    float4 r7 = In.color1;
    float4 r8 = In.color2;
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

    r8.xzw = tex2D(Texture2D_0, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.y = dot(r4.zxy, r4.zxy);
    r3.y = ps;
    r18.xyz = r8.xzw * 2.0 - 1.0;
    ps = rsqrt(abs(r8.y));
    r8.x = dot(r18.zxy, r18.zxy);
    r8.y = ps;
    ps = rsqrt(abs(r8.x));
    r15.xyz = r8.yyy * r4.xyz;
    r8.x = ps;
    ps = r3.x;
    r23.xzw = r18.xyz * r8.xxx;
    ps = abs(r9.x) * ps;
    r8.x = dot(r23.wxz, r15.zxy);
    r12.x = ps;
    ps = r3.y;
    r8.xyz = r23.xwz * r8.xxx;
    r20.xyw = r8.xyz * 2.0 - r15.xzy;
    ps = abs(r9.y) * ps;
    r8 = xe_cube(r20.xwy);
    r12.y = ps;
    ps = 1.0 / abs(r8.z);
    r3.z = r8.w;
    r3.x = ps;
    r3.xy = r8.yx * r3.xx + 1.5;
    r9.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r4.xzw = tex2D(Texture2D_2, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r21.xyz = texCUBE(TextureCube_0, xe_cube_dir(r3.xyz)).xyz;
    r11.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r3.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r8.xy = tex2D(ModShadowAccumTexture, r12.xy).xy;
    ps = OpacityOverride.x;
    r12.yzw = UniformVector_2.xyz * UniformVector_2.www;
    r23.y = saturate(ps);
    ps = UniformVector_1.x * UniformVector_1.w;
    r17.xyz = -ModShadowColor.xyz + 1.0;
    r22.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r8.w = dot(r5.zxy, r5.zxy);
    r22.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r4.y = dot(r2.zxy, r2.zxy);
    r22.z = ps;
    r25.xyz = r7.xyz * 2.0 - 1.0;
    r14 = r6.yxzw * 2.0 - 1.0;
    ps = 0.875 * r8.x;
    r13.xyz = -UniformVector_0.xyz + 1.0;
    r19.x = ps;
    ps = 0.875 * r8.y;
    r0.yz = r0.yz * 0.8;
    r19.y = ps;
    ps = 0.01 * r3.x;
    r16.xyz = r11.xyz * 0.4;
    r8.x = ps;
    ps = 0.01 * r3.y;
    r11.xyz = r13.xyz * r3.xyz;
    r8.y = ps;
    ps = 0.01 * r3.z;
    r6.z = dot(r14.zyx, r14.zyx);
    r8.z = ps;
    ps = log2(abs(r3.x));
    r7.w = dot(r25.zxy, r25.zxy);
    r6.x = ps;
    ps = log2(abs(r3.y));
    r0.w = dot(r21.yzx, float3(0.59, 0.11, 0.3));
    r6.y = ps;
    ps = log2(abs(r3.z));
    r7.xyz = r10.xyz * 0.8;
    r6.w = ps;
    ps = rsqrt(abs(r4.y));
    r10.yzw = r7.xzy * UniformScalar_6.xxx;
    r7.x = ps;
    ps = rsqrt(abs(r8.w));
    r7.xyz = r7.xxx * r2.zxy;
    r8.w = ps;
    ps = rsqrt(abs(r7.w));
    r21.xyz = r0.www * r3.xyz;
    r7.w = ps;
    r22.xyz = r22.xyz * r0.www - r21.xyz;
    ps = 0.1 - -r7.x;
    r24.xyz = r8.www * r5.xyz;
    r4.y = ps;
    ps = rsqrt(abs(r6.z));
    r5.yzw = r25.xzy * r7.www;
    r6.z = ps;
    ps = 0.3 * r6.x;
    r25.xyz = r14.xyz * r6.zzz;
    r6.z = ps;
    ps = 0.3 * r6.y;
    r7.w = dot(r15.zxy, r18.zxy);
    r8.w = ps;
    ps = 0.3 * r6.w;
    r20.z = max(r7.w, 0.0);
    r7.w = ps;
    ps = pow(2.0, r6.z);
    r2.xyz = r25.yxz * r18.zzz;
    r15.x = ps;
    ps = pow(2.0, r8.w);
    r6.xyz = r25.zxy * r5.wyz;
    r15.y = ps;
    r6.xzw = r25.xzy * r5.zyw - r6.xzy;
    ps = r4.y;
    r22.w = dot(r24.zxy, r23.wxz);
    r6.y = ps;
    ps = pow(2.0, r7.w);
    r24.xyz = r23.www * r1.xyz;
    r15.z = ps;
    ps = 5.0 * r6.y;
    r15.xyz = saturate(r15.xyz - 0.2);
    r23.x = saturate(ps);
    ps = 4.0 * r4.x;
    r14.xyz = r24.xyz * r3.xyz;
    r23.z = saturate(ps);
    r22.xyz = r23.zzz * r22.xyz + r21.xyz;
    ps = r0.y;
    r21.xyz = r6.xwz * r14.www;
    ps = r22.y * ps;
    r0.w = dot(r21.yxz, r21.yxz);
    r0.y = ps;
    ps = r0.z;
    r6.xz = -r23.yx + 1.0;
    ps = r22.z * ps;
    r7.w = float((r6.x >= 0.004));
    r0.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r8.w = saturate(dot(r7.xyz, r20.yxw));
    r20.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r6.xyw = r22.wxw * float3(0.5, 0.8, -0.5);
    r20.y = ps;
    ps = rsqrt(abs(r0.w));
    r0.x = r6.y * r0.x;
    r6.z = ps;
    ps = 0.5 + r6.x;
    r21.xyz = r21.xzy * r6.zzz;
    r7.z = ps;
    r2.xyz = r21.xzy * r18.yyy + r2.xzy;
    ps = 0.5 + r6.w;
    r6.xyz = -r20.xzy + float3(1.0, 0.9, 1.0);
    r5.x = ps;
    ps = abs(r7.z) * abs(r7.z);
    r7.xy = r19.xy * r6.xz;
    r7.z = ps;
    r6.xzw = r5.zyw * r18.xxx + r2.yxz;
    ps = LocalToWorldMatrix[2].z * r6.x;
    r2.x = r6.w * LocalToWorldMatrix[1].z;
    r0.w = ps;
    r10.x = r6.z * LocalToWorldMatrix[0].z + r2.x;
    ps = abs(r5.x) * abs(r5.x);
    r2 = r10.xywz + r0.wxyz;
    r6.w = ps;
    ps = r2.x;
    r5.xyz = r11.xzy * r7.zzz;
    r6.x = ps;
    ps = 0.5 * r6.x;
    r2.xyz = r2.yzw + r8.xyz;
    r7.z = ps;
    r2.xyz = r4.xzw * 2.0 + r2.xyz;
    ps = log2(r8.w);
    r7.xyz = r7.xzy + float3(0.125, 0.5, 0.125);
    r12.x = ps;
    r2.xyz = r9.xyz * 2.0 + r2.xyz;
    r2.xyz = r12.ywz * r3.xzy - r2.xzy;
    ps = log2(abs(r7.y));
    r7.x = r7.x * r7.z;
    r12.y = ps;
    r7.xyz = r7.xxx * r17.xyz + ModShadowColor.xyz;
    ps = 1.4285715 * r6.y;
    r17.xy = r12.xy * float2(2e+01, 0.8);
    r16.w = saturate(ps);
    ps = pow(2.0, r17.x);
    r12.xyz = r11.xzy * r6.www;
    r6.x = ps;
    ps = pow(2.0, r17.y);
    r1.xyz = r6.xxx * r1.xzy;
    r15.w = ps;
    r6 = r16.xzyw * r15.xzyw;
    r1.xyz = r1.xyz * r6.xyz + UniformVector_0.xzy;
    r1.xyz = r14.xyz * r13.xyz + r1.xzy;
    r1.xyz = r12.xyz * LowerSkyColor.xzy + r1.xzy;
    r1.xyz = r5.xzy * UpperSkyColor.xyz + r1.xzy;
    r6.xyz = r11.xzy * AmbientColorAndSkyFactor.xzy + r1.xzy;
    r6.xyz = r6.www * r2.xzy + r6.xzy;
    r6.xyz = r6.xzy + r10.yzw;
    r6.xyz = r6.xzy + r0.xyz;
    r6.xyz = r6.xyz + r8.xyz;
    r6.xyz = r4.xzw * 2.0 + r6.xyz;
    r6.xyz = r9.xyz * 2.0 + r6.xyz;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
    ps = OpacityOverride.x + ps;
    r8.xyz = r6.xyz - r6.xyz;
    r8.w = ps;
    oC0.w = r8.w * r7.w + r3.w;
    r6.xyz = r8.xyz * r7.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
