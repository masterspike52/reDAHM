// ps_cf4320733eb5d22f.bin
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

    r0.zw = r0.xy * 0.05 + UniformVector_1.xy;
    r0.z = tex2D(Texture2D_0, r0.zw).x;
    r0.w = dot(r3.zxy, r3.zxy);
    r0.z = r0.z * 0.2 - 0.005;
    ps = rsqrt(abs(r0.w));
    r2.x = r4.w * SCENE_COLOR_BIAS_FACTOR.x;
    r0.w = ps;
    r2.yz = r0.ww * r3.xy;
    r0.zw = r2.yz * r0.zz + r0.xy;
    r0.z = tex2D(Texture2D_1, r0.zw).x;
    r2.y = tex2D(Texture2D_2, r0.xy).y;
    r0.x = tex2D(Texture2D_3, r0.xy).x;
    r2.z = r0.z * r2.y;
    ps = OpacityOverride.x;
    r3.yzw = r2.zzy * r1.yzx;
    ps = 5e+01 * ps;
    r3.x = r3.w * r0.z;
    r1.x = ps;
    ps = r1.x;
    r0.yzw = r3.xyz + UniformVector_0.xyz;
    ps = r0.x * ps;
    oC0.xyz = r2.xxx * r0.yzw;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
