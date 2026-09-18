// ps_bf4da0138268115d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 72 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000120 10000300 00000008 00000000 00004084 0003000F 00000021 0000F050 0000F156 0000F2A0 0000F3A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> COLOR0 (flags 0xF)
//   interpolator: r3 <-> COLOR2 (flags 0xF)
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

    r3.x = tex2D(Texture2D_2, r0.xy).x;
    r2.xy = tex2D(Texture2D_1, r0.xy).xw;
    r2.z = tex2D(Texture2D_0, r0.xy).x;
    r0.yz = r1.xy * IndividualVelocityScale.xy;
    r1.xy = r0.yz * r0.yz;
    r1.zw = r2.zx * float2(5.0, 3e+01);
    r0.xw = r1.zx + r1.wy;
    r2.w = max(r0.w, 1.0);
    r3.y = 0.5;
    r3.x = saturate(r3.x - UniformScalar_5.x);
    r3.z = rsqrt(abs(r2.w));
    r2.w = tex2D(Texture2D_3, r3.xy).x;
    r0.xyz = r0.xyz * r3.xzz;
    r3.zw = float2((r0.yz > 0.0));
    r3.x = saturate(abs(r0.y));
    r2.w = r2.w * UniformVector_1.x + r0.x;
    r2.w = r2.w * UniformScalar_9.x;
    r3.y = saturate(abs(r0.z));
    r2.z = r2.w * r2.y - 0.333;
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
