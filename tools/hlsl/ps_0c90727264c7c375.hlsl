// ps_0c90727264c7c375.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 33 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 00000084 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c8); // float
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_10 : register(c7); // float
float4 UniformScalar_9 : register(c6); // float
float4 UniformVector_0 : register(c0); // float4
float4 UniformVector_1 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
sampler2D Texture2D_0 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 color0 : COLOR0; // r4
    float4 color2 : COLOR2; // r5
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
    float4 r3 = In.texcoord7;
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r4.x = tex2D(Texture2D_0, r0.xy).w;
    r5.xyz = (UniformScalar_0.xxx > 0.0) ? UniformVector_2.xyz : UniformVector_1.xyz;
    r4.xy = r4.xx * UniformVector_1.wx;
    ps = OpacityOverride.x;
    r5.xyz = r5.xyz + UniformVector_0.xyz;
    oC0.xyz = r5.xyz * r3.www + r3.xyz;
    ps = UniformScalar_10.x * ps;
    r4.z = r4.y * UniformScalar_9.x;
    r4.y = ps;
    r4.x = (UniformScalar_0.x > 0.0) ? r4.z : r4.x;
    oC0.w = r4.y * r4.x;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
