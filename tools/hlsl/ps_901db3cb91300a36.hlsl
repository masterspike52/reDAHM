// ps_901db3cb91300a36.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040900 00000406 00000000 00004084 000F000F 00000001 0000F054 0000F156 0000F257 0000F358
//   interpolator: r0 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
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
    float4 texcoord4 : TEXCOORD4; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 texcoord7 : TEXCOORD7; // r2
    float4 texcoord8 : TEXCOORD8; // r3
    float2 vPos : VPOS;   // r4 (pixel parameters)
    float vFace : VFACE;  // r4
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord4;
    float4 r1 = In.texcoord6;
    float4 r2 = In.texcoord7;
    float4 r3 = In.texcoord8;
    float4 r4 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xyz = AmbientColorAndSkyFactor.xyz * UniformVector_1.xyz;
    r6.y = ps;
    r4.xy = r6.xy * abs(r4.xy);
    r9.yz = tex2D(ModShadowAccumTexture, r4.xy).xy;
    ps = OpacityOverride.x;
    r5.w = dot(r3.zxy, r3.zxy);
    r8.z = saturate(ps);
    ps = ConstantLighting.z;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.21952 * ps;
    r6.x = dot(r2.zxy, r2.zxy);
    r4.w = ps;
    ps = rsqrt(abs(r6.x));
    r6.w = dot(r0.zxy, r0.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r6.xxx * r2.xyz;
    r2.x = ps;
    ps = -r6.x;
    r2.xyz = r2.xxx * r0.xyz;
    r0.z = ps;
    r0.y = r6.z * 2.0 - r6.z;
    ps = -r6.y;
    r0.x = r2.z + 0.1;
    r0.w = ps;
    ps = 5.0 * r0.x;
    r6.xyz = r4.xyz * UniformVector_1.xyz;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r0.y = saturate(dot(r2.xyz, r0.zwy));
    r0.x = ps;
    ps = log2(r0.y);
    r8.xy = r0.xx * ModShadowGroupColor.xy;
    r9.x = ps;
    ps = rsqrt(abs(r5.w));
    r2.xzw = r9.xyz * float3(15.0, 0.875, 0.875);
    r2.y = ps;
    ps = pow(2.0, r2.x);
    r0.xyw = -r8.xyz + 1.0;
    r2.x = ps;
    ps = r4.w;
    r8.zw = r2.zw * r0.xy;
    ps = r2.x * ps;
    r0.xyz = r2.yyx * float3(-0.5, 0.5, 0.21952);
    r2.z = ps;
    ps = ConstantLighting.x * r0.z;
    r0.w = float((r0.w >= 0.004));
    r2.x = ps;
    ps = ConstantLighting.y * r0.z;
    r8.xy = r0.xy * r3.zz;
    r2.y = ps;
    r2.xyz = r6.xyz * ConstantLighting.xyz + r2.xyz;
    r3 = r8.xzwy + float4(0.5, 0.125, 0.125, 0.5);
    ps = r3.y * r3.z;
    r3.xw = abs(r3.wx) * abs(r3.wx);
    r0.x = ps;
    r0.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    r3.xyz = r6.xzy * r3.xxx;
    r6.xyz = r6.xzy * r3.www;
    r2.xyz = r6.xzy * LowerSkyColor.xyz + r2.xyz;
    r2.xyz = r3.xzy * UpperSkyColor.xyz + r2.xyz;
    r2.xyz = r5.xyz * r4.xyz + r2.xyz;
    r2.xyz = r2.xyz + UniformVector_0.xyz;
    ps = -r1.w;
    r0.xyz = r2.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xyz - r0.xyz;
    r2.w = ps;
    oC0.w = r2.w * r0.w + r1.w;
    r0.xyz = r2.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
