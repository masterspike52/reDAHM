// ps_e054c628412ac3b4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 60 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000F0 10000500 00000004 00000000 00004CC6 003F003F 00000021 00003050 00003151 0000F252 0000F353 0000F456 00007557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0x7)
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
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
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
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 oC0 = 0.0;

    r0.zw = r0.xy * 0.2 + UniformVector_1.xy;
    r1.x = tex2D(Texture2D_0, r0.zw).x;
    r0.z = dot(r5.zxy, r5.zxy);
    r1.zw = r0.yx - 0.5;
    r1.y = rsqrt(abs(r0.z));
    r0.w = dot(r1.zw, UniformVector_3.yx) + 0.5;
    r0.z = dot(r1.zw, UniformVector_2.yx) + 0.5;
    r1.x = r1.x * 0.25 - 0.005;
    r1.yz = r1.yy * r5.xy;
    r0.xy = r1.yz * r1.xx + r0.xy;
    r0.x = tex2D(Texture2D_1, r0.xy).x;
    r0.y = tex2D(Texture2D_1, r0.zw).x;
    r0.y = r0.y * r3.x;
    r0.x = r0.y * r0.x;
    r0.x = min(r0.x, 1.0);
    r0.x = (-0.5) - -r0.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    oC0.w = r4.w;
    oC0.xyz = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
