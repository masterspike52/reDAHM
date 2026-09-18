// ps_c9590bf0b6b9d5fa.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 84 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000150 10000200 00000004 00000001 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000001 00000000
// Non-float definitions (raw): 00000000 239C0001 00000002 00000000

#include "xenos_common.hlsli"

float4 DynamicVelocityParameters : register(c3); // float4 // default: 0.025, -0.044444446, -0.0125, 0.022222223
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
sampler2D SceneColorTexture : register(s0);
sampler2D VelocityBuffer : register(s1);

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
    bool p0 = false;
    int aL = 0;

    r0.xy = tex2D(VelocityBuffer, r0.zw).xy;
    r1.x = r0.x + r0.y;
    r1.x = float((r1.x > 0.0001));
    p0 = (r1.x != 0.0);
    if (p0)
    {
        r1.xy = r0.yx * 2.0 - 1.0;
        r0.xy = float2((-r1.xy > 0.0));
    }
    if (p0)
    {
        if (p0)
        {
            r0.xy = abs(r1.xy) - r0.xy;
            r1.xy = r0.xy * DynamicVelocityParameters.yx;
            r0.x = dot(r0.yx, r0.yx) + 0.0;
            r0.xy = r1.xy * r0.xx;
            r1.zw = r0.yx * 0.33333334;
            r1.xy = r1.zw * (-2.0) + r0.zw;
        }
    }
    if (p0)
    {
        r0.xyz = tex2D(SceneColorTexture, r1.xy).zyx;
    }
    for (int xe_iter0 = 0, aL = 0; xe_iter0 < 2; xe_iter0++, aL += 0)
    {
        if (p0)
        {
            if (p0)
            {
                r1.xy = r1.zw + r1.xy;
                r2.xyz = tex2D(SceneColorTexture, r1.xy).xyz;
                r0.xyz = r2.zyx + r0.xyz;
            }
        }
        if (!p0) break;
    }
    if (p0)
    {
        r0.w = SCENE_COLOR_BIAS_FACTOR.x * 0.33333334;
        r0.xyz = r0.www * r0.zyx;
    }
    if (!p0)
    {
        r0.xyz = tex2D(SceneColorTexture, r0.zw).xyz;
        r0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    }
    oC0.xyz = r0.xyz;
    oC0.w = 1.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
