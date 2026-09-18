// ps_2f39f33c353c8004.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 393 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000624 10041300 0000070A 00000000 000068E7 001F007F 00000001 00003050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c30); // float4
float4 ConstantLighting : register(c31); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c29); // float3
float4 ModShadowAccumResolution : register(c34); // float2
float4 ModShadowColor : register(c32); // float3
float4 ModShadowGroupColor : register(c33); // float3
float4 OpacityOverride : register(c27); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_10 : register(c21); // float
float4 UniformScalar_11 : register(c22); // float
float4 UniformScalar_12 : register(c23); // float
float4 UniformScalar_13 : register(c24); // float
float4 UniformScalar_14 : register(c25); // float
float4 UniformScalar_15 : register(c26); // float
float4 UniformScalar_2 : register(c13); // float
float4 UniformScalar_3 : register(c14); // float
float4 UniformScalar_4 : register(c15); // float
float4 UniformScalar_5 : register(c16); // float
float4 UniformScalar_6 : register(c17); // float
float4 UniformScalar_7 : register(c18); // float
float4 UniformScalar_8 : register(c19); // float
float4 UniformScalar_9 : register(c20); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_3 : register(c9); // float4
float4 UniformVector_4 : register(c10); // float4
float4 UniformVector_5 : register(c11); // float4
float4 UniformVector_6 : register(c12); // float4
float4 UpperSkyColor : register(c28); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
samplerCUBE TextureCube_0 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
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
    float4 r7 = 0.0;
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

    ps = (UniformScalar_11.x >= 0.0) ? 1.0 : 0.0;
    r0.zw = r0.xy * UniformVector_1.xy;
    r9.w = ps;
    r13.xyz = tex2D(Texture2D_6, r0.zw).xyz;
    r14.xyz = tex2D(Texture2D_0, r0.zw).xyz;
    r18.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r16.xy = tex2D(Texture2D_5, r0.xy).xy;
    ps = (UniformScalar_11.x > 0.0) ? 1.0 : 0.0;
    r0.w = dot(r3.zxy, r3.zxy);
    r9.x = ps;
    ps = UniformVector_3.x * UniformVector_3.w;
    r17.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r15.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r8.w = dot(r1.zxy, r1.zxy);
    r15.y = ps;
    r11 = r5.yxzw * 2.0 - 1.0;
    r12.xyz = r6.xyz * 2.0 - 1.0;
    ps = UniformVector_3.z * UniformVector_3.w;
    r5.x = UniformScalar_15.x - UniformScalar_14.x;
    r15.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = r8.xyz + r8.xyz;
    r8.x = ps;
    r8.z = r5.x * UniformScalar_2.x + UniformScalar_14.x;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r12.zxy, r12.zxy);
    r8.y = ps;
    ps = r18.z + r18.z;
    r0.z = dot(r11.zyx, r11.zyx);
    r5.x = ps;
    ps = rsqrt(abs(r8.w));
    r5.yz = r18.xy * 4.0;
    r8.w = ps;
    r6.xyz = r14.zyx * 2.0 - 1.0;
    r14.xyz = (-abs(r9.xxx) >= 0.0) ? UniformVector_4.xyz : r15.xyz;
    r9.xyz = (-abs(r9.xxx) >= 0.0) ? UniformVector_6.xyz : r17.xyz;
    r9.xyz = (-abs(r9.www) >= 0.0) ? r17.xyz : r9.xyz;
    r14.xyz = (-abs(r9.www) >= 0.0) ? r15.xyz : r14.xyz;
    ps = (-2.0) - r6.z;
    r8.xy = r8.xy * abs(r7.xy);
    r6.w = ps;
    ps = rsqrt(abs(r0.w));
    r1.xyz = r8.www * r1.xzy;
    r0.w = ps;
    ps = (-2.0) + r5.y;
    r15.xyz = r0.www * r3.xyz;
    r3.x = ps;
    ps = (-2.0) + r5.z;
    r14.xyz = r14.xzy * r16.xxx;
    r3.y = ps;
    ps = rsqrt(abs(r0.z));
    r9.xyz = r9.xzy * r16.yyy;
    r0.z = ps;
    ps = rsqrt(abs(r5.w));
    r11.xyz = r11.xyz * r0.zzz;
    r5.w = ps;
    ps = (-1.0) + r5.x;
    r12.xyz = r12.xzy * r5.www;
    r3.z = ps;
    ps = (-2.0) - r6.y;
    r3.xyz = r3.xyz - r6.zyx;
    r5.w = ps;
    ps = r5.w;
    r7.xyz = r11.zxy * r12.zxy;
    r7.xyz = r11.xzy * r12.yxz - r7.xzy;
    ps = r5.z + ps;
    r7.xyz = r7.xyz * r11.www;
    r3.w = ps;
    r3 = r3 * UniformScalar_2.xxxx + r6.zyxy;
    ps = 0.1 - -r1.y;
    r6.y = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.y));
    r5.w = dot(r7.zxy, r7.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r5.w));
    r17.z = saturate(r6.x * 5.0);
    r5.w = ps;
    ps = r16.x + r16.y;
    r3 = r3.xywz * r0.zzzz;
    r17.y = ps;
    ps = r6.w;
    r6.x = dot(r3.wxy, r3.wxy);
    ps = r5.y + ps;
    r8.w = dot(r3.wxy, r15.zxy);
    r16.x = ps;
    ps = rsqrt(abs(r6.x));
    r17.xw = max(r8.wz, float2(0.0, 0.0001));
    r5.x = ps;
    ps = r7.x;
    r6.xyw = r3.xyw * r5.xxx;
    ps = r5.w * ps;
    r5.x = dot(r6.wxy, r15.zxy);
    r7.x = ps;
    ps = r7.y;
    r19.xyz = -r17.zxy + 1.0;
    ps = r5.w * ps;
    r5.xyz = r6.xwy * r5.xxx;
    r7.y = ps;
    r18.xyz = r5.xyz * 2.0 - r15.xzy;
    ps = r7.z;
    r5.xyz = r19.zzz * r13.xyz;
    r9.xyz = r9.xzy * r13.xyz + r5.xyz;
    ps = r5.w * ps;
    r5.xyz = r11.yzx * r18.yyy;
    r7.z = ps;
    r5.xyz = r7.xzy * r18.zzz + r5.xyz;
    r9.xyz = r14.xyz * r13.xzy + r9.xzy;
    r16.yzw = r9.xyz * r10.xzy - r9.xyz;
    r5.xyw = r12.xzy * r18.xxx + r5.xzy;
    ps = LocalToWorldMatrix[2].x * r5.w;
    r10.xyz = r7.yxz * r3.zzz;
    r3.x = ps;
    ps = LocalToWorldMatrix[2].y * r5.w;
    r7.xyz = r5.yyy * LocalToWorldMatrix[1].xyz;
    r3.y = ps;
    r5.z = r16.x * UniformScalar_2.x + r6.z;
    ps = LocalToWorldMatrix[2].z * r5.w;
    r5.z = r5.z * r0.z;
    r3.z = ps;
    r10.x = r12.z * r5.z + r10.x;
    r10.yz = r12.xy * r5.zz + r10.yz;
    r5.z = r11.y * r3.w + r10.y;
    r0.zw = r11.xz * r3.ww + r10.xz;
    ps = LocalToWorldMatrix[2].z * r0.w;
    r7.w = r0.z * LocalToWorldMatrix[1].z;
    r3.w = ps;
    r5 = r5.xxxz * LocalToWorldMatrix[0].xzyz + r7.xzyw;
    r7 = r5.xwzy + r3.xwyz;
    r5 = xe_cube(r7.xzw);
    ps = 1.0 / abs(r5.z);
    r3.z = r5.w;
    r6.z = ps;
    r3.xy = r5.yx * r6.zz + 1.5;
    r13.x = tex2D(Texture2D_3, r0.xy).x;
    r11.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r3.xyz = texCUBE(TextureCube_0, xe_cube_dir(r3.xyz)).xyz;
    r5.x = tex2D(Texture2D_4, r0.xy).x;
    r5.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = dot(r4.zxy, r4.zxy);
    r8.xyz = -UniformVector_0.xyz + 1.0;
    ps = OpacityOverride.x;
    r10.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz;
    r13.w = saturate(ps);
    ps = UniformScalar_7.x * r5.y;
    r12.xyz = r5.yzw * UniformScalar_6.xxx;
    r14.x = ps;
    r6.z = r5.x * UniformScalar_9.x + UniformScalar_10.x;
    ps = rsqrt(abs(r0.x));
    r5.x = dot(r3.zxy, float3(0.11, 0.3, 0.59));
    r0.x = ps;
    ps = UniformScalar_7.x * r5.w;
    r0.xyz = r0.xxx * r4.xyz;
    r14.y = ps;
    ps = UniformScalar_7.x * r5.z;
    r4.xyz = r5.xxx - r3.xyz;
    r14.z = ps;
    r5.xyz = r4.xyz * UniformScalar_4.xxx + r3.xyz;
    ps = ConstantLighting.x * r6.w;
    r4.xyz = r5.xyz * UniformScalar_5.xxx;
    r3.x = ps;
    ps = ConstantLighting.y * r6.w;
    r11.z = dot(r0.zxy, r6.wxy);
    r3.y = ps;
    ps = ConstantLighting.z * r6.w;
    r13.yz = r19.xx * ModShadowGroupColor.xy;
    r3.z = ps;
    ps = log2(abs(r19.y));
    r11 = r11.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r5.y = ps;
    ps = UniformScalar_3.x * r5.y;
    r5.xw = r11.wz + 0.5;
    r6.x = ps;
    ps = abs(r5.w) * abs(r5.w);
    r5.y = saturate(dot(r1.yxz, r18.yxz));
    r6.y = ps;
    ps = log2(r5.y);
    r0 = -r13.wyzx + 1.0;
    r5.y = ps;
    ps = abs(r5.x) * abs(r5.x);
    r5.w = r17.w * r5.y;
    r5.z = ps;
    ps = pow(2.0, r6.x);
    r5.xy = r11.xy * r0.yz;
    r6.x = ps;
    ps = pow(2.0, r5.w);
    r11.xyz = r4.xzy * r6.xxx;
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r6.x = float((r0.x >= 0.004));
    r4.x = ps;
    r4.yzw = r16.yzw * UniformScalar_2.xxx + r9.xyz;
    r1.xyz = r4.ywz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    ps = ConstantLighting.y * r5.w;
    r9.xyz = r4.ywz - UniformVector_2.xyz;
    r4.y = ps;
    r9.xyz = r9.xyz * r6.zzz + UniformVector_2.xyz;
    ps = ConstantLighting.z * r5.w;
    r0.xyz = r9.xyz * r8.xyz;
    r4.z = ps;
    ps = r0.x;
    r4.xyz = r4.xzy * r6.zzz;
    ps = r6.y * ps;
    r8.xyz = r0.xzy * r5.zzz;
    r7.x = ps;
    ps = r0.z;
    r5.z = r7.y * 0.5;
    ps = r6.y * ps;
    r5.xyz = r5.xzy + float3(0.125, 0.5, 0.125);
    r7.y = ps;
    ps = abs(r5.y) * abs(r5.y);
    r5.x = r5.x * r5.z;
    r5.w = ps;
    r5.xyz = r5.xxx * r15.xyz + ModShadowColor.xyz;
    ps = r0.y;
    r11.xyz = r11.xzy * r5.www;
    r11.xyz = r14.xyz * r13.xxx + r11.xzy;
    r11.xyz = r12.xzy * r0.www + r11.xyz;
    ps = r6.y * ps;
    r11.xyz = r11.xzy * UniformScalar_8.xxx;
    r7.z = ps;
    r6.yzw = r11.xyz * r6.zzz + UniformVector_0.xyz;
    r6.yzw = r10.xyz * r9.xyz + r6.yzw;
    r6.yzw = r8.xyz * UpperSkyColor.xzy + r6.ywz;
    r6.yzw = r7.xzy * LowerSkyColor.xyz + r6.ywz;
    r6.yzw = r4.xyz * r1.xzy + r6.ywz;
    r6.yzw = r3.xyz * r0.xyz + r6.ywz;
    ps = -r2.w;
    r5.xyz = r6.yzw * r5.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.x + r2.w;
    r5.xyz = r0.xyz * r6.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
