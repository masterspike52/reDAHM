// ps_eeed86875fe4f867.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 81 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000144 10000500 00000004 00000000 00004CC6 003F003F 00000021 00003050 00003151 0000F252 0000F353 0000F455 00007556
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord5 : TEXCOORD5; // r4
    float4 texcoord6 : TEXCOORD6; // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord3;
    float4 r4 = In.texcoord5;
    float4 r5 = In.texcoord6;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.zw = r0.xy * float2(48.0, 3.2) + UniformVector_3.xy;
    r0.zw = r0.xy * float2(8.0, 1.6) + UniformVector_4.xy;
    r1.xy = r0.xy * float2(5.0, 0.5) + UniformVector_2.xy;
    r1.xy = tex2D(Texture2D_0, r1.xy).xy;
    r0.w = tex2D(Texture2D_2, r0.zw).w;
    r0.yz = tex2D(Texture2D_3, r0.xy).xy;
    r0.x = tex2D(Texture2D_1, r1.zw).w;
    ps = 4.0 - r0.x;
    r0.yz = r0.yz * r3.ww;
    r1.z = ps;
    r0.x = r1.z * r0.w + r0.x;
    r0.xy = r0.yz * r0.xx;
    r0.zw = abs(r0.xy) * abs(r0.xy);
    r0.xy = r0.zw * abs(r0.xy);
    r0.xy = min(r0.xy, 1.0);
    r0.z = r0.x * r1.x - 0.003921569;
    r0.xy = r0.xy + r1.xy;
    r0.xy = r0.xy * 4.0;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r0.xy = max(r0.xy, (-255.0));
    r0.xy = min(r0.xy, 255.0);
    r0.xy = r0.xy * 0.003921569;
    oC0.xy = max(r0.xy, 0.0);
    r0.xy = min(r0.xy, 0.0);
    oC0.zw = abs(r0.xy);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
