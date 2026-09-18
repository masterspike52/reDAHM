// ps_1bcf5e1a4ca069d9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 54 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000D8 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

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

    r4.yw = r0.yx - 0.5;
    r4.xz = r4.yw * UniformVector_1.yx;
    r4.yw = r4.yw * UniformVector_2.yx;
    r5 = r4 + float4(0.5, 0.5, 0.0, 0.0);
    r4 = r5 + r4.zwxy;
    r5.xz = r4.zw + 0.5;
    r5.y = tex2D(Texture2D_1, r5.xz).x;
    r5.z = tex2D(Texture2D_0, r5.xz).x;
    r0.xyz = tex2D(Texture2D_0, r4.xy).xyz;
    r4.x = tex2D(Texture2D_1, r4.xy).x;
    r5.x = SCENE_COLOR_BIAS_FACTOR.x * r3.w;
    r4.xyz = r4.xxx * float3(2e+01, 1.0, 0.5) + UniformVector_0.xyz;
    r4.xzw = r0.xyz * float3(2e+01, 1e+01, 1e+01) + r4.xyz;
    r4.y = dot(r5.zy, float2(2e+01, 2e+01)) + 0.0;
    oC0.xyz = r5.xxx * r4.xzw;
    oC0.w = OpacityOverride.x * r4.y;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
