// ps_334be52276bf08bc.bin
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

    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = saturate(OpacityOverride.x);
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r9.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0 = tex2D(Texture2D_0, r0.xy);
    ps = -ModShadowColor.x;
    r5.w = max(UniformScalar_0.x, 0.0001);
    ps = 1.0 + ps;
    r6.x = dot(r4.zxy, r4.zxy);
    r8.x = ps;
    ps = -ModShadowColor.y;
    r6.y = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r6.w = dot(r1.zxy, r1.zxy);
    r8.y = ps;
    ps = -ModShadowColor.z;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r5.xyz = r7.xyz * r0.xyz;
    r8.z = ps;
    ps = rsqrt(abs(r6.w));
    r10.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r6.w = ps;
    r7.xyz = r10.xyz * r7.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r6.y));
    r1.xyz = r6.www * r1.xzy;
    r1.w = ps;
    ps = r0.w;
    r3.xyz = r1.www * r3.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r6.x));
    r6.yw = -r3.xy;
    r9.z = ps;
    r6.x = r3.z * 2.0 - r3.z;
    ps = 0.1 - -r1.y;
    r3 = r9.zxyz * float4(-0.5, 0.875, 0.875, 0.5);
    r0.x = ps;
    ps = 5.0 * r0.x;
    r1.z = saturate(dot(r1.xzy, r6.ywx));
    r1.x = saturate(ps);
    ps = r3.x;
    r1.x = -r1.x + 1.0;
    ps = r4.z * ps;
    r6.xy = r1.xx * ModShadowGroupColor.xy;
    r3.x = ps;
    ps = r3.w;
    r1.xyw = -r6.xyz + 1.0;
    ps = r4.z * ps;
    r3.zw = r3.yz * r1.xy;
    r3.y = ps;
    ps = UniformVector_1.x * r0.y;
    r3 = r3 + float4(0.5, 0.5, 0.125, 0.125);
    r4.x = ps;
    ps = r3.z * r3.w;
    r1.x = float((r1.w >= 0.004));
    r1.y = ps;
    ps = log2(r1.z);
    r6.xy = abs(r3.xy) * abs(r3.xy);
    r6.z = ps;
    r1.yzw = r1.yyy * r8.xyz + ModShadowColor.xyz;
    ps = UniformVector_1.z * r0.w;
    r3 = r5.xzyw * r6.yyyz;
    r4.y = ps;
    ps = pow(2.0, r3.w);
    r6.xyz = r5.xzy * r6.xxx;
    r3.w = ps;
    r3.xyz = r3.xzy * UpperSkyColor.xyz + r7.xyz;
    r3.xyz = r6.xyz * LowerSkyColor.xzy + r3.xzy;
    ps = UniformVector_1.y * r0.w;
    r6.xyz = r3.www * ConstantLighting.xzy;
    r4.z = ps;
    r0.xyz = r6.xzy * r4.xzy + r3.xzy;
    r0.xyz = r5.xzy * ConstantLighting.xzy + r0.xzy;
    ps = -r2.w;
    r0.xyz = r0.xzy * r1.yzw;
    ps = OpacityOverride.x + ps;
    r3.xyz = r0.xyz - r0.xyz;
    r3.w = ps;
    oC0.w = r3.w * r1.x + r2.w;
    r0.xyz = r3.xyz * r1.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
