// ps_f01cccb474f37e52.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 162 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000288 10040C00 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 ConstantLighting : register(c9); // float3
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
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
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_1, r0.xy);
    r5.z = r9.w - 0.5;
    r5.y = 1.0 / ModShadowAccumResolution.y;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = 1.0 / ModShadowAccumResolution.x;
    r5.xy = r5.xy * abs(r7.xy);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r8.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r11.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = dot(r1.zxy, r1.zxy);
    r5.x = dot(r4.zxy, r4.zxy);
    r5.y = dot(r3.zxy, r3.zxy);
    r7.w = r9.w * OpacityOverride.x - r2.w;
    r7.xyz = r12.xyz * r9.xyz;
    r6.xyz = r6.zxy * 2.0 - 1.0;
    r0.xyz = r9.xyz * AmbientColorAndSkyFactor.xyz;
    r5.y = rsqrt(abs(r5.y));
    r9.xyz = r0.xyz * r12.xyz + UniformVector_0.xyz;
    r3.xyz = r5.yyy * r3.xyz;
    r5.x = rsqrt(abs(r5.x));
    r4.xyw = r5.xxx * r4.xyz;
    r5.y = r9.w;
    ps = rsqrt(abs(r5.z));
    r5.x = dot(r6.xyz, r6.xyz);
    r5.z = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r5.zzz * r1.zxy;
    r5.x = ps;
    ps = OpacityOverride.x * r5.y;
    r5.xzw = r6.xyz * r5.xxx;
    r4.z = saturate(ps);
    ps = 0.1 - -r0.x;
    r6.xyw = r5.zwx * TwoSidedSign.xxx;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r11.x = dot(r4.wxy, r6.wxy);
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r5.y = dot(r6.wxy, r3.zxy);
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r5.xyw = r6.xyw * r5.yyy;
    r4.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r4.y = ps;
    r3.xyz = r5.xyw * 2.0 - r3.xyz;
    r5.xyz = -r4.zxy + 1.0;
    r5.w = float((r5.x >= 0.004));
    r5.x = saturate(dot(r0.xyz, r3.zxy));
    r0.xy = r1.zw * r5.yz + 0.125;
    ps = ConstantLighting.x * r6.w;
    r5.yz = r1.xy + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r6.w;
    r5.yz = abs(r5.yz) * abs(r5.yz);
    r1.y = ps;
    ps = log2(r5.x);
    r6.z = r0.x * r0.y;
    r5.x = ps;
    r0.xyz = r6.zzz * r10.xyz + ModShadowColor.xyz;
    ps = 15.0 * r5.x;
    r3.xyz = r7.xzy * r5.yyy;
    r6.z = ps;
    ps = pow(2.0, r6.z);
    r5.xyz = r7.xzy * r5.zzz;
    r6.z = ps;
    r5.xyz = r5.xyz * UpperSkyColor.xzy + r9.xzy;
    r5.xyz = r3.xzy * LowerSkyColor.xyz + r5.xzy;
    ps = ConstantLighting.z * r6.w;
    r3.xyz = r6.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r5.xyz = r3.xyz * r8.xzy + r5.xzy;
    r5.xyz = r1.xyz * r7.xyz + r5.xzy;
    r5.xyz = r5.xyz * r0.xyz;
    r7.xyz = r5.xyz - r5.xyz;
    oC0.w = r7.w * r5.w + r2.w;
    r5.xyz = r7.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
