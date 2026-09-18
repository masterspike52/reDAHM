// ps_3f04af6b7d466147.bin
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

    r1.xy = r0.xy + UniformVector_1.xy;
    ps = 1.0 / r4.w;
    r2 = r0.xyxy * float4(3.0, 3.0, 0.3, 0.03);
    r0.z = ps;
    r0.zw = r0.zz * ScreenPositionScaleBias.xy;
    r1.zw = r0.wz * r4.yx + ScreenPositionScaleBias.zw;
    r0.w = tex2D(Texture2D_2, r2.xy).x;
    r0.y = tex2D(Texture2D_2, r0.xy).w;
    r0.x = tex2D(SceneDepthTexture, r1.wz).x;
    r2.xyz = tex2D(Texture2D_0, r2.zw).xyz;
    r1.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r1.yzw = r2.xyz * r1.xyz + r3.xyz;
    r0.x = r0.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r0.x;
    r1.x = r0.y * 5.0;
    r0.y = ps;
    r0.x = r0.y - r4.w;
    r1 = min(r1, float4(1.0, 1.5, 1.5, 1.5));
    ps = r1.x;
    r0.z = float((r0.y != 1.0));
    ps = r0.w + ps;
    r1.xyz = r1.yzw + UniformVector_0.xyz;
    r0.y = ps;
    r1.xyz = r1.xyz * r6.www + r6.xyz;
    ps = 0.04 * r0.x;
    r0.y = r0.y * r3.w;
    r0.x = saturate(ps);
    r0.x = r0.y * r0.x;
    oC0.xyz = r1.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    r0.y = (r0.z == 0.0) ? r0.y : r0.x;
    ps = OpacityOverride.x * r0.y;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
