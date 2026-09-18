// ps_e9fd4893c2883e00.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 168 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002A0 10040E00 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_1, r1.xy);
    r6.z = r14.w - 0.5;
    r6.y = 1.0 / ModShadowAccumResolution.y;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r6.xy * abs(r8.xy);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r8.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r1.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r6.xzw = tex2D(LightMapTexture, r0.xy).yxz;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = dot(r2.zxy, r2.zxy);
    r7.y = dot(r5.zxy, r5.zxy);
    r0.w = r14.w * OpacityOverride.x - r3.w;
    r7.z = dot(r4.zxy, r4.zxy);
    r6.y = r14.w;
    r1.xyz = r1.zxy * 2.0 - 1.0;
    r10.xyz = r9.xyz * r14.xyz;
    r7.z = rsqrt(abs(r7.z));
    r11.xyz = r10.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    r4.xyz = r7.zzz * r4.xyz;
    r7.y = rsqrt(abs(r7.y));
    r0.xyz = r7.yyy * r5.xyz;
    r5.z = saturate(OpacityOverride.x * r6.y);
    r6.y = dot(r1.xyz, r1.xyz);
    r7.x = rsqrt(abs(r7.x));
    r7.xyz = r7.xxx * r2.zxy;
    r6.y = rsqrt(abs(r6.y));
    r1.yzw = r1.xyz * r6.yyy;
    r1.x = LightMapScale.x * r6.z;
    r2.xyz = r1.yzw * TwoSidedSign.xxx;
    r1.y = LightMapScale.y * r6.x;
    r13.x = dot(r0.zxy, r2.xyz);
    r1.z = LightMapScale.z * r6.w;
    r6.y = dot(r2.xyz, r4.zxy);
    r6.x = 0.1 - -r7.x;
    r0.xyz = r1.xyz * r2.xxx;
    r6.x = saturate(5.0 * r6.x);
    r0.xyz = r0.xyz * r14.xyz;
    r6.z = 1.0 - r6.x;
    ps = ModShadowGroupColor.x * r6.z;
    r6.xyw = r2.yzx * r6.yyy;
    r5.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2 = r13.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r5.y = ps;
    r4.xyz = r6.xyw * 2.0 - r4.xyz;
    r6.xyz = -r5.zxy + 1.0;
    r6.w = float((r6.x >= 0.004));
    r6.x = saturate(dot(r7.xyz, r4.zxy));
    r6.yz = r2.zw * r6.yz + 0.125;
    r7.xy = r2.xy + 0.5;
    r2.xy = abs(r7.xy) * abs(r7.xy);
    ps = log2(r6.x);
    r6.y = r6.y * r6.z;
    r6.x = ps;
    r7.xyz = r6.yyy * r12.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r4.xyz = r10.xzy * r2.yyy;
    r7.w = ps;
    r6.xyz = r4.xzy * UpperSkyColor.xyz + r11.xyz;
    ps = pow(2.0, r7.w);
    r2.xyz = r10.xzy * r2.xxx;
    r7.w = ps;
    r1.xyz = r1.xzy * r7.www;
    r6.xyz = r2.xyz * LowerSkyColor.xzy + r6.xzy;
    r6.xyz = r1.xyz * r8.xzy + r6.xyz;
    r6.xyz = r0.xyz * r9.xyz + r6.xzy;
    r6.xyz = r6.xyz * r7.xyz;
    r0.xyz = r6.xyz - r6.xyz;
    oC0.w = r0.w * r6.w + r3.w;
    r6.xyz = r0.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
