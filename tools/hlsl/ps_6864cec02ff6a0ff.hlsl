// ps_6864cec02ff6a0ff.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 78 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000138 10000500 00000004 00000000 000044A5 001F001F 00000001 00003050 0000F151 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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

    r3.xy = r0.xy + UniformVector_1.xy;
    ps = 1.0 / r2.w;
    r5 = r0.xyxy * float4(3.0, 3.0, 0.3, 0.03);
    r0.z = ps;
    r0.zw = r0.zz * ScreenPositionScaleBias.xy;
    r3.zw = r0.wz * r2.yx + ScreenPositionScaleBias.zw;
    r0.w = tex2D(Texture2D_2, r5.xy).x;
    r0.y = tex2D(Texture2D_2, r0.xy).w;
    r0.x = tex2D(SceneDepthTexture, r3.wz).x;
    r5.xyz = tex2D(Texture2D_0, r5.zw).xyz;
    r3.xyz = tex2D(Texture2D_1, r3.xy).xyz;
    r3.yzw = r5.xyz * r3.xyz + r1.xyz;
    r0.x = r0.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r0.x;
    r3.x = r0.y * 5.0;
    r0.y = ps;
    r0.x = r0.y - r2.w;
    r2 = min(r3, float4(1.0, 1.5, 1.5, 1.5));
    ps = r2.x;
    r0.z = float((r0.y != 1.0));
    ps = r0.w + ps;
    r2.xyz = r2.yzw + UniformVector_0.xyz;
    r0.y = ps;
    r2.xyz = r2.xyz * r4.www + r4.xyz;
    ps = 0.04 * r0.x;
    r0.y = r0.y * r1.w;
    r0.x = saturate(ps);
    r0.x = r0.y * r0.x;
    oC0.xyz = r2.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    r0.y = (r0.z == 0.0) ? r0.y : r0.x;
    ps = OpacityOverride.x * r0.y;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
