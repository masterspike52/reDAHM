// ps_369ec442242cae63.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 60 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000F0 10000200 00000004 00000000 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 MinZ_MaxZRatio : register(c2); // float4
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToLight[4] : register(c6); // float4x4 (matrix_columns)
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D Texture2D_0 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = 0.0;
    float4 r2 = 0.0;
    float4 oC0 = 0.0;

    r1.x = 1.0 / r0.w;
    r1.xy = r1.xx * ScreenPositionScaleBias.xy;
    r1.xy = r1.xy * r0.xy + ScreenPositionScaleBias.wz;
    r0.z = tex2D(SceneDepthTexture, r1.xy).x;
    r0.z = r0.z * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r0.z = 1.0 / r0.z;
    r2.xy = r0.zz * ScreenToLight[0].yx;
    r1.x = ScreenToLight[2].y * r0.z;
    r2.zw = r0.zz * ScreenToLight[1].yx;
    r1.y = ScreenToLight[2].x * r0.z;
    r1.y = dot(r2.yw, r0.xy) + r1.y;
    r1.x = dot(r2.xz, r0.xy) + r1.x;
    r0.xy = r1.xy - 0.5;
    r0.xz = r0.xy + ScreenToLight[3].yx;
    r0.y = dot(r0.xz, UniformVector_2.yx) + 0.5;
    r0.x = dot(r0.xz, UniformVector_1.yx) + 0.5;
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xyz = r0.xyz + UniformVector_0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 1.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
