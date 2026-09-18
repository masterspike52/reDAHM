// ps_ff2cc4071bbe7722.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 90 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000168 10000500 00000004 00000000 000044A5 001F001F 00000001 00003050 0000F151 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
    float4 r5 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.yw = r0.xy - 0.5;
    r1.w = dot(r0.wy, UniformVector_5.yx) + 0.5;
    r1.z = dot(r0.wy, UniformVector_4.yx) + 0.5;
    r0.xz = r0.yw * UniformVector_1.xy;
    r0.yw = r0.yw * UniformVector_2.xy;
    r2 = r0.zwxy + float4(0.5, 0.5, 0.0, 0.0);
    r0 = r2.zwxy + r0.zwxy;
    r1.xy = r0.xy + 0.5;
    r5.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r3.yzw = tex2D(Texture2D_2, r0.zw).xyz;
    r0.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r2.xyz = tex2D(Texture2D_3, r1.zw).xyz;
    r1.xyw = tex2D(Texture2D_2, r1.xy).yzx;
    ps = UniformScalar_10.x;
    r0.w = UniformScalar_18.x * 2e+02;
    ps = 3e+01 * ps;
    r2.w = r0.w * r2.x;
    r0.w = ps;
    ps = r0.w;
    r0.yz = r0.yz * float2(5.0, 5e+01);
    ps = r0.x * ps;
    r2.xyz = r2.xzy * float3(2e+02, 1.0, 2e+01);
    r3.x = ps;
    ps = UniformScalar_10.x * r0.y;
    r1.xyz = r1.wyx * r3.ywz;
    r3.y = ps;
    ps = UniformScalar_10.x * r0.z;
    r2.xyz = r2.xyz * UniformScalar_18.xxx;
    r3.z = ps;
    r0.xyz = r5.xyz * UniformVector_3.xyz + r3.xyz;
    ps = r1.w * r1.w;
    r0 = r0.xyzx + r2.xzyw;
    r1.w = ps;
    r0 = r0.xwyz + r1.xwzy;
    r0.y = min(r0.y, 1.0);
    r0.xzw = r0.xzw + UniformVector_0.xyz;
    r0.xzw = r0.xzw * r4.www + r4.xyz;
    ps = OpacityOverride.x * r0.y;
    oC0.xyz = r0.xzw * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
