// ps_3223f1676fb8ac29.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 36 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 00000090 10000100 00000004 00000000 00000821 00010001 00000001 00003050
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)

#include "xenos_common.hlsli"

float4 consts : register(c3); // float4
float4 tob : register(c2); // float4
float4 tog : register(c1); // float4
float4 tor : register(c0); // float4
sampler2D tex0 : register(s0);
sampler2D tex1 : register(s1);
sampler2D tex2 : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.x = tex2D(tex0, r0.xy).x;
    r1.y = tex2D(tex1, r0.xy).x;
    r1.z = tex2D(tex2, r0.xy).x;
    r0.y = tor.w * consts.x;
    r0.x = dot(r1.zxy, tor.zxy);
    ps = tog.w;
    r0.z = dot(r1.zxy, tog.zxy);
    ps = consts.x * ps;
    r1.x = dot(r1.zxy, tob.zxy);
    r0.w = ps;
    oC0.z = tob.w * consts.x + r1.x;
    ps = consts.w;
    oC0.xy = r0.xz + r0.yw;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
