// ps_d1eca4ceba1ad169.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 63 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000FC 10000200 00000004 00000000 00001842 00030003 00000021 00003050 0000F156
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
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
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord6;
    float4 r2 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.zw = r1.xy * IndividualVelocityScale.xy;
    r1.xy = r0.yx * 2.0 - 1.0;
    r0 = r1 * r1;
    r0.xz = r0.yz + r0.xw;
    ps = sqrt(abs(r0.x));
    r0.z = max(r0.z, 1.0);
    r0.y = ps;
    r2.x = float((r0.y >= UniformScalar_0.x));
    ps = rsqrt(abs(r0.z));
    r0.x = float((UniformScalar_0.x >= r0.y));
    r0.z = ps;
    ps = UniformScalar_0.x - r0.y;
    r1.yz = r1.wz * r0.zz;
    r0.y = ps;
    r2.y = float((r0.y >= UniformScalar_2.x));
    ps = abs(r1.z);
    r0.z = float((UniformScalar_2.x >= r0.y));
    r1.x = saturate(ps);
    ps = abs(r1.y);
    r1.zw = float2((r1.zy > 0.0));
    r1.y = saturate(ps);
    r0.xy = (r2.xy > 0.0) ? r0.xz : 1.0;
    r0.z = r0.x * r0.y - 0.5;
    r1 = r1 * float4(0.49, 0.49, 0.5, 0.5);
    r0.xy = r1.xy + r1.zw;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r0.xy = max(r0.xy, IndividualVelocityScale.zz);
    oC0.xy = min(r0.xy, IndividualVelocityScale.ww);
    oC0.zw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
