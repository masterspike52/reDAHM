// ps_98d630a30f90e6e7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 63 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000FC 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
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

    r5.xz = r0.xy * float2(5.0, 0.5) + UniformVector_2.xy;
    r5.yw = r0.xy * float2(48.0, 3.2) + UniformVector_3.xy;
    r1.yz = r0.xy * float2(2.5, 0.5) + UniformVector_1.xy;
    r1.xw = r0.xy * float2(8.0, 1.6) + UniformVector_4.xy;
    r0.w = tex2D(Texture2D_3, r0.xy).x;
    r1.x = tex2D(Texture2D_2, r1.xw).w;
    r0.xyz = tex2D(Texture2D_0, r1.yz).xyz;
    r5.y = tex2D(Texture2D_1, r5.yw).w;
    r5.xzw = tex2D(Texture2D_0, r5.xz).yxz;
    ps = 4.0 - r5.y;
    r0.xyz = r5.zxw + r0.xyz;
    r1.y = ps;
    r5.y = r1.y * r1.x + r5.y;
    ps = r3.w;
    r0 = r0 * r4;
    ps = SCENE_COLOR_BIAS_FACTOR.x * ps;
    r4.x = r0.w * r5.y;
    r4.z = ps;
    ps = abs(r4.x) * abs(r4.x);
    r0.xyz = r0.xyz + UniformVector_0.xyz;
    r4.y = ps;
    oC0.xyz = r4.zzz * r0.xyz;
    r4.x = r4.y * abs(r4.x);
    ps = OpacityOverride.x * r5.z;
    r4.x = min(r4.x, 1.0);
    r4.y = ps;
    oC0.w = r4.y * r4.x;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
