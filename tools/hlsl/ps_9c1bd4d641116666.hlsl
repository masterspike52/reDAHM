// ps_9c1bd4d641116666.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 39 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000009C 10000400 00000004 00000000 00003CA5 001F001F 00000001 00003050 00003151 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.xyw = r1.yxy * float3(0.5, 0.5, 3.0);
    r1.xz = r0.wy - 0.5;
    r0.z = 0.88 + r0.x;
    r1.y = dot(r1.xz, float2(-0.054177135, 0.99853134)) + 0.5;
    r1.x = dot(r1.xz, float2(-0.99853134, -0.054177135)) + 0.5;
    r1.x = tex2D(Texture2D_1, r1.xy).x;
    r0.x = tex2D(Texture2D_0, r0.yz).x;
    ps = abs(r0.x) * abs(r0.x);
    r0.w = r4.w * SCENE_COLOR_BIAS_FACTOR.x;
    r0.x = ps;
    r0.x = r0.x * r0.x + r1.x;
    r0.xyz = r0.xxx * UniformVector_1.xyz + UniformVector_0.xyz;
    ps = OpacityOverride.x;
    oC0.xyz = r0.www * r0.xyz;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
