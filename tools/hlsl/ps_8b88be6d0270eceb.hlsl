// ps_8b88be6d0270eceb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 75 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000012C 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c11); // float
float4 UniformScalar_1 : register(c6); // float
float4 UniformScalar_4 : register(c7); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_6 : register(c9); // float
float4 UniformScalar_7 : register(c10); // float
float4 UniformVector_0 : register(c0); // float4
float4 UniformVector_1 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);

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

    r4.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r4.w = float((r4.z >= UniformScalar_6.x));
    ps = r4.x;
    r4.y = saturate(r4.w + r4.y);
    r4.x = saturate(ps);
    r1.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r0 = tex2D(Texture2D_1, r4.xy);
    r4.xyz = UniformScalar_4.xxx * UniformVector_1.xyz;
    r5.xyz = (UniformScalar_1.xxx > 0.0) ? r4.xyz : 0.0;
    r4.x = -r0.w * UniformScalar_7.x + 1.0;
    ps = 1e+02 * r4.x;
    r2.xyz = r0.xyz * UniformVector_2.xyz;
    r4.z = saturate(ps);
    r5.xyz = (UniformScalar_1.xxx >= 0.0) ? r5.xyz : 0.0;
    r4.xyw = (UniformScalar_5.xxx > 0.0) ? r2.xyz : r0.xyz;
    r2.xyz = (UniformScalar_5.xxx >= 0.0) ? r4.xyw : r0.xyz;
    ps = 1.0 - r4.z;
    r4.x = float((UniformScalar_5.x >= 1.0));
    r4.y = ps;
    r5.xyz = (r4.xxx > 0.0) ? 0.0 : r5.xyz;
    ps = OpacityOverride.x * r4.y;
    oC0.w = ps;
    r5.xyz = r2.xyz + r5.xyz;
    r5.xyz = r1.xyz * UniformVector_3.xyz + r5.xyz;
    r4.xyw = r4.yyy * r0.xyz - r5.xyz;
    r4.xyz = r4.zzz * r4.xyw + r5.xyz;
    r4.xyz = r4.xyz + UniformVector_0.xyz;
    oC0.xyz = r4.xyz * r3.www + r3.xyz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
