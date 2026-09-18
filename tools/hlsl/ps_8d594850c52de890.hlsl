// ps_8d594850c52de890.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 42 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 000000A8 10000100 00000004 00000000 00000821 00010001 00000001 00003050
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)

#include "xenos_common.hlsli"

float4 ColorScale : register(c3); // float3
float4 InverseGamma : register(c5); // float
float4 OverlayColor : register(c4); // float4
sampler2D SceneColorTexture : register(s0);

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

    r0.xyz = tex2D(SceneColorTexture, r0.xy).xyz;
    r0.xyz = r0.xyz * ColorScale.xyz;
    r1.xyz = -r0.xyz + OverlayColor.xyz;
    r0.xyz = saturate(r1.xyz * OverlayColor.www + r0.xyz);
    r0.x = log2(r0.x);
    r0.y = log2(r0.y);
    r0.z = log2(r0.z);
    r0.xyz = r0.xyz * InverseGamma.xxx;
    oC0.x = pow(2.0, r0.x);
    oC0.yz = 0.0;
    oC0.w = 1.0;
    oC0.y = pow(2.0, r0.y);
    oC0.z = pow(2.0, r0.z);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
