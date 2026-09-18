// ps_d4016d2a4f1c194a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10040B00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c9); // float4
float4 LightMapScale : register(c10); // float3
float4 LowerSkyColor : register(c8); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c7); // float3
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
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r8.yw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6 = tex2D(Texture2D_0, r1.xy);
    r0.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    ps = OpacityOverride.x;
    r0.w = max(UniformScalar_0.x, 0.0001);
    r8.z = saturate(ps);
    ps = -ModShadowColor.x;
    r7.w = dot(r5.zxy, r5.zxy);
    ps = 1.0 + ps;
    r1.w = dot(r4.zxy, r4.zxy);
    r10.x = ps;
    ps = -ModShadowColor.y;
    r7.x = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r10.y = ps;
    ps = -ModShadowColor.z;
    r1.xyz = r0.xyz * LightMapScale.xyz;
    ps = 1.0 + ps;
    r0.xyz = r9.xyz * r6.xyz;
    r10.z = ps;
    ps = rsqrt(abs(r7.x));
    r11.xyz = r6.xyz * AmbientColorAndSkyFactor.xyz;
    r7.x = ps;
    r9.xyz = r11.xyz * r9.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r1.w));
    r7.xyz = r7.xxx * r2.xzy;
    r1.w = ps;
    ps = r6.w;
    r2.xyz = r1.www * r4.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r7.w));
    r4.yz = -r2.xy;
    r8.x = ps;
    r4.x = r2.z * 2.0 - r2.z;
    ps = 0.1 - -r7.y;
    r2 = r8.xyxw * float4(0.5, 0.875, -0.5, 0.875);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r7.z = saturate(dot(r7.xzy, r4.yzx));
    r7.x = saturate(ps);
    ps = r2.z;
    r7.x = -r7.x + 1.0;
    ps = r5.z * ps;
    r8.xy = r7.xx * ModShadowGroupColor.xy;
    r2.z = ps;
    ps = r2.x;
    r7.xyw = -r8.xyz + 1.0;
    ps = r5.z * ps;
    r2.xy = r2.yw * r7.xy;
    r2.w = ps;
    ps = UniformVector_1.x * r6.y;
    r4 = r2 + float4(0.125, 0.125, 0.5, 0.5);
    r2.x = ps;
    ps = r4.x * r4.y;
    r7.x = float((r7.w >= 0.004));
    r7.y = ps;
    ps = log2(r7.z);
    r8.xy = abs(r4.zw) * abs(r4.zw);
    r8.z = ps;
    r7.yzw = r7.yyy * r10.xyz + ModShadowColor.xyz;
    ps = UniformVector_1.z * r6.w;
    r4 = r0.xzyw * r8.yyyz;
    r2.y = ps;
    r5.xyz = r4.xzy * UpperSkyColor.xyz + r9.xyz;
    ps = pow(2.0, r4.w);
    r8.xyz = r0.xzy * r8.xxx;
    r1.w = ps;
    ps = UniformVector_1.y * r6.w;
    r4.xyz = r1.xzy * r1.www;
    r2.z = ps;
    r6.xyz = r8.xyz * LowerSkyColor.xzy + r5.xzy;
    r6.xyz = r4.xyz * r2.xyz + r6.xyz;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.yzw;
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
