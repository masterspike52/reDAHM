// ps_220131900780e99f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040900 00000806 00000000 00007108 00FF00FF 00000001 00003050 00003151 0000F252 0000F353 0000F454 0000F556 0000F657 0000F758
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r7 <-> TEXCOORD8 (flags 0xF)
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
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
sampler2D ModShadowAccumTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord4 : TEXCOORD4; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
    float4 texcoord8 : TEXCOORD8; // r7
    float2 vPos : VPOS;   // r8 (pixel parameters)
    float vFace : VFACE;  // r8
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord3;
    float4 r4 = In.texcoord4;
    float4 r5 = In.texcoord6;
    float4 r6 = In.texcoord7;
    float4 r7 = In.texcoord8;
    float4 r8 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.xyz = AmbientColorAndSkyFactor.xyz * UniformVector_1.xyz;
    r0.y = ps;
    r0.xy = r0.xy * abs(r8.xy);
    r1.yz = tex2D(ModShadowAccumTexture, r0.xy).xy;
    ps = OpacityOverride.x;
    r0.y = dot(r7.zxy, r7.zxy);
    r8.z = saturate(ps);
    ps = ConstantLighting.z;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.21952 * ps;
    r0.w = dot(r6.zxy, r6.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r0.w));
    r0.x = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r0.x));
    r6.xyz = r0.www * r6.xyz;
    r0.x = ps;
    ps = -r6.x;
    r8.xyw = r0.xxx * r4.xyz;
    r4.y = ps;
    r4.x = r6.z * 2.0 - r6.z;
    ps = -r6.y;
    r0.x = r8.w + 0.1;
    r4.z = ps;
    ps = 5.0 * r0.x;
    r6.xyz = r2.xyz * UniformVector_1.xyz;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r0.w = saturate(dot(r8.xyw, r4.yzx));
    r0.x = ps;
    ps = log2(r0.w);
    r8.xy = r0.xx * ModShadowGroupColor.xy;
    r1.x = ps;
    ps = rsqrt(abs(r0.y));
    r1.xzw = r1.xyz * float3(15.0, 0.875, 0.875);
    r1.y = ps;
    ps = pow(2.0, r1.x);
    r0.xyw = -r8.xyz + 1.0;
    r1.x = ps;
    ps = r0.z;
    r4.zw = r1.zw * r0.xy;
    ps = r1.x * ps;
    r0.xyz = r1.yyx * float3(-0.5, 0.5, 0.21952);
    r1.z = ps;
    ps = ConstantLighting.x * r0.z;
    r0.w = float((r0.w >= 0.004));
    r1.x = ps;
    ps = ConstantLighting.y * r0.z;
    r4.xy = r0.xy * r7.zz;
    r1.y = ps;
    r1.xyz = r6.xyz * ConstantLighting.xyz + r1.xyz;
    r4 = r4.xzwy + float4(0.5, 0.125, 0.125, 0.5);
    ps = r4.y * r4.z;
    r4.xw = abs(r4.wx) * abs(r4.wx);
    r0.x = ps;
    r0.xyz = r0.xxx * r9.xyz + ModShadowColor.xyz;
    r4.xyz = r6.xzy * r4.xxx;
    r6.xyz = r6.xzy * r4.www;
    r1.xyz = r6.xzy * LowerSkyColor.xyz + r1.xyz;
    r1.xyz = r4.xzy * UpperSkyColor.xyz + r1.xyz;
    r1.xyz = r3.xyz * r2.xyz + r1.xyz;
    r1.xyz = r1.xyz + UniformVector_0.xyz;
    ps = -r5.w;
    r0.xyz = r1.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r5.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
