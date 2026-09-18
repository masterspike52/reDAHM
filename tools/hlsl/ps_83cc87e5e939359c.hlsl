// ps_83cc87e5e939359c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 252 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003F0 10040A00 0000070A 00000000 000068E7 001F007F 00000001 00003050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1
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

float4 ConstantLighting : register(c12); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 OpacityOverride : register(c11); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
samplerCUBE TextureCube_0 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r4.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.w = dot(r3.zxy, r3.zxy);
    r0.z = ps;
    r9.xyz = r6.xyz * 2.0 - 1.0;
    r6 = r5.yxzw * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r6.zyx, r6.zyx);
    r0.w = ps;
    r8.xyz = r8.xyz * 2.0 - 1.0;
    r4.xyz = r4.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r4.w));
    r5.y = dot(r9.zxy, r9.zxy);
    r5.z = ps;
    r10.xyz = r5.zzz * r3.xyz;
    ps = rsqrt(abs(r5.y));
    r8.xyz = r8.xyz - r4.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r3.xyz = r9.xzy * r5.yyy;
    r5.x = ps;
    r5.xyz = r6.xzy * r5.xxx;
    r9.xyz = r8.xyz * UniformScalar_0.xxx + r4.xyz;
    r6.xyz = r5.zxy * r9.zzz;
    r5.w = dot(r9.zxy, r9.zxy);
    r4.xyz = r5.yzx * r3.zyx;
    r4.xyz = r5.xyz * r3.yxz - r4.xyz;
    ps = rsqrt(abs(r5.w));
    r4.xyz = r4.xyz * r6.www;
    r5.w = ps;
    r8.xyz = r9.xzy * r5.www;
    r6.w = dot(r8.yxz, r10.zxy);
    r5.w = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r5.w));
    r8.xyz = r8.xzy * r6.www;
    r5.w = ps;
    r8.xyz = r8.xyz * 2.0 - r10.xyz;
    ps = r0.z;
    r4.yzw = r4.xzy * r5.www;
    r6.xyz = r4.ywz * r9.yyy + r6.xyz;
    ps = abs(r7.x) * ps;
    r5.xyz = r5.zxy * r8.zzz;
    r4.x = ps;
    r5.xyz = r4.ywz * r8.yyy + r5.xyz;
    r6.xyz = r3.xzy * r9.xxx + r6.xyz;
    r4.yzw = r3.xyz * r8.xxx + r5.xzy;
    ps = LocalToWorldMatrix[0].z * r6.x;
    r5.xyz = r4.zzz * LocalToWorldMatrix[2].xyz;
    r3.w = ps;
    ps = LocalToWorldMatrix[1].z * r6.y;
    r3.xyz = r4.www * LocalToWorldMatrix[1].xyz;
    r5.w = ps;
    r3.xyz = r4.yyy * LocalToWorldMatrix[0].xzy + r3.xzy;
    ps = r0.w;
    r3 = r3.wxzy + r5.wxyz;
    ps = abs(r7.y) * ps;
    r5 = xe_cube(r3.yzw);
    r4.y = ps;
    ps = 1.0 / abs(r5.z);
    r7.z = r5.w;
    r6.x = ps;
    r7.xy = r5.yx * r6.xx + 1.5;
    r6.xyw = tex2D(Texture2D_2, r0.xy).xyz;
    r0.xyz = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).xyz;
    r5.xz = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r7.xyz = UniformVector_2.xyz * UniformScalar_1.xxx;
    r5.w = dot(r1.zxy, r1.zxy);
    r5.y = dot(r0.zxy, float3(0.11, 0.3, 0.59));
    ps = rsqrt(abs(r5.w));
    r6.xyw = r6.xyw - 1.0;
    r5.w = ps;
    r3.yzw = r6.xyw * UniformScalar_0.xxx + 1.0;
    r6.xyw = r5.www * r1.xzy;
    r1.xyz = r5.yyy - r0.xyz;
    r0.xyz = r1.xyz * 0.8 + r0.xyz;
    ps = 0.1 - -r6.y;
    r5.w = dot(r10.zxy, r9.zxy);
    r5.y = ps;
    ps = OpacityOverride.x;
    r5.y = saturate(r5.y * 5.0);
    r1.w = saturate(ps);
    ps = 1.0 - r5.y;
    r1.z = max(r5.w, 0.0);
    r5.y = ps;
    ps = 0.875 * r5.x;
    r1.xy = r5.yy * ModShadowGroupColor.xy;
    r5.w = ps;
    ps = 0.875 * r5.z;
    r1 = -r1.wxyz + 1.0;
    r5.y = ps;
    ps = r5.w;
    r0.xyz = r7.xyz * r0.xyz;
    ps = r1.y * ps;
    r5.w = float((r1.x >= 0.004));
    r5.x = ps;
    ps = r5.y;
    r0.w = saturate(dot(r6.yxw, r8.zxy));
    r5.y = r6.z * LocalToWorldMatrix[2].z + r3.x;
    ps = r1.z * ps;
    r5.z = r5.y * 0.5;
    r5.y = ps;
    ps = abs(r1.w) * abs(r1.w);
    r5.xyz = r5.xzy + float3(0.125, 0.5, 0.125);
    r6.x = ps;
    ps = log2(abs(r5.y));
    r5.x = r5.x * r5.z;
    r3.x = ps;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    ps = log2(r0.w);
    r6.yw = r3.xy * float2(0.8, 5e+01);
    r6.z = ps;
    ps = pow(2.0, r6.y);
    r0.w = max(r6.w, 0.0001);
    r6.y = ps;
    ps = sqrt(abs(r6.x));
    r0 = r0 * r6.yyyz;
    r6.x = ps;
    ps = pow(2.0, r0.w);
    r0.xyz = r0.xyz - UniformVector_1.xyz;
    r6.w = ps;
    r6.xyz = r0.xyz * r6.xxx + UniformVector_1.xyz;
    r0.xyz = r6.www * ConstantLighting.xyz;
    r0.xyz = r0.xyz * r3.yzw;
    r6.xyz = r6.xyz * r3.yzw + UniformVector_0.xyz;
    r6.xyz = r0.xyz * 2e+01 + r6.xyz;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
