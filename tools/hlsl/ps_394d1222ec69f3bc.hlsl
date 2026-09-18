// ps_394d1222ec69f3bc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 45 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000B4 10000100 00000004 00000000 00001021 00010001 00000021 0000F056
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c4); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
float4 UniformVector_1 : register(c3); // float4

struct PS_INPUT
{
    float4 texcoord6 : TEXCOORD6; // r0
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord6;
    float4 r1 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.xy = IndividualVelocityScale.xy * UniformVector_1.ww;
    r0.zw = r1.xy * r0.xy;
    r0.x = dot(r0.zw, r0.zw) + 0.0;
    r0.y = max(r0.x, 1.0);
    ps = rsqrt(abs(r0.y));
    r0.x = UniformVector_1.w - 0.003921569;
    r0.y = ps;
    r0.yz = r0.wz * r0.yy;
    ps = abs(r0.z);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    r0.x = saturate(ps);
    ps = abs(r0.y);
    r0.zw = float2((r0.zy > 0.0));
    r0.y = saturate(ps);
    r0 = r0 * float4(0.49, 0.49, 0.5, 0.5);
    r0.xy = r0.xy + r0.zw;
    r0.xy = max(r0.xy, IndividualVelocityScale.zz);
    oC0.xy = min(r0.xy, IndividualVelocityScale.ww);
    oC0.zw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
