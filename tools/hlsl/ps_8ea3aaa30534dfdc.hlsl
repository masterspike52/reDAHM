// ps_8ea3aaa30534dfdc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 69 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000114 10000200 00000004 00000000 00002463 00070007 00000021 00003050 0000F155 00007256
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformVector_1 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord5;
    float4 r2 = In.texcoord6;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.x;
    r1.xz = r0.xy + UniformVector_3.xy;
    ps = UniformVector_4.x + ps;
    r2.xy = r0.xy + UniformVector_2.xy;
    r1.y = ps;
    ps = r0.y;
    r2.zw = r0.xy + UniformVector_5.xy;
    ps = UniformVector_4.y + ps;
    r0.xy = r0.xy + UniformVector_1.xy;
    r1.w = ps;
    r0.w = tex2D(Texture2D_0, r0.xy).x;
    r0.xy = tex2D(Texture2D_4, r2.zw).xy;
    r0.z = tex2D(Texture2D_1, r2.xy).x;
    r1.y = tex2D(Texture2D_3, r1.yw).x;
    r1.x = tex2D(Texture2D_2, r1.xz).x;
    r1.x = r1.y + r1.x;
    r0.xyz = r0.zxy * float3(3.0, 8e+01, 8e+01);
    r0.x = r1.x + r0.x;
    r0.yz = max(r0.yz, (-255.0));
    ps = (-0.003921569) + r0.x;
    r0.yz = min(r0.yz, 255.0);
    r0.x = ps;
    ps = 0.003921569 * r0.y;
    r0.w = r0.x + r0.w;
    r0.x = ps;
    ps = 0.003921569 * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.wwww)) clip(-1.0);
    r0.w = ps;
    oC0.xy = max(r0.xw, 0.0);
    r0.xy = min(r0.xw, 0.0);
    oC0.zw = abs(r0.xy);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
