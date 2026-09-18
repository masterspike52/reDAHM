// ps_3120237df8d79681.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 363 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005AC 10041200 0000090A 00000000 00008929 003F01FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c29); // float4
float4 LightMapScale : register(c30); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c28); // float3
float4 ModShadowAccumResolution : register(c33); // float2
float4 ModShadowColor : register(c31); // float3
float4 ModShadowGroupColor : register(c32); // float3
float4 OpacityOverride : register(c26); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c11); // float
float4 UniformScalar_1 : register(c12); // float
float4 UniformScalar_10 : register(c20); // float
float4 UniformScalar_13 : register(c21); // float
float4 UniformScalar_14 : register(c22); // float
float4 UniformScalar_15 : register(c23); // float
float4 UniformScalar_16 : register(c24); // float
float4 UniformScalar_17 : register(c25); // float
float4 UniformScalar_3 : register(c13); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformScalar_5 : register(c15); // float
float4 UniformScalar_6 : register(c16); // float
float4 UniformScalar_7 : register(c17); // float
float4 UniformScalar_8 : register(c18); // float
float4 UniformScalar_9 : register(c19); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_2 : register(c7); // float4
float4 UniformVector_3 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UniformVector_5 : register(c10); // float4
float4 UpperSkyColor : register(c27); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
samplerCUBE TextureCube_0 : register(s6);
sampler2D LightMapTexture : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r16 = tex2D(Texture2D_3, r1.xy).wxyz;
    r8.xy = r1.xy * UniformScalar_0.xx;
    r8.z = r16.x - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r8.zzzz)) clip(-1.0);
    r11.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r8.xyz = tex2D(Texture2D_0, r8.xy).wxy;
    ps = OpacityOverride.x;
    r8.w = dot(r4.zxy, r4.zxy);
    r13.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.w = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    r10 = r6.yxzw * 2.0 - 1.0;
    r12.xyz = r7.xyz * 2.0 - 1.0;
    r7.yz = r8.yz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r12.zxy, r12.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r11.w));
    r7.x = dot(r10.zyx, r10.zyx);
    r7.w = ps;
    r6.xyz = r11.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r8.w));
    r2.xzw = r7.www * r2.zxy;
    r7.w = ps;
    ps = UniformVector_2.z * r6.x;
    r11.xyz = r7.www * r4.xyz;
    r2.y = ps;
    ps = rsqrt(abs(r7.x));
    r4.y = max(r11.z, 0.0);
    r6.x = ps;
    ps = rsqrt(abs(r6.w));
    r15.xyz = r10.xzy * r6.xxx;
    r6.x = ps;
    ps = r2.y;
    r12.xyz = r12.xzy * r6.xxx;
    r6.x = ps;
    ps = (-1.0) + r6.x;
    r4.xzw = r15.yzx * r12.zyx;
    r6.w = ps;
    r4.xzw = r15.xyz * r12.yxz - r4.xzw;
    ps = 0.1 + r2.x;
    r10.xyz = r4.xzw * r10.www;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r7.x = dot(r10.zxy, r10.zxy);
    r4.x = saturate(ps);
    ps = r3.w;
    r4.xy = -r4.xy + 1.0;
    ps = 0.0001 * ps;
    r13.yz = r4.xx * ModShadowGroupColor.xy;
    r13.w = saturate(ps);
    r14 = -r13.wxyz + 1.0;
    r8.w = r14.x * UniformScalar_1.x;
    r6.yz = r8.ww * r7.yz + r6.yz;
    r6.yz = r6.yz * UniformVector_2.xy;
    ps = r1.w;
    r6.xyw = r6.yzw * r14.xxx;
    ps = UniformVector_5.x * ps;
    r6.z = r6.w + 1.0;
    r7.z = ps;
    r6.xyz = (r14.xxx > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r14.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.x));
    r6.x = dot(r6.wyz, r6.wyz);
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r13.xyz = r10.xzy * r7.xxx;
    r6.x = ps;
    ps = r1.z;
    r10.xyz = r6.yzw * r6.xxx;
    ps = UniformVector_5.y * ps;
    r6.x = dot(r10.zxy, r11.zxy);
    r7.w = ps;
    ps = r0.z;
    r6.xyz = r10.xzy * r6.xxx;
    r11.xyz = r6.xyz * 2.0 - r11.xzy;
    ps = abs(r9.x) * ps;
    r6.xyz = r15.zxy * r11.yyy;
    r7.x = ps;
    r6.xyz = r13.xzy * r11.zzz + r6.xyz;
    r6.xyw = r12.yzx * r11.xxx + r6.zyx;
    ps = r0.w;
    r12.xyz = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r12.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    ps = abs(r9.y) * ps;
    r6 = xe_cube(r6.xzy);
    r7.y = ps;
    ps = 1.0 / abs(r6.z);
    r12.z = r6.w;
    r0.z = ps;
    r12.xy = r6.yx * r0.zz + 1.5;
    r0.w = tex2D(Texture2D_2, r1.xy).x;
    r9.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r15.xyz = texCUBE(TextureCube_0, xe_cube_dir(r12.xyz)).xyz;
    r13.xyz = tex2D(Texture2D_4, r7.zw).xyz;
    r6.xzw = tex2D(LightMapTexture, r0.xy).yxz;
    r7.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r6.y = UniformScalar_9.x * (-XE_FLT_MAX);
    r17.xyz = UniformVector_3.xyz * UniformVector_3.www;
    ps = -ModShadowColor.x;
    r18.xyz = UniformVector_4.xyz * UniformVector_4.www;
    ps = 1.0 + ps;
    r1.xyw = -UniformVector_0.xyz + 1.0;
    r12.y = ps;
    ps = -ModShadowColor.y;
    r7.z = float((UniformScalar_14.x >= 1.0));
    ps = 1.0 + ps;
    r7.w = float((UniformScalar_14.x > 1.0));
    r12.z = ps;
    ps = -ModShadowColor.z;
    r1.z = float((UniformScalar_13.x >= 1.0));
    ps = 1.0 + ps;
    r0.x = dot(r5.zxy, r5.zxy);
    r12.w = ps;
    ps = (-1.0) + r8.x;
    r0.y = float((UniformScalar_13.x > 1.0));
    r16.x = ps;
    r13.xyz = (-abs(r0.yyy) >= 0.0) ? r13.xyz : 1.0;
    ps = rsqrt(abs(r0.x));
    r4.z = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r0.x = ps;
    ps = pow(2.0, r6.y);
    r8.xyz = r18.xyz * r16.yzw;
    r6.y = ps;
    ps = 0.875 * r7.x;
    r0.xyz = r0.xxx * r5.xyz;
    r16.y = ps;
    r5.xyz = r8.xyz * UniformScalar_7.xxx + UniformScalar_8.xxx;
    ps = 0.875 * r7.y;
    r18.xyz = r4.zzz - r15.xyz;
    r16.z = ps;
    r13.xyz = (-abs(r1.zzz) >= 0.0) ? 1.0 : r13.xyz;
    ps = LightMapScale.x * r6.z;
    r8.xyz = r8.xyz * r13.xyz;
    r4.x = ps;
    r15.xyz = r18.xyz * UniformScalar_6.xxx + r15.xyz;
    ps = log2(abs(r4.y));
    r15.xyz = r17.xyz * r15.xyz;
    r7.x = ps;
    ps = LightMapScale.y * r6.x;
    r7.y = r7.x * UniformScalar_3.x;
    r4.y = ps;
    ps = pow(2.0, r7.y);
    r7.x = float((r14.y >= 0.004));
    r7.y = ps;
    r1.z = r7.y * UniformScalar_5.x + UniformScalar_4.x;
    r14.xyz = r16.xyz * r14.xzw + float3(1.0, 0.125, 0.125);
    r7.y = (r8.w > 0.0) ? r14.x : 1.0;
    ps = LightMapScale.z * r6.w;
    r15.xyz = r15.xyz * r1.zzz;
    r4.z = ps;
    ps = UniformScalar_10.x * r6.y;
    r5.xyz = r15.xyz * r5.xyz;
    r5.w = ps;
    r12.x = (r8.w >= 0.0) ? r7.y : 1.0;
    ps = r14.y * r14.z;
    r8.yzw = r8.xzy * r12.xxx;
    r13.w = ps;
    ps = r8.y;
    r9.xyz = -r8.ywz + r9.xyz;
    ps = r1.x * ps;
    r6 = r13.wxww * r12.wxzy;
    r8.x = ps;
    ps = r8.w;
    r5 = r5 * r6.yyyy;
    r9.xyz = r9.xyz * UniformScalar_15.xxx + r8.ywz;
    r9.xyz = r9.xyz * UniformScalar_16.xxx + UniformScalar_17.xxx;
    ps = r1.y * ps;
    r5 = r5 * r0.wwww;
    r8.y = ps;
    r5 = (-abs(r7.wwww) >= 0.0) ? r5 : 0.0;
    r5 = (-abs(r7.zzzz) >= 0.0) ? 0.0 : r5;
    ps = r8.z;
    r7.yzw = r5.xyz + UniformVector_0.xyz;
    ps = r1.w * ps;
    r1.xyz = r9.xzy + r5.www;
    r8.z = ps;
    r5.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz + r7.yzw;
    ps = r6.w;
    r7.z = saturate(dot(r2.xzw, r11.yxz));
    r6.y = ps;
    ps = log2(r7.z);
    r7.y = dot(r0.zxy, r10.zxy);
    r7.z = ps;
    ps = ModShadowColor.x + r6.y;
    r0.xyz = r7.yyz * float3(-0.5, 0.5, 15.0);
    r7.y = ps;
    ps = pow(2.0, r0.z);
    r7.zw = r0.xy + 0.5;
    r8.w = ps;
    ps = abs(r7.z) * abs(r7.z);
    r0.xyz = r4.xzy * r10.zzz;
    r7.z = ps;
    ps = abs(r7.w) * abs(r7.w);
    r2.xyz = r4.xzy * r8.www;
    r7.w = ps;
    ps = ModShadowColor.y + r6.z;
    r4.xyz = r8.xzy * r7.zzz;
    r7.z = ps;
    ps = ModShadowColor.z + r6.x;
    r9.xyz = r8.xzy * r7.www;
    r7.w = ps;
    r6.xyz = r9.xyz * UpperSkyColor.xzy + r5.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r2.xyz * r1.xyz + r6.xzy;
    r6.xyz = r0.xzy * r8.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.yzw;
    ps = OpacityOverride.x + ps;
    r8.xyz = r6.xyz - r6.xyz;
    r8.w = ps;
    oC0.w = r8.w * r7.x + r3.w;
    r6.xyz = r8.xyz * r7.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
