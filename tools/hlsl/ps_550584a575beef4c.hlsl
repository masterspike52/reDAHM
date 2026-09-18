// ps_550584a575beef4c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 51 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000CC 10000400 00000004 00000000 000044A5 001F001F 00000001 00003050 0000F151 0000F255 00007356 0000F457
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
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c4); // float
float4 UniformVector_0 : register(c3); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);

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

    r3.w = r0.x * 5.0 + UniformScalar_1.x;
    r3.x = r4.w * SCENE_COLOR_BIAS_FACTOR.x;
    r0.z = 1.0 / r2.w;
    r0.zw = r0.zz * ScreenPositionScaleBias.xy;
    r3.yz = r0.zw * r2.xy + ScreenPositionScaleBias.wz;
    r2.xyz = r3.yzw * float3(1e+01, 1e+01, 1.0000007) + float3(1e+01, 1e+01, 0.5);
    r0.z = frac(r2.z);
    r0.z = r0.z * 6.2831855 - 3.1415927;
    r0.z = sin(r0.z);
    r0.xy = r0.zz * 0.008 + r0.xy;
    r0.y = tex2D(Texture2D_1, r0.xy).x;
    r0.xzw = tex2D(Texture2D_0, r2.xy).xyz;
    r0.xzw = r0.xzw * r1.xyz + UniformVector_0.xyz;
    r0.y = saturate(r0.y * 7e+01 - 2e+01);
    oC0.xyz = r3.xxx * r0.xzw;
    oC0.w = OpacityOverride.x * r0.y;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
