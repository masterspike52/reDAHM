// ps_45664af15ae77519.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 99 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000018C 10000500 00000004 00000000 000044A5 001F001F 00000001 00003050 0000F151 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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

    r1.xy = r0.yx - 0.5;
    r0.w = dot(r1.xy, UniformVector_3.yx) + 0.5;
    r0.z = dot(r1.xy, UniformVector_2.yx) + 0.5;
    r5.y = tex2D(Texture2D_0, r0.zw).x;
    r1.xy = r0.xy * 8.0 + UniformVector_4.xy;
    ps = 1.0 / r2.w;
    r0.y = dot(r3.zxy, r3.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r0.xz = r0.xx * ScreenPositionScaleBias.xy;
    r0.y = ps;
    r0.zw = r0.zx * r2.yx + ScreenPositionScaleBias.zw;
    r0.x = saturate(r0.y * r3.z);
    ps = log2(r0.x);
    r1.zw = r0.yy * r3.xy;
    r5.x = ps;
    r0.xy = r5.yx * float2(0.39999998, 0.18);
    ps = (-0.002) + r0.x;
    r0.x = ps;
    r1.xy = r1.zw * r0.xx + r1.xy;
    r1.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r0.x = tex2D(SceneDepthTexture, r0.wz).x;
    r0.x = r0.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r0.x;
    r0.w = r4.w * SCENE_COLOR_BIAS_FACTOR.x;
    r0.x = ps;
    ps = r0.x;
    r3.xyz = r1.xyz + 0.01;
    ps = -r2.w + ps;
    r1.w = float((r0.x != 1.0));
    r0.z = ps;
    ps = pow(2.0, r0.y);
    r1.x = saturate(r0.z * 0.04);
    r0.x = ps;
    ps = 1.0 - r0.x;
    r0.x = ps;
    r0.xyz = r0.xxx * UniformVector_1.xyz;
    r2.xyz = r3.xyz * UniformVector_5.xyz - r0.xyz;
    r0.xyz = r2.yxz * 0.4 + r0.yxz;
    r1.yz = r0.xz * UniformVector_6.yz + UniformVector_0.yz;
    ps = UniformVector_6.x * r0.y;
    r0.y = ps;
    ps = UniformVector_0.x + r0.y;
    r0.x = r0.y * r1.x;
    r1.x = ps;
    r0.y = (r1.w == 0.0) ? r0.y : r0.x;
    ps = OpacityOverride.x * r0.y;
    oC0.xyz = r0.www * r1.xyz;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
