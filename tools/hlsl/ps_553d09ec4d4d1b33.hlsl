// ps_553d09ec4d4d1b33.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 81 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000144 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 MinZ_MaxZRatio : register(c2); // float4
float4 OpacityOverride : register(c7); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);

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

    r5.xz = r0.yx * 0.1 - 0.5;
    r5.y = dot(r5.xz, UniformVector_2.yx) + 0.5;
    r5.x = dot(r5.xz, UniformVector_1.yx) + 0.5;
    r5.x = tex2D(Texture2D_0, r5.xy).x;
    ps = 1.0 / r1.w;
    r5.y = dot(r2.zxy, r2.zxy);
    r5.z = ps;
    r5.x = r5.x * 0.29999998 - 0.002;
    ps = rsqrt(abs(r5.y));
    r5.zw = r5.zz * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r5.zw = r5.wz * r1.yx + ScreenPositionScaleBias.zw;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r3.w;
    r2.xy = r5.yy * r2.xy;
    r0.w = ps;
    r5.xy = r2.xy * r5.xx + r0.xy;
    r0.y = tex2D(SceneDepthTexture, r5.wz).x;
    r5 = tex2D(Texture2D_1, r5.xy);
    r4.x = r4.x * UniformVector_3.x;
    r0.x = r4.x * r5.x;
    r4.x = r0.y * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r4.x;
    r0.yz = r5.yz * UniformVector_3.yz;
    r4.x = ps;
    ps = r4.x;
    r0.yz = r0.yz * r4.yz;
    ps = -r1.w + ps;
    r4.z = float((r4.x != 1.0));
    r4.y = ps;
    ps = 0.002 * r4.y;
    r0.xyz = r0.xyz + UniformVector_0.xyz;
    r4.x = saturate(ps);
    r4.x = r4.x * r5.w;
    oC0.xyz = r0.www * r0.xyz;
    r4.y = (r4.z == 0.0) ? r5.w : r4.x;
    ps = OpacityOverride.x * r4.y;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
