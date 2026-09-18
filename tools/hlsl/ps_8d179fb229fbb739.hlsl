// ps_8d179fb229fbb739.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 99 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000018C 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
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
float4 OpacityOverride : register(c10); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
float4 UniformVector_6 : register(c9); // float4
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

    r4.xz = r0.yx - 0.5;
    r4.y = dot(r4.xz, UniformVector_3.yx) + 0.5;
    r4.x = dot(r4.xz, UniformVector_2.yx) + 0.5;
    r4.y = tex2D(Texture2D_0, r4.xy).x;
    r5.xy = r0.xy * 4.0 + UniformVector_4.xy;
    ps = 1.0 / r1.w;
    r4.w = dot(r2.zxy, r2.zxy);
    r4.x = ps;
    ps = rsqrt(abs(r4.w));
    r4.xz = r4.xx * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r4.zw = r4.zx * r1.yx + ScreenPositionScaleBias.zw;
    r4.x = saturate(r5.z * r2.z);
    ps = log2(r4.x);
    r5.zw = r5.zz * r2.xy;
    r4.x = ps;
    r4.xy = r4.yx * float2(0.29999998, 0.02);
    ps = (-0.002) + r4.x;
    r4.x = ps;
    r5.xy = r5.zw * r4.xx + r5.xy;
    r5.xyz = tex2D(Texture2D_1, r5.xy).xyz;
    r4.x = tex2D(SceneDepthTexture, r4.wz).x;
    r4.x = r4.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r4.x;
    r4.w = r3.w * SCENE_COLOR_BIAS_FACTOR.x;
    r4.x = ps;
    ps = r4.x;
    r0.xyz = r5.xyz + 0.01;
    ps = -r1.w + ps;
    r5.w = float((r4.x != 1.0));
    r4.z = ps;
    ps = pow(2.0, r4.y);
    r5.x = saturate(r4.z * 0.002);
    r4.x = ps;
    ps = 1.0 - r4.x;
    r4.x = ps;
    r4.xyz = r4.xxx * UniformVector_1.xyz;
    r0.xyz = r0.xyz * UniformVector_5.xyz - r4.xyz;
    r4.xyz = r0.yxz * 0.5 + r4.yxz;
    r5.yz = r4.xz * UniformVector_6.yz + UniformVector_0.yz;
    ps = UniformVector_6.x * r4.y;
    r4.y = ps;
    ps = UniformVector_0.x + r4.y;
    r4.x = r4.y * r5.x;
    r5.x = ps;
    r4.y = (r5.w == 0.0) ? r4.y : r4.x;
    ps = OpacityOverride.x * r4.y;
    oC0.xyz = r4.www * r5.xyz;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
