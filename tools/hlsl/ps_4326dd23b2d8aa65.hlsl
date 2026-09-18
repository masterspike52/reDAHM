// ps_4326dd23b2d8aa65.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 39 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 0000009C 10000200 00000004 00000000 00000821 00010001 00000001 00003050
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)

#include "xenos_common.hlsli"

float4 consts : register(c3); // float4
float4 tob : register(c2); // float4
float4 tog : register(c1); // float4
float4 tor : register(c0); // float4
sampler2D tex0 : register(s0);
sampler2D tex1 : register(s1);
sampler2D tex2 : register(s2);
sampler2D tex3 : register(s3);

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
    float4 r2 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r2.x = tex2D(tex0, r0.xy).x;
    r2.y = tex2D(tex1, r0.xy).x;
    r2.z = tex2D(tex2, r0.xy).x;
    r0.x = tex2D(tex3, r0.xy).x;
    r1.y = tor.w * consts.x;
    r1.x = dot(r2.zxy, tor.zxy);
    ps = tog.w;
    r1.z = dot(r2.zxy, tog.zxy);
    ps = consts.x * ps;
    r0.y = dot(r2.zxy, tob.zxy);
    r1.w = ps;
    oC0.z = tob.w * consts.x + r0.y;
    ps = consts.w * r0.x;
    oC0.xy = r1.xz + r1.yw;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
