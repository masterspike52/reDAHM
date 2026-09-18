// ps_048b544702aa51a0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 60 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000F0 10000500 00000004 00000000 00004CC6 003F003F 00000001 00003050 00003151 0000F252 0000F353 0000F455 00007556
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformVector_4 : register(c3); // float4
float4 UniformVector_5 : register(c4); // float4
float4 UniformVector_6 : register(c5); // float4

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord5 : TEXCOORD5; // r4
    float4 texcoord6 : TEXCOORD6; // r5
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.x = dot(r5.zxy, r5.zxy);
    ps = rsqrt(abs(r0.x));
    r0.w = 1.0;
    r0.x = ps;
    r1.xyz = r0.xxx * r5.xyz;
    r0.x = r1.z * 2.0 - r1.z;
    r0.xyz = (float3(1.0, 1.0, 0.0) == 0.0) ? r0.xxx : -r1.xyx;
    r1.w = dot(r1.xyz, r0.xyz);
    r0.x = dot(r1, r0);
    r0.xz = r0.xx * UniformVector_4.yx - 0.5;
    r0.y = dot(r0.xz, UniformVector_6.yx) + 0.5;
    r0.x = dot(r0.xz, UniformVector_5.yx) + 0.5;
    r0.xy = r0.xy * 4.0;
    r0.xy = max(r0.xy, (-255.0));
    r0.xy = min(r0.xy, 255.0);
    r0.xy = r0.xy * 0.003921569;
    oC0.xy = max(r0.xy, 0.0);
    r0.xy = min(r0.xy, 0.0);
    oC0.zw = abs(r0.xy);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
