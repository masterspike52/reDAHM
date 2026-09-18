// ps_2bd84f738b741a7a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 63 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000FC 10000400 00000004 00000000 000044A5 001F001F 00000001 00003050 0000F151 0000F255 00007356 0000F457
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
sampler2D Texture2D_2 : register(s2);

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
    r2.zw = r0.xy * float2(5.0, 1.0) + UniformVector_2.xy;
    r0.w = dot(r3.zxy, r3.zxy);
    r0.z = r0.z * 0.5 - 0.005;
    ps = rsqrt(abs(r0.w));
    r0.w = ps;
    r2.xy = r0.ww * r3.xy;
    r2.xz = r2.xy * r0.zz + r2.zw;
    r0.z = r2.y * r0.z + UniformVector_2.y;
    r2.y = r0.z + r0.y;
    r0.z = tex2D(Texture2D_1, r2.xz).x;
    r2.x = tex2D(Texture2D_1, r2.xy).x;
    r0.y = tex2D(Texture2D_2, r0.xy).x;
    r2.y = r0.z * r2.x;
    r1.yzw = r2.yyx * r1.yzx;
    ps = r4.w;
    r1.x = r1.w * r0.z;
    ps = SCENE_COLOR_BIAS_FACTOR.x * ps;
    r0.xzw = r1.xyz + UniformVector_0.xyz;
    r1.x = ps;
    ps = OpacityOverride.x * r0.y;
    oC0.xyz = r1.xxx * r0.xzw;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
