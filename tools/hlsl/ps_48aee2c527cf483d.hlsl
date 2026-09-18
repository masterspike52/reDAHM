// ps_48aee2c527cf483d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10040900 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = dot(r1.zxy, r1.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    r5.xy = r6.xy * abs(r5.xy);
    r9.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.yzw = tex2D(LightMapTexture, r0.xy).xyz;
    r5.x = -UniformVector_0.x + 1.0;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r0.z));
    r7.xyz = r5.yzw * LightMapScale.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r6.w));
    r0.yzw = r0.yyy * r1.xyz;
    r1.x = ps;
    ps = OpacityOverride.x;
    r1.xyz = r1.xxx * r3.xyz;
    r5.w = saturate(ps);
    ps = rsqrt(abs(r0.x));
    r8.yz = -r1.xy;
    r9.x = ps;
    r8.x = r1.z * 2.0 - r1.z;
    ps = 0.1 - -r0.w;
    r1 = r9.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r0.x = ps;
    ps = 5.0 * r0.x;
    r3.xy = r1.xy * r4.zz;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r0.y = saturate(dot(r0.yzw, r8.yzx));
    r0.x = ps;
    ps = log2(r0.y);
    r5.yz = r0.xx * ModShadowGroupColor.xy;
    r0.y = ps;
    r0.xzw = -r5.ywz + 1.0;
    ps = 15.0 * r0.y;
    r3.zw = r1.zw * r0.xw;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r0.w = float((r0.z >= 0.004));
    r5.y = ps;
    r1 = r7.xyzx * r5.xyyy;
    r3 = r3 + float4(0.5, 0.5, 0.125, 0.125);
    ps = r3.z * r3.w;
    r1.yzw = r1.yzw * 0.21952;
    r0.x = ps;
    ps = r1.x;
    r3.xy = abs(r3.xy) * abs(r3.xy);
    r0.xyz = r0.xxx * r6.xyz + ModShadowColor.xyz;
    ps = r1.w + ps;
    r3.xy = r3.xy * r5.xx;
    r1.x = ps;
    r1.x = r3.x * LowerSkyColor.x + r1.x;
    r1.x = r3.y * UpperSkyColor.x + r1.x;
    r1.x = r5.x * AmbientColorAndSkyFactor.x + r1.x;
    r1.xyz = r1.xyz + UniformVector_0.xyz;
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
