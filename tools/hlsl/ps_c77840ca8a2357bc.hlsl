// ps_c77840ca8a2357bc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 87 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000015C 10000600 00000004 00000000 00005CE7 007F007F 00000001 00003050 00003151 0000F252 0000F353 0000F455 00007556 0000F657
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord5 : TEXCOORD5; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord3;
    float4 r4 = In.texcoord5;
    float4 r5 = In.texcoord6;
    float4 r6 = In.texcoord7;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r4.xy = r0.xy * float2(1e+01, 1.0) + UniformVector_3.xy;
    r4.zw = r0.xy * float2(15.0, 1.875) + UniformVector_4.xy;
    r0.zw = r0.xy * float2(2.5, 1.25) + UniformVector_1.xy;
    r1.xy = r0.xy * float2(5.0, 2.5) + UniformVector_2.xy;
    r1.zw = r0.yx - 0.5;
    r0.y = dot(r1.zw, float2(0.0007963267, 0.9999997)) + 0.5;
    r0.x = dot(r1.zw, float2(-0.9999997, 0.0007963267)) + 0.5;
    r2.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r1.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r0.yzw = tex2D(Texture2D_0, r0.zw).xyz;
    r1.w = tex2D(Texture2D_2, r4.zw).w;
    r0.x = tex2D(Texture2D_1, r4.xy).w;
    ps = 2.0 - r0.x;
    r2.w = ps;
    r1.w = r2.w * r1.w;
    r1 = r1 + r0.yzwx;
    ps = abs(r1.x) * abs(r1.x);
    r0.xyz = r2.xyz * r3.www;
    r4.x = ps;
    ps = abs(r1.y) * abs(r1.y);
    r0.xyz = r0.xyz * r1.www;
    r4.y = ps;
    ps = abs(r1.z) * abs(r1.z);
    r2.xyz = abs(r0.xyz) * abs(r0.xyz);
    r4.z = ps;
    r1.xyz = r4.xyz * abs(r1.xyz);
    r2.xyz = r2.xyz * r2.xyz;
    r1.xyz = r1.xyz * r3.xyz;
    ps = r6.w;
    r0.xyz = r2.xyz * abs(r0.xyz);
    ps = SCENE_COLOR_BIAS_FACTOR.x * ps;
    r0.xyz = min(r0.yxz, 1.0);
    r0.w = ps;
    r1.xyz = r1.xyz * r0.yxz + UniformVector_0.xyz;
    ps = OpacityOverride.x * r0.y;
    oC0.xyz = r0.www * r1.xyz;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
