// ps_955ea3411a9c47c7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 51 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000CC 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
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

    r4.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r4.x = dot(r2.zxy, r2.zxy);
    r5.yzw = r4.yzw * UniformVector_1.xyz;
    r4.x = rsqrt(abs(r4.x));
    r4.x = r4.x * r2.z;
    r4.x = max(r4.x, 0.0);
    r4.y = UniformVector_2.y * UniformVector_2.w;
    r4.x = -r4.x + 1.0;
    r4.z = UniformVector_2.z * UniformVector_2.w;
    r5.x = r5.y * UniformVector_2.w;
    r4.x = log2(abs(r4.x));
    r4.x = r4.x * 1.5;
    r4.w = UniformVector_2.x * UniformVector_2.w;
    r5.x = r5.x * UniformVector_2.x;
    r4.x = pow(2.0, r4.x);
    r4.yzw = r4.yzw * r4.xxx;
    r4 = r5 * r4.xwyz;
    ps = r4.y;
    r4.xzw = r4.xzw + UniformVector_0.xyz;
    r4.y = ps;
    r4.xzw = r4.xzw * r3.www + r3.xyz;
    ps = OpacityOverride.x * r4.y;
    oC0.xyz = r4.xzw * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
