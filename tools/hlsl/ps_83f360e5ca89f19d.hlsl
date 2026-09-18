// ps_83f360e5ca89f19d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 39 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000009C 10000600 00000004 00000000 00005CE7 007F007F 00000001 00003050 00003151 0000F252 0000F353 0000F455 00007556 0000F657
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D Texture2D_0 : register(s0);

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

    r0.xz = r0.yx - 0.5;
    r0.y = dot(r0.xz, UniformVector_2.yx) + 0.5;
    r0.x = dot(r0.xz, UniformVector_1.yx) + 0.5;
    r0.xy = tex2D(Texture2D_0, r0.xy).xy;
    ps = r6.w;
    r1.x = UniformVector_0.z * SCENE_COLOR_BIAS_FACTOR.x;
    ps = SCENE_COLOR_BIAS_FACTOR.x * ps;
    r0.xw = r0.yx * float2(0.2, 5.0);
    r0.z = ps;
    r0.xy = r0.wx * r3.xy + UniformVector_0.xy;
    ps = r1.x;
    r0.w = r0.w * OpacityOverride.x;
    oC0.w = r0.w * r3.x;
    ps = r6.w * ps;
    oC0.xy = r0.zz * r0.xy;
    oC0.z = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
