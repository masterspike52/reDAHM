// ps_cccdc573cf06236e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 84 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000150 10000500 00000004 00000000 000044A5 001F001F 00000001 00003050 0000F151 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.zw = r0.xy * float2(64.0, 4.0) + UniformVector_5.xy;
    r2.xz = r0.xy * float2(32.0, 1.0) + UniformVector_4.xy;
    r2.y = r2.z + r0.y;
    r3.x = tex2D(Texture2D_3, r2.xy).w;
    r0.z = tex2D(Texture2D_4, r0.zw).w;
    r5.xy = r0.xy * float2(2e+01, 0.5) + UniformVector_3.xy;
    r3.yz = r0.xy + r0.xy;
    r3.w = -r3.x + r0.z;
    r0.zw = r3.yz * float2(16.0, 0.25) + UniformVector_1.xy;
    r2.xy = r3.yz * float2(4.0, 0.25) + UniformVector_2.xy;
    r2.xyz = tex2D(Texture2D_1, r2.xy).xyz;
    r2.w = tex2D(Texture2D_5, r0.xy).x;
    r0.xzw = tex2D(Texture2D_0, r0.zw).xyz;
    r0.y = tex2D(Texture2D_2, r5.xy).x;
    r0.xzw = abs(r0.xzw) * abs(r0.xzw);
    r0.xzw = r0.xzw * r0.xzw;
    r2 = r2 * r1;
    r1.w = r3.w * 0.5 + r3.x;
    ps = r4.w;
    r1.xyz = r0.xzw * r0.xzw;
    ps = SCENE_COLOR_BIAS_FACTOR.x * ps;
    r1 = r2 * r1;
    r0.z = ps;
    ps = abs(r1.w) * abs(r1.w);
    r1.xyz = r1.xyz + UniformVector_0.xyz;
    r0.x = ps;
    ps = OpacityOverride.x * r0.y;
    r0.x = min(r0.x, 1.0);
    r0.y = ps;
    oC0.xyz = r0.zzz * r1.xyz;
    oC0.w = r0.y * r0.x;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
