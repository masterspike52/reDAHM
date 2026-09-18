// ps_db51b6344c1a5c69.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 54 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000D8 10000500 00000004 00000000 00004CC6 003F003F 00000021 00003050 00003151 0000F252 0000F353 0000F455 00007556
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
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

    r0.zw = r0.xy * 0.05 + UniformVector_1.xy;
    r0.w = tex2D(Texture2D_0, r0.zw).x;
    r0.z = dot(r5.zxy, r5.zxy);
    r1.xyz = r0.www * float3(0.4, 32.0, 8.0);
    r0.z = rsqrt(abs(r0.z));
    r2.xy = r0.zz * r5.xy;
    r0.z = (-0.005) + r1.x;
    r0.xy = r2.xy * r0.zz + r0.xy;
    r0.x = tex2D(Texture2D_2, r0.xy).x;
    r0.y = r1.z * r0.x;
    r0.x = max(r1.y, (-255.0));
    r0.y = r0.y * r3.x - 0.003921569;
    r0.x = min(r0.x, 255.0);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.yyyy)) clip(-1.0);
    r0.y = 0.003921569 * r0.x;
    r0.x = min(r0.y, 0.0);
    oC0.xy = max(r0.yy, 0.0);
    oC0.zw = abs(r0.xx);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
