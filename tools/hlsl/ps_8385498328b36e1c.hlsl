// ps_8385498328b36e1c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 132 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000210 10040A00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 LightMapScale : register(c9); // float3
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
sampler2D LightMapTexture : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xyz = AmbientColorAndSkyFactor.xyz * UniformVector_1.xyz;
    r0.w = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r5.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r0.zw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = dot(r4.zxy, r4.zxy);
    r0.y = dot(r3.zxy, r3.zxy);
    r5.w = dot(r1.zxy, r1.zxy);
    r7.xyz = r7.xyz * r10.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r5.w));
    r0.zw = r0.zw * 0.875;
    r5.w = ps;
    ps = rsqrt(abs(r0.y));
    r9.xyz = r5.www * r1.xyz;
    r0.y = ps;
    ps = OpacityOverride.x;
    r1.xyw = r0.yyy * r3.xyz;
    r1.z = saturate(ps);
    r8.x = r1.w * 2.0 - r1.w;
    ps = -r1.x;
    r0.y = r9.z + 0.1;
    r8.y = ps;
    ps = -r1.y;
    r0.y = saturate(r0.y * 5.0);
    r8.z = ps;
    ps = 1.0 - r0.y;
    r3.xyz = r10.xyz * UniformVector_1.xyz;
    r1.x = ps;
    ps = rsqrt(abs(r0.x));
    r0.y = saturate(dot(r9.xyz, r8.yzx));
    r0.x = ps;
    ps = log2(r0.y);
    r1.xy = r1.xx * ModShadowGroupColor.xy;
    r0.y = ps;
    ps = 15.0 * r0.y;
    r5.xyz = r5.xyz * LightMapScale.xyz;
    r8.x = ps;
    ps = (-0.5) * r0.x;
    r9.xyz = -r1.xyz + 1.0;
    r8.y = ps;
    ps = 0.5 * r0.x;
    r1.xy = r0.zw * r9.xy;
    r8.z = ps;
    r1.zw = r8.yz * r4.zz;
    ps = pow(2.0, r8.x);
    r0.w = float((r9.z >= 0.004));
    r0.x = ps;
    r4.xyz = r5.xzy * r0.xxx;
    r1 = r1.zwxy + float4(0.5, 0.5, 0.125, 0.125);
    ps = r1.z * r1.w;
    r1.xy = abs(r1.xy) * abs(r1.xy);
    r0.x = ps;
    r0.xyz = r0.xxx * r6.xyz + ModShadowColor.xyz;
    r6.xyz = r3.xzy * r1.xxx;
    r1.xyz = r3.xzy * r1.yyy;
    r1.xyz = r1.xzy * UpperSkyColor.xyz + r7.xyz;
    r1.xyz = r6.xyz * LowerSkyColor.xzy + r1.xzy;
    r1.xyz = r4.xyz * 0.21952 + r1.xyz;
    r1.xyz = r5.xyz * r3.xyz + r1.xzy;
    ps = -r2.w;
    r0.xyz = r1.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r2.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
