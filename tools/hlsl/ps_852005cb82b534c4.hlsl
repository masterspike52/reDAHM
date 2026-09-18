// ps_852005cb82b534c4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10040A00 00000506 00000000 000048A5 001F001F 00000001 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 ConstantLighting : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
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

    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = ps;
    r5.xy = r6.xy * abs(r5.xy);
    r10.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = OpacityOverride.x;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r9.z = saturate(ps);
    ps = ConstantLighting.z;
    r0.x = dot(r1.zxy, r1.zxy);
    ps = 0.21952 * ps;
    r0.y = dot(r3.zxy, r3.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r6.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r9.xyw = r0.yyy * r3.xyz;
    r0.x = ps;
    ps = -r9.x;
    r3.xyz = r0.xxx * r1.xyz;
    r1.y = ps;
    r1.x = r9.w * 2.0 - r9.w;
    ps = -r9.y;
    r0.x = r3.z + 0.1;
    r1.z = ps;
    ps = 5.0 * r0.x;
    r7.xyz = r5.xyz * r7.xyz;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r0.y = saturate(dot(r3.xyz, r1.yzx));
    r0.x = ps;
    ps = log2(r0.y);
    r9.xy = r0.xx * ModShadowGroupColor.xy;
    r10.x = ps;
    ps = rsqrt(abs(r0.w));
    r1.xzw = r10.xyz * float3(15.0, 0.875, 0.875);
    r1.y = ps;
    ps = pow(2.0, r1.x);
    r0.xyw = -r9.xyz + 1.0;
    r1.x = ps;
    ps = r0.z;
    r3.zw = r1.zw * r0.xy;
    ps = r1.x * ps;
    r0.xyz = r1.yyx * float3(-0.5, 0.5, 0.21952);
    r1.z = ps;
    ps = ConstantLighting.x * r0.z;
    r0.w = float((r0.w >= 0.004));
    r1.x = ps;
    ps = ConstantLighting.y * r0.z;
    r3.xy = r0.xy * r4.zz;
    r1.y = ps;
    r1.xyz = r7.xyz * ConstantLighting.xyz + r1.xyz;
    r3 = r3.xzwy + float4(0.5, 0.125, 0.125, 0.5);
    ps = r3.y * r3.z;
    r3.xw = abs(r3.wx) * abs(r3.wx);
    r0.x = ps;
    r0.xyz = r0.xxx * r8.xyz + ModShadowColor.xyz;
    r3.xyz = r7.xzy * r3.xxx;
    r4.xyz = r7.xzy * r3.www;
    r1.xyz = r4.xzy * LowerSkyColor.xyz + r1.xyz;
    r1.xyz = r3.xzy * UpperSkyColor.xyz + r1.xyz;
    r1.xyz = r6.xyz * r5.xyz + r1.xyz;
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
