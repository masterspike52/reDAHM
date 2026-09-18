// ps_93ee535b1990601e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 42 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000A8 10000300 00000008 00000000 00004084 0001000F 00000001 0000F056 0000F1A0 0000F2A1 0000F3A2
//   interpolator: r0 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r1 <-> COLOR0 (flags 0xF)
//   interpolator: r2 <-> COLOR1 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c3); // float4 // default: 1.0, 1.0, 0.0002, 0.9998

struct PS_INPUT
{
    float4 texcoord6 : TEXCOORD6; // r0
    float4 color0 : COLOR0; // r1
    float4 color1 : COLOR1; // r2
    float4 color2 : COLOR2; // r3
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord6;
    float4 r1 = In.color0;
    float4 r2 = In.color1;
    float4 r3 = In.color2;
    float4 oC0 = 0.0;

    r1.yz = r0.xy * IndividualVelocityScale.xy;
    r1.x = dot(r1.yz, r1.yz) + 0.0;
    r1.x = max(r1.x, 1.0);
    r1.x = rsqrt(abs(r1.x));
    r1.zw = r1.yz * r1.xx;
    r1.xy = saturate(abs(r1.zw));
    r1.zw = float2((r1.zw > 0.0));
    r1 = r1 * float4(0.49, 0.49, 0.5, 0.5);
    r1.xy = r1.xy + r1.zw;
    r1.xy = max(r1.xy, IndividualVelocityScale.zz);
    oC0.xy = min(r1.xy, IndividualVelocityScale.ww);
    oC0.zw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
