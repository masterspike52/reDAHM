// ps_f07c110dfbb40f37.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 39 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000009C 10000200 00000004 00000000 00002463 00070007 00000021 00003050 0000F156 00007257
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformScalar_5 : register(c4); // float
float4 UniformVector_1 : register(c3); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);

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

    r0.z = tex2D(Texture2D_2, r0.xy).x;
    r0.z = saturate(r0.z - UniformScalar_5.x);
    r0.w = 0.5;
    r2.x = tex2D(Texture2D_1, r0.xy).x;
    r2.y = tex2D(Texture2D_0, r0.xy).x;
    r0.x = tex2D(Texture2D_3, r0.zw).x;
    r0.x = r0.x * UniformVector_1.x - 0.5;
    r0.y = dot(r2.yx, float2(5.0, 3e+01)) + 0.0;
    r0.x = r0.y * r0.z + r0.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    oC0.w = r1.w;
    oC0.xyz = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
