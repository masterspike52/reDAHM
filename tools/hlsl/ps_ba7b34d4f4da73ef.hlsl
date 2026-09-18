// ps_ba7b34d4f4da73ef.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 180 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002D0 10040B00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c11); // float4
float4 LightMapScale : register(c12); // float3
float4 LowerSkyColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_3 : register(c7); // float4
float4 UpperSkyColor : register(c9); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D LightMapTexture : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    r6.xy = r1.xy + UniformVector_2.xy;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r1.xy + UniformVector_1.xy;
    r7.y = ps;
    r7.xy = r7.xy * abs(r8.xy);
    r10.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r8.xyz = tex2D(Texture2D_0, r6.zw).xyz;
    r11.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r1.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r7.yzw = tex2D(Texture2D_0, r6.xy).xyz;
    r6.xyw = tex2D(LightMapTexture, r0.xy).yzx;
    r0.w = dot(r5.zxy, r5.zxy);
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.x = dot(r2.zxy, r2.zxy);
    r6.z = dot(r4.zxy, r4.zxy);
    r7.yzw = r7.wyz * 2.0 - 2.0;
    ps = rsqrt(abs(r6.z));
    r1.xyz = r1.xyz * UniformVector_3.xyz;
    r6.z = ps;
    ps = OpacityOverride.x;
    r9.xyz = r6.zzz * r4.xyz;
    r6.z = saturate(ps);
    ps = rsqrt(abs(r7.x));
    r4.xyz = r1.xyz * r11.xyz;
    r7.x = ps;
    r1.xyz = r8.zxy * 2.0 + r7.yzw;
    ps = LightMapScale.x * r6.w;
    r7.xyz = r7.xxx * r2.zxy;
    r2.x = ps;
    ps = LightMapScale.y * r6.x;
    r7.w = dot(r1.xyz, r1.xyz);
    r2.y = ps;
    ps = 0.1 - -r7.x;
    r0.xyz = r4.xyz * r0.xyz;
    r6.x = ps;
    r8.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r7.w));
    r6.x = saturate(r6.x * 5.0);
    r6.w = ps;
    ps = 1.0 - r6.x;
    r1.xyz = r1.xyz * r6.www;
    r6.x = ps;
    ps = rsqrt(abs(r0.w));
    r7.w = dot(r1.xyz, r1.xyz);
    r0.w = ps;
    ps = rsqrt(abs(r7.w));
    r6.xw = r6.xx * ModShadowGroupColor.xy;
    r7.w = ps;
    ps = 1.0 - r6.x;
    r11.xyz = r0.www * r5.xyz;
    r5.x = ps;
    ps = 1.0 - r6.w;
    r1.xyz = r1.xyz * r7.www;
    r5.y = ps;
    ps = 1.0 - r6.z;
    r4.xyz = r1.xyz * TwoSidedSign.xxx;
    r5.z = ps;
    ps = LightMapScale.z * r6.y;
    r7.w = float((r5.z >= 0.004));
    r2.z = ps;
    r1.xyz = r2.xzy * r4.xxx;
    r10.x = dot(r11.zxy, r4.xyz);
    ps = -ModShadowColor.x;
    r6.x = dot(r4.xyz, r9.zxy);
    ps = 1.0 + ps;
    r6.xzw = r4.yzx * r6.xxx;
    r6.y = ps;
    ps = -ModShadowColor.y;
    r4 = r10.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.xzw = r6.xzw * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r7.xyz, r6.wxz));
    r6.z = ps;
    r7.xy = r4.zw * r5.xy + 0.125;
    ps = -ModShadowColor.z;
    r4.xy = r4.xy + 0.5;
    ps = 1.0 + ps;
    r4.xy = abs(r4.xy) * abs(r4.xy);
    r6.w = ps;
    ps = log2(r6.x);
    r7.x = r7.x * r7.y;
    r6.x = ps;
    r6.yzw = r7.xxx * r6.yzw + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r7.xyz = r0.xzy * r4.yyy;
    r6.x = ps;
    r7.xyz = r7.xyz * UpperSkyColor.xzy + r8.xzy;
    ps = pow(2.0, r6.x);
    r4.xyz = r0.xzy * r4.xxx;
    r6.x = ps;
    r2.xyz = r2.xzy * r6.xxx;
    r7.xyz = r4.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r2.xyz * 0.1 + r7.xzy;
    r7.xyz = r1.xzy * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.w + r3.w;
    r6.xyz = r0.xyz * r7.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
