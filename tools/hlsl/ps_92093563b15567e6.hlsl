// ps_92093563b15567e6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 78 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000138 10000600 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
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
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);

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
    float4 r6 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.yz = r0.xy + UniformVector_1.xy;
    ps = 1.0 / r1.w;
    r2 = r0.xxyy * float4(3.0, 0.3, 0.03, 3.0);
    r5.x = ps;
    r5.xw = r5.xx * ScreenPositionScaleBias.xy;
    r6.xy = r5.wx * r1.yx + ScreenPositionScaleBias.zw;
    r2.x = tex2D(Texture2D_2, r2.xw).x;
    r5.x = tex2D(Texture2D_2, r0.xy).w;
    r0.x = tex2D(SceneDepthTexture, r6.yx).x;
    r0.yzw = tex2D(Texture2D_0, r2.yz).xyz;
    r5.yzw = tex2D(Texture2D_1, r5.yz).xyz;
    r5.yzw = r0.yzw * r5.yzw + r4.xyz;
    r4.x = r0.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r4.x;
    r5.x = r5.x * 5.0;
    r4.y = ps;
    r4.x = r4.y - r1.w;
    r0 = min(r5, float4(1.0, 1.5, 1.5, 1.5));
    ps = r0.x;
    r5.x = float((r4.y != 1.0));
    ps = r2.x + ps;
    r5.yzw = r0.yzw + UniformVector_0.xyz;
    r0.x = ps;
    r5.yzw = r5.yzw * r3.www + r3.xyz;
    ps = 0.04 * r4.x;
    r4.y = r0.x * r4.w;
    r4.x = saturate(ps);
    r4.x = r4.y * r4.x;
    oC0.xyz = r5.yzw * SCENE_COLOR_BIAS_FACTOR.xxx;
    r4.y = (r5.x == 0.0) ? r4.y : r4.x;
    ps = OpacityOverride.x * r4.y;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
