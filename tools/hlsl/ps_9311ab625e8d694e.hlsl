// ps_9311ab625e8d694e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 132 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000210 10040A00 0000090A 00000000 00009129 007F01FF 00000001 0000F050 0000F151 0000F253 0000F354 0000F456 0000F557 0000F658 0000F7A0 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
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
    float4 texcoord3 : TEXCOORD3; // r2
    float4 texcoord4 : TEXCOORD4; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 texcoord8 : TEXCOORD8; // r6
    float4 color0 : COLOR0; // r7
    float4 color2 : COLOR2; // r8
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord3;
    float4 r3 = In.texcoord4;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.texcoord8;
    float4 r7 = In.color0;
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xz = r1.xy + r1.xy;
    r8.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.y = dot(r3.zxy, r3.zxy);
    r8.x = ps;
    r8.xy = r8.xy * abs(r9.xy);
    r1.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r7.z = tex2D(Texture2D_0, r7.xz).w;
    r8 = tex2D(Texture2D_1, r0.xy);
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = dot(r6.zxy, r6.zxy);
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = dot(r5.zxy, r5.zxy);
    ps = rsqrt(abs(r7.y));
    r10.xyz = r7.zzz * r8.xyz;
    r7.y = ps;
    ps = rsqrt(abs(r0.w));
    r7.yzw = r7.yyy * r3.xzy;
    r0.w = ps;
    r8.xyz = r0.www * r5.xyz;
    ps = OpacityOverride.x;
    r0.xyz = r10.xyz * r0.xyz;
    r10.z = saturate(ps);
    r3.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r7.x));
    r10.yw = -r8.xy;
    r1.x = ps;
    r10.x = r8.z * 2.0 - r8.z;
    ps = 0.1 - -r7.z;
    r1 = r1.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r7.x = ps;
    ps = 5.0 * r7.x;
    r5.xy = r1.xy * r6.zz;
    r7.x = saturate(ps);
    ps = 1.0 - r7.x;
    r7.y = saturate(dot(r7.ywz, r10.ywx));
    r7.x = ps;
    ps = log2(r7.y);
    r10.xy = r7.xx * ModShadowGroupColor.xy;
    r7.y = ps;
    ps = 15.0 * r7.y;
    r7.xzw = -r10.xyz + 1.0;
    r7.y = ps;
    ps = pow(2.0, r7.y);
    r5.zw = r1.zw * r7.xz;
    r7.y = ps;
    r1.xyz = r7.yyy * r2.xzy;
    r7.w = float((r7.w >= 0.004));
    r5 = r5 + float4(0.5, 0.5, 0.125, 0.125);
    ps = r5.z * r5.w;
    r8.xy = abs(r5.xy) * abs(r5.xy);
    r7.x = ps;
    r7.xyz = r7.xxx * r9.xyz + ModShadowColor.xyz;
    r5.xyz = r0.xzy * r8.xxx;
    r6.xyz = r0.xzy * r8.yyy;
    r3.xyz = r6.xzy * UpperSkyColor.xyz + r3.xyz;
    r8.xyz = r5.xyz * LowerSkyColor.xzy + r3.xzy;
    r8.xyz = r1.xzy * r8.www + r8.xzy;
    r8.xyz = r0.xzy * r2.xzy + r8.xzy;
    ps = -r4.w;
    r7.xyz = r8.xzy * r7.xyz;
    ps = OpacityOverride.x + ps;
    r8.xyz = r7.xyz - r7.xyz;
    r8.w = ps;
    oC0.w = r8.w * r7.w + r4.w;
    r7.xyz = r8.xyz * r7.www + r7.xyz;
    oC0.xyz = r7.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
