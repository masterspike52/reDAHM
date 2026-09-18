// ps_9c11b2176e607fd9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 99 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000018C 10000400 00000008 00000000 00004084 0003000F 00000021 0000F050 0000F156 0000F2A0 0000F3A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c6); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
float4 UniformVector_3 : register(c3); // float4
float4 UniformVector_4 : register(c4); // float4
float4 UniformVector_5 : register(c5); // float4
sampler2D Texture2D_2 : register(s0);
sampler2D Texture2D_3 : register(s1);
sampler2D Texture2D_4 : register(s2);
sampler2D Texture2D_5 : register(s3);

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
    float4 r4 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3.zw = r0.xy * float2(64.0, 4.0) + UniformVector_5.xy;
    r3.xy = r0.xy * float2(2e+01, 0.5) + UniformVector_3.xy;
    r4.xz = r0.xy * float2(32.0, 1.0) + UniformVector_4.xy;
    r4.y = r4.z + r0.y;
    r3.x = tex2D(Texture2D_2, r3.xy).x;
    r3.y = tex2D(Texture2D_3, r4.xy).w;
    r3.z = tex2D(Texture2D_4, r3.zw).w;
    r3.w = tex2D(Texture2D_5, r0.xy).x;
    r2.y = r3.w * r2.w;
    r2.x = -r3.y + r3.z;
    r2.x = r2.x * 0.5 + r3.y;
    r2.x = r2.y * r2.x;
    r2.x = abs(r2.x) * abs(r2.x);
    r2.y = min(r2.x, 1.0);
    r2.x = r2.y * r3.x;
    r2.z = IndividualVelocityScale.y * r2.x;
    r3.yz = r2.zy * r1.yx;
    r2.y = r3.z * r3.x;
    r3.x = IndividualVelocityScale.x * r2.y;
    r2.y = dot(r3.xy, r3.xy) + 0.0;
    r2.y = max(r2.y, 1.0);
    ps = rsqrt(abs(r2.y));
    r2.x = r2.x - 0.003921569;
    r2.y = ps;
    r2.yz = r3.yx * r2.yy;
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
