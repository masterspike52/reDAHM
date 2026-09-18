// ps_2b361f49a05bb47e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 51 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000CC 10000200 00000008 00000000 00001842 00010003 00000001 00003050 0000F1A0
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> COLOR0 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 Gamma : register(c3); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
sampler2D Texture : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 color0 : COLOR0; // r1
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.color0;
    float4 r2 = 0.0;
    float4 oC0 = 0.0;
    bool p0 = false;

    r2 = tex2D(Texture, r0.xy);
    r0.w = float((Gamma.x != 1.0));
    r0.xyz = saturate(r2.zyx * r1.zyx);
    p0 = (r0.w != 0.0);
    r1 = r2 * r1;
    if (p0)
    {
        if (p0)
        {
            r1.x = log2(abs(r0.z));
            r1.y = log2(abs(r0.y));
            r1.z = log2(abs(r0.x));
            r0.xyz = r1.xyz * Gamma.xxx;
            r1.x = pow(2.0, r0.x);
            r1.y = pow(2.0, r0.y);
        }
    }
    if (p0)
    {
        if (p0)
        {
            r1.z = pow(2.0, r0.z);
        }
    }
    r1.xyz = r1.zyx * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0 = r1.zyxw;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
