// ps_14857c8778850d4a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 63 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000FC 10000300 00000004 00000000 00000821 00010001 00000001 00003050
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ShaderComplexityColors[6] : register(c3); // float3[6]
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
    float4 r2 = 0.0;
    float4 r3 = 0.0;
    float4 oC0 = 0.0;

    r0.x = tex2D(SceneColorTexture, r0.xy).x;
    r0.w = 3.0 * r0.x;
    r1.w = float((1.0 >= r0.w));
    r3 = float4((r0.wwww > float4(1.0, 2.0, 3.0, 4.0)));
    r2 = float4((float4(2.0, 3.0, 4.0, 5.0) >= r0.wwww));
    r2 = r3 * r2;
    r0.xyz = (r2.www == 0.0) ? ShaderComplexityColors[5].xzy : ShaderComplexityColors[4].xzy;
    r1.xyz = (r2.zzz == 0.0) ? ShaderComplexityColors[5].xzy : ShaderComplexityColors[4].xzy;
    r1.xyz = (r2.yyy == 0.0) ? r1.xyz : ShaderComplexityColors[3].xzy;
    r0.xyz = (r2.zzz == 0.0) ? r0.xyz : ShaderComplexityColors[3].xzy;
    r0.xyz = (r2.yyy == 0.0) ? r0.xyz : ShaderComplexityColors[2].xzy;
    r1.xyz = (r2.xxx == 0.0) ? r1.xyz : ShaderComplexityColors[2].xzy;
    r1.xyz = (r1.www == 0.0) ? r1.xzy : ShaderComplexityColors[1].xyz;
    r0.xyz = (r2.xxx == 0.0) ? r0.xyz : ShaderComplexityColors[1].xzy;
    r0.xyz = (r1.www == 0.0) ? r0.xzy : ShaderComplexityColors[0].xyz;
    r1.xyz = r1.xyz - r0.xyz;
    r0.w = frac(r0.w);
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 1.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
