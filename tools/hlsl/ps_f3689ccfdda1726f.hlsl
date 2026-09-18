// ps_f3689ccfdda1726f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 60 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000F0 10000600 00000008 00000000 00006CE7 001F007F 00000001 0000F050 0000F151 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
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
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xw = r0.xy * 0.08 + UniformVector_1.xy;
    r6.y = tex2D(Texture2D_2, r0.xy).w;
    r6.z = tex2D(Texture2D_2, r0.wz).w;
    r6.x = tex2D(Texture2D_0, r6.xw).x;
    r6.w = dot(r3.zxy, r3.zxy);
    r6.x = r6.x * 0.2 - 0.005;
    ps = rsqrt(abs(r6.w));
    r6.z = -r6.y + r6.z;
    r6.w = ps;
    r6.y = r6.z * r1.x + r6.y;
    ps = 1e+01 * r5.w;
    r2.xy = r6.ww * r3.xy;
    r2.z = ps;
    r6.xyz = r2.xyz * r6.xxy;
    r0.xy = r6.xy + r0.xy;
    r0.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.xyz = r0.xyz * r5.xyz + UniformVector_0.xyz;
    r5.xyz = r5.xyz * r4.www + r4.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    r5.y = min(r6.z, 1.0);
    ps = OpacityOverride.x * r5.y;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
