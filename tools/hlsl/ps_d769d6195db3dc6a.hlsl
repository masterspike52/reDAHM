// ps_d769d6195db3dc6a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10040800 00000406 00000000 00004084 000F000F 00000001 0000F054 0000F156 0000F257 0000F358
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
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r0.zxy, r0.zxy);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    r4.xy = r5.xy * abs(r4.xy);
    r4.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r5.w = ConstantLighting.z * 0.21952;
    r5.xyz = AmbientColorAndSkyFactor.xyz * 0.21952;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    ps = rsqrt(abs(r7.x));
    r8.xy = r4.xy * 0.875;
    r4.x = ps;
    ps = rsqrt(abs(r6.w));
    r4.xyz = r4.xxx * r0.xyz;
    r0.x = ps;
    ps = OpacityOverride.x;
    r0.xzw = r0.xxx * r2.xyz;
    r0.y = saturate(ps);
    r2.x = r0.w * 2.0 - r0.w;
    ps = -r0.x;
    r2.z = r4.z + 0.1;
    r2.y = ps;
    ps = -r0.z;
    r0.x = saturate(r2.z * 5.0);
    r2.z = ps;
    ps = 1.0 - r0.x;
    r0.z = dot(r3.zxy, r3.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r0.z));
    r0.w = saturate(dot(r4.xyz, r2.yzx));
    r2.y = ps;
    ps = log2(r0.w);
    r0.xz = r0.xx * ModShadowGroupColor.xy;
    r2.x = ps;
    ps = 1.0 - r0.x;
    r4.yzw = -UniformVector_0.xyz + 1.0;
    r7.x = ps;
    ps = 1.0 - r0.z;
    r2.xyz = r2.xyy * float3(15.0, -0.5, 0.5);
    r7.y = ps;
    ps = 1.0 - r0.y;
    r3.xy = r2.yz * r3.zz;
    r7.z = ps;
    ps = pow(2.0, r2.x);
    r3.zw = r8.xy * r7.xy;
    r4.x = ps;
    ps = r5.w;
    r2 = r4 * 0.21952;
    ps = r4.x * ps;
    r0 = r3.xzyw + float4(0.5, 0.125, 0.5, 0.125);
    r8.z = ps;
    ps = r0.y * r0.w;
    r0.xz = abs(r0.xz) * abs(r0.xz);
    r3.x = ps;
    ps = r2.x;
    r0.w = float((r7.z >= 0.004));
    r0.y = ps;
    r3.xyz = r3.xxx * r6.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.x * r0.y;
    r6.xyz = r2.ywz * r0.zzz;
    r8.x = ps;
    ps = ConstantLighting.y * r2.x;
    r7.xyz = r2.ywz * r0.xxx;
    r8.y = ps;
    r0.xyz = r2.yzw * ConstantLighting.xyz + r8.xyz;
    r0.xyz = r7.xzy * LowerSkyColor.xyz + r0.xyz;
    r0.xyz = r6.xzy * UpperSkyColor.xyz + r0.xyz;
    r0.xyz = r5.xyz * r4.yzw + r0.xyz;
    r0.xyz = r0.xyz + UniformVector_0.xyz;
    ps = -r1.w;
    r0.xyz = r0.xyz * r3.xyz;
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
