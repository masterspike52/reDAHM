// ps_70e445ecc9a41510.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 96 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000180 10000300 00000004 00000000 00002863 00070007 00000021 00003050 0000F151 0000F256
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c6); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
float4 UniformVector_2 : register(c3); // float4
float4 UniformVector_3 : register(c4); // float4
float4 UniformVector_4 : register(c5); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);

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

    r3.xy = r0.xy * float2(48.0, 3.2) + UniformVector_3.xy;
    r3.zw = r0.xy * float2(8.0, 1.6) + UniformVector_4.xy;
    r0.zw = r0.xy * float2(5.0, 0.5) + UniformVector_2.xy;
    r0.z = tex2D(Texture2D_0, r0.zw).x;
    r0.w = tex2D(Texture2D_2, r3.zw).w;
    r0.y = tex2D(Texture2D_3, r0.xy).x;
    r0.x = tex2D(Texture2D_1, r3.xy).w;
    ps = 4.0 - r0.x;
    r0.y = r0.y * r1.w;
    r1.x = ps;
    r0.x = r1.x * r0.w + r0.x;
    r0.x = r0.y * r0.x;
    ps = abs(r0.x) * abs(r0.x);
    r0.y = ps;
    r0.x = r0.y * abs(r0.x);
    r0.y = min(r0.x, 1.0);
    r0.x = r0.y * r0.z;
    ps = IndividualVelocityScale.y * r0.x;
    r0.w = ps;
    r1.yz = r0.wy * r2.yx;
    r0.y = r1.z * r0.z;
    ps = IndividualVelocityScale.x * r0.y;
    r1.x = ps;
    r0.y = dot(r1.xy, r1.xy) + 0.0;
    r0.y = max(r0.y, 1.0);
    ps = rsqrt(abs(r0.y));
    r0.x = r0.x - 0.003921569;
    r0.y = ps;
    r0.yz = r1.yx * r0.yy;
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
