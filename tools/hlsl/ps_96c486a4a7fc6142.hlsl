// ps_96c486a4a7fc6142.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 90 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000168 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
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

    r4.yw = r0.xy - 0.5;
    r5.w = dot(r4.wy, UniformVector_5.yx) + 0.5;
    r5.z = dot(r4.wy, UniformVector_4.yx) + 0.5;
    r4.xz = r4.yw * UniformVector_1.xy;
    r4.yw = r4.yw * UniformVector_2.xy;
    r0 = r4.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    r4 = r0.zwxy + r4.zwxy;
    r5.xy = r4.xy + 0.5;
    r2.xyz = tex2D(Texture2D_0, r5.xy).xyz;
    r1.yzw = tex2D(Texture2D_2, r4.zw).xyz;
    r4.xyz = tex2D(Texture2D_1, r5.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r5.zw).xyz;
    r5.xyw = tex2D(Texture2D_2, r5.xy).yzx;
    ps = UniformScalar_10.x;
    r4.w = UniformScalar_18.x * 2e+02;
    ps = 3e+01 * ps;
    r0.w = r4.w * r0.x;
    r4.w = ps;
    ps = r4.w;
    r4.yz = r4.yz * float2(5.0, 5e+01);
    ps = r4.x * ps;
    r0.xyz = r0.xzy * float3(2e+02, 1.0, 2e+01);
    r1.x = ps;
    ps = UniformScalar_10.x * r4.y;
    r5.xyz = r5.wyx * r1.ywz;
    r1.y = ps;
    ps = UniformScalar_10.x * r4.z;
    r0.xyz = r0.xyz * UniformScalar_18.xxx;
    r1.z = ps;
    r4.xyz = r2.xyz * UniformVector_3.xyz + r1.xyz;
    ps = r5.w * r5.w;
    r4 = r4.xyzx + r0.xzyw;
    r5.w = ps;
    r4 = r4.xwyz + r5.xwzy;
    r4.y = min(r4.y, 1.0);
    r4.xzw = r4.xzw + UniformVector_0.xyz;
    r4.xzw = r4.xzw * r3.www + r3.xyz;
    ps = OpacityOverride.x * r4.y;
    oC0.xyz = r4.xzw * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
