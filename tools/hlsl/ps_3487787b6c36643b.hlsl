// ps_3487787b6c36643b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 84 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000150 10000400 00000004 00000000 00003484 000F000F 00000001 00003050 0000F155 00007256 0000F357
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c7); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_9 : register(c6); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
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
    float4 r4 = 0.0;
    float4 oC0 = 0.0;

    r1.xy = r0.xy + UniformVector_1.xy;
    r1.zw = r0.xy + UniformVector_2.xy;
    r4 = r1 + r0.xyxy;
    r0.x = tex2D(Texture2D_1, r0.xy).w;
    r1.xyz = tex2D(Texture2D_0, r4.zw).xyz;
    r4.xyz = tex2D(Texture2D_0, r4.xy).xyz;
    r0.y = dot(r2.zxy, r2.zxy);
    r4.xyz = r4.xyz * 0.6;
    r1.xyz = r1.xyz * 0.6;
    r0.y = rsqrt(abs(r0.y));
    r0.yz = r0.yy * r2.xz;
    r0.z = r0.z * 2.0 - r0.z;
    r1.w = r0.z * r0.z;
    r4.w = -r0.y * -r0.y;
    r1 = r4 + r1;
    r0.y = r0.x * UniformScalar_9.x;
    r0.x = rsqrt(abs(r1.w));
    r1.xyz = r1.xyz * 0.1 + UniformVector_0.xyz;
    r1.xyz = r1.xyz * r3.www + r3.xyz;
    r0.x = dot(-r0.zz, r0.xx) + 2.0;
    r0.x = abs(r0.x) * abs(r0.x);
    oC0.xyz = r1.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    r0.x = -r0.x * r0.x + 1.0;
    r0.x = max(r0.x, 0.0);
    r0.x = min(r0.x, 2.0);
    r0.y = r0.y * r0.x;
    oC0.w = OpacityOverride.x * r0.y;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
