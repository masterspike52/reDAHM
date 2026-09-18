// ps_c7f9a10473d33dfc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 81 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000144 10000400 00000008 00000000 00004CA5 0007001F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

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

    r1.xy = r0.xy * float2(48.0, 3.2) + UniformVector_3.xy;
    r4.zw = r0.xy * float2(8.0, 1.6) + UniformVector_4.xy;
    r4.xy = r0.xy * float2(5.0, 0.5) + UniformVector_2.xy;
    r4.xy = tex2D(Texture2D_0, r4.xy).xy;
    r4.z = tex2D(Texture2D_2, r4.zw).w;
    r0.xy = tex2D(Texture2D_3, r0.xy).xy;
    r3.x = tex2D(Texture2D_1, r1.xy).w;
    ps = 4.0 - r3.x;
    r3.yz = r0.xy * r3.ww;
    r3.w = ps;
    r3.x = r3.w * r4.z + r3.x;
    r3.xy = r3.yz * r3.xx;
    r3.zw = abs(r3.xy) * abs(r3.xy);
    r3.xy = r3.zw * abs(r3.xy);
    r3.xy = min(r3.xy, 1.0);
    r3.z = r3.x * r4.x - 0.003921569;
    r3.xy = r3.xy + r4.xy;
    r3.xy = r3.xy * 4.0;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.zzzz)) clip(-1.0);
    r3.xy = max(r3.xy, (-255.0));
    r3.xy = min(r3.xy, 255.0);
    r3.xy = r3.xy * 0.003921569;
    oC0.xy = max(r3.xy, 0.0);
    r3.xy = min(r3.xy, 0.0);
    oC0.zw = abs(r3.xy);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
