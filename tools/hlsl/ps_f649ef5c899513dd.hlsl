// ps_f649ef5c899513dd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 78 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000138 10000300 00000008 00000000 00004084 0003000F 00000021 0000F050 0000F156 0000F2A0 0000F3A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c4); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
float4 UniformVector_1 : register(c3); // float4
sampler2D Texture2D_0 : register(s0);

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

    r3 = r0.yxxy * float4(1.0, 1.0, 2e+01, 2e+01) - 0.5;
    r2.zw = r3.xx * float2(0.9999997, 0.0007963267) + 0.5;
    r2.xy = r3.ww * float2(-0.0015926529, -0.99999875) + 0.5;
    r2.xy = r3.yy * float2(-0.99999875, 0.0015926529) + r2.xy;
    r2.zw = r3.zz * float2(0.0007963267, -0.9999997) + r2.zw;
    r2.z = tex2D(Texture2D_0, r2.zw).x;
    r2.y = tex2D(Texture2D_0, r2.xy).x;
    r2.x = IndividualVelocityScale.x * UniformVector_1.x;
    r2.y = r2.z + r2.y;
    ps = UniformVector_1.x * r2.y;
    r2.z = r2.x * r2.y;
    r2.x = ps;
    ps = IndividualVelocityScale.y * r2.x;
    r2.w = ps;
    r2.zw = r2.zw * r1.xy;
    r2.y = dot(r2.zw, r2.zw) + 0.0;
    r2.y = max(r2.y, 1.0);
    ps = rsqrt(abs(r2.y));
    r2.x = r2.x - 0.003921569;
    r2.y = ps;
    r2.yz = r2.wz * r2.yy;
    ps = abs(r2.z);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.xxxx)) clip(-1.0);
    r2.x = saturate(ps);
    ps = abs(r2.y);
    r2.zw = float2((r2.zy > 0.0));
    r2.y = saturate(ps);
    r2 = r2 * float4(0.49, 0.49, 0.5, 0.5);
    r2.xy = r2.xy + r2.zw;
    r2.xy = max(r2.xy, IndividualVelocityScale.zz);
    oC0.xy = min(r2.xy, IndividualVelocityScale.ww);
    oC0.zw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
