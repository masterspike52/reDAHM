// ps_cc76335e1926d196.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 135 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000021C 10040A00 00000606 00000000 000050C6 003F003F 00000001 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LightMapScale : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D LightMapTexture : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r0.zw = r1.xy * 2e+01;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.y = dot(r5.zxy, r5.zxy);
    r1.x = ps;
    r1.xz = r1.xz * abs(r6.xy);
    r10.xy = tex2D(ModShadowAccumTexture, r1.xz).xy;
    r6.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r0.yzw = tex2D(Texture2D_0, r0.zw).xyz;
    r0.x = dot(r2.zxy, r2.zxy);
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r1.x = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r1.y));
    r7.xyz = r6.xyz * LightMapScale.xyz;
    r10.z = ps;
    ps = rsqrt(abs(r1.x));
    r6.xyz = r8.xyz * r0.yzw;
    r1.x = ps;
    ps = rsqrt(abs(r0.x));
    r9.xyz = r1.xxx * r4.xyz;
    r0.x = ps;
    ps = -r9.x;
    r1.xyz = r0.xxx * r2.xzy;
    r2.y = ps;
    r2.x = r9.z * 2.0 - r9.z;
    ps = -r9.y;
    r4 = r10.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r2.z = ps;
    ps = 0.1 - -r1.y;
    r4.zw = r4.zw * r5.zz;
    r0.x = ps;
    ps = 5.0 * r0.x;
    r1.w = saturate(dot(r1.xzy, r2.yzx));
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    ps = OpacityOverride.x;
    r1.xy = r0.xx * ModShadowGroupColor.xy;
    r1.z = saturate(ps);
    ps = log2(r1.w);
    r1.xyz = -r1.zxy + 1.0;
    r0.x = ps;
    r2 = r0 * float4(15.0, 0.5, 0.5, 0.5);
    ps = AmbientColorAndSkyFactor.x * r0.y;
    r4.xy = r4.xy * r1.yz;
    r9.x = ps;
    ps = AmbientColorAndSkyFactor.y * r0.z;
    r1.yzw = r2.yzw + UniformVector_0.xyz;
    r9.y = ps;
    ps = pow(2.0, r2.x);
    r1.x = float((r1.x >= 0.004));
    r2.x = ps;
    ps = AmbientColorAndSkyFactor.z * r0.w;
    r2.xyz = r7.xzy * r2.xxx;
    r9.z = ps;
    r1.yzw = r9.xyz * r8.xyz + r1.yzw;
    r0 = r4 + float4(0.125, 0.125, 0.5, 0.5);
    ps = r0.x * r0.y;
    r4.xw = abs(r0.zw) * abs(r0.zw);
    r0.x = ps;
    r0.xyz = r0.xxx * r5.xyz + ModShadowColor.xyz;
    r4.xyz = r6.xzy * r4.xxx;
    r5.xyz = r6.xzy * r4.www;
    r1.yzw = r5.xzy * UpperSkyColor.xyz + r1.yzw;
    r1.yzw = r4.xyz * LowerSkyColor.xzy + r1.ywz;
    r1.yzw = r2.xyz * 0.21952 + r1.yzw;
    r1.yzw = r7.xyz * r6.xyz + r1.ywz;
    ps = -r3.w;
    r0.xyz = r1.yzw * r0.xyz;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xyz - r0.xyz;
    r2.w = ps;
    oC0.w = r2.w * r1.x + r3.w;
    r0.xyz = r2.xyz * r1.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
