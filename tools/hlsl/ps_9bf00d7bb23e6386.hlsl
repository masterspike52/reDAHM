// ps_9bf00d7bb23e6386.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 51 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000CC 10000200 00000004 00000000 00002463 00070007 00000021 00003050 0000F156 00007257
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformScalar_5 : register(c4); // float
float4 UniformVector_1 : register(c3); // float4
sampler2D Texture2D_1 : register(s0);
sampler2D Texture2D_2 : register(s1);
sampler2D Texture2D_3 : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 texcoord7 : TEXCOORD7; // r2
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord6;
    float4 r2 = In.texcoord7;
    float4 oC0 = 0.0;

    r0.zw = r0.xy * 0.08 + UniformVector_1.xy;
    r0.z = tex2D(Texture2D_1, r0.zw).x;
    r0.w = dot(r2.zxy, r2.zxy);
    r0.z = r0.z * 0.05 - 0.005;
    r0.w = rsqrt(abs(r0.w));
    r2.xy = r0.ww * r2.xy;
    r0.zw = r2.xy * r0.zz + r0.xy;
    r0.z = tex2D(Texture2D_2, r0.zw).w;
    r0.x = tex2D(Texture2D_3, r0.xy).w;
    r0.x = -r0.z + r0.x;
    r0.x = r0.x * UniformScalar_5.x - 0.1;
    r0.x = r0.x + r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    oC0.w = r1.w;
    oC0.xyz = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
