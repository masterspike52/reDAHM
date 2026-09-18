// ps_1d6fbb30f0ba266d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 309 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004D4 10040F00 0000090A 00000000 00008929 003F01FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
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

float4 AmbientColorAndSkyFactor : register(c24); // float4
float4 LightMapScale : register(c25); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c23); // float3
float4 ModShadowAccumResolution : register(c28); // float2
float4 ModShadowColor : register(c26); // float3
float4 ModShadowGroupColor : register(c27); // float3
float4 OpacityOverride : register(c21); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c19); // float
float4 UniformScalar_11 : register(c20); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformScalar_3 : register(c12); // float
float4 UniformScalar_4 : register(c13); // float
float4 UniformScalar_5 : register(c14); // float
float4 UniformScalar_6 : register(c15); // float
float4 UniformScalar_7 : register(c16); // float
float4 UniformScalar_8 : register(c17); // float
float4 UniformScalar_9 : register(c18); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_2 : register(c7); // float4
float4 UniformVector_3 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UpperSkyColor : register(c22); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
samplerCUBE TextureCube_0 : register(s3);
sampler2D LightMapTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_2, r1.xy);
    ps = (-0.5) + r13.w;
    r8.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r8.xxxx)) clip(-1.0);
    r8.xyw = tex2D(Texture2D_0, r1.xy).xyz;
    ps = OpacityOverride.x;
    r10.x = saturate(r3.w * 0.0001);
    r10.w = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.z = dot(r2.zxy, r2.zxy);
    r14.x = ps;
    r12 = r6.yxzw * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r14.y = ps;
    r15.xyz = r7.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r7.w = dot(r15.zxy, r15.zxy);
    r6.w = ps;
    r6.xyz = r8.wxy * 2.0 - 1.0;
    ps = UniformVector_2.x * r6.y;
    r8.x = dot(r12.zyx, r12.zyx);
    r8.y = ps;
    ps = rsqrt(abs(r8.z));
    r11.xyz = r6.www * r4.xyz;
    r6.w = ps;
    ps = UniformVector_2.y * r6.z;
    r7.xyz = r6.www * r2.zxy;
    r8.z = ps;
    ps = rsqrt(abs(r8.x));
    r6.w = max(r11.z, 0.0);
    r6.y = ps;
    ps = rsqrt(abs(r7.w));
    r4.xyz = r12.xzy * r6.yyy;
    r6.y = ps;
    ps = 0.1 - -r7.x;
    r2.yzw = r15.xzy * r6.yyy;
    r6.y = ps;
    ps = 5.0 * r6.y;
    r15.xyz = r4.yzx * r2.wzy;
    r6.z = saturate(ps);
    r15.xyz = r4.xyz * r2.zyw - r15.xyz;
    ps = 1.0 - r6.z;
    r12.xyz = r15.xyz * r12.www;
    r7.w = ps;
    ps = 1.0 - r6.w;
    r0.z = dot(r12.zxy, r12.zxy);
    r0.w = ps;
    ps = UniformVector_2.z * r6.x;
    r10.yz = r7.ww * ModShadowGroupColor.xy;
    r8.x = ps;
    ps = (-1.0) - -r8.x;
    r10 = -r10.wxyz + 1.0;
    r8.w = ps;
    r6.xyz = r8.wyz * r10.yyy;
    ps = 1.0 + r6.x;
    r7.w = float((UniformScalar_9.x > 1.0));
    r6.w = ps;
    r6.xyz = (r10.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r10.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r0.z));
    r6.x = dot(r6.wyz, r6.wyz);
    r8.x = ps;
    ps = rsqrt(abs(r6.x));
    r8.xyz = r12.xzy * r8.xxx;
    r6.x = ps;
    r12.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r12.zxy, r11.zxy);
    ps = r14.x;
    r6.xyz = r12.xzy * r6.xxx;
    r11.xyz = r6.xyz * 2.0 - r11.xzy;
    ps = abs(r9.x) * ps;
    r6.xyz = r4.zxy * r11.yyy;
    r2.x = ps;
    r6.xyz = r8.xzy * r11.zzz + r6.xyz;
    r6.xyw = r2.zwy * r11.xxx + r6.zyx;
    ps = r14.y;
    r8.xyz = r6.xxx * LocalToWorldMatrix[2].xyz;
    r6.xyz = r6.yyy * LocalToWorldMatrix[1].xyz + r8.xyz;
    r6.xyz = r6.www * LocalToWorldMatrix[0].xzy + r6.xzy;
    ps = abs(r9.y) * ps;
    r6 = xe_cube(r6.xzy);
    r2.y = ps;
    ps = 1.0 / abs(r6.z);
    r8.z = r6.w;
    r8.x = ps;
    r8.xy = r6.yx * r8.xx + 1.5;
    r4.yz = tex2D(ModShadowAccumTexture, r2.xy).xy;
    r8.w = tex2D(Texture2D_1, r1.xy).x;
    r14.xyz = texCUBE(TextureCube_0, xe_cube_dir(r8.xyz)).xyz;
    r1.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    ps = UniformScalar_7.x;
    r6.x = dot(r5.zxy, r5.zxy);
    ps = (-XE_FLT_MAX) * ps;
    r0.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r0.xyz = r0.xyz * r13.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r8.xyz = r0.xyz * r8.xyz;
    r6.w = ps;
    r9.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r6.x = float((UniformScalar_9.x >= 1.0));
    r2.xyz = r1.xyz * LightMapScale.xyz;
    r6.z = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    r13.xyz = r6.www * r5.xyz;
    r1.xyz = r0.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    r0.xyz = r0.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r5.xyz = r6.zzz - r14.xyz;
    r5.xyz = r5.xyz * UniformScalar_4.xxx + r14.xyz;
    ps = log2(abs(r0.w));
    r5.xyz = r9.xyz * r5.xyz;
    r6.z = ps;
    ps = UniformScalar_1.x * r6.z;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = ps;
    ps = pow(2.0, r6.z);
    r6.w = float((r10.x >= 0.004));
    r6.z = ps;
    r6.z = r6.z * UniformScalar_3.x + UniformScalar_2.x;
    r5.xyz = r5.xyz * r6.zzz;
    ps = UniformScalar_8.x * r6.y;
    r0.xyz = r5.xyz * r0.xyz;
    r0.w = ps;
    r0 = r0 * r8.wwww;
    r0 = (-abs(r7.wwww) >= 0.0) ? r0 : 0.0;
    r0 = (-abs(r6.xxxx) >= 0.0) ? 0.0 : r0;
    r6.xyz = r0.xyz + UniformVector_0.xyz;
    r1.xyz = r1.xzy + r0.www;
    r0.xyz = r2.xzy * r12.zzz;
    r5.xyz = r8.xyz * AmbientColorAndSkyFactor.xyz + r6.xyz;
    r4.x = dot(r13.zxy, r12.zxy);
    r4 = r4.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.x = saturate(dot(r7.xyz, r11.yxz));
    r6.yz = r4.zw * r10.zw + 0.125;
    r7.xy = r4.xy + 0.5;
    r4.xy = abs(r7.xy) * abs(r7.xy);
    ps = log2(r6.x);
    r6.y = r6.y * r6.z;
    r6.x = ps;
    r7.xyz = r6.yyy * r9.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r9.xyz = r8.xzy * r4.yyy;
    r7.w = ps;
    r6.xyz = r9.xyz * UpperSkyColor.xzy + r5.xzy;
    ps = pow(2.0, r7.w);
    r4.xyz = r8.xzy * r4.xxx;
    r7.w = ps;
    r2.xyz = r2.xzy * r7.www;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r2.xyz * r1.xyz + r6.xzy;
    r6.xyz = r0.xzy * r8.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
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
