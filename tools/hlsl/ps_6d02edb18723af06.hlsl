// ps_6d02edb18723af06.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 48 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000C0 10000300 00000004 00000000 00003484 000F000F 00000001 00003050 0000F155 00007256 0000F357
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
samplerCUBE TextureCube_0 : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.z = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r0.z));
    r2.w = OpacityOverride.x * 0.6;
    r0.z = ps;
    r1.xyz = r0.zzz * r2.xyz;
    r1 = xe_cube(r1.xyz);
    ps = 1.0 / abs(r1.z);
    r2.z = r1.w;
    r0.z = ps;
    r2.xy = r1.yx * r0.zz + 1.5;
    r1.xyz = texCUBE(TextureCube_0, xe_cube_dir(r2.xyz)).xyz;
    r2.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.x = tex2D(Texture2D_1, r0.xy).w;
    ps = r2.w;
    r0.yzw = r2.xyz * 0.3;
    r0.yzw = r0.yzw * r1.xyz + UniformVector_0.xyz;
    r0.yzw = r0.yzw * r3.www + r3.xyz;
    ps = r0.x * ps;
    oC0.xyz = r0.yzw * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
