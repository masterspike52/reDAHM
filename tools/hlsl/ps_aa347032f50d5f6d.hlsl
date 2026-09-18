// ps_aa347032f50d5f6d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 60 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000F0 10000200 00000004 00000000 00002463 00070007 00000001 00003050 0000F155 00007256
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformVector_3 : register(c3); // float4
float4 UniformVector_4 : register(c4); // float4
float4 UniformVector_5 : register(c5); // float4

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.x = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r0.x));
    r0.w = 1.0;
    r0.x = ps;
    r1.xyz = r0.xxx * r2.xyz;
    r0.x = r1.z * 2.0 - r1.z;
    r0.xyz = (float3(1.0, 1.0, 0.0) == 0.0) ? r0.xxx : -r1.xyx;
    r1.w = dot(r1.xyz, r0.xyz);
    r0.x = dot(r1, r0);
    r0.xz = r0.xx * UniformVector_3.yx - 0.5;
    r0.y = dot(r0.xz, UniformVector_5.yx) + 0.5;
    r0.x = dot(r0.xz, UniformVector_4.yx) + 0.5;
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
