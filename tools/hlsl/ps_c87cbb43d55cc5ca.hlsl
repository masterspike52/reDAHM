// ps_c87cbb43d55cc5ca.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 45 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000B4 10000400 00000008 00000000 000040A5 0007001F 00000021 00003050 00003151 0000F256 0000F3A0 0000F4A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c3); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
sampler2D Texture2D_3 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 color0 : COLOR0; // r3
    float4 color1 : COLOR1; // r4
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
    float4 r3 = In.color0;
    float4 r4 = In.color1;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3.x = tex2D(Texture2D_3, r0.xy).w;
    r3.zw = r2.xy * IndividualVelocityScale.xy;
    r3.y = dot(r3.zw, r3.zw) + 0.0;
    r3.y = max(r3.y, 1.0);
    ps = rsqrt(abs(r3.y));
    r3.x = r3.x - 0.5;
    r3.y = ps;
    r3.yz = r3.wz * r3.yy;
    ps = abs(r3.z);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.xxxx)) clip(-1.0);
    r3.x = saturate(ps);
    ps = abs(r3.y);
    r3.zw = float2((r3.zy > 0.0));
    r3.y = saturate(ps);
    r3 = r3 * float4(0.49, 0.49, 0.5, 0.5);
    r3.xy = r3.xy + r3.zw;
    r3.xy = max(r3.xy, IndividualVelocityScale.zz);
    oC0.xy = min(r3.xy, IndividualVelocityScale.ww);
    oC0.zw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
