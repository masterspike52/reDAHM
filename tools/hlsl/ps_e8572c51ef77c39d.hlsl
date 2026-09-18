// ps_e8572c51ef77c39d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 60 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000F0 10000600 00000004 00000000 00005CE7 007F007F 00000001 00003050 00003151 0000F252 0000F353 0000F455 00007556 0000F657
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

    r0.zw = r0.xy * 0.05 + UniformVector_1.xy;
    r0.z = tex2D(Texture2D_0, r0.zw).x;
    r0.w = dot(r5.zxy, r5.zxy);
    r0.z = r0.z * 0.5 - 0.005;
    r1.zw = r0.xy - 0.5;
    r0.w = rsqrt(abs(r0.w));
    r1.xy = r0.ww * r5.yx;
    r1.yz = r1.xy * r0.zz + r1.wz;
    r0.z = r1.x * r0.z - 0.5;
    r1.x = r0.z + r0.y;
    r0.w = SCENE_COLOR_BIAS_FACTOR.x * r6.w;
    r0.xyz = r1.xxy * float3(0.9999997, 0.0007963267, 0.9999997) + 0.5;
    r0.xyz = r1.zzz * float3(0.0007963267, -0.9999997, 0.0007963267) + r0.xyz;
    r0.x = tex2D(Texture2D_1, r0.xy).z;
    r0.y = tex2D(Texture2D_1, r0.zy).z;
    r0.z = r3.x * OpacityOverride.x;
    oC0.w = r0.z * r0.y;
    r0.xyz = r0.xxx * r3.xyz + UniformVector_0.xyz;
    oC0.xyz = r0.www * r0.xyz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
