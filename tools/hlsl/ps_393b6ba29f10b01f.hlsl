// ps_393b6ba29f10b01f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 87 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000015C 10000800 00000004 00000000 000044A5 001F001F 00000001 00003050 0000F151 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c7); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);

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
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.zw = r0.yx - 0.5;
    r7.y = dot(r0.wz, UniformVector_3.xy) + 0.5;
    r2.xz = r0.zw * UniformVector_2.yx;
    r2.yw = r0.zw * UniformVector_3.yx;
    r3 = r2 + float4(0.5, 0.5, 0.0, 0.0);
    r8 = r3 + r2.zwxy;
    r7.xz = r8.zw + 0.5;
    r2.xyz = tex2D(Texture2D_0, r7.xz).xyz;
    r3.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_2, r7.xz).xyz;
    r6.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_4, r7.xy).xyz;
    r0.w = tex2D(Texture2D_5, r8.xy).z;
    r0.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r0.xyz = r0.www * float3(5.0, 1e+01, 4e+01) + r0.xyz;
    r0.xyz = r7.xyz * float3(5.0, 1e+01, 5e+01) + r0.xyz;
    r0.yzw = r6.yzx * float3(5.0, 2e+01, 1.0) + r0.yzx;
    r0.x = r0.w + r5.x;
    r0.xyz = r5.xyz * float3(1.0, 5.0, 3e+01) + r0.xyz;
    r0.xyz = r0.xyz + r3.xyz;
    r0.xyz = r0.xyz * r1.xyz;
    ps = r4.w;
    r0.xyz = r0.xyz * r2.xyz;
    ps = SCENE_COLOR_BIAS_FACTOR.x * ps;
    r0.x = dot(r0.zxy, float3(0.11, 0.3, 0.59));
    r0.w = ps;
    r0.xyz = r0.xxx * UniformVector_1.xyz + UniformVector_0.xyz;
    ps = OpacityOverride.x;
    oC0.xyz = r0.www * r0.xyz;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
