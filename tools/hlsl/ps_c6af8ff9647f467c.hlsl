// ps_c6af8ff9647f467c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 288 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000480 10041000 0000070A 00000000 000068E7 001F007F 00000001 00003050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1
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

float4 AmbientColorAndSkyFactor : register(c13); // float4
float4 ConstantLighting : register(c14); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 OpacityOverride : register(c10); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_6 : register(c9); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UpperSkyColor : register(c11); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
samplerCUBE TextureCube_0 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8.xy = r0.xy * 1e+01 + UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.yzw = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.xyz = -UniformVector_0.yxz + 1.0;
    r0.w = ps;
    r0.zw = r0.zw * abs(r7.xy);
    r11.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    r12.x = tex2D(Texture2D_1, r0.xy).y;
    r12.w = tex2D(Texture2D_2, r8.xy).y;
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0.y = dot(r1.zxy, r1.zxy);
    r0.w = dot(r3.zxy, r3.zxy);
    r7 = r5.ywxz * 2.0 - 1.0;
    r8.xyz = r6.xyz * 2.0 - 1.0;
    r5.w = dot(r8.zxy, r8.zxy);
    r6.w = dot(r7.wzx, r7.wzx);
    r5.xyz = r10.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r6.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    ps = rsqrt(abs(r0.y));
    r15.xyz = r0.www * r3.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r6.w));
    r1.xyz = r0.yyy * r1.xzy;
    r6.w = ps;
    ps = rsqrt(abs(r5.w));
    r13.xyz = r7.xwz * r6.www;
    r5.w = ps;
    r8.xyz = r8.xzy * r5.www;
    r5.yzw = r6.yzx * UniformScalar_0.xxx + r5.yzx;
    ps = OpacityOverride.x;
    r10.xyz = r13.zxy * r5.zzz;
    r7.x = saturate(ps);
    ps = 0.1 - -r1.y;
    r6.z = dot(r5.zwy, r5.zwy);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r6.y = dot(r15.zxy, r5.zwy);
    r6.x = saturate(ps);
    ps = r6.y;
    r3.xyz = r13.yzx * r8.zyx;
    r6.y = ps;
    r3.xyz = r13.xyz * r8.yxz - r3.xyz;
    ps = rsqrt(abs(r6.z));
    r14.xyz = r3.xyz * r7.yyy;
    r5.x = ps;
    ps = 0.0;
    r3.xyw = r5.wyz * r5.xxx;
    r6.z = ps;
    ps = max(r6.y, r6.z);
    r6.w = dot(r3.wxy, r15.zxy);
    r6.y = ps;
    ps = 0.875 * r0.x;
    r6.xz = -r6.yx + 1.0;
    r6.y = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r5.x = dot(r14.zxy, r14.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r5.x));
    r16.xyz = r3.xyw * r6.www;
    r5.x = ps;
    r3.xyz = r16.xyz * 2.0 - r15.xyz;
    ps = ModShadowGroupColor.y * r6.z;
    r14.xyz = r14.xzy * r5.xxx;
    r7.z = ps;
    r5.xyz = r14.xzy * r5.yyy + r10.xyz;
    ps = 0.875 * r0.z;
    r7.xyz = -r7.xyz + 1.0;
    r6.w = ps;
    r12.yz = r6.yw * r7.yz + 0.125;
    r5.xyz = r8.xzy * r5.www + r5.xyz;
    ps = LocalToWorldMatrix[0].z * r5.x;
    r5.w = saturate(dot(r1.yxz, r3.zxy));
    r10.x = ps;
    ps = LocalToWorldMatrix[1].z * r5.y;
    r10.yz = r12.xy * r12.wz;
    r10.w = ps;
    r0.xz = r10.xy + r10.wy;
    r5.x = r5.z * LocalToWorldMatrix[2].z + r0.x;
    ps = 0.5 * r5.x;
    r12.yzw = r3.www * ConstantLighting.yzx;
    r11.x = ps;
    r1 = r11.yzwx + float4(-1.0, -1.0, -1.0, 0.5);
    r6.yzw = r1.xyz * UniformScalar_0.xxx + 1.0;
    ps = 5e+01 * r6.y;
    r5.x = ps;
    ps = log2(r5.w);
    r8.w = max(r5.x, 0.0001);
    r3.w = ps;
    r8 = r8.xzyw * r3.xxxw;
    r5.xyz = r14.xyz * r3.yyy + r8.xzy;
    r5.xyw = r13.xyz * r3.zzz + r5.zyx;
    r3.xyz = r5.yyy * LocalToWorldMatrix[2].xyz;
    r5.xyz = r5.xxx * LocalToWorldMatrix[1].xyz + r3.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xzy + r5.xzy;
    r5 = xe_cube(r5.xzy);
    ps = 1.0 / abs(r5.z);
    r3.z = r5.w;
    r0.y = ps;
    r3.xy = r5.yx * r0.yy + 1.5;
    r5.xyz = texCUBE(TextureCube_0, xe_cube_dir(r3.xyz)).xyz;
    r5.w = dot(r5.zxy, float3(0.11, 0.3, 0.59));
    ps = UpperSkyColor.x * r4.y;
    r3.xyz = r5.www - r5.xzy;
    r4.w = ps;
    r5.xyz = r3.xyz * 1.8 + r5.xzy;
    r3 = r4.yxzw * r11.yzwy;
    r9.x = r12.w * r3.x;
    ps = LowerSkyColor.x * r4.y;
    r8.xyz = r5.xyz * UniformScalar_6.xxx;
    r12.x = ps;
    r0.xyw = r12.xyz * r11.yzw;
    r5.xyz = r10.zzz * r9.yzw + ModShadowColor.xyz;
    ps = pow(2.0, r8.w);
    r9.yz = r0.yw * r4.xz;
    r5.w = ps;
    r4.xyz = r5.www * ConstantLighting.xyz;
    ps = log2(abs(r1.w));
    r1.xyz = r4.xzy * r6.ywz;
    r1.w = ps;
    ps = abs(r6.x) * abs(r6.x);
    r1 = r1.xzyw * float4(2e+01, 2e+01, 2e+01, 0.8);
    r5.w = ps;
    ps = pow(2.0, r1.w);
    r1.xyz = r9.xyz + r1.xyz;
    r6.x = ps;
    r4.xyz = r8.xyz * r6.xxx - 0.025;
    r0.yw = r3.yz * LowerSkyColor.yz + r1.yz;
    ps = sqrt(abs(r5.w));
    r1.x = r1.x + r0.x;
    r6.x = ps;
    ps = r1.x;
    r5.w = float((r7.x >= 0.004));
    r1.yz = r3.yz * UpperSkyColor.yz + r0.yw;
    r4.xyz = r4.xyz * r6.xxx + 0.025;
    ps = r3.w + ps;
    r0.xyw = r4.xyz * r6.ywz;
    r1.x = ps;
    r6.xyz = r3.xyz * AmbientColorAndSkyFactor.xyz + r1.xyz;
    r0.z = r0.z + r0.w;
    r0.xyz = r0.xzy + UniformVector_0.xyz;
    r6.xyz = r0.xyz + r6.xyz;
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
