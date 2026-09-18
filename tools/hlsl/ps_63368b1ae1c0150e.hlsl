// ps_63368b1ae1c0150e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 84 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000150 10000300 00000008 00000000 00004084 0003000F 00000021 0000F050 0000F156 0000F2A0 0000F3A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c3); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
float4 MinZ_MaxZRatio : register(c2); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
sampler2D SceneDepthTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 color0 : COLOR0; // r2
    float4 color2 : COLOR2; // r3
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord6;
    float4 r2 = In.color0;
    float4 r3 = In.color2;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r2.xy = ScreenPositionScaleBias.zw;
    r2.x = tex2D(SceneDepthTexture, r2.yx).x;
    r2.x = r2.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r2.y = 1.0 / r2.x;
    r2.x = float((r2.y != 1.0));
    p0 = (r2.x != 0.0);
    if (p0)
    {
        r2.z = saturate(0.002 * r2.y);
    }
    if (!p0)
    {
        r2.z = 1.0;
    }
    p0 = (r2.x == 0.0);
    ps = p0 ? 0.0 : 1.0;
    r2.z = r2.z - 0.003921569;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.zzzz)) clip(-1.0);
    if (p0)
    {
        ps = 1.0;
        r2.x = ps;
    }
    if (!p0)
    {
        ps = 0.002 * r2.y;
        r2.x = saturate(ps);
    }
    r2.yz = r1.xy * IndividualVelocityScale.xy;
    r2.yz = r2.yz * r2.xx;
    r2.x = dot(r2.yz, r2.yz) + 0.0;
    r2.x = max(r2.x, 1.0);
    ps = rsqrt(abs(r2.x));
    r2.x = ps;
    r2.zw = r2.yz * r2.xx;
    r2.xy = saturate(abs(r2.zw));
    r2.zw = float2((r2.zw > 0.0));
    r2 = r2 * float4(0.49, 0.49, 0.5, 0.5);
    r2.xy = r2.xy + r2.zw;
    r2.xy = max(r2.xy, IndividualVelocityScale.zz);
    oC0.xy = min(r2.xy, IndividualVelocityScale.ww);
    oC0.zw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
