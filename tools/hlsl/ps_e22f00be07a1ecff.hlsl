// ps_e22f00be07a1ecff.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10040800 00000606 00000000 000058C6 003F003F 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
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
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r0.y = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.x = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    r0.zw = r0.zw * abs(r6.xy);
    r1.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0.w = ConstantLighting.z * 0.21952;
    r6.xyz = AmbientColorAndSkyFactor.xyz * 0.21952;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = rsqrt(abs(r0.y));
    r8.xy = r1.xy * 0.875;
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r2.xyz = r0.yyy * r2.xyz;
    r0.x = ps;
    ps = OpacityOverride.x;
    r1.xyz = r0.xxx * r4.zxy;
    r0.y = saturate(ps);
    r1.x = r1.x * 2.0 - r1.x;
    ps = -r1.y;
    r0.x = r2.z + 0.1;
    r1.y = ps;
    ps = -r1.z;
    r0.x = saturate(r0.x * 5.0);
    r1.z = ps;
    ps = 1.0 - r0.x;
    r0.z = dot(r5.zxy, r5.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r0.z));
    r1.x = saturate(dot(r2.xyz, r1.yzx));
    r1.y = ps;
    ps = log2(r1.x);
    r0.xz = r0.xx * ModShadowGroupColor.xy;
    r1.x = ps;
    ps = 1.0 - r0.x;
    r4.yzw = -UniformVector_0.xyz + 1.0;
    r2.y = ps;
    ps = 1.0 - r0.z;
    r1.xyz = r1.xyy * float3(15.0, -0.5, 0.5);
    r2.z = ps;
    ps = 1.0 - r0.y;
    r5.xy = r1.yz * r5.zz;
    r2.w = ps;
    ps = pow(2.0, r1.x);
    r5.zw = r8.xy * r2.yz;
    r4.x = ps;
    ps = r0.w;
    r1 = r4 * 0.21952;
    ps = r4.x * ps;
    r0 = r5.xzyw + float4(0.5, 0.125, 0.5, 0.125);
    r8.z = ps;
    ps = r0.y * r0.w;
    r0.xz = abs(r0.xz) * abs(r0.xz);
    r2.x = ps;
    ps = r1.x;
    r0.w = float((r2.w >= 0.004));
    r0.y = ps;
    r2.xyz = r2.xxx * r7.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.x * r0.y;
    r5.xyz = r1.ywz * r0.zzz;
    r8.x = ps;
    ps = ConstantLighting.y * r1.x;
    r7.xyz = r1.ywz * r0.xxx;
    r8.y = ps;
    r0.xyz = r1.yzw * ConstantLighting.xyz + r8.xyz;
    r0.xyz = r7.xzy * LowerSkyColor.xyz + r0.xyz;
    r0.xyz = r5.xzy * UpperSkyColor.xyz + r0.xyz;
    r0.xyz = r6.xyz * r4.yzw + r0.xyz;
    r0.xyz = r0.xyz + UniformVector_0.xyz;
    ps = -r3.w;
    r0.xyz = r0.xyz * r2.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r3.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
