// ps_47c9ad13ec70c101.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 42 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000A8 10000400 00000008 00000000 000048A5 0007001F 00000001 00003050 0000F151 0000F256 0000F3A0 0000F4A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c3); // float4 // default: 1.0, 1.0, 0.0002, 0.9998

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

    r3.yz = r2.xy * IndividualVelocityScale.xy;
    r3.x = dot(r3.yz, r3.yz) + 0.0;
    r3.x = max(r3.x, 1.0);
    r3.x = rsqrt(abs(r3.x));
    r3.zw = r3.yz * r3.xx;
    r3.xy = saturate(abs(r3.zw));
    r3.zw = float2((r3.zw > 0.0));
    r3 = r3 * float4(0.49, 0.49, 0.5, 0.5);
    r3.xy = r3.xy + r3.zw;
    r3.xy = max(r3.xy, IndividualVelocityScale.zz);
    oC0.xy = min(r3.xy, IndividualVelocityScale.ww);
    oC0.zw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
