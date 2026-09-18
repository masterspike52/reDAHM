// ps_efb8f837deabc74b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 54 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000D8 10000600 00000004 00000000 00005CE7 007F007F 00000001 00003050 00003151 0000F252 0000F353 0000F455 00007556 0000F657
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

float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
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

    r1.xy = r0.xy + UniformVector_3.xy;
    r1.zw = r0.xy + UniformVector_4.xy;
    r2.xy = r0.xy + UniformVector_2.xy;
    r0.xy = r0.xy + UniformVector_1.xy;
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r2.xy = tex2D(Texture2D_1, r2.xy).xy;
    r3.xyw = tex2D(Texture2D_3, r1.zw).yzx;
    r1.yzw = tex2D(Texture2D_2, r1.xy).yzx;
    r3.xyz = r3.wxy + UniformVector_0.xyz;
    ps = r3.w;
    r2.z = r3.z + r1.z;
    ps = r1.w + ps;
    r1.yz = r3.xy + r1.wy;
    r1.w = ps;
    r2.xyw = r2.xyx * float3(3.0, 0.1, 3.0) + r1.yzw;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r6.w;
    r0 = r2 + r0.xyzx;
    r1.x = ps;
    oC0.w = r0.w * OpacityOverride.x;
    oC0.xyz = r1.xxx * r0.xyz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
