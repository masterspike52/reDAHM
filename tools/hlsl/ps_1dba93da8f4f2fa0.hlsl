// ps_1dba93da8f4f2fa0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 63 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000FC 10000600 00000004 00000000 000044A5 001F001F 00000001 00003050 0000F151 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 MinZ_MaxZRatio : register(c2); // float4
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D SceneColorTexture : register(s1);
sampler2D Texture2D_0 : register(s2);
sampler2D Texture2D_1 : register(s3);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r2.w;
    r0.z = ps;
    r0.zw = r0.zz * ScreenPositionScaleBias.xy;
    r6.xy = r0.zw * r2.xy + ScreenPositionScaleBias.wz;
    r5.xzw = tex2D(Texture2D_0, r0.xy).xyz;
    r3.xyz = tex2D(SceneColorTexture, r6.xy).xyz;
    r0.xyz = tex2D(Texture2D_1, r0.xy).yxz;
    r0.w = tex2D(SceneDepthTexture, r6.xy).x;
    r5.y = r0.w * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = OpacityOverride.x * r0.y;
    r6 = r0.yyxz * r1.wxyz;
    r3.w = ps;
    ps = r6.x;
    r0.xzw = r3.xyz + UniformVector_0.xyz;
    r0.y = ps;
    ps = 1.0 - r0.y;
    r5.xzw = r6.yzw * r5.xzw;
    r0.y = ps;
    r3.xyz = r5.xzw * 1.000001 - r3.xyz;
    ps = 1.0 / r5.y;
    r5.x = max(r0.y, 0.001);
    r0.y = ps;
    ps = 1.0 / r5.x;
    r0.y = r0.y - r2.w;
    r2.x = ps;
    ps = r3.w;
    r0.y = saturate(r0.y * r2.x);
    r0.xyz = r0.yyy * r3.xyz + r0.xzw;
    r0.xyz = r0.xyz * r4.www + r4.xyz;
    ps = r1.w * ps;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
