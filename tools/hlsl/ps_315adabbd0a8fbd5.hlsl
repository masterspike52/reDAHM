// ps_315adabbd0a8fbd5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 90 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000168 10040700 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xz = r0.yx - 0.5;
    r6.y = ps;
    r5.y = dot(r5.xz, float2(0.7073883, -0.7068252)) + 0.5;
    r5.x = dot(r5.xz, float2(0.7068252, 0.7073883)) + 0.5;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.w = dot(r1.zxy, r1.zxy);
    r6.x = ps;
    r6.xy = r6.xy * abs(r7.xy);
    r5.xy = r5.xy + UniformVector_2.xy;
    r5.xyz = tex2D(Texture2D_0, r5.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = rsqrt(abs(r5.w));
    r0.xy = r6.xy * 0.875;
    r5.w = ps;
    ps = OpacityOverride.x;
    r5.w = r5.w * r1.z;
    ps = UniformVector_1.x * ps;
    r5 = r5.yzxw + float4(0.25, 0.25, 0.25, 0.1);
    r0.w = ps;
    r6.w = r0.w * r5.z - r2.w;
    r6.xyz = r5.zxy * UniformVector_1.xyz + UniformVector_0.xyz;
    ps = 5.0 * r5.w;
    r0.z = saturate(ps);
    ps = r0.w;
    r0.z = -r0.z + 1.0;
    ps = r5.z * ps;
    r5.xy = r0.zz * ModShadowGroupColor.xy;
    r5.z = saturate(ps);
    r5.xyw = -r5.xyz + 1.0;
    r5.w = float((r5.w >= 0.004));
    r0.xy = r0.xy * r5.xy + 0.125;
    ps = r0.x * r0.y;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    r5.xyz = r0.xxx * r5.xyz + ModShadowColor.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    r6.xyz = r5.xyz - r5.xyz;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
