// ps_1c31a9d562822be4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 84 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000150 10000600 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c9); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);

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
    float4 r6 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.xy * float2(64.0, 4.0) + UniformVector_5.xy;
    r1.xz = r0.xy * float2(32.0, 1.0) + UniformVector_4.xy;
    r1.y = r1.z + r0.y;
    r1.x = tex2D(Texture2D_3, r1.xy).w;
    r5.x = tex2D(Texture2D_4, r5.xy).w;
    r6.xy = r0.xy * float2(2e+01, 0.5) + UniformVector_3.xy;
    r1.yz = r0.xy + r0.xy;
    r1.w = -r1.x + r5.x;
    r5.xy = r1.yz * float2(16.0, 0.25) + UniformVector_1.xy;
    r5.zw = r1.yz * float2(4.0, 0.25) + UniformVector_2.xy;
    r2.xyz = tex2D(Texture2D_1, r5.zw).xyz;
    r2.w = tex2D(Texture2D_5, r0.xy).x;
    r5.xzw = tex2D(Texture2D_0, r5.xy).xyz;
    r5.y = tex2D(Texture2D_2, r6.xy).x;
    r5.xzw = abs(r5.xzw) * abs(r5.xzw);
    r5.xzw = r5.xzw * r5.xzw;
    r0 = r2 * r4;
    r4.w = r1.w * 0.5 + r1.x;
    ps = r3.w;
    r4.xyz = r5.xzw * r5.xzw;
    ps = SCENE_COLOR_BIAS_FACTOR.x * ps;
    r0 = r0 * r4;
    r4.z = ps;
    ps = abs(r0.w) * abs(r0.w);
    r5.xzw = r0.xyz + UniformVector_0.xyz;
    r4.x = ps;
    ps = OpacityOverride.x * r5.y;
    r4.x = min(r4.x, 1.0);
    r4.y = ps;
    oC0.xyz = r4.zzz * r5.xzw;
    oC0.w = r4.y * r4.x;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
