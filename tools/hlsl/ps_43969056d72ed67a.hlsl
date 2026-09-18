// ps_43969056d72ed67a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 42 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000A8 10000200 00000004 00000000 00002463 00070007 00000021 00003050 0000F156 00007257
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformScalar_0 : register(c3); // float
float4 UniformScalar_2 : register(c4); // float

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 texcoord7 : TEXCOORD7; // r2
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord6;
    float4 r2 = In.texcoord7;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.xy = r0.yx * 2.0 - 1.0;
    r0.x = dot(r0.yx, r0.yx) + 0.0;
    r0.y = sqrt(abs(r0.x));
    r2.x = float((r0.y >= UniformScalar_0.x));
    ps = UniformScalar_0.x - r0.y;
    r0.x = float((UniformScalar_0.x >= r0.y));
    r0.y = ps;
    r2.y = float((r0.y >= UniformScalar_2.x));
    r0.z = float((UniformScalar_2.x >= r0.y));
    r0.xy = (r2.xy > 0.0) ? r0.xz : 1.0;
    r0.x = r0.x * r0.y - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    ps = r1.w;
    oC0.w = ps;
    oC0.xyz = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
