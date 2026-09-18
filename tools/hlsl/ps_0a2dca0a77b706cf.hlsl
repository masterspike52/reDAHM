// ps_0a2dca0a77b706cf.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 54 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000D8 10000400 00000004 00000000 000044A5 001F001F 00000001 00003050 0000F151 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
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

    r0.yw = r0.yx - 0.5;
    r0.xz = r0.yw * UniformVector_1.yx;
    r0.yw = r0.yw * UniformVector_2.yx;
    r1 = r0 + float4(0.5, 0.5, 0.0, 0.0);
    r0 = r1 + r0.zwxy;
    r1.xz = r0.zw + 0.5;
    r1.y = tex2D(Texture2D_0, r1.xz).x;
    r2.xy = tex2D(Texture2D_1, r0.xy).xy;
    r2.z = tex2D(Texture2D_1, r1.xz).x;
    r0.xyz = tex2D(Texture2D_0, r0.xy).zxy;
    r1.x = SCENE_COLOR_BIAS_FACTOR.x * r4.w;
    r1.zw = r0.yz + UniformVector_0.xy;
    r0.w = UniformVector_0.z + r0.x;
    r0.xz = r2.xy * float2(0.8, 0.4) + r1.zw;
    r0.y = r2.z * 0.8 + r1.y;
    oC0.xyz = r1.xxx * r0.xzw;
    oC0.w = OpacityOverride.x * r0.y;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
