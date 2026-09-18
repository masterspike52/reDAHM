// ps_5823c6f07b562184.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 129 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000204 10040800 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D Texture2D_1 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xz = r1.xy + r1.xy;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = dot(r2.zxy, r2.zxy);
    r7.x = ps;
    r7.xy = r7.xy * abs(r8.xy);
    r1.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r6.z = tex2D(Texture2D_0, r6.xz).w;
    r0 = tex2D(Texture2D_1, r0.xy);
    r6.x = dot(r5.zxy, r5.zxy);
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r7.w = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r6.y));
    r8.xyz = r6.zzz * r0.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r7.w));
    r6.yzw = r6.yyy * r2.xzy;
    r7.w = ps;
    r2.xyz = r7.www * r4.xyz;
    ps = OpacityOverride.x;
    r0.xyz = r8.xyz * r7.xyz;
    r4.z = saturate(ps);
    r7.yzw = r0.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r6.x));
    r4.yw = -r2.xy;
    r1.x = ps;
    r4.x = r2.z * 2.0 - r2.z;
    ps = 0.1 - -r6.z;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r1 = r1.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r6.y = saturate(dot(r6.ywz, r4.ywx));
    r6.x = ps;
    ps = log2(r6.y);
    r4.xy = r6.xx * ModShadowGroupColor.xy;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r1.xy = r1.xy * r5.zz;
    r6.w = ps;
    ps = pow(2.0, r6.w);
    r6.xyz = -r4.xyz + 1.0;
    r6.w = ps;
    r1.zw = r1.zw * r6.xy;
    r7.x = float((r6.z >= 0.004));
    ps = ConstantLighting.x * r6.w;
    r4 = r1 + float4(0.5, 0.5, 0.125, 0.125);
    r1.x = ps;
    ps = r4.z * r4.w;
    r1.yz = abs(r4.xy) * abs(r4.xy);
    r6.x = ps;
    r6.xyz = r6.xxx * r2.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.z * r6.w;
    r2.xyz = r0.xzy * r1.yyy;
    r1.y = ps;
    ps = ConstantLighting.y * r6.w;
    r4.xyz = r0.xzy * r1.zzz;
    r1.z = ps;
    r7.yzw = r4.xzy * UpperSkyColor.xyz + r7.yzw;
    r7.yzw = r2.xyz * LowerSkyColor.xzy + r7.ywz;
    r7.yzw = r1.xzy * r0.www + r7.ywz;
    r7.yzw = r0.xzy * ConstantLighting.xzy + r7.ywz;
    ps = -r3.w;
    r6.xyz = r7.ywz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.x + r3.w;
    r6.xyz = r0.xyz * r7.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
