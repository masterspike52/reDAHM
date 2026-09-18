// ps_d1f73bccf52b5aa0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 75 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000012C 10000300 00000004 00000000 00003484 000F000F 00000021 00003050 0000F151 0000F255 00007356
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 MinZ_MaxZRatio : register(c2); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D Texture2D_2 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r2.w;
    r0.zw = r0.xy * 3.0;
    r3.x = ps;
    r3.xy = r3.xx * ScreenPositionScaleBias.xy;
    r3.xy = r3.yx * r2.yx + ScreenPositionScaleBias.zw;
    r0.w = tex2D(Texture2D_2, r0.zw).x;
    r0.z = tex2D(SceneDepthTexture, r3.yx).x;
    r0.x = tex2D(Texture2D_2, r0.xy).w;
    ps = 5.0 * r0.x;
    r0.y = ps;
    r0.x = r0.z * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r0.x;
    r0.z = min(r0.y, 1.0);
    r0.y = ps;
    ps = r0.z;
    r0.x = r0.y - r2.w;
    ps = r0.w + ps;
    r0.z = float((r0.y != 1.0));
    r0.y = ps;
    ps = 0.04 * r0.x;
    r0.y = r0.y * r1.w;
    r0.x = saturate(ps);
    r0.x = r0.y * r0.x;
    r0.z = (r0.z == 0.0) ? r0.y : r0.x;
    ps = 4.0 * r0.z;
    r0.x = ps;
    r0.x = max(r0.x, (-255.0));
    ps = (-0.003921569) - -r0.z;
    r0.y = min(r0.x, 255.0);
    r0.x = ps;
    ps = 0.003921569 * r0.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    r0.x = ps;
    oC0.x = max(r0.x, 0.0);
    oC0.yzw = 0.0;
    r0.x = min(r0.x, 0.0);
    oC0.yz = (float2(1.0, 0.0) == 0.0) ? abs(r0.xx) : 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
