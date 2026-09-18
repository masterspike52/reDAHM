// ps_ee078c0a9206c138.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 57 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 000000E4 10000600 00000004 00000000 00005CE7 007F007F 00000001 00003050 00003151 0000F252 0000F353 0000F455 00007556 0000F657
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c9); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_11 : register(c7); // float
float4 UniformScalar_19 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord5 : TEXCOORD5; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
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
    float4 r6 = In.texcoord7;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.zw = r0.xy + UniformVector_3.xy;
    r2.xy = r0.xy + UniformVector_2.xy;
    r1.xy = r0.xy + UniformVector_1.xy;
    r1.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r4.yzw = tex2D(Texture2D_1, r2.xy).xyz;
    r2.xyz = tex2D(Texture2D_1, r0.zw).xyz;
    r0.x = tex2D(Texture2D_1, r0.xy).w;
    r0.yz = r2.yz * r0.xx;
    r0.xyz = r0.xyz * UniformScalar_19.xxx;
    r4.x = r0.x * r2.x;
    r2.xyz = r4.xzw * UniformScalar_11.xxx;
    r0.x = r2.x * r4.y;
    ps = r6.w;
    r0.yz = r2.yz * r0.yz;
    ps = SCENE_COLOR_BIAS_FACTOR.x * ps;
    r0.xyz = r0.xyz * r1.xyz;
    r0.w = ps;
    r0.xyz = r0.xyz * r3.xyz + UniformVector_0.xyz;
    ps = OpacityOverride.x;
    oC0.xyz = r0.www * r0.xyz;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
