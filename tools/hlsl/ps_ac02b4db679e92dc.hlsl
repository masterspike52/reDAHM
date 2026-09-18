// ps_ac02b4db679e92dc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 54 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000D8 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);

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

    r5.xy = r0.xy * 0.05 + UniformVector_1.xy;
    r5.x = tex2D(Texture2D_0, r5.xy).x;
    r5.z = dot(r2.zxy, r2.zxy);
    r5.x = r5.x * 0.2 - 0.005;
    ps = rsqrt(abs(r5.z));
    r5.y = r3.w * SCENE_COLOR_BIAS_FACTOR.x;
    r5.z = ps;
    r5.zw = r5.zz * r2.xy;
    r5.xz = r5.zw * r5.xx + r0.xy;
    r5.z = tex2D(Texture2D_1, r5.xz).x;
    r1.x = tex2D(Texture2D_2, r0.xy).y;
    r5.x = tex2D(Texture2D_3, r0.xy).x;
    r1.y = r5.z * r1.x;
    ps = OpacityOverride.x;
    r0.yzw = r1.yyx * r4.yzx;
    ps = 5e+01 * ps;
    r0.x = r0.w * r5.z;
    r4.w = ps;
    ps = r4.w;
    r4.xyz = r0.xyz + UniformVector_0.xyz;
    ps = r5.x * ps;
    oC0.xyz = r5.yyy * r4.xyz;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
