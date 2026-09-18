// ps_a2a1ca7d31f8b3ff.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 72 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000120 10000300 00000004 00000000 00001842 00030003 00000021 00003050 0000F156
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c6); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
float4 UniformScalar_5 : register(c4); // float
float4 UniformScalar_9 : register(c5); // float
float4 UniformVector_1 : register(c3); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);

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
    float4 r3 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.w = tex2D(Texture2D_2, r0.xy).x;
    r2.xy = tex2D(Texture2D_1, r0.xy).xw;
    r2.z = tex2D(Texture2D_0, r0.xy).x;
    r1.yz = r1.xy * IndividualVelocityScale.xy;
    r3.xy = r1.yz * r1.yz;
    r3.zw = r2.zx * float2(5.0, 3e+01);
    r1.xw = r3.zx + r3.wy;
    r0.z = max(r1.w, 1.0);
    r0.y = 0.5;
    ps = rsqrt(abs(r0.z));
    r0.x = saturate(r0.w - UniformScalar_5.x);
    r0.z = ps;
    r0.w = tex2D(Texture2D_3, r0.xy).x;
    r0.xyz = r1.xzy * r0.xzz;
    ps = abs(r0.z);
    r1.zw = float2((r0.zy > 0.0));
    r1.x = saturate(ps);
    r0.w = r0.w * UniformVector_1.x + r0.x;
    ps = abs(r0.y);
    r0.x = r0.w * UniformScalar_9.x;
    r1.y = saturate(ps);
    r0.z = r0.x * r2.y - 0.333;
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
