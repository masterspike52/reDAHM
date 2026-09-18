// ps_49246632bac737f5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 69 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000114 10000400 00000008 00000000 00004CA5 0007001F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
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
    float4 color0 : COLOR0; // r3
    float4 color2 : COLOR2; // r4
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
    float4 r3 = In.color0;
    float4 r4 = In.color2;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.x;
    r4.xz = r0.xy + UniformVector_3.xy;
    ps = UniformVector_4.x + ps;
    r1.xy = r0.xy + UniformVector_2.xy;
    r4.y = ps;
    ps = r0.y;
    r3.xy = r0.xy + UniformVector_5.xy;
    ps = UniformVector_4.y + ps;
    r3.zw = r0.xy + UniformVector_1.xy;
    r4.w = ps;
    r3.w = tex2D(Texture2D_0, r3.zw).x;
    r3.xy = tex2D(Texture2D_4, r3.xy).xy;
    r3.z = tex2D(Texture2D_1, r1.xy).x;
    r4.y = tex2D(Texture2D_3, r4.yw).x;
    r4.x = tex2D(Texture2D_2, r4.xz).x;
    r4.x = r4.y + r4.x;
    r3.xyz = r3.zxy * float3(3.0, 8e+01, 8e+01);
    r3.x = r4.x + r3.x;
    r3.yz = max(r3.yz, (-255.0));
    ps = (-0.003921569) + r3.x;
    r3.yz = min(r3.yz, 255.0);
    r3.x = ps;
    ps = 0.003921569 * r3.y;
    r3.w = r3.x + r3.w;
    r3.x = ps;
    ps = 0.003921569 * r3.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.wwww)) clip(-1.0);
    r3.w = ps;
    oC0.xy = max(r3.xw, 0.0);
    r3.xy = min(r3.xw, 0.0);
    oC0.zw = abs(r3.xy);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
