// ps_3ac9e084d6c62d5c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 99 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000018C 10040700 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = r0.xy * 2.0 + UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0 = r0.xyxy * float4(4.0, 4.0, 3.0, 3.0);
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r0.xy + UniformVector_2.xy;
    r3.y = ps;
    r0.xy = r3.xy * abs(r7.xy);
    r4.y = tex2D(Texture2D_2, r0.zw).x;
    r3.xy = tex2D(ModShadowAccumTexture, r0.xy).xy;
    r6.w = tex2D(Texture2D_1, r6.zw).w;
    r3.w = tex2D(Texture2D_0, r6.xy).w;
    r6.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r6.x));
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    r6.x = r6.x * r1.z + 0.1;
    ps = 5.0 * r6.x;
    r3.z = saturate(ps);
    r1.xy = -r3.zw + float2(1.0, 4.0);
    ps = OpacityOverride.x;
    r6.yz = r1.xx * ModShadowGroupColor.xy;
    r6.x = saturate(ps);
    r3.z = r1.y * r6.w + r3.w;
    ps = r5.x;
    r1.xyz = -r6.yzx + 1.0;
    ps = 0.05 * ps;
    r4.xzw = r3.zxy * float3(0.05, 0.875, 0.875);
    r6.x = ps;
    ps = r6.x;
    r1.xy = r4.zw * r1.xy;
    ps = r3.z * ps;
    r6.yzw = r4.xxy * r5.yzw;
    r6.x = ps;
    ps = r6.w;
    r5.w = float((r1.z >= 0.004));
    ps = r3.z * ps;
    r6.xyz = r6.xyz + UniformVector_0.xyz;
    r1.z = ps;
    r5.xyz = r1.xyz + float3(0.125, 0.125, -0.5);
    ps = r5.x * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r5.x = ps;
    r5.xyz = r5.xxx * r0.xyz + ModShadowColor.xyz;
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
