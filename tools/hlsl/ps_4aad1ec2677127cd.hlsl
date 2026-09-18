// ps_4aad1ec2677127cd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 258 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000408 10041500 0000080A 00000000 00008108 001F00FF 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c19); // float4
float4 ConstantLighting : register(c20); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r0.xy + UniformVector_1.xy;
    r6.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = UniformVector_3.xzy * UniformVector_3.www;
    r6.z = ps;
    r6.zw = r6.zw * abs(r8.xy);
    r9.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r13.zw = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r14.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r6.w = tex2D(Texture2D_4, r0.xy).w;
    r18.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    r19.x = tex2D(Texture2D_2, r0.xy).w;
    r16.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r19.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xyw = r5.xyz * 2.0 - 1.0;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.y = dot(r1.zxy, r1.zxy);
    r21.xyz = r6.zxy * 2.0 - 1.0;
    r15.xyz = r19.ywz * UniformScalar_8.xxx;
    r13.xy = r16.yz * UniformScalar_11.xx + r15.zy;
    ps = rsqrt(abs(r5.y));
    r6.yz = r19.zx * 3.0;
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r17.z = r6.y * r18.y;
    r6.y = ps;
    r5.z = dot(r4.zxy, r4.zxy);
    r5.xyw = r6.www * float3(0.2, 3.0, 0.5);
    r5.xyw = r5.yxw * r18.yxz;
    ps = rsqrt(abs(r5.z));
    r0.z = r6.z * r5.x;
    r6.z = ps;
    ps = OpacityOverride.x;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r8.w = saturate(ps);
    ps = r6.x;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    ps = r1.x * ps;
    r5.z = dot(r0.wxy, r0.wxy);
    r7.x = ps;
    ps = r6.x;
    r20.xyz = r6.zzz * r4.xyz;
    ps = r1.y * ps;
    r6.w = dot(r21.xyz, r21.xyz);
    r7.z = ps;
    ps = r6.x;
    r4.xyz = r6.yyy * r3.zxy;
    ps = r1.z * ps;
    r3 = r19.xyxw * float4(0.2, 0.2, 0.5, 0.5);
    r7.y = ps;
    ps = rsqrt(abs(r5.z));
    r8.x = max(r4.x, 0.0);
    r6.x = ps;
    ps = 0.1 - -r7.y;
    r17.xy = r3.yw * r18.xz;
    r5.z = ps;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r0.xyw * r6.xxx;
    r5.x = ps;
    ps = LocalToWorldMatrix[0].z * r6.x;
    r0.xy = r3.xz * r5.yw;
    r3.x = ps;
    ps = LocalToWorldMatrix[1].z * r6.y;
    r5.xyw = r21.yzx * r5.xxx;
    r17.w = ps;
    ps = 5.0 * r5.z;
    r1.y = dot(r20.zxy, r5.wxy);
    r5.z = saturate(ps);
    r3.yzw = r19.xxx * r18.xzy + r0.xyz;
    ps = ConstantLighting.x * r5.w;
    r6.w = dot(r5.wxy, r4.xyz);
    r0.x = ps;
    ps = ConstantLighting.y * r5.w;
    r5.z = -r5.z + 1.0;
    r0.y = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r1.xzw = r5.xyw * r6.www;
    r8.y = ps;
    r4.xyz = r1.xzw * 2.0 - r4.yzx;
    ps = ModShadowGroupColor.y * r5.z;
    r3 = r3.zxwy + r17.ywzx;
    r8.z = ps;
    r1.x = r6.z * LocalToWorldMatrix[2].z + r3.y;
    r6.xyz = r16.zxy * UniformScalar_11.xxx + r3.xwz;
    ps = ConstantLighting.z * r5.w;
    r8 = -r8.wxyz + float4(1.0, 0.55, 1.0, 1.0);
    r0.z = ps;
    ps = r8.y;
    r3.y = saturate(dot(r7.yxz, r4.zxy));
    r5.x = ps;
    ps = r6.x;
    r7.yz = r3.xz + r13.yx;
    ps = r15.y + ps;
    r7.xw = r6.yz + r15.xz;
    r5.y = ps;
    r4.xyz = r1.xyy * float3(0.5, -0.5, 0.5) + 0.5;
    ps = 2.2222223 * r5.x;
    r5.y = r5.y + r14.z;
    r13.x = saturate(ps);
    ps = r5.y;
    r6.x = float((r8.x >= 0.004));
    ps = r11.z * ps;
    r5 = r7 + r14.xzyy;
    r3.x = ps;
    ps = abs(r4.y) * abs(r4.y);
    r1.xyz = r5.xyz * UniformScalar_15.xxx;
    r3.z = ps;
    ps = abs(r4.z) * abs(r4.z);
    r6.yzw = r5.xyz * UniformScalar_12.xxx;
    r3.w = ps;
    ps = log2(abs(r4.x));
    r7 = r5.xzyw * r11.xyzy;
    r13.y = ps;
    r5.xyz = r5.xzy * UniformScalar_13.xxx + UniformScalar_14.xxx;
    r11.xyz = r5.xzy * UniformVector_2.xzy - r6.yzw;
    ps = r3.x * r3.z;
    r4.xy = r7.xw * r3.zz;
    r4.z = ps;
    ps = r3.y * r3.y;
    r5.xyw = r13.ywz * float3(0.8, 0.875, 0.875);
    r4.w = ps;
    r13.yz = r5.wy * r8.zw + 0.125;
    ps = pow(2.0, r5.x);
    r5.w = r4.w * r3.y;
    r13.w = ps;
    ps = ConstantLighting.x * r5.w;
    r8.xyz = r7.xyz * r3.www;
    r3.x = ps;
    ps = ConstantLighting.z * r5.w;
    r3.zw = r13.xy * r13.wz;
    r3.y = ps;
    r5.xyz = r3.www * r12.xyz + ModShadowColor.xyz;
    r6.yzw = r3.zzz * r11.xyz + r6.yzw;
    r6.yzw = r10.xzy * r9.xyz + r6.ywz;
    ps = ConstantLighting.y * r5.w;
    r6.yzw = r6.yzw + UniformVector_0.xyz;
    r3.z = ps;
    r6.yzw = r7.xyz * AmbientColorAndSkyFactor.xyz + r6.yzw;
    r6.yzw = r8.xyz * UpperSkyColor.xyz + r6.yzw;
    r6.yzw = r4.xzy * LowerSkyColor.xzy + r6.ywz;
    r6.yzw = r3.xzy * r1.xzy + r6.ywz;
    r6.yzw = r0.xzy * r7.xzy + r6.ywz;
    ps = -r2.w;
    r5.xyz = r6.ywz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r5.xyz - r5.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.x + r2.w;
    r5.xyz = r7.xyz * r6.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
