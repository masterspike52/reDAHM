// ps_e2553a7f743a3561.bin
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
sampler2D Texture2D_1 : register(s1);
sampler2D LightMapTexture : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    r7.y = dot(r5.zxy, r5.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r9.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r11.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r0.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r6.yzw = tex2D(Texture2D_1, r1.xy).xyz;
    r6.x = dot(r2.zxy, r2.zxy);
    r8.xyz = -UniformVector_0.xyz + 1.0;
    ps = rsqrt(abs(r7.y));
    r1.xyz = r0.xyz * LightMapScale.xyz;
    r11.x = ps;
    ps = rsqrt(abs(r7.x));
    r0.xyz = r8.xyz * r6.yzw;
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r10.xyz = r7.xxx * r4.xyz;
    r6.x = ps;
    ps = -r10.x;
    r7.xyz = r6.xxx * r2.xzy;
    r2.y = ps;
    r2.x = r10.z * 2.0 - r10.z;
    ps = -r10.y;
    r4 = r11.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    r2.z = ps;
    ps = 0.1 - -r7.y;
    r4.zw = r4.zw * r5.zz;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r7.w = saturate(dot(r7.xzy, r2.yzx));
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = OpacityOverride.x;
    r7.xy = r6.xx * ModShadowGroupColor.xy;
    r7.z = saturate(ps);
    ps = log2(r7.w);
    r7.xyz = -r7.zxy + 1.0;
    r9.x = ps;
    r2 = r9 * float4(15.0, 3.0, 0.4, 1.5);
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r4.xy = r4.xy * r7.yz;
    r9.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r7.yzw = r2.yzw + UniformVector_0.xyz;
    r9.y = ps;
    ps = pow(2.0, r2.x);
    r7.x = float((r7.x >= 0.004));
    r6.x = ps;
    ps = AmbientColorAndSkyFactor.z * r6.w;
    r2.xyz = r1.xzy * r6.xxx;
    r9.z = ps;
    r7.yzw = r9.xyz * r8.xyz + r7.yzw;
    r6 = r4 + float4(0.125, 0.125, 0.5, 0.5);
    ps = r6.x * r6.y;
    r4.xw = abs(r6.zw) * abs(r6.zw);
    r6.x = ps;
    r6.xyz = r6.xxx * r5.xyz + ModShadowColor.xyz;
    r4.xyz = r0.xzy * r4.xxx;
    r5.xyz = r0.xzy * r4.www;
    r7.yzw = r5.xzy * UpperSkyColor.xyz + r7.yzw;
    r7.yzw = r4.xyz * LowerSkyColor.xzy + r7.ywz;
    r7.yzw = r2.xyz * 0.21952 + r7.yzw;
    r7.yzw = r1.xyz * r0.xyz + r7.ywz;
    ps = -r3.w;
    r6.xyz = r7.yzw * r6.xyz;
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
