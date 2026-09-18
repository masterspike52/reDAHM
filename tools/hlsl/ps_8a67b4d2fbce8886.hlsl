// ps_8a67b4d2fbce8886.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 129 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000204 10040800 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
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
float4 LightMapScale : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D LightMapTexture : register(s1);
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

    ps = 1.0 / ModShadowAccumResolution.x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.yzw = -ModShadowColor.xyz + 1.0;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r8.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r6.x = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r6.x));
    r0.z = dot(r6.wyz, r6.wyz);
    r6.x = ps;
    ps = rsqrt(abs(r0.z));
    r7.x = dot(r5.zxy, r5.zxy);
    r0.z = ps;
    r6.x = r6.x * r2.z + 0.1;
    ps = rsqrt(abs(r7.x));
    r0.zw = r0.zz * float2(0.70710677, 1.0);
    r8.z = ps;
    ps = 5.0 * r6.x;
    r8 = r8.xyzz * float4(0.875, 0.875, 0.5, -0.5);
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r0.zw = r0.zw * r6.yw;
    r6.x = ps;
    ps = OpacityOverride.x;
    r1.yz = r6.xx * ModShadowGroupColor.xy;
    r1.x = saturate(ps);
    r1.w = r0.w * 0.70710677 + r0.z;
    ps = r8.z;
    r1 = -r1.wyzx + 1.0;
    ps = r5.z * ps;
    r2.w = float((abs(r1.x) >= 0.0345));
    r8.z = ps;
    r2.yz = r8.xy * r1.yz + 0.125;
    ps = r8.w;
    r2.x = float((abs(r1.x) > 0.0345));
    ps = r5.z * ps;
    r8.xy = r2.xy * r2.wz;
    r8.w = ps;
    r1.xyz = r8.xzw + float3(-0.1, 0.5, 0.5);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.xxxx)) clip(-1.0);
    r0.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r0.xyz = r0.xzy * LightMapScale.xzy;
    r5.xyz = r4.xyz * r6.yzw;
    r2.xyz = r0.xzy * r5.xyz + UniformVector_0.xyz;
    r7.x = float((r1.w >= 0.004));
    r7.yzw = r8.yyy * r7.yzw + ModShadowColor.xyz;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r0.yz = abs(r1.yz) * abs(r1.yz);
    r0.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r1.xyz = r5.xzy * r0.yyy;
    r0.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.w;
    r5.xyz = r5.xzy * r0.zzz;
    r0.z = ps;
    r6.xyz = r5.xyz * LowerSkyColor.xzy + r2.xzy;
    r6.xyz = r1.xzy * UpperSkyColor.xyz + r6.xzy;
    r6.xyz = r0.xzy * r4.xzy + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xzy * r7.yzw;
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
