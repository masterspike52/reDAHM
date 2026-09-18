// ps_df43047733123d39.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000264 10040B00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
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
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r2.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = dot(r3.zxy, r3.zxy);
    r2.y = ps;
    r2.xy = r2.xy * abs(r5.xy);
    r6.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r11.yz = tex2D(ModShadowAccumTexture, r2.xy).xy;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r2.x = dot(r1.zxy, r1.zxy);
    r0.x = dot(r4.zxy, r4.zxy);
    r5.xyz = r8.xyz * r10.xyz;
    r9.xyz = r9.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r10.xyz = r10.xyz * AmbientColorAndSkyFactor.xyz;
    r0.y = ps;
    r8.xyz = r10.xyz * r8.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r0.x));
    r10.xyz = r0.yyy * r3.xyz;
    r0.x = ps;
    r0.yzw = r0.xxx * r4.xyz;
    ps = rsqrt(abs(r2.x));
    r0.x = dot(r9.xyz, r9.xyz);
    r2.x = ps;
    ps = rsqrt(abs(r0.x));
    r2.xyz = r2.xxx * r1.zxy;
    r0.x = ps;
    ps = OpacityOverride.x;
    r1.xyz = r9.xyz * r0.xxx;
    r9.z = saturate(ps);
    ps = 0.1 - -r2.x;
    r1.xyw = r1.yzx * TwoSidedSign.xxx;
    r0.x = ps;
    ps = 5.0 * r0.x;
    r11.x = dot(r0.wyz, r1.wxy);
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r0.y = dot(r1.wxy, r10.zxy);
    r0.z = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r0.xyw = r1.xyw * r0.yyy;
    r9.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r3 = r11.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    r9.y = ps;
    r4.xyz = r0.xyw * 2.0 - r10.xyz;
    r0.xyz = -r9.zxy + 1.0;
    r0.w = float((r0.x >= 0.004));
    r0.x = saturate(dot(r2.xyz, r4.zxy));
    r3.xy = r3.xy * r0.yz + 0.125;
    ps = ConstantLighting.x * r1.w;
    r0.yz = r3.zw + 0.5;
    r4.x = ps;
    ps = ConstantLighting.y * r1.w;
    r0.yz = abs(r0.yz) * abs(r0.yz);
    r4.y = ps;
    ps = log2(r0.x);
    r1.z = r3.x * r3.y;
    r0.x = ps;
    r3.xyz = r1.zzz * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r0.x;
    r7.xyz = r5.xzy * r0.yyy;
    r1.z = ps;
    ps = pow(2.0, r1.z);
    r0.xyz = r5.xzy * r0.zzz;
    r1.z = ps;
    r0.xyz = r0.xyz * UpperSkyColor.xzy + r8.xzy;
    r0.xyz = r7.xzy * LowerSkyColor.xyz + r0.xzy;
    ps = ConstantLighting.z * r1.w;
    r7.xyz = r1.zzz * ConstantLighting.xzy;
    r4.z = ps;
    r0.xyz = r7.xyz * r6.xzy + r0.xzy;
    r0.xyz = r4.xyz * r5.xyz + r0.xzy;
    ps = -r2.w;
    r0.xyz = r0.xyz * r3.xyz;
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
