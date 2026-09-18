// ps_0d271c711d19a9d0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 294 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000498 10040E00 0000080A 00000000 00008108 001F00FF 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r4.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r7.w = dot(r3.zxy, r3.zxy);
    r7.xyz = r6.xyz * 2.0 - 1.0;
    r6 = r5.yxzw * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = dot(r6.zyx, r6.zyx);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r7.zxy, r7.zxy);
    r5.y = ps;
    r4.xyz = r4.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r9.xyz = r4.xyz - r4.xyz;
    r7.w = ps;
    ps = rsqrt(abs(r5.w));
    r11.yzw = r7.www * r3.xyz;
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r3.yzw = r7.xzy * r5.www;
    r5.z = ps;
    r7.xyz = r6.xzy * r5.zzz;
    r9.xyz = r9.xyz * UniformScalar_0.xxx + r4.xyz;
    r6.xyz = r7.zxy * r9.zzz;
    r5.z = dot(r9.zxy, r9.zxy);
    r4.xyz = r7.yzx * r3.wzy;
    r4.xyz = r7.xyz * r3.zyw - r4.xyz;
    ps = rsqrt(abs(r5.z));
    r4.xyz = r4.xyz * r6.www;
    r5.z = ps;
    r10.xyw = r9.xyz * r5.zzz;
    r5.w = dot(r10.wxy, r11.wyz);
    r5.z = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r5.z));
    r12.xyz = r10.xyw * r5.www;
    r5.z = ps;
    r12.xyz = r12.xyz * 2.0 - r11.yzw;
    ps = r5.x;
    r4.xyz = r4.xzy * r5.zzz;
    r6.xyz = r4.xzy * r9.yyy + r6.xyz;
    ps = abs(r8.x) * ps;
    r7.xyz = r7.zxy * r12.zzz;
    r3.x = ps;
    r7.xyz = r4.xzy * r12.yyy + r7.xyz;
    r6.xyw = r3.yzw * r9.xxx + r6.xzy;
    r4.xyw = r3.ywz * r12.xxx + r7.xyz;
    ps = LocalToWorldMatrix[0].z * r6.x;
    r7.xyz = r4.www * LocalToWorldMatrix[2].xyz;
    r4.w = ps;
    ps = LocalToWorldMatrix[1].z * r6.w;
    r3.yzw = r4.yyy * LocalToWorldMatrix[1].xyz;
    r7.w = ps;
    r4.xyz = r4.xxx * LocalToWorldMatrix[0].xzy + r3.ywz;
    ps = r5.y;
    r7 = r4.wxzy + r7.wxyz;
    ps = abs(r8.y) * ps;
    r5 = xe_cube(r7.yzw);
    r3.y = ps;
    ps = 1.0 / abs(r5.z);
    r6.w = r5.w;
    r6.x = ps;
    r6.xz = r5.yx * r6.xx + 1.5;
    r8.z = tex2D(Texture2D_1, r0.xy).y;
    r8.xyw = texCUBE(TextureCube_0, xe_cube_dir(r6.xzw)).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r0.xyz = tex2D(Texture2D_2, r0.xy).yxz;
    r13.yzw = -ModShadowColor.xyz + 1.0;
    r5.z = dot(r1.zxy, r1.zxy);
    r3.xyz = -UniformVector_0.yxz + 1.0;
    ps = OpacityOverride.x;
    r5.w = dot(r8.wxy, float3(0.11, 0.3, 0.59));
    r6.z = saturate(ps);
    ps = AmbientColorAndSkyFactor.y * r0.x;
    r4.xyz = r0.yzx - 1.0;
    r11.x = ps;
    r10.xyz = r4.xyz * UniformScalar_0.xxx + 1.0;
    ps = rsqrt(abs(r5.z));
    r14.yzw = r5.www - r8.xwy;
    r5.z = ps;
    ps = UpperSkyColor.x * r3.y;
    r1.xyz = r5.zzz * r1.xzy;
    r3.w = ps;
    ps = LowerSkyColor.x * r3.y;
    r4 = r3.zyxw * r0.zyxy;
    r14.x = ps;
    r7.yzw = r14.yzw * 1.2 + r8.xwy;
    ps = 0.1 - -r1.y;
    r5.w = dot(r11.wyz, r9.zxy);
    r5.z = ps;
    ps = 0.875 * r5.x;
    r6.x = saturate(r5.z * 5.0);
    r9.z = ps;
    ps = 0.875 * r5.y;
    r5.xz = -r6.zx + 1.0;
    r9.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6.x = max(r5.w, 0.0);
    r6.z = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r14.yzw = r10.www * ConstantLighting.xyz;
    r6.w = ps;
    ps = 1.0 - r6.x;
    r9.xy = r14.yz * r4.yz;
    r8.x = ps;
    ps = 1.0 - r6.z;
    r11.yz = r14.xw * r0.yz;
    r8.y = ps;
    ps = 1.0 - r6.w;
    r5.y = saturate(dot(r1.yxz, r12.zxy));
    r8.w = ps;
    ps = UniformScalar_1.x * r7.y;
    r0.xy = r9.zw * r8.yw;
    r12.x = ps;
    ps = r4.z;
    r9.zw = r11.xz * r3.xz;
    r5.z = ps;
    r10.w = r6.y * LocalToWorldMatrix[2].z + r7.x;
    ps = UpperSkyColor.y * r5.z;
    r0.zw = r10.wx * float2(0.5, 5e+01);
    r5.w = ps;
    ps = log2(r5.y);
    r6.xyw = r0.xyz + float3(0.125, 0.125, 0.5);
    r13.x = ps;
    ps = r6.x * r6.y;
    r0.x = max(r0.w, 0.0001);
    r0.y = ps;
    ps = UpperSkyColor.z * r4.x;
    r0 = r0.xyyy * r13;
    r5.y = ps;
    ps = pow(2.0, r0.x);
    r1.x = r9.z + r5.w;
    r5.w = ps;
    ps = UniformScalar_1.x * r7.z;
    r1.yzw = r5.www * ConstantLighting.xyz;
    r12.y = ps;
    ps = log2(abs(r6.w));
    r6.xyz = r1.yzw * r10.xzy;
    r6.w = ps;
    ps = UniformScalar_1.x * r7.w;
    r6 = r6.xzyw * float4(2e+01, 2e+01, 2e+01, 0.8);
    r12.z = ps;
    ps = pow(2.0, r6.w);
    r1.yz = r9.xw + r6.xy;
    r5.w = ps;
    r7.xyz = r12.xyz * r5.www - 0.0125;
    ps = abs(r8.x) * abs(r8.x);
    r7.w = r1.y + r11.y;
    r5.w = ps;
    ps = sqrt(abs(r5.w));
    r6.x = r7.w + r4.w;
    r5.w = ps;
    r7.xyz = r7.xyz * r5.www + 0.0125;
    r6.yw = r4.xz * LowerSkyColor.zy + r1.zx;
    r6.y = r6.y + r5.y;
    r5.w = float((r5.x >= 0.004));
    ps = r6.w;
    r5.xyz = r0.yzw + ModShadowColor.xyz;
    ps = r9.y + ps;
    r7.xyz = r7.xyz * r10.xyz;
    r7.w = ps;
    r7.w = r7.w + r6.z;
    r8.xy = r4.yx * AmbientColorAndSkyFactor.xz + r6.xy;
    r6.xyz = r7.xyw + UniformVector_0.xzy;
    r6.w = r6.z + r7.z;
    r6.w = r6.w + r8.z;
    r6.xyz = r6.xyw + r8.xyz;
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
