// ps_0a128c0eecd69205.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 99 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000018C 10040800 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.zw = r0.xy * 2.0 + UniformVector_2.xy;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    r6.xy = r6.xy * abs(r7.xy);
    r8.x = tex2D(Texture2D_2, r0.xy).x;
    r8.yzw = tex2D(Texture2D_1, r6.zw).xyz;
    r6.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = OpacityOverride.x;
    r6.x = dot(r1.zxy, r1.zxy);
    r7.x = saturate(ps);
    ps = rsqrt(abs(r6.x));
    r6.zw = r6.yz * 0.875;
    r3.w = ps;
    ps = r8.x + r8.x;
    r6.xy = r0.xy + UniformVector_1.xy;
    r4.x = ps;
    r0.x = r3.w * r1.z + 0.1;
    ps = r8.y + r8.y;
    r0.x = saturate(r0.x * 5.0);
    r4.y = ps;
    ps = r8.z + r8.z;
    r0.x = -r0.x + 1.0;
    r4.z = ps;
    ps = r8.w + r8.w;
    r7.yz = r0.xx * ModShadowGroupColor.xy;
    r4.w = ps;
    ps = r4.x;
    r0.xyz = -r7.xyz + 1.0;
    ps = r5.w * ps;
    r1.xy = r6.zw * r0.yz;
    r1.z = ps;
    r0.yzw = r1.xyz + float3(0.125, 0.125, -0.1);
    ps = r0.y * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.wwww)) clip(-1.0);
    r6.w = ps;
    r6.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r6.xyz = r6.xyz + r6.xyz;
    r5.xyz = r6.xyz * r4.yzw + r5.xyz;
    r6.xyz = r5.xyz * 0.8 + UniformVector_0.xyz;
    r5.w = float((r0.x >= 0.004));
    r5.xyz = r6.www * r3.xyz + ModShadowColor.xyz;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
