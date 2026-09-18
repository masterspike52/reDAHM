// ps_9268051b88811886.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 72 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000120 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
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

    r4.xz = r0.xy + UniformVector_1.xy;
    r5.xy = UniformVector_2.yx - 0.5;
    r4.y = dot(r2.zxy, r2.zxy);
    r5.xy = r5.xy + r0.yx;
    r4.y = rsqrt(abs(r4.y));
    r1.y = dot(r5.xy, UniformVector_4.yx) + 0.5;
    r1.x = dot(r5.xy, UniformVector_3.yx) + 0.5;
    r4.yw = r4.yy * r2.xy;
    r5.y = r0.y;
    r5.xzw = -r4.yyw * float3(0.5, 0.4, 0.4) + 0.5;
    r4.y = tex2D(Texture2D_2, r5.zw).x;
    r4.w = tex2D(Texture2D_0, r1.xy).x;
    r4.z = tex2D(Texture2D_0, r4.xz).x;
    r4.x = tex2D(Texture2D_1, r5.xy).x;
    r5.xyz = UniformVector_0.xyz + float3(1.0, 0.9, 0.5);
    r5.xyz = r5.xyz * r3.www + r3.xyz;
    ps = 3.0 * r4.x;
    r4.z = r4.w + r4.z;
    r4.x = ps;
    r4.x = r4.x * r4.z;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    ps = 0.5 * r4.x;
    r4.x = ps;
    r4.y = r4.x * r4.y;
    ps = OpacityOverride.x * r4.y;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
