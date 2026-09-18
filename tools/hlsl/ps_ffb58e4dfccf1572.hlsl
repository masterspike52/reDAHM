// ps_ffb58e4dfccf1572.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 33 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000084 10000500 00000008 00000000 00005CC6 0007003F 00000021 0000F050 0000F156 00007257 0000F3A0 0000F4A1 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformScalar_3 : register(c3); // float
float4 UniformScalar_4 : register(c4); // float
sampler2D Texture2D_1 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 texcoord7 : TEXCOORD7; // r2
    float4 color0 : COLOR0; // r3
    float4 color1 : COLOR1; // r4
    float4 color2 : COLOR2; // r5
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
    float4 r3 = In.color0;
    float4 r4 = In.color1;
    float4 r5 = In.color2;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3.x = tex2D(Texture2D_1, r0.xy).w;
    r3.y = UniformScalar_4.x - UniformScalar_3.x;
    r3.w = -UniformScalar_3.x + 1.0;
    r3.z = saturate(r0.z);
    ps = 1.0 / r3.y;
    r3.z = r3.w - r3.z;
    r3.y = ps;
    r3.y = saturate(r3.z * r3.y);
    r3.x = r3.y * r3.x - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.xxxx)) clip(-1.0);
    ps = r1.w;
    oC0.w = ps;
    oC0.xyz = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
