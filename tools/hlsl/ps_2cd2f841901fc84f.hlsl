// ps_2cd2f841901fc84f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10040700 0000060A 00000000 000060C6 000F003F 00000001 0000F054 0000F156 0000F257 0000F358 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
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
sampler2D ModShadowAccumTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord4 : TEXCOORD4; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 texcoord7 : TEXCOORD7; // r2
    float4 texcoord8 : TEXCOORD8; // r3
    float4 color0 : COLOR0; // r4
    float4 color2 : COLOR2; // r5
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
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r4.y = dot(r0.zxy, r0.zxy);
    r4.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.x = dot(r2.zxy, r2.zxy);
    r4.w = ps;
    r4.zw = r4.zw * abs(r6.xy);
    r6.xy = tex2D(ModShadowAccumTexture, r4.zw).xy;
    r4.z = ConstantLighting.z * 0.21952;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    ps = rsqrt(abs(r4.y));
    r6.zw = r6.xy * 0.875;
    r4.y = ps;
    ps = rsqrt(abs(r4.x));
    r7.xyz = r4.yyy * r0.xyz;
    r4.x = ps;
    ps = OpacityOverride.x;
    r4.xyw = r4.xxx * r2.yxz;
    r2.z = saturate(ps);
    r0.x = r4.w * 2.0 - r4.w;
    ps = -r4.y;
    r5.w = r7.z + 0.1;
    r0.y = ps;
    ps = -r4.x;
    r4.y = saturate(r5.w * 5.0);
    r0.z = ps;
    ps = 1.0 - r4.y;
    r4.x = dot(r3.zxy, r3.zxy);
    r4.w = ps;
    ps = rsqrt(abs(r4.x));
    r4.y = saturate(dot(r7.xyz, r0.yzx));
    r4.x = ps;
    ps = log2(r4.y);
    r2.xy = r4.ww * ModShadowGroupColor.xy;
    r4.y = ps;
    ps = 15.0 * r4.y;
    r0.xy = -UniformVector_0.xy + 1.0;
    r6.x = ps;
    ps = (-0.5) * r4.x;
    r7.xyz = -r2.xyz + 1.0;
    r6.y = ps;
    ps = 0.5 * r4.x;
    r2.xy = r6.zw * r7.xy;
    r6.z = ps;
    r2.zw = r6.yz * r3.zz;
    ps = pow(2.0, r6.x);
    r4.w = float((r7.z >= 0.004));
    r4.x = ps;
    ps = 0.21952 * r4.x;
    r2 = r2.zwxy + float4(0.5, 0.5, 0.125, 0.125);
    r0.z = ps;
    ps = r2.z * r2.w;
    r2.xy = abs(r2.xy) * abs(r2.xy);
    r4.y = ps;
    r5.xyz = r4.yyy * r5.xyz + ModShadowColor.xyz;
    ps = r4.z;
    r2 = r2.xxyy * r0.xyxy;
    ps = r4.x * ps;
    r2.xy = r2.xy * LowerSkyColor.xy;
    r4.z = ps;
    r4.y = dot(r0.yz, ConstantLighting.yy) + r2.y;
    r4.x = dot(r0.xz, ConstantLighting.xx) + r2.x;
    r4.xy = r2.zw * UpperSkyColor.xy + r4.xy;
    r4.xy = r0.xy * AmbientColorAndSkyFactor.xy + r4.xy;
    r4.xyz = r4.xyz + UniformVector_0.xyz;
    ps = -r1.w;
    r4.xyz = r4.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r5.xyz = r4.xyz - r4.xyz;
    r5.w = ps;
    oC0.w = r5.w * r4.w + r1.w;
    r4.xyz = r5.xyz * r4.www + r4.xyz;
    oC0.xyz = r4.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
