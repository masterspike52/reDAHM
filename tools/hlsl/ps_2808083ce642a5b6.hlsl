// ps_2808083ce642a5b6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 249 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003E4 10041200 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 LightMapScale : register(c17); // float3
float4 LowerSkyColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 OpacityOverride : register(c13); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_11 : register(c10); // float
float4 UniformScalar_12 : register(c11); // float
float4 UniformScalar_13 : register(c12); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c14); // float3
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
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_4, r1.xy);
    ps = r15.w;
    r7.xy = r1.wz * UniformVector_5.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = ps;
    ps = (-0.5) + r6.y;
    r6.xz = r6.xz * abs(r8.xy);
    r6.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r13.yz = tex2D(ModShadowAccumTexture, r6.xz).xy;
    r10 = tex2D(Texture2D_2, r1.xy);
    r6.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r11 = tex2D(Texture2D_1, r1.xy);
    r12.yzw = tex2D(Texture2D_3, r7.xy).xyz;
    r7.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    ps = OpacityOverride.x;
    r17.xyz = UniformVector_3.xzy * 2e+01;
    r12.x = saturate(ps);
    ps = r3.w;
    r7.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = 0.0001 * ps;
    r1.w = float((UniformScalar_11.x >= 1.0));
    r0.y = saturate(ps);
    ps = UniformVector_4.x;
    r8.w = dot(r5.zxy, r5.zxy);
    ps = 2e+01 * ps;
    r0.x = dot(r2.zxy, r2.zxy);
    r18.x = ps;
    ps = UniformVector_4.z;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    ps = 2e+01 * ps;
    r0.z = float((UniformScalar_11.x > 1.0));
    r18.y = ps;
    ps = UniformVector_4.y;
    r14.xyz = r1.xyz * AmbientColorAndSkyFactor.xyz;
    ps = 2e+01 * ps;
    r8.xyz = r15.xyz * UniformScalar_12.xxx;
    r18.z = ps;
    r12.yzw = (-abs(r0.zzz) >= 0.0) ? r12.yzw : 1.0;
    ps = rsqrt(abs(r0.x));
    r16.xyz = r11.xzy * r11.www;
    r0.z = ps;
    r6.xyz = r6.zxy * 2.0 - 1.0;
    ps = UniformVector_2.z * r6.x;
    r10.xyz = r10.xzy * r10.www;
    r0.x = ps;
    ps = UniformVector_2.x * r6.y;
    r11.xyz = r0.zzz * r2.xyz;
    r0.z = ps;
    ps = UniformVector_2.y * r6.z;
    r10.xyz = r18.xyz * r10.xyz;
    r0.w = ps;
    ps = rsqrt(abs(r8.w));
    r2.xyz = r17.xyz * r16.xyz;
    r6.y = ps;
    r16.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r12.yzw;
    r8.xyz = r8.xzy * r16.xzy + UniformScalar_13.xxx;
    r12.yzw = (-abs(r7.www) >= 0.0) ? r10.xyz : r2.xyz;
    ps = rsqrt(abs(r6.w));
    r6.x = r11.z + 0.1;
    r6.z = ps;
    ps = 5.0 * r6.x;
    r10.xyz = r6.zzz * r4.xyz;
    r6.z = saturate(ps);
    ps = r0.x;
    r5.xyz = r6.yyy * r5.xyz;
    r6.y = ps;
    ps = 1.0 - r6.y;
    r6.w = saturate(dot(r12.wzy, float3(0.59, 0.11, 0.3)));
    r7.w = ps;
    ps = 1.0 - r0.y;
    r2.xyz = r12.ywz + UniformVector_0.xyz;
    r6.x = ps;
    r4.xyz = r16.xyz * r15.xyz + r12.ywz;
    r2.xyz = r14.xyz * r4.xyz + r2.xyz;
    ps = r7.w;
    r6.y = dot(r12.zyw, float3(0.11, 0.3, 0.59));
    ps = r6.w * ps;
    r6.y = r6.y - r12.y;
    r14.x = ps;
    ps = r6.y;
    r14.yz = -r0.zw * r6.ww;
    ps = r12.y + ps;
    r0.yzw = r0.xzw + r14.xyz;
    r6.w = saturate(ps);
    ps = (-1.0) - -r0.y;
    r6.yz = -r6.wz + 1.0;
    r0.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r1.xyz = r4.xyz * r1.xyz;
    r12.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r0.yzw = r0.xzw * r6.xxx;
    r12.z = ps;
    ps = 1.0 + r0.y;
    r4.xyz = -r12.xyz + 1.0;
    r0.x = ps;
    r0.xyz = (r6.xxx > 0.0) ? r0.xzw : float3(1.0, 0.0, 0.0);
    r0.xyz = (r6.xxx >= 0.0) ? r0.xyz : float3(1.0, 0.0, 0.0);
    r6.x = dot(r0.xyz, r0.xyz);
    ps = rsqrt(abs(r6.x));
    r6.w = float((r4.x >= 0.004));
    r6.x = ps;
    r0.xyz = r0.yzx * r6.xxx;
    ps = LightMapScale.x * r7.y;
    r13.x = dot(r5.zxy, r0.zxy);
    r5.x = ps;
    ps = LightMapScale.y * r7.z;
    r6.x = dot(r0.zxy, r10.zxy);
    r5.y = ps;
    ps = LightMapScale.z * r7.x;
    r12.xyz = r0.xyz * r6.xxx;
    r5.z = ps;
    ps = r5.x;
    r7 = r13.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    r10.xyz = r12.xyz * 2.0 - r10.xyz;
    ps = r0.z * ps;
    r6.x = saturate(dot(r11.zxy, r10.zxy));
    r0.x = ps;
    r7.xy = r7.xy * r4.yz + 0.125;
    ps = r5.z;
    r7.zw = r7.zw + 0.5;
    ps = r0.z * ps;
    r4.xw = abs(r7.zw) * abs(r7.zw);
    r0.y = ps;
    ps = log2(r6.x);
    r7.x = r7.x * r7.y;
    r6.x = ps;
    r7.xyz = r7.xxx * r9.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r4.xyz = r1.xzy * r4.xxx;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r9.xyz = r1.xzy * r4.www;
    r6.x = ps;
    r2.xyz = r9.xyz * UpperSkyColor.xzy + r2.xzy;
    r2.xyz = r4.xzy * LowerSkyColor.xyz + r2.xzy;
    ps = r5.y;
    r4.xyz = r5.xyz * r6.xxx;
    ps = r0.z * ps;
    r6.xyz = r4.xzy * r6.yyy;
    r0.z = ps;
    r6.xyz = r6.xyz * r8.xyz + r2.xzy;
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
