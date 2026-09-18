// ps_03b08c020d28edfb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 87 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000015C 10000400 00000004 00000001 00000821 00010001 00000001 00003050
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
// Definition header: 00000000 00000001 00000001 00000000
// Non-float definitions (raw): 00000000 239C0001 00000009 00000000

#include "xenos_common.hlsli"

float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 blurParameters : register(c3); // float3
float4 screenCenter : register(c4); // float2
float4 viewportRatio : register(c5); // float4
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
    float4 r4 = 0.0;
    float4 oC0 = 0.0;
    bool p0 = false;
    int aL = 0;

    r0.zw = r0.yx * float2(-0.5, 0.5) + 0.5;
    r1.xyz = tex2D(SceneColorTexture, r0.wz).xyz;
    r3.xy = r0.xy * viewportRatio.xy;
    r0.zw = -r3.xy + screenCenter.xy;
    r1.w = dot(r0.zw, r0.zw) + 0.0;
    r0.x = sqrt(abs(r1.w));
    r0.x = -blurParameters.y - -r0.x;
    r0.y = max(r0.x, 0.0);
    r0.x = float((r0.y > 0.01));
    p0 = (r0.x != 0.0);
    if (p0)
    {
        r0.x = 1.0;
        r1.w = rsqrt(abs(r1.w));
        r0.y = r0.y * r1.w;
    }
    if (p0)
    {
        if (p0)
        {
            r2.xyz = r1.xyz;
            r0.yz = r0.yy * r0.zw;
            r0.yz = r0.yz * 0.015;
        }
    }
    for (int xe_iter0 = 0, aL = 0; xe_iter0 < 9; xe_iter0++, aL += 0)
    {
        if (p0)
        {
            if (p0)
            {
                r4.xy = viewportRatio.wz * float2(-0.5, 0.5);
                r3.zw = r0.yz * r0.xx + r3.xy;
                r3.zw = r4.xy * r3.wz + 0.5;
                r4.xyz = tex2D(SceneColorTexture, r3.wz).xyz;
                r2.xyz = r4.xyz + r2.xyz;
                r0.x = 1.0 + r0.x;
            }
        }
        if (!p0) break;
    }
    if (p0)
    {
        if (p0)
        {
            r0.xyz = r2.xyz * 0.1 - r1.xyz;
            r1.xyz = r0.xyz * blurParameters.xxx + r1.xyz;
        }
    }
    oC0.xyz = r1.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 1.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
