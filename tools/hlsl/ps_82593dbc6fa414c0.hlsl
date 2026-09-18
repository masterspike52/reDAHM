// ps_82593dbc6fa414c0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 60 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000F0 10000400 00000004 00000000 00003484 000F000F 00000021 00003050 0000F151 0000F256 00007357
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformVector_1 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
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
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = 0.0;
    float4 oC0 = 0.0;

    r0.zw = r0.xy * 0.2 + UniformVector_1.xy;
    r3.w = tex2D(Texture2D_0, r0.zw).x;
    r0.z = dot(r3.zxy, r3.zxy);
    r4.yz = r0.yx - 0.5;
    r4.x = rsqrt(abs(r0.z));
    r0.w = dot(r4.yz, UniformVector_3.yx) + 0.5;
    r0.z = dot(r4.yz, UniformVector_2.yx) + 0.5;
    r3.w = r3.w * 0.25 - 0.005;
    r3.xy = r4.xx * r3.xy;
    r0.xy = r3.xy * r3.ww + r0.xy;
    r0.x = tex2D(Texture2D_1, r0.xy).x;
    r0.y = tex2D(Texture2D_1, r0.zw).x;
    r0.y = r0.y * r1.x;
    r0.x = r0.y * r0.x;
    r0.x = min(r0.x, 1.0);
    r0.x = (-0.5) - -r0.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    oC0.w = r2.w;
    oC0.xyz = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
