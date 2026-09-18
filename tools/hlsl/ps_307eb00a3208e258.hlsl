// ps_307eb00a3208e258.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 294 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000498 10040E00 0000070A 00000000 000068E7 001F007F 00000001 00003050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1
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

float4 AmbientColorAndSkyFactor : register(c12); // float4
float4 ConstantLighting : register(c13); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 OpacityOverride : register(c9); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformVector_0 : register(c6); // float4
float4 UpperSkyColor : register(c10); // float3
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
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r4.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.z = dot(r3.zxy, r3.zxy);
    r2.xyz = r6.xyz * 2.0 - 1.0;
    r6 = r5.yxzw * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = dot(r6.zyx, r6.zyx);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    r4.xyz = r4.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r8.xyz = r4.xyz - r4.xyz;
    r0.z = ps;
    ps = rsqrt(abs(r5.w));
    r11.yzw = r0.zzz * r3.xyz;
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r3.xyz = r2.xzy * r5.www;
    r5.z = ps;
    r2.xyz = r6.xzy * r5.zzz;
    r10.xyz = r8.xyz * UniformScalar_0.xxx + r4.xyz;
    r6.xyz = r2.zxy * r10.zzz;
    r5.z = dot(r10.zxy, r10.zxy);
    r4.xyz = r2.yzx * r3.zyx;
    r4.xyz = r2.xyz * r3.yxz - r4.xyz;
    ps = rsqrt(abs(r5.z));
    r4.xyz = r4.xyz * r6.www;
    r5.z = ps;
    r8.xyz = r10.xzy * r5.zzz;
    r5.w = dot(r8.yxz, r11.wyz);
    r5.z = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r5.z));
    r9.xyz = r8.xzy * r5.www;
    r5.z = ps;
    r13.xyz = r9.xyz * 2.0 - r11.yzw;
    ps = r5.x;
    r4.xyz = r4.xzy * r5.zzz;
    r6.xyz = r4.xzy * r10.yyy + r6.xyz;
    ps = abs(r7.x) * ps;
    r2.xyz = r2.zxy * r13.zzz;
    r0.z = ps;
    r2.xyz = r4.xzy * r13.yyy + r2.xyz;
    r6.xyw = r3.xzy * r10.xxx + r6.xyz;
    r4.xyw = r3.xzy * r13.xxx + r2.xyz;
    ps = LocalToWorldMatrix[0].z * r6.x;
    r3.xyz = r4.www * LocalToWorldMatrix[2].xyz;
    r4.w = ps;
    ps = LocalToWorldMatrix[1].z * r6.y;
    r2.xyz = r4.yyy * LocalToWorldMatrix[1].xyz;
    r3.w = ps;
    r4.xyz = r4.xxx * LocalToWorldMatrix[0].xzy + r2.xzy;
    ps = r5.y;
    r9 = r4.xzyw + r3;
    ps = abs(r7.y) * ps;
    r5 = xe_cube(r9.xyz);
    r0.w = ps;
    ps = 1.0 / abs(r5.z);
    r6.z = r5.w;
    r6.x = ps;
    r6.xy = r5.yx * r6.xx + 1.5;
    r7.z = tex2D(Texture2D_1, r0.xy).y;
    r5.xyz = texCUBE(TextureCube_0, xe_cube_dir(r6.xyz)).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r2.xyz = tex2D(Texture2D_2, r0.xy).yxz;
    r12.yzw = -ModShadowColor.xyz + 1.0;
    r5.w = dot(r1.zxy, r1.zxy);
    r4.xyz = -UniformVector_0.yxz + 1.0;
    ps = OpacityOverride.x;
    r6.z = dot(r5.zxy, float3(0.11, 0.3, 0.59));
    r0.y = saturate(ps);
    ps = AmbientColorAndSkyFactor.y * r2.x;
    r0.xzw = r2.yzx - 1.0;
    r11.x = ps;
    r9.xyz = r0.xzw * UniformScalar_0.xxx + 1.0;
    ps = rsqrt(abs(r5.w));
    r0.xzw = r6.zzz - r5.xzy;
    r5.w = ps;
    ps = UpperSkyColor.x * r4.y;
    r1.xyz = r5.www * r1.xzy;
    r4.w = ps;
    ps = LowerSkyColor.x * r4.y;
    r3 = r4.zyxw * r2.zyxy;
    r14.x = ps;
    r5.yzw = r0.xzw * 1.2 + r5.xzy;
    ps = 0.1 - -r1.y;
    r5.x = dot(r11.wyz, r10.zxy);
    r6.z = ps;
    ps = 0.875 * r6.x;
    r0.x = saturate(r6.z * 5.0);
    r7.x = ps;
    ps = 0.875 * r6.y;
    r6.xz = -r0.yx + 1.0;
    r7.y = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r0.x = max(r5.x, 0.0);
    r0.z = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r14.yzw = r8.yyy * ConstantLighting.xyz;
    r0.w = ps;
    ps = 1.0 - r0.x;
    r8.xy = r14.yz * r3.yz;
    r10.x = ps;
    ps = 1.0 - r0.z;
    r11.yz = r14.xw * r2.yz;
    r10.y = ps;
    ps = 1.0 - r0.w;
    r1.y = saturate(dot(r1.yxz, r13.zxy));
    r10.z = ps;
    ps = UniformScalar_1.x * r5.y;
    r13.xy = r7.xy * r10.yz;
    r1.x = ps;
    ps = r3.z;
    r8.zw = r11.xz * r4.xz;
    r5.x = ps;
    r9.w = r6.w * LocalToWorldMatrix[2].z + r9.w;
    ps = UpperSkyColor.y * r5.x;
    r13.zw = r9.wx * float2(0.5, 5e+01);
    r6.y = ps;
    ps = log2(r1.y);
    r0.xyw = r13.xyz + float3(0.125, 0.125, 0.5);
    r12.x = ps;
    ps = r0.x * r0.y;
    r1.y = max(r13.w, 0.0001);
    r1.z = ps;
    ps = UpperSkyColor.z * r3.x;
    r4 = r1.yzzz * r12;
    r5.x = ps;
    ps = pow(2.0, r4.x);
    r7.x = r8.z + r6.y;
    r6.y = ps;
    ps = UniformScalar_1.x * r5.z;
    r12.xyz = r6.yyy * ConstantLighting.xyz;
    r1.y = ps;
    ps = log2(abs(r0.w));
    r0.xyz = r12.xyz * r9.xzy;
    r0.w = ps;
    ps = UniformScalar_1.x * r5.w;
    r0 = r0.xzwy * float4(2e+01, 2e+01, 0.8, 2e+01);
    r1.z = ps;
    ps = pow(2.0, r0.z);
    r7.yw = r8.xw + r0.xy;
    r5.y = ps;
    r1.xyz = r1.xyz * r5.yyy - 0.0125;
    ps = abs(r10.x) * abs(r10.x);
    r5.z = r7.y + r11.y;
    r5.y = ps;
    ps = sqrt(abs(r5.y));
    r6.y = r5.z + r3.w;
    r5.y = ps;
    r1.xyz = r1.xyz * r5.yyy + 0.0125;
    r0.xy = r3.zx * LowerSkyColor.yz + r7.xw;
    r6.w = r0.y + r5.x;
    r5.w = float((r6.x >= 0.004));
    ps = r0.x;
    r5.xyz = r4.yzw + ModShadowColor.xyz;
    ps = r8.y + ps;
    r0.xyz = r1.xyz * r9.xyz;
    r6.x = ps;
    r0.w = r6.x + r0.w;
    r7.xy = r3.yx * AmbientColorAndSkyFactor.xz + r6.yw;
    r6.xyz = r0.xyw + UniformVector_0.xzy;
    r6.w = r6.z + r0.z;
    r6.w = r6.w + r7.z;
    r6.xyz = r6.xyw + r7.xyz;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xzy;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xzy - r5.xzy;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
