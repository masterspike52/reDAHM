// ps_035d5fc64e7f45ee.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 63 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000FC 10000300 00000008 00000000 00004084 0003000F 00000021 0000F050 0000F156 0000F2A0 0000F3A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c5); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
float4 UniformScalar_0 : register(c3); // float
float4 UniformScalar_2 : register(c4); // float

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

    r3.zw = r1.xy * IndividualVelocityScale.xy;
    r3.xy = r0.yx * 2.0 - 1.0;
    r2 = r3 * r3;
    r2.xz = r2.yz + r2.xw;
    ps = sqrt(abs(r2.x));
    r2.z = max(r2.z, 1.0);
    r2.y = ps;
    r0.x = float((r2.y >= UniformScalar_0.x));
    ps = rsqrt(abs(r2.z));
    r2.x = float((UniformScalar_0.x >= r2.y));
    r2.z = ps;
    ps = UniformScalar_0.x - r2.y;
    r3.yz = r3.wz * r2.zz;
    r2.y = ps;
    r0.y = float((r2.y >= UniformScalar_2.x));
    ps = abs(r3.z);
    r2.z = float((UniformScalar_2.x >= r2.y));
    r3.x = saturate(ps);
    ps = abs(r3.y);
    r3.zw = float2((r3.zy > 0.0));
    r3.y = saturate(ps);
    r2.xy = (r0.xy > 0.0) ? r2.xz : 1.0;
    r2.z = r2.x * r2.y - 0.5;
    r3 = r3 * float4(0.49, 0.49, 0.5, 0.5);
    r2.xy = r3.xy + r3.zw;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.zzzz)) clip(-1.0);
    r2.xy = max(r2.xy, IndividualVelocityScale.zz);
    oC0.xy = min(r2.xy, IndividualVelocityScale.ww);
    oC0.zw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
