// ps_7f182ef958f74790.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 33 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 00000084 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
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

    r4.zw = r0.xy + UniformVector_1.xy;
    r1.xyz = tex2D(Texture2D_0, r4.zw).xyz;
    r4.xy = r0.xy + UniformVector_2.xy;
    r5.x = SCENE_COLOR_BIAS_FACTOR.x * r3.w;
    r5.yzw = tex2D(Texture2D_0, r4.xy).xyz;
    r4 = tex2D(Texture2D_1, r0.xy).xwyz;
    r5.yzw = r1.xyz * r5.yzw;
    r4.y = r4.y;
    r4.xzw = r5.yzw * r4.xzw + UniformVector_0.xyz;
    oC0.xyz = r5.xxx * r4.xzw;
    oC0.w = OpacityOverride.x * r4.y;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
