// ps_a3f5f71ba9c84424.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 57 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000E4 10000300 00000004 00000000 00003484 000F000F 00000021 00003050 0000F151 0000F255 00007356
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformVector_1 : register(c3); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_2 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 oC0 = 0.0;

    r0.zw = r0.xy * 0.05 + UniformVector_1.xy;
    r2.x = tex2D(Texture2D_0, r0.zw).x;
    r2.y = dot(r3.zxy, r3.zxy);
    r0.zw = r2.xx * float2(32.0, 0.4);
    r2.y = rsqrt(abs(r2.y));
    r2.zw = r2.yy * r3.xy;
    r2.y = (-0.005) + r0.w;
    r0.xy = r2.zw * r2.yy + r0.xy;
    r0.y = tex2D(Texture2D_2, r0.xy).x;
    r0.x = max(r0.z, (-255.0));
    r0.x = min(r0.x, 255.0);
    r0.xy = r0.xy * float2(0.003921569, 8.0);
    r0.w = r0.y * r2.x;
    r0.z = min(r0.x, 0.0);
    r0.w = r0.w * r1.x - 0.003921569;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.wwww)) clip(-1.0);
    oC0.zw = abs(r0.zz);
    oC0.xy = max(r0.xx, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
