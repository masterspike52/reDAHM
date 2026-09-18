// ps_c55d7d2e383af8b3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 132 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000210 10040A00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c9); // float4
float4 ConstantLighting : register(c10); // float3
float4 LowerSkyColor : register(c8); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c7); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.z = saturate(OpacityOverride.x);
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r9.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5 = tex2D(Texture2D_0, r0.xy);
    ps = -ModShadowColor.x;
    r0.w = max(UniformScalar_0.x, 0.0001);
    ps = 1.0 + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r8.x = ps;
    ps = -ModShadowColor.y;
    r7.w = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r6.x = dot(r1.zxy, r1.zxy);
    r8.y = ps;
    ps = -ModShadowColor.z;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r0.xyz = r7.xyz * r5.xyz;
    r8.z = ps;
    ps = rsqrt(abs(r6.x));
    r10.xyz = r5.xyz * AmbientColorAndSkyFactor.xyz;
    r6.x = ps;
    r7.xyz = r10.xyz * r7.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r7.w));
    r6.xyz = r6.xxx * r1.xzy;
    r1.x = ps;
    ps = r5.w;
    r1.xyz = r1.xxx * r3.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r6.w));
    r3.yz = -r1.xy;
    r9.w = ps;
    r3.x = r1.z * 2.0 - r1.z;
    ps = 0.1 - -r6.y;
    r1 = r9.wxyw * float4(-0.5, 0.875, 0.875, 0.5);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r6.z = saturate(dot(r6.xzy, r3.yzx));
    r6.x = saturate(ps);
    ps = r1.x;
    r6.x = -r6.x + 1.0;
    ps = r4.z * ps;
    r9.xy = r6.xx * ModShadowGroupColor.xy;
    r1.x = ps;
    ps = r1.w;
    r6.xyw = -r9.xyz + 1.0;
    ps = r4.z * ps;
    r1.zw = r1.yz * r6.xy;
    r1.y = ps;
    ps = UniformVector_1.x * r5.y;
    r1 = r1 + float4(0.5, 0.5, 0.125, 0.125);
    r3.x = ps;
    ps = r1.z * r1.w;
    r6.x = float((r6.w >= 0.004));
    r6.y = ps;
    ps = log2(r6.z);
    r4.xy = abs(r1.xy) * abs(r1.xy);
    r4.z = ps;
    r6.yzw = r6.yyy * r8.xyz + ModShadowColor.xyz;
    ps = UniformVector_1.z * r5.w;
    r1 = r0.xzyw * r4.yyyz;
    r3.y = ps;
    ps = pow(2.0, r1.w);
    r4.xyz = r0.xzy * r4.xxx;
    r1.w = ps;
    r1.xyz = r1.xzy * UpperSkyColor.xyz + r7.xyz;
    r1.xyz = r4.xyz * LowerSkyColor.xzy + r1.xzy;
    ps = UniformVector_1.y * r5.w;
    r4.xyz = r1.www * ConstantLighting.xzy;
    r3.z = ps;
    r5.xyz = r4.xzy * r3.xzy + r1.xzy;
    r5.xyz = r0.xzy * ConstantLighting.xzy + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xzy * r6.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.x + r2.w;
    r5.xyz = r0.xyz * r6.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
