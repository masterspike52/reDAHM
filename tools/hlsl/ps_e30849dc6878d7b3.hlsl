// ps_e30849dc6878d7b3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 252 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003F0 10041100 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c18); // float4
float4 LightMapScale : register(c19); // float3
float4 LowerSkyColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 OpacityOverride : register(c15); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c14); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_8 : register(c12); // float
float4 UniformScalar_9 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c16); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D LightMapTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_4, r1.xy);
    ps = UniformVector_4.y;
    r7.xy = r1.wz * UniformVector_5.xy;
    ps = UniformScalar_5.x * ps;
    r6.y = UniformScalar_1.x * UniformVector_2.x;
    r9.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = UniformVector_2.x * UniformScalar_4.x;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.z = r14.w - 0.5;
    r6.w = ps;
    ps = UniformVector_4.x * r6.y;
    r6.xw = r6.xw * abs(r8.xy);
    r9.x = ps;
    ps = UniformVector_4.x * r6.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.zzzz)) clip(-1.0);
    r9.z = ps;
    ps = OpacityOverride.x;
    r9.y = UniformScalar_2.x * UniformVector_4.y;
    r8.w = saturate(ps);
    r9 = r9 + r1.xyxy;
    r12.yz = tex2D(ModShadowAccumTexture, r6.xw).xy;
    r16 = tex2D(Texture2D_1, r9.xy);
    r6.xzw = tex2D(Texture2D_0, r1.xy).xyz;
    r17 = tex2D(Texture2D_2, r9.zw);
    r8.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r7.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    ps = -ModShadowColor.x;
    r1.w = dot(r5.zxy, r5.zxy);
    ps = 1.0 + ps;
    r9.xyz = UniformVector_3.xyz * 2e+01;
    r11.x = ps;
    ps = -ModShadowColor.y;
    r9.w = float((UniformScalar_8.x >= 1.0));
    ps = 1.0 + ps;
    r7.w = dot(r4.zxy, r4.zxy);
    r11.y = ps;
    ps = -ModShadowColor.z;
    r0.x = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r11.z = ps;
    ps = r3.w;
    r0.y = float((UniformScalar_8.x > 1.0));
    ps = 0.0001 * ps;
    r10.xyz = r1.xyz * AmbientColorAndSkyFactor.xyz;
    r6.y = saturate(ps);
    r15.xyz = (-abs(r0.yyy) >= 0.0) ? r8.xyz : 1.0;
    ps = rsqrt(abs(r0.x));
    r13.xyz = r14.xyz * UniformScalar_9.xxx;
    r0.x = ps;
    ps = rsqrt(abs(r7.w));
    r0.yzw = r17.xyz * r17.www;
    r7.w = ps;
    r6.xzw = r6.wxz * 2.0 - 1.0;
    r8.xyz = r16.xyz * r16.www + r0.yzw;
    ps = 1.0 - r6.y;
    r0.xyz = r0.xxx * r2.zxy;
    r0.w = ps;
    r15.xyz = (-abs(r9.www) >= 0.0) ? 1.0 : r15.xyz;
    r2.xyz = r13.xzy * r15.xzy + UniformScalar_10.xxx;
    ps = UniformVector_2.z * r6.x;
    r8.xyz = r9.xyz * r8.xyz;
    r13.y = ps;
    ps = UniformVector_2.x * r6.z;
    r6.y = dot(r8.zxy, float3(0.11, 0.3, 0.59));
    r13.z = ps;
    ps = UniformVector_2.y * r6.w;
    r9.xyz = r8.xyz + UniformVector_0.xyz;
    r13.w = ps;
    r14.xyz = r15.xyz * r14.xyz + r8.xyz;
    r10.xyz = r10.xyz * r14.xyz + r9.xyz;
    ps = 0.1 - -r0.x;
    r6.y = r6.y - r8.x;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r8.z = saturate(r6.y + r8.x);
    r13.x = saturate(ps);
    ps = rsqrt(abs(r1.w));
    r6.xz = -r13.yx + 1.0;
    r6.y = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r9.yzw = r6.yyy * r5.xyz;
    r8.x = ps;
    ps = r6.x;
    r1.xyz = r14.xyz * r1.xyz;
    ps = r8.z * ps;
    r5.yz = -r13.zw * r8.zz;
    r5.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r5.yzw = r13.yzw + r5.xyz;
    r8.y = ps;
    ps = LightMapScale.x * r7.y;
    r8 = -r8.wxyz + 1.0;
    r9.x = ps;
    ps = r7.w;
    r5.x = r5.y - 1.0;
    ps = r4.x * ps;
    r5.yzw = r5.zwx * r0.www;
    r6.x = ps;
    ps = r7.w;
    r5.x = r5.w + 1.0;
    r6.yzw = (r0.www > 0.0) ? r5.xyz : float3(1.0, 0.0, 0.0);
    r5.xyz = (r0.www >= 0.0) ? r6.yzw : float3(1.0, 0.0, 0.0);
    ps = r4.y * ps;
    r6.z = dot(r5.xyz, r5.xyz);
    r6.y = ps;
    ps = rsqrt(abs(r6.z));
    r6.w = float((r8.x >= 0.004));
    r6.z = ps;
    ps = r7.w;
    r5.xyz = r5.xyz * r6.zzz;
    ps = r4.z * ps;
    r12.x = dot(r9.wyz, r5.xyz);
    r6.z = ps;
    ps = LightMapScale.y * r7.z;
    r7.w = dot(r5.xyz, r6.zxy);
    r9.y = ps;
    ps = LightMapScale.z * r7.x;
    r4.xyz = r5.yzx * r7.www;
    r9.z = ps;
    ps = r9.x;
    r7 = r12.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    r6.xyz = r4.xyz * 2.0 - r6.xyz;
    ps = r5.x * ps;
    r6.x = saturate(dot(r0.xyz, r6.zxy));
    r0.x = ps;
    r7.xy = r7.xy * r8.yz + 0.125;
    ps = r9.z;
    r6.yz = r7.zw + 0.5;
    ps = r5.x * ps;
    r6.yz = abs(r6.yz) * abs(r6.yz);
    r0.y = ps;
    ps = log2(r6.x);
    r7.x = r7.x * r7.y;
    r6.x = ps;
    r7.xyz = r7.xxx * r11.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r4.xyz = r1.xzy * r6.yyy;
    r7.w = ps;
    ps = pow(2.0, r7.w);
    r6.xyz = r1.xzy * r6.zzz;
    r7.w = ps;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r10.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    ps = r9.y;
    r4.xyz = r9.xyz * r7.www;
    ps = r5.x * ps;
    r4.xyz = r4.xzy * r8.www;
    r0.z = ps;
    r6.xyz = r4.xyz * r2.xyz + r6.xzy;
    r6.xyz = r0.xzy * r1.xyz + r6.xzy;
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
