// ps_dac0526a009cc239.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 93 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000174 10000300 00000004 00000000 00002863 00070007 00000021 00003050 0000F151 0000F256
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c3); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
float4 MinZ_MaxZRatio : register(c2); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D Texture2D_0 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord6 : TEXCOORD6; // r2
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord6;
    float4 r3 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    r3.xy = ScreenPositionScaleBias.zw;
    r0.z = tex2D(Texture2D_0, r0.xy).w;
    r0.x = tex2D(SceneDepthTexture, r3.yx).x;
    r0.y = r0.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r0.y;
    r0.x = r1.x * 3.0;
    r0.y = ps;
    r0.w = float((r0.y != 1.0));
    p0 = (r0.w == 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = saturate(r0.x * r0.z);
    if (!p0)
    {
        if (!p0)
        {
            ps = 0.002 * r0.y;
            r3.x = saturate(ps);
            r0.x = r0.x * r3.x;
        }
    }
    ps = (-0.003921569) - -r0.x;
    r1.y = r0.z * 3.0;
    r0.z = ps;
    p0 = (r0.w == 0.0);
    ps = p0 ? 0.0 : 1.0;
    r0.x = saturate(r1.y * r1.x);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    if (!p0)
    {
        if (!p0)
        {
            ps = 0.002 * r0.y;
            r0.y = saturate(ps);
            r0.x = r0.x * r0.y;
        }
    }
    r0.yz = r2.xy * IndividualVelocityScale.xy;
    r0.yz = r0.yz * r0.xx;
    r0.x = dot(r0.yz, r0.yz) + 0.0;
    r0.x = max(r0.x, 1.0);
    ps = rsqrt(abs(r0.x));
    r0.x = ps;
    r0.zw = r0.yz * r0.xx;
    r0.xy = saturate(abs(r0.zw));
    r0.zw = float2((r0.zw > 0.0));
    r0 = r0 * float4(0.49, 0.49, 0.5, 0.5);
    r0.xy = r0.xy + r0.zw;
    r0.xy = max(r0.xy, IndividualVelocityScale.zz);
    oC0.xy = min(r0.xy, IndividualVelocityScale.ww);
    oC0.zw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
