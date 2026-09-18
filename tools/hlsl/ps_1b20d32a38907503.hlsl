// ps_1b20d32a38907503.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 330 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000528 10041000 0000080A 00000000 00007108 003F00FF 00000001 00003050 00003151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
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
float4 UniformScalar_0 : register(c11); // float
float4 UniformScalar_1 : register(c12); // float
float4 UniformScalar_5 : register(c13); // float
float4 UniformScalar_6 : register(c14); // float
float4 UniformScalar_7 : register(c15); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_2 : register(c7); // float4
float4 UniformVector_3 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UniformVector_5 : register(c10); // float4
float4 UpperSkyColor : register(c17); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
samplerCUBE TextureCube_0 : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

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

    r0.zw = r0.xy * UniformScalar_0.xx;
    r1.zw = r1.xy * 0.5;
    r9.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r10 = tex2D(Texture2D_3, r0.xy);
    r11.xy = tex2D(Texture2D_0, r1.zw).xy;
    r0.xyz = tex2D(Texture2D_1, r0.zw).wxy;
    r16.y = saturate(r3.w * 0.0001);
    r6 = r6.yxzw * 2.0 - 1.0;
    r0.w = dot(r4.zxy, r4.zxy);
    r12.xyz = r7.xyz * 2.0 - 1.0;
    ps = (-1.0) + r0.x;
    r7.x = dot(r2.zxy, r2.zxy);
    r14.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r13.xy = r0.yz + r0.yz;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.zw = r11.xy + r11.xy;
    r1.w = ps;
    ps = rsqrt(abs(r7.x));
    r14.z = float((r10.w >= 0.5));
    r0.x = ps;
    ps = rsqrt(abs(r0.w));
    r7.w = dot(r12.zxy, r12.zxy);
    r11.x = ps;
    r7.xyz = r9.zxy * 2.0 - 1.0;
    ps = UniformVector_2.z * r7.x;
    r0.y = dot(r6.zyx, r6.zyx);
    r15.w = ps;
    ps = rsqrt(abs(r0.y));
    r9.xyz = r11.xxx * r4.zxy;
    r0.y = ps;
    ps = r9.x;
    r15.xyz = r0.xxx * r2.xyz;
    r0.x = ps;
    ps = rsqrt(abs(r7.w));
    r11.yzw = r6.xzy * r0.yyy;
    r7.w = ps;
    ps = 0.0;
    r12.xyz = r12.xzy * r7.www;
    r0.y = ps;
    ps = max(r0.x, r0.y);
    r2 = r13.wxyz - 1.0;
    r16.z = ps;
    ps = r2.w;
    r6.yz = r15.zw + float2(0.1, -1.0);
    r6.x = ps;
    ps = 0.012 * r6.x;
    r0.xyz = r11.zwy * r12.zyx;
    r16.x = ps;
    r0.xyz = r11.yzw * r12.yxz - r0.xyz;
    ps = 5.0 * r6.y;
    r13.xyz = r0.xyz * r6.www;
    r16.w = saturate(ps);
    ps = r6.z;
    r7.w = dot(r13.zxy, r13.zxy);
    ps = r14.z * ps;
    r0.xyz = -r16.yzw + 1.0;
    r14.y = ps;
    r6.zw = r14.yx * r0.xx + 1.0;
    ps = 0.012 * r2.x;
    r6.y = r0.x * UniformScalar_1.x;
    r16.y = ps;
    r6.x = (r6.y > 0.0) ? r6.w : 1.0;
    r7.xy = r6.yy * r2.yz + r7.yz;
    r14.xy = r7.xy * UniformVector_2.xy - r16.xy;
    r14.w = (r6.y >= 0.0) ? r6.x : 1.0;
    r7.xyz = r14.xyz * r14.zzw;
    ps = r1.x;
    r6.xy = r16.xy + r7.xy;
    ps = UniformVector_5.x * ps;
    r6.xy = r6.xy * r0.xx;
    r2.x = ps;
    r6.xyz = (r0.xxx > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r0.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.w));
    r6.x = dot(r6.wyz, r6.wyz);
    r7.w = ps;
    ps = rsqrt(abs(r6.x));
    r13.xyz = r13.xzy * r7.www;
    r6.x = ps;
    ps = r1.y;
    r7.xyw = r6.yzw * r6.xxx;
    ps = UniformVector_5.y * ps;
    r6.x = dot(r7.wxy, r9.xyz);
    r2.y = ps;
    ps = r1.z;
    r6.xyz = r7.xwy * r6.xxx;
    r9.xyz = r6.xyz * 2.0 - r9.yxz;
    ps = abs(r8.x) * ps;
    r6.z = saturate(dot(r15.zxy, r9.yxz));
    r2.z = ps;
    ps = log2(abs(r0.y));
    r6.xyw = r11.wyz * r9.yyy;
    r11.y = ps;
    r6.xyw = r13.xzy * r9.zzz + r6.xyw;
    r6.xyw = r12.yzx * r9.xxx + r6.wyx;
    ps = log2(r6.z);
    r9.xyz = r6.xxx * LocalToWorldMatrix[2].xzy;
    r11.z = ps;
    ps = r1.w;
    r13.xyz = r11.xyz * float3(-0.075, 0.0125, 15.0);
    r1.z = r13.x * r4.x + r1.x;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xzy + r9.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xyz + r6.xzy;
    ps = abs(r8.y) * ps;
    r6 = xe_cube(r6.xyz);
    r2.w = ps;
    ps = 1.0 / abs(r6.z);
    r4.z = r6.w;
    r0.w = ps;
    r4.xy = r6.yx * r0.ww + 1.5;
    r11.xyz = texCUBE(TextureCube_0, xe_cube_dir(r4.xyz)).xyz;
    r8.yz = tex2D(ModShadowAccumTexture, r2.zw).xy;
    r2.xyz = tex2D(Texture2D_5, r2.xy).xyz;
    r6.xyw = tex2D(Texture2D_4, r1.zy).xyz;
    ps = OpacityOverride.x;
    r4.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r4.w = saturate(ps);
    ps = -UniformVector_0.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r6.z = float((UniformScalar_5.x >= 1.0));
    r1.x = ps;
    ps = -UniformVector_0.y;
    r0.w = dot(r5.zxy, r5.zxy);
    ps = 1.0 + ps;
    r1.z = float((UniformScalar_5.x > 1.0));
    r1.y = ps;
    r2.xyz = (-abs(r1.zzz) >= 0.0) ? r2.xyz : 1.0;
    ps = rsqrt(abs(r0.w));
    r4.xyz = r4.xyz * r10.xyz;
    r0.w = ps;
    ps = -UniformVector_0.z;
    r5.xyz = r0.www * r5.xyz;
    r2.xyz = (-abs(r6.zzz) >= 0.0) ? 1.0 : r2.xyz;
    ps = 1.0 + ps;
    r6.z = -r14.z + 1.0;
    r1.z = ps;
    ps = 6.0 * r6.x;
    r10.xyz = r6.zzz * UniformVector_3.xyz;
    r12.x = ps;
    ps = 6.0 * r6.y;
    r4.xyz = r4.xyz * r2.xyz;
    r12.y = ps;
    r2.xyz = r14.zzz * UniformScalar_6.xxx + r10.xzy;
    ps = 6.0 * r6.w;
    r4.xyz = r4.xyz * r7.zzz;
    r12.z = ps;
    r2.xyz = r4.xyz * UniformScalar_7.xxx + r2.xzy;
    ps = ModShadowGroupColor.x * r0.z;
    r1.xyz = r4.xyz * r1.xyz;
    r4.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r8.x = dot(r5.zxy, r7.wxy);
    r4.y = ps;
    ps = ConstantLighting.x * r7.w;
    r6 = r8.yzxx * float4(0.875, 0.875, 0.5, -0.5);
    r0.x = ps;
    ps = ConstantLighting.y * r7.w;
    r0.zw = r6.wz + 0.5;
    r0.y = ps;
    ps = ConstantLighting.z * r7.w;
    r6.zw = abs(r0.zw) * abs(r0.zw);
    r0.z = ps;
    ps = pow(2.0, r13.y);
    r5.xyz = r1.xzy * r6.zzz;
    r4.z = ps;
    ps = pow(2.0, r13.z);
    r8.xyz = r1.xzy * r6.www;
    r6.w = ps;
    ps = ConstantLighting.x * r6.w;
    r7 = -r4.wxyz + 1.0;
    r4.x = ps;
    ps = ConstantLighting.z * r6.w;
    r7.x = float((r7.x >= 0.004));
    r4.y = ps;
    r6.xy = r6.xy * r7.yz + 0.125;
    r7.yzw = r12.xzy * r7.www + r11.xzy;
    r7.yzw = r10.xyz * r7.ywz + UniformVector_0.xyz;
    ps = ConstantLighting.y * r6.w;
    r6.x = r6.x * r6.y;
    r4.z = ps;
    r6.xyz = r6.xxx * r9.xyz + ModShadowColor.xyz;
    r7.yzw = r1.xyz * AmbientColorAndSkyFactor.xyz + r7.yzw;
    r7.yzw = r8.xyz * UpperSkyColor.xzy + r7.ywz;
    r7.yzw = r5.xzy * LowerSkyColor.xyz + r7.ywz;
    r7.yzw = r4.xyz * r2.xzy + r7.ywz;
    r7.yzw = r0.xyz * r1.xyz + r7.ywz;
    ps = -r3.w;
    r6.xyz = r7.ywz * r6.xzy;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xzy - r6.xzy;
    r0.w = ps;
    oC0.w = r0.w * r7.x + r3.w;
    r6.xyz = r0.xyz * r7.xxx + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
