// ps_990d358bb8ccf872.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 72 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000120 10000500 00000004 00000000 000044A5 001F001F 00000001 00003050 0000F151 0000F255 00007356 0000F457
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

    r0.zw = r0.xy * 0.08 + UniformVector_1.xy;
    r0.w = tex2D(Texture2D_0, r0.zw).x;
    r5.x = dot(r3.zxy, r3.zxy);
    r0.z = 1.0 / r2.w;
    r3.w = r0.w * 0.2 - 0.005;
    r0.zw = r0.zz * ScreenPositionScaleBias.xy;
    r5.x = rsqrt(abs(r5.x));
    r0.zw = r0.wz * r2.yx + ScreenPositionScaleBias.zw;
    r3.xy = r5.xx * r3.xy;
    r0.xy = r3.xy * r3.ww + r0.xy;
    r0.x = tex2D(Texture2D_1, r0.xy).w;
    r0.y = tex2D(SceneDepthTexture, r0.wz).x;
    r0.z = SCENE_COLOR_BIAS_FACTOR.x * r4.w;
    r0.y = r0.y * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r3.xyz = r0.xxx * r1.xyz + UniformVector_0.xyz;
    oC0.xyz = r0.zzz * r3.xyz;
    ps = 1.0 / r0.y;
    r0.z = r0.x * r1.w;
    r0.y = ps;
    r0.x = r0.y - r2.w;
    ps = 0.004 * r0.x;
    r0.y = float((r0.y != 1.0));
    r0.x = saturate(ps);
    r0.x = r0.z * r0.x;
    r0.y = (r0.y == 0.0) ? r0.z : r0.x;
    ps = OpacityOverride.x * r0.y;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
