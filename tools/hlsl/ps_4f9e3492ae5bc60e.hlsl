// ps_4f9e3492ae5bc60e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040600 00000406 00000000 00004084 000F000F 00000001 0000F054 0000F156 0000F257 0000F358
//   interpolator: r0 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    r4.xy = r6.xy * abs(r4.xy);
    r4.zw = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r4.y = ConstantLighting.z * 0.21952;
    ps = rsqrt(abs(r5.w));
    r4.x = dot(r0.zxy, r0.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r4.x));
    r2.xzw = r5.www * r2.zxy;
    r2.y = ps;
    r0.yzw = r2.yyy * r0.xzy;
    r2.zw = -r2.zw;
    r2.y = r2.x * 2.0 - r2.x;
    ps = 0.1 - -r0.z;
    r2.x = dot(r3.zxy, r3.zxy);
    r0.x = ps;
    ps = 5.0 * r0.x;
    r0.y = saturate(dot(r0.ywz, r2.zwy));
    r0.x = saturate(ps);
    ps = log2(r0.y);
    r0.x = -r0.x + 1.0;
    r0.y = ps;
    ps = 15.0 * r0.y;
    r4.x = -UniformVector_0.y + 1.0;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r0.xz = r0.xx * ModShadowGroupColor.xy;
    r0.y = ps;
    ps = rsqrt(abs(r2.x));
    r2.z = r4.y * r0.y;
    r4.y = ps;
    r6 = r4.yyzw * float4(-0.5, 0.5, 0.875, 0.875);
    ps = OpacityOverride.x;
    r3.xy = r6.xy * r3.zz;
    r0.w = saturate(ps);
    r0.xzw = -r0.xzw + 1.0;
    r3.zw = r6.zw * r0.xz;
    ps = 0.21952 * r0.y;
    r0.w = float((r0.w >= 0.004));
    r0.x = ps;
    r2.xw = r0.xx * ConstantLighting.xy;
    r2.y = r4.x * ConstantLighting.y + r2.w;
    r3 = r3 + float4(0.5, 0.5, 0.125, 0.125);
    ps = r3.z * r3.w;
    r3.xy = abs(r3.xy) * abs(r3.xy);
    r0.x = ps;
    r0.xyz = r0.xxx * r5.xyz + ModShadowColor.xyz;
    r3.xy = r3.xy * r4.xx;
    r2.y = r3.x * LowerSkyColor.y + r2.y;
    r2.y = r3.y * UpperSkyColor.y + r2.y;
    r2.y = r4.x * AmbientColorAndSkyFactor.y + r2.y;
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
