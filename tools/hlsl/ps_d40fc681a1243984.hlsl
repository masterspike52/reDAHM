// ps_d40fc681a1243984.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 10040E00 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 LightMapScale : register(c9); // float3
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
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
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_0, r1.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = r13.w - 0.5;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r6.zw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r7.yzw = tex2D(LightMapTexture, r0.xy).xyz;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = dot(r5.zxy, r5.zxy);
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = dot(r4.zxy, r4.zxy);
    ps = OpacityOverride.x;
    r9.xyz = r7.yzw * LightMapScale.xyz;
    r14.z = saturate(ps);
    ps = rsqrt(abs(r7.x));
    r7.yzw = r13.xyz + UniformVector_0.xyz;
    r7.x = ps;
    ps = rsqrt(abs(r6.y));
    r10.xyz = r0.xyz * r13.xyz;
    r6.y = ps;
    r8.xyz = r10.xyz * AmbientColorAndSkyFactor.xyz + r7.yzw;
    ps = rsqrt(abs(r6.x));
    r7.xyz = r7.xxx * r2.zxy;
    r6.x = ps;
    ps = TwoSidedSign.x * r6.y;
    r2 = r6.xxzw * float4(-0.5, 0.5, 0.875, 0.875);
    r6.z = ps;
    ps = 0.1 - -r7.x;
    r1.xy = r2.xy * TwoSidedSign.xx;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r12 = r6.yyyz * r4.xyzz;
    r6.x = saturate(ps);
    ps = r12.w + r12.w;
    r6.z = -r6.x + 1.0;
    r9.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r2.xy = r1.xy * r5.zz;
    r14.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r1 = r9 * TwoSidedSign.xxxx;
    r14.y = ps;
    ps = -r12.x;
    r4.xyz = -r14.xyz + 1.0;
    r6.y = ps;
    ps = -r12.y;
    r1.xyz = r1.xyz * r13.xyz;
    r6.z = ps;
    ps = -r12.z;
    r2.zw = r2.zw * r4.xy;
    ps = r1.w + ps;
    r6.w = float((r4.z >= 0.004));
    r6.x = ps;
    r6.x = saturate(dot(r7.yzx, r6.yzx));
    ps = log2(r6.x);
    r7 = r2 + float4(0.5, 0.5, 0.125, 0.125);
    r6.y = ps;
    ps = r7.z * r7.w;
    r6.xz = abs(r7.xy) * abs(r7.xy);
    r7.x = ps;
    r7.xyz = r7.xxx * r11.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.y;
    r4.xyz = r10.xzy * r6.xxx;
    r7.w = ps;
    ps = pow(2.0, r7.w);
    r6.xyz = r10.xzy * r6.zzz;
    r7.w = ps;
    r2.xyz = r9.xzy * r7.www;
    r6.xyz = r6.xzy * UpperSkyColor.xyz + r8.xyz;
    r6.xyz = r4.xyz * LowerSkyColor.xzy + r6.xzy;
    r6.xyz = r2.xyz * 0.21952 + r6.xyz;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
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
