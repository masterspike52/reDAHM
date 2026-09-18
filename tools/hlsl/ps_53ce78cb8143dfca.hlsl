// ps_53ce78cb8143dfca.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 90 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000168 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 color0 : COLOR0; // r4
    float4 color2 : COLOR2; // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord5;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r2.zw = r0.xy * float2(15.0, 1.875) + UniformVector_4.xy;
    r5.xy = r0.xy * float2(2.5, 1.25) + UniformVector_1.xy;
    r5.zw = r0.xy * float2(5.0, 2.5) + UniformVector_2.xy;
    r1.xy = r0.xy + r0.xy;
    r0.xz = r0.yx - 0.5;
    r2.xy = r1.xy * float2(5.0, 0.5) + UniformVector_3.xy;
    r0.y = dot(r0.xz, float2(0.0007963267, 0.9999997)) + 0.5;
    r0.x = dot(r0.xz, float2(-0.9999997, 0.0007963267)) + 0.5;
    r0.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r1.xyz = tex2D(Texture2D_0, r5.zw).xyz;
    r5.yzw = tex2D(Texture2D_0, r5.xy).xyz;
    r0.w = tex2D(Texture2D_2, r2.zw).w;
    r5.x = tex2D(Texture2D_1, r2.xy).w;
    ps = 2.0 - r5.x;
    r1.w = ps;
    r1.w = r1.w * r0.w;
    r5 = r1 + r5.yzwx;
    ps = abs(r5.x) * abs(r5.x);
    r0.xyz = r0.xyz * r4.www;
    r2.x = ps;
    ps = abs(r5.y) * abs(r5.y);
    r0.xyz = r0.xyz * r5.www;
    r2.y = ps;
    ps = abs(r5.z) * abs(r5.z);
    r1.xyz = abs(r0.xyz) * abs(r0.xyz);
    r2.z = ps;
    r5.xyz = r2.xyz * abs(r5.xyz);
    r1.xyz = r1.xyz * r1.xyz;
    r5.xyz = r5.xyz * r4.xyz;
    ps = r3.w;
    r4.xyz = r1.xyz * abs(r0.xyz);
    ps = SCENE_COLOR_BIAS_FACTOR.x * ps;
    r4.xyz = min(r4.yxz, 1.0);
    r4.w = ps;
    r5.xyz = r5.xyz * r4.yxz + UniformVector_0.xyz;
    ps = OpacityOverride.x * r4.y;
    oC0.xyz = r4.www * r5.xyz;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
