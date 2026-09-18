// ps_4a873ad05fc26c30.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 78 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000138 10000600 00000004 00000000 00005CE7 007F007F 00000001 00003050 00003151 0000F252 0000F353 0000F455 00007556 0000F657
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

float4 OpacityOverride : register(c11); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_10 : register(c9); // float
float4 UniformScalar_18 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
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

    r0.zw = r0.yx - 0.5;
    r0.y = dot(r0.zw, UniformVector_2.yx) + 0.5;
    r0.x = dot(r0.zw, UniformVector_1.yx) + 0.5;
    r2.y = dot(r0.zw, UniformVector_5.yx) + 0.5;
    r2.x = dot(r0.zw, UniformVector_4.yx) + 0.5;
    r1.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r2.xyz = tex2D(Texture2D_3, r2.xy).xyz;
    r1.w = UniformScalar_10.x * 3e+01;
    r0.w = UniformScalar_18.x * 2e+02;
    ps = r0.w;
    r3.x = r1.w * r0.x;
    ps = r2.x * ps;
    r0.yz = r0.yz * float2(5.0, 5e+01);
    r2.w = ps;
    ps = UniformScalar_10.x * r0.y;
    r2.xyz = r2.xzy * float3(2e+02, 1.0, 2e+01);
    r3.y = ps;
    ps = UniformScalar_10.x * r0.z;
    r2.xyz = r2.xyz * UniformScalar_18.xxx;
    r3.z = ps;
    r0.xyz = r4.xyz * UniformVector_3.xyz + r3.xyz;
    r0 = r0.xyzx + r2.xzyw;
    r0 = r1.xxyz * r1.xxyz + r0.xwyz;
    r0.y = min(r0.y, 1.0);
    r0.xzw = r0.xzw + UniformVector_0.xyz;
    r0.xzw = r0.xzw * r6.www + r6.xyz;
    ps = OpacityOverride.x * r0.y;
    oC0.xyz = r0.xzw * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
