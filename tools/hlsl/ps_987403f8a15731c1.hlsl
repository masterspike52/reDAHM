// ps_987403f8a15731c1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 393 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000624 10041300 0000080A 00000000 00008108 001F00FF 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = (UniformScalar_11.x >= 0.0) ? 1.0 : 0.0;
    r7.xy = r0.xy * UniformVector_1.xy;
    r10.w = ps;
    r14.xyz = tex2D(Texture2D_6, r7.xy).xyz;
    r15.xyz = tex2D(Texture2D_0, r7.xy).xyz;
    r18.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r7.zw = tex2D(Texture2D_5, r0.xy).xy;
    ps = (UniformScalar_11.x > 0.0) ? 1.0 : 0.0;
    r9.w = dot(r3.zxy, r3.zxy);
    r9.x = ps;
    ps = UniformVector_3.x * UniformVector_3.w;
    r17.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r16.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r9.y = dot(r1.zxy, r1.zxy);
    r16.y = ps;
    r12 = r5.yxzw * 2.0 - 1.0;
    r13.xyz = r6.xyz * 2.0 - 1.0;
    ps = UniformVector_3.z * UniformVector_3.w;
    r5.x = UniformScalar_15.x - UniformScalar_14.x;
    r16.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.xyz = r10.xyz + r10.xyz;
    r10.x = ps;
    r7.x = r5.x * UniformScalar_2.x + UniformScalar_14.x;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r13.zxy, r13.zxy);
    r10.y = ps;
    ps = r18.z + r18.z;
    r7.y = dot(r12.zyx, r12.zyx);
    r5.x = ps;
    ps = rsqrt(abs(r9.y));
    r5.yz = r18.xy * 4.0;
    r10.z = ps;
    r6.xyz = r15.zyx * 2.0 - 1.0;
    r15.xyz = (-abs(r9.xxx) >= 0.0) ? UniformVector_4.xyz : r16.xyz;
    r9.xyz = (-abs(r9.xxx) >= 0.0) ? UniformVector_6.xyz : r17.xyz;
    r9.xyz = (-abs(r10.www) >= 0.0) ? r17.xyz : r9.xyz;
    r15.xyz = (-abs(r10.www) >= 0.0) ? r16.xyz : r15.xyz;
    ps = (-2.0) - r6.z;
    r10.xy = r10.xy * abs(r8.xy);
    r6.w = ps;
    ps = rsqrt(abs(r9.w));
    r1.xyz = r10.zzz * r1.xzy;
    r1.w = ps;
    ps = (-2.0) + r5.y;
    r16.yzw = r1.www * r3.xyz;
    r3.x = ps;
    ps = (-2.0) + r5.z;
    r15.xyz = r15.xzy * r7.zzz;
    r3.y = ps;
    ps = rsqrt(abs(r7.y));
    r9.xyz = r9.xzy * r7.www;
    r7.y = ps;
    ps = rsqrt(abs(r5.w));
    r12.xyz = r12.xyz * r7.yyy;
    r5.w = ps;
    ps = (-1.0) + r5.x;
    r13.xyz = r13.xzy * r5.www;
    r3.z = ps;
    ps = (-2.0) - r6.y;
    r3.xyz = r3.xyz - r6.zyx;
    r5.w = ps;
    ps = r5.w;
    r8.xyz = r12.zxy * r13.zxy;
    r8.xyz = r12.xzy * r13.yxz - r8.xzy;
    ps = r5.z + ps;
    r8.xyz = r8.xyz * r12.www;
    r3.w = ps;
    r3 = r3 * UniformScalar_2.xxxx + r6.zyxy;
    ps = 0.1 - -r1.y;
    r6.y = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.y));
    r5.w = dot(r8.zxy, r8.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r5.w));
    r17.z = saturate(r6.x * 5.0);
    r5.w = ps;
    ps = r7.z + r7.w;
    r3 = r3.xywz * r7.yyyy;
    r17.y = ps;
    ps = r6.w;
    r6.x = dot(r3.wxy, r3.wxy);
    ps = r5.y + ps;
    r7.z = dot(r3.wxy, r16.wyz);
    r16.x = ps;
    ps = rsqrt(abs(r6.x));
    r17.xw = max(r7.zx, float2(0.0, 0.0001));
    r5.x = ps;
    ps = r8.x;
    r6.xyw = r3.xyw * r5.xxx;
    ps = r5.w * ps;
    r5.x = dot(r6.wxy, r16.wyz);
    r8.x = ps;
    ps = r8.y;
    r7.xzw = -r17.yzx + 1.0;
    ps = r5.w * ps;
    r5.xyz = r6.xwy * r5.xxx;
    r8.y = ps;
    r18.xyz = r5.xyz * 2.0 - r16.ywz;
    ps = r8.z;
    r5.xyz = r7.xxx * r14.xyz;
    r9.xyz = r9.xzy * r14.xyz + r5.xyz;
    ps = r5.w * ps;
    r5.xyz = r12.yzx * r18.yyy;
    r8.z = ps;
    r5.xyz = r8.xzy * r18.zzz + r5.xyz;
    r9.xyz = r15.xyz * r14.xzy + r9.xzy;
    r16.yzw = r9.xyz * r11.xzy - r9.xyz;
    r5.xyw = r13.xzy * r18.xxx + r5.xzy;
    ps = LocalToWorldMatrix[2].x * r5.w;
    r11.xyz = r8.yxz * r3.zzz;
    r3.x = ps;
    ps = LocalToWorldMatrix[2].y * r5.w;
    r8.xyz = r5.yyy * LocalToWorldMatrix[1].xyz;
    r3.y = ps;
    r5.z = r16.x * UniformScalar_2.x + r6.z;
    ps = LocalToWorldMatrix[2].z * r5.w;
    r5.z = r5.z * r7.y;
    r3.z = ps;
    r11.x = r13.z * r5.z + r11.x;
    r11.yz = r13.xy * r5.zz + r11.yz;
    r5.z = r12.y * r3.w + r11.y;
    r7.xy = r12.zx * r3.ww + r11.zx;
    ps = LocalToWorldMatrix[2].z * r7.x;
    r8.w = r7.y * LocalToWorldMatrix[1].z;
    r3.w = ps;
    r5 = r5.xxxz * LocalToWorldMatrix[0].xzyz + r8.xzyw;
    r3 = r5.xzyw + r3;
    r5 = xe_cube(r3.xyz);
    ps = 1.0 / abs(r5.z);
    r8.z = r5.w;
    r6.z = ps;
    r8.xy = r5.yx * r6.zz + 1.5;
    r13.x = tex2D(Texture2D_3, r0.xy).x;
    r11.xy = tex2D(ModShadowAccumTexture, r10.xy).xy;
    r19.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r5.x = tex2D(Texture2D_4, r0.xy).x;
    r5.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r7.y = dot(r4.zxy, r4.zxy);
    r8.xyz = -UniformVector_0.xyz + 1.0;
    ps = OpacityOverride.x;
    r10.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz;
    r13.w = saturate(ps);
    ps = UniformScalar_7.x * r5.y;
    r12.xyz = r5.yzw * UniformScalar_6.xxx;
    r14.x = ps;
    r6.z = r5.x * UniformScalar_9.x + UniformScalar_10.x;
    ps = rsqrt(abs(r7.y));
    r5.x = dot(r19.zxy, float3(0.11, 0.3, 0.59));
    r7.y = ps;
    ps = UniformScalar_7.x * r5.w;
    r0.yzw = r7.yyy * r4.xyz;
    r14.y = ps;
    ps = UniformScalar_7.x * r5.z;
    r4.xyz = r5.xxx - r19.xyz;
    r14.z = ps;
    r5.xyz = r4.xyz * UniformScalar_4.xxx + r19.xyz;
    ps = ConstantLighting.x * r6.w;
    r4.xyz = r5.xyz * UniformScalar_5.xxx;
    r0.x = ps;
    ps = ConstantLighting.y * r6.w;
    r11.z = dot(r0.wyz, r6.wxy);
    r0.y = ps;
    ps = ConstantLighting.z * r6.w;
    r13.yz = r7.zz * ModShadowGroupColor.xy;
    r0.z = ps;
    ps = log2(abs(r7.w));
    r11 = r11.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r5.y = ps;
    ps = UniformScalar_3.x * r5.y;
    r5.xw = r11.wz + 0.5;
    r6.x = ps;
    ps = abs(r5.w) * abs(r5.w);
    r5.y = saturate(dot(r1.yxz, r18.yxz));
    r6.y = ps;
    ps = log2(r5.y);
    r7 = -r13.wyzx + 1.0;
    r5.y = ps;
    ps = abs(r5.x) * abs(r5.x);
    r5.w = r17.w * r5.y;
    r5.z = ps;
    ps = pow(2.0, r6.x);
    r5.xy = r11.xy * r7.yz;
    r6.x = ps;
    ps = pow(2.0, r5.w);
    r11.xyz = r4.xzy * r6.xxx;
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r6.x = float((r7.x >= 0.004));
    r4.x = ps;
    r4.yzw = r16.yzw * UniformScalar_2.xxx + r9.xyz;
    r1.xyz = r4.ywz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    ps = ConstantLighting.y * r5.w;
    r9.xyz = r4.ywz - UniformVector_2.xyz;
    r4.y = ps;
    r9.xyz = r9.xyz * r6.zzz + UniformVector_2.xyz;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r9.xyz * r8.xyz;
    r4.z = ps;
    ps = r7.x;
    r3.xyz = r4.xzy * r6.zzz;
    ps = r6.y * ps;
    r8.xyz = r7.xzy * r5.zzz;
    r4.x = ps;
    ps = r7.z;
    r5.z = r3.w * 0.5;
    ps = r6.y * ps;
    r5.xyz = r5.xzy + float3(0.125, 0.5, 0.125);
    r4.y = ps;
    ps = abs(r5.y) * abs(r5.y);
    r5.x = r5.x * r5.z;
    r5.w = ps;
    r5.xyz = r5.xxx * r15.xyz + ModShadowColor.xyz;
    ps = r7.y;
    r11.xyz = r11.xzy * r5.www;
    r11.xyz = r14.xyz * r13.xxx + r11.xzy;
    r11.xyz = r12.xzy * r7.www + r11.xyz;
    ps = r6.y * ps;
    r11.xyz = r11.xzy * UniformScalar_8.xxx;
    r4.z = ps;
    r6.yzw = r11.xyz * r6.zzz + UniformVector_0.xyz;
    r6.yzw = r10.xyz * r9.xyz + r6.yzw;
    r6.yzw = r8.xyz * UpperSkyColor.xzy + r6.ywz;
    r6.yzw = r4.xzy * LowerSkyColor.xyz + r6.ywz;
    r6.yzw = r3.xyz * r1.xzy + r6.ywz;
    r6.yzw = r0.xyz * r7.xyz + r6.ywz;
    ps = -r2.w;
    r5.xyz = r6.yzw * r5.xyz;
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
