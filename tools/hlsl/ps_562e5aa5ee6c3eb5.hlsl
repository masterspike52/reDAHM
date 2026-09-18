// ps_562e5aa5ee6c3eb5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 135 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000021C 10040B00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r10.xyw = tex2D(LightMapTexture, r0.xy).xyz;
    r7.xyw = tex2D(Texture2D_0, r1.xy).yzx;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = dot(r5.zxy, r5.zxy);
    ps = OpacityOverride.x;
    r7.z = dot(r2.zxy, r2.zxy);
    r10.z = saturate(ps);
    ps = 0.875 * r6.x;
    r1.xyz = r7.wxy * AmbientColorAndSkyFactor.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r7.z));
    r0.yzw = r7.www + UniformVector_0.xyz;
    r7.z = ps;
    r8.xyz = r1.xyz * r11.xyz + r0.yzw;
    ps = rsqrt(abs(r6.w));
    r2.xyz = r7.zzz * r2.xyz;
    r6.w = ps;
    ps = 0.875 * r6.y;
    r0.yzw = r6.www * r4.zxy;
    r6.w = ps;
    r0.y = r0.y * 2.0 - r0.y;
    ps = -r0.z;
    r6.x = r2.z + 0.1;
    r0.z = ps;
    ps = -r0.w;
    r6.x = saturate(r6.x * 5.0);
    r0.w = ps;
    ps = 1.0 - r6.x;
    r1.xyz = r10.xyw * LightMapScale.xyz;
    r7.z = ps;
    ps = rsqrt(abs(r0.x));
    r6.y = saturate(dot(r2.xyz, r0.zwy));
    r6.x = ps;
    ps = log2(r6.y);
    r10.xy = r7.zz * ModShadowGroupColor.xy;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r0.xyz = r11.xyz * r7.wxy;
    r2.x = ps;
    ps = (-0.5) * r6.x;
    r7.xyz = -r10.xyz + 1.0;
    r2.y = ps;
    ps = 0.5 * r6.x;
    r4.xy = r6.zw * r7.xy;
    r2.z = ps;
    r4.zw = r2.yz * r5.zz;
    ps = pow(2.0, r2.x);
    r6.w = float((r7.z >= 0.004));
    r6.x = ps;
    r2.xyz = r1.xzy * r6.xxx;
    r4 = r4 + float4(0.125, 0.125, 0.5, 0.5);
    ps = r4.x * r4.y;
    r7.xy = abs(r4.zw) * abs(r4.zw);
    r6.x = ps;
    r6.xyz = r6.xxx * r9.xyz + ModShadowColor.xyz;
    r5.xyz = r0.xzy * r7.xxx;
    r4.xyz = r0.xzy * r7.yyy;
    r4.xyz = r4.xzy * UpperSkyColor.xyz + r8.xyz;
    r7.xyz = r5.xyz * LowerSkyColor.xzy + r4.xzy;
    r7.xyz = r2.xyz * r7.www + r7.xyz;
    r7.xyz = r1.xyz * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
