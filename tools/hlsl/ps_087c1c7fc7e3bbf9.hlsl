// ps_087c1c7fc7e3bbf9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 315 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004EC 10041800 0000080A 00000000 00008108 001F00FF 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c13); // float4
float4 ConstantLighting : register(c14); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
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
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color1;
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

    r7.xzw = tex2D(Texture2D_0, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.y = dot(r3.zxy, r3.zxy);
    r9.y = ps;
    r11.xyz = r7.xzw * 2.0 - 1.0;
    ps = rsqrt(abs(r7.y));
    r7.x = dot(r11.zxy, r11.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r7.x));
    r15.xyz = r7.yyy * r3.xyz;
    r7.x = ps;
    ps = r9.x;
    r22.xyw = r11.zyx * r7.xxx;
    ps = abs(r8.x) * ps;
    r7.x = dot(r22.xwy, r15.zxy);
    r12.x = ps;
    ps = r9.y;
    r7.xyz = r22.wxy * r7.xxx;
    r20.xyw = r7.xyz * 2.0 - r15.xzy;
    ps = abs(r8.y) * ps;
    r7 = xe_cube(r20.xwy);
    r12.y = ps;
    ps = 1.0 / abs(r7.z);
    r9.z = r7.w;
    r3.x = ps;
    r9.xy = r7.yx * r3.xx + 1.5;
    r8.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r3.xzw = tex2D(Texture2D_2, r0.xy).xyz;
    r23.xzw = tex2D(Texture2D_3, r0.xy).xyz;
    r24.xyz = texCUBE(TextureCube_0, xe_cube_dir(r9.xyz)).xyz;
    r10.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r0.xy = tex2D(ModShadowAccumTexture, r12.xy).xy;
    ps = OpacityOverride.x;
    r17.xyz = UniformVector_2.xyz * UniformVector_2.www;
    r23.y = saturate(ps);
    ps = UniformVector_1.x * UniformVector_1.w;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r21.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r7.w = dot(r4.zxy, r4.zxy);
    r21.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r3.y = dot(r1.zxy, r1.zxy);
    r21.z = ps;
    r18.xyz = r6.xyz * 2.0 - 1.0;
    r14 = r5.yxzw * 2.0 - 1.0;
    ps = 0.875 * r0.x;
    r13.xyz = -UniformVector_0.xyz + 1.0;
    r19.x = ps;
    ps = 0.875 * r0.y;
    r19.zw = r9.yz * 0.8;
    r19.y = ps;
    ps = 0.01 * r7.x;
    r16.xyz = r10.xyz * 0.4;
    r0.x = ps;
    ps = 0.01 * r7.y;
    r10.xyz = r13.xyz * r7.xyz;
    r0.y = ps;
    ps = 0.01 * r7.z;
    r5.z = dot(r14.zyx, r14.zyx);
    r0.z = ps;
    ps = log2(abs(r7.x));
    r6.w = dot(r18.zxy, r18.zxy);
    r5.x = ps;
    ps = log2(abs(r7.y));
    r0.w = dot(r24.yzx, float3(0.59, 0.11, 0.3));
    r5.y = ps;
    ps = log2(abs(r7.z));
    r6.xyz = r23.xzw * 0.8;
    r5.w = ps;
    ps = rsqrt(abs(r3.y));
    r9.yzw = r6.xzy * UniformScalar_6.xxx;
    r6.x = ps;
    ps = rsqrt(abs(r7.w));
    r6.xyz = r6.xxx * r1.zxy;
    r7.w = ps;
    ps = rsqrt(abs(r6.w));
    r1.xyz = r0.www * r7.xyz;
    r6.w = ps;
    r21.xyz = r21.xyz * r0.www - r1.xyz;
    ps = 0.1 - -r6.x;
    r23.xzw = r7.www * r4.xyz;
    r3.y = ps;
    ps = rsqrt(abs(r5.z));
    r18.xyz = r18.xzy * r6.www;
    r5.z = ps;
    ps = 0.3 * r5.x;
    r24.xyz = r14.xyz * r5.zzz;
    r5.z = ps;
    ps = 0.3 * r5.y;
    r6.w = dot(r15.zxy, r11.zxy);
    r7.w = ps;
    ps = 0.3 * r5.w;
    r20.z = max(r6.w, 0.0);
    r6.w = ps;
    ps = pow(2.0, r5.z);
    r4.xyz = r24.yxz * r11.zzz;
    r15.x = ps;
    ps = pow(2.0, r7.w);
    r5.xyz = r24.zxy * r18.zxy;
    r15.y = ps;
    r5.xzw = r24.xzy * r18.yxz - r5.xzy;
    ps = r3.y;
    r22.w = dot(r23.wxz, r22.xwy);
    r5.y = ps;
    ps = pow(2.0, r6.w);
    r22.xyz = r22.xxx * ConstantLighting.xyz;
    r15.z = ps;
    ps = 5.0 * r5.y;
    r15.xyz = saturate(r15.xyz - 0.2);
    r23.x = saturate(ps);
    ps = 4.0 * r3.x;
    r14.xyz = r22.xyz * r7.xyz;
    r23.z = saturate(ps);
    r22.xyz = r23.zzz * r21.xyz + r1.xyz;
    ps = r19.z;
    r21.xyz = r5.xwz * r14.www;
    ps = r22.y * ps;
    r0.w = dot(r21.yxz, r21.yxz);
    r1.y = ps;
    ps = r19.w;
    r5.xz = -r23.yx + 1.0;
    ps = r22.z * ps;
    r6.w = float((r5.x >= 0.004));
    r1.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r7.w = saturate(dot(r6.xyz, r20.yxw));
    r20.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r5.xyw = r22.wxw * float3(0.5, 0.8, -0.5);
    r20.y = ps;
    ps = rsqrt(abs(r0.w));
    r1.x = r5.y * r9.x;
    r5.z = ps;
    ps = 0.5 + r5.x;
    r21.xyz = r21.xzy * r5.zzz;
    r6.z = ps;
    r4.xyz = r21.xzy * r11.yyy + r4.xzy;
    ps = 0.5 + r5.w;
    r5.xyz = -r20.xzy + float3(1.0, 0.9, 1.0);
    r0.w = ps;
    ps = abs(r6.z) * abs(r6.z);
    r6.xy = r19.xy * r5.xz;
    r6.z = ps;
    r5.xzw = r18.yxz * r11.xxx + r4.yxz;
    ps = LocalToWorldMatrix[2].z * r5.x;
    r4.x = r5.w * LocalToWorldMatrix[1].z;
    r1.w = ps;
    r9.x = r5.z * LocalToWorldMatrix[0].z + r4.x;
    ps = abs(r0.w) * abs(r0.w);
    r4 = r9.xywz + r1.wxyz;
    r5.w = ps;
    ps = r4.x;
    r11.xyz = r10.xzy * r6.zzz;
    r5.x = ps;
    ps = 0.5 * r5.x;
    r4.xyz = r4.yzw + r0.xyz;
    r6.z = ps;
    r4.yzw = r3.xzw * 2.0 + r4.xyz;
    ps = log2(r7.w);
    r6.xyz = r6.xzy + float3(0.125, 0.5, 0.125);
    r4.x = ps;
    r4.yzw = r8.xyz * 2.0 + r4.yzw;
    r7.xyz = r17.xzy * r7.xzy - r4.ywz;
    ps = log2(abs(r6.y));
    r6.x = r6.x * r6.z;
    r4.y = ps;
    r6.xyz = r6.xxx * r12.xyz + ModShadowColor.xyz;
    ps = 1.4285715 * r5.y;
    r4.xw = r4.xy * float2(2e+01, 0.8);
    r16.w = saturate(ps);
    ps = pow(2.0, r4.x);
    r12.xyz = r10.xzy * r5.www;
    r5.x = ps;
    ps = pow(2.0, r4.w);
    r4.xyz = r5.xxx * ConstantLighting.xzy;
    r15.w = ps;
    r5 = r16.xzyw * r15.xzyw;
    r4.xyz = r4.xyz * r5.xyz + UniformVector_0.xzy;
    r4.xyz = r14.xyz * r13.xyz + r4.xzy;
    r4.xyz = r12.xyz * LowerSkyColor.xzy + r4.xzy;
    r4.xyz = r11.xzy * UpperSkyColor.xyz + r4.xzy;
    r5.xyz = r10.xzy * AmbientColorAndSkyFactor.xzy + r4.xzy;
    r5.xyz = r5.www * r7.xzy + r5.xzy;
    r5.xyz = r5.xzy + r9.yzw;
    r5.xyz = r5.xzy + r1.xyz;
    r5.xyz = r5.xyz + r0.xyz;
    r5.xyz = r3.xzw * 2.0 + r5.xyz;
    r5.xyz = r8.xyz * 2.0 + r5.xyz;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r5.xyz - r5.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r2.w;
    r5.xyz = r7.xyz * r6.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
