// ps_0d36ba794d1d7473.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 267 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000042C 10041600 0000090A 00000000 00008929 003F01FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c19); // float4
float4 LightMapScale : register(c20); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c18); // float3
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 OpacityOverride : register(c16); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_13 : register(c13); // float
float4 UniformScalar_14 : register(c14); // float
float4 UniformScalar_15 : register(c15); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_3 : register(c9); // float4
float4 UpperSkyColor : register(c17); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D LightMapTexture : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
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
    float4 r1 = In.texcoord1;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r1.xy + UniformVector_1.xy;
    r7.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = UniformVector_3.xzy * UniformVector_3.www;
    r7.z = ps;
    r7.zw = r7.zw * abs(r9.xy);
    r9.xyz = tex2D(Texture2D_7, r1.xy).xyz;
    r12.yz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r14.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r7.w = tex2D(Texture2D_4, r1.xy).w;
    r18.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r19.x = tex2D(Texture2D_2, r1.xy).w;
    r16.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r19.yzw = tex2D(Texture2D_5, r1.xy).xyz;
    r7.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r22.xyz = r6.xyz * 2.0 - 1.0;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.y = dot(r2.zxy, r2.zxy);
    r21.xyz = r7.zxy * 2.0 - 1.0;
    r13.xyw = r19.yzw * UniformScalar_8.xxx;
    r0.xy = r16.yz * UniformScalar_11.xx + r13.yw;
    ps = rsqrt(abs(r6.y));
    r7.yz = r19.zx * 3.0;
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r17.z = r7.y * r18.y;
    r7.y = ps;
    r6.z = dot(r5.zxy, r5.zxy);
    r6.xyw = r7.www * float3(0.2, 3.0, 0.5);
    r6.xyw = r6.xwy * r18.xzy;
    ps = rsqrt(abs(r6.z));
    r6.w = r7.z * r6.w;
    r7.z = ps;
    ps = OpacityOverride.x;
    r1.xyw = -UniformVector_0.xyz + 1.0;
    r15.w = saturate(ps);
    ps = r7.x;
    r6.z = dot(r22.zxy, r22.zxy);
    ps = r2.x * ps;
    r20.xyz = r7.zzz * r5.xyz;
    r8.x = ps;
    ps = r7.x;
    r7.w = dot(r21.xyz, r21.xyz);
    ps = r2.y * ps;
    r5.xyz = r7.yyy * r4.zxy;
    r8.z = ps;
    ps = r7.x;
    r4 = r19.xyxw * float4(0.2, 0.2, 0.5, 0.5);
    ps = r2.z * ps;
    r15.x = max(r5.x, 0.0);
    r8.y = ps;
    ps = rsqrt(abs(r6.z));
    r17.xy = r4.yw * r18.xz;
    r7.x = ps;
    ps = 0.1 - -r8.y;
    r6.yz = r4.xz * r6.xy;
    r6.x = ps;
    ps = rsqrt(abs(r7.w));
    r7.xyz = r22.xyz * r7.xxx;
    r7.w = ps;
    ps = LocalToWorldMatrix[0].z * r7.x;
    r2.xyw = r21.yzx * r7.www;
    r4.x = ps;
    ps = LocalToWorldMatrix[1].z * r7.y;
    r12.w = dot(r20.zxy, r2.wxy);
    r17.w = ps;
    r4.yzw = r19.xxx * r18.xzy + r6.yzw;
    ps = 5.0 * r6.x;
    r6.z = dot(r2.wxy, r5.xyz);
    r6.y = saturate(ps);
    ps = 1.0 - r6.y;
    r18.xyz = r2.xyw * r6.zzz;
    r6.z = ps;
    r5.xyz = r18.xyz * 2.0 - r5.yzx;
    ps = ModShadowGroupColor.x * r6.z;
    r4 = r4.xzyw + r17.wyxz;
    r15.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r0.yz = r4.yw + r0.yx;
    r15.z = ps;
    r12.x = r7.z * LocalToWorldMatrix[2].z + r4.x;
    r4.xyz = r16.xyz * UniformScalar_11.xxx + r4.zwy;
    r6 = -r15 + float4(0.55, 1.0, 1.0, 1.0);
    r0.xw = r4.xy + r13.xy;
    r4.xyw = r12.wwx * float3(-0.5, 0.5, 0.5) + 0.5;
    ps = abs(r4.x) * abs(r4.x);
    r7 = r0 + r11.xzyy;
    r15.z = ps;
    r2.xyz = r7.xzy * UniformScalar_13.xxx + UniformScalar_14.xxx;
    ps = abs(r4.y) * abs(r4.y);
    r0 = r7.xzyw * r1.xywy;
    r15.w = ps;
    ps = log2(abs(r4.w));
    r4.xy = r0.xw * r15.zz;
    r12.x = ps;
    ps = r6.x;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = r4.z;
    r14.xyz = r14.xyz * LightMapScale.xyz;
    ps = r13.w + ps;
    r1.xyz = r14.xzy * r2.www;
    r8.w = ps;
    ps = r8.w;
    r15.y = saturate(dot(r8.yxz, r5.zxy));
    ps = r11.z + ps;
    r6.w = float((r6.w >= 0.004));
    r8.w = ps;
    ps = r8.w;
    r8.xyz = r7.xyz * UniformScalar_15.xxx;
    ps = r1.w * ps;
    r7.xyz = r7.xyz * UniformScalar_12.xxx;
    r15.x = ps;
    r11.xyz = r2.xzy * UniformVector_2.xzy - r7.xyz;
    ps = r15.x * r15.z;
    r5.xyz = r0.xyz * r15.www;
    r4.z = ps;
    ps = r15.y * r15.y;
    r2.xyw = r12.yzx * float3(0.875, 0.875, 0.8);
    r4.w = ps;
    r12.yz = r2.xy * r6.yz + 0.125;
    ps = 2.2222223 * r6.x;
    r6.y = r4.w * r15.y;
    r12.x = saturate(ps);
    ps = pow(2.0, r2.w);
    r2.xyz = r14.xzy * r6.yyy;
    r12.w = ps;
    r12.xy = r12.xy * r12.wz;
    r6.xyz = r12.yyy * r13.xyz + ModShadowColor.xyz;
    r7.xyz = r12.xxx * r11.xyz + r7.xyz;
    r7.xyz = r10.xzy * r9.xyz + r7.xzy;
    r7.xyz = r7.xyz + UniformVector_0.xyz;
    r7.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + r7.xyz;
    r7.xyz = r5.xyz * UpperSkyColor.xyz + r7.xyz;
    r7.xyz = r4.xzy * LowerSkyColor.xzy + r7.xzy;
    r7.xyz = r2.xzy * r8.xzy + r7.xzy;
    r7.xyz = r1.xyz * r0.xzy + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xyz;
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
