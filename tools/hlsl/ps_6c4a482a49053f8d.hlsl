// ps_6c4a482a49053f8d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 60 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000F0 10000200 00000004 00000000 00001842 00030003 00000021 00003050 0000F156
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 IndividualVelocityScale : register(c5); // float4 // default: 1.0, 1.0, 0.0002, 0.9998
float4 UniformScalar_5 : register(c4); // float
float4 UniformVector_1 : register(c3); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_2 : register(s1);
sampler2D Texture2D_3 : register(s2);

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

    r0.w = tex2D(Texture2D_2, r0.xy).x;
    r2.yz = r1.xy * IndividualVelocityScale.xy;
    r0.z = dot(r2.yz, r2.yz) + 0.0;
    r0.z = max(r0.z, 1.0);
    r1.y = 0.5;
    r1.x = saturate(r0.w - UniformScalar_5.x);
    r1.z = rsqrt(abs(r0.z));
    r0.y = tex2D(Texture2D_0, r0.xy).x;
    r0.x = tex2D(Texture2D_3, r1.xy).x;
    r0.z = r0.x * UniformVector_1.x - 0.5;
    r2.x = 5e+01 * r0.y;
    r1.xyz = r2.xyz * r1.xzz;
    r0.xy = saturate(abs(r1.yz));
    r0.w = r0.z + r1.x;
    r0.z = (r1.y > 0.0) ? 1.0 : 0.0;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.wwww)) clip(-1.0);
    r0.w = (r1.z > 0.0) ? 1.0 : 0.0;
    r0 = r0 * float4(0.49, 0.49, 0.5, 0.5);
    r0.xy = r0.xy + r0.zw;
    r0.xy = max(r0.xy, IndividualVelocityScale.zz);
    oC0.xy = min(r0.xy, IndividualVelocityScale.ww);
    oC0.zw = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
