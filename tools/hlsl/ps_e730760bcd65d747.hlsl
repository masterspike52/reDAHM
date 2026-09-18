// ps_e730760bcd65d747.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 75 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000012C 10000400 00000008 00000000 00004CA5 0007001F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
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
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 color0 : COLOR0; // r3
    float4 color2 : COLOR2; // r4
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
    float4 r3 = In.color0;
    float4 r4 = In.color2;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r1.w;
    r4.xy = r0.xy * 3.0;
    r3.x = ps;
    r3.xy = r3.xx * ScreenPositionScaleBias.xy;
    r3.xy = r3.yx * r1.yx + ScreenPositionScaleBias.zw;
    r4.x = tex2D(Texture2D_2, r4.xy).x;
    r3.z = tex2D(SceneDepthTexture, r3.yx).x;
    r3.x = tex2D(Texture2D_2, r0.xy).w;
    ps = 5.0 * r3.x;
    r3.y = ps;
    r3.x = r3.z * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r3.x;
    r3.z = min(r3.y, 1.0);
    r3.y = ps;
    ps = r3.z;
    r3.x = r3.y - r1.w;
    ps = r4.x + ps;
    r3.z = float((r3.y != 1.0));
    r4.x = ps;
    ps = 0.04 * r3.x;
    r3.y = r4.x * r3.w;
    r3.x = saturate(ps);
    r3.x = r3.y * r3.x;
    r3.z = (r3.z == 0.0) ? r3.y : r3.x;
    ps = 4.0 * r3.z;
    r3.x = ps;
    r3.x = max(r3.x, (-255.0));
    ps = (-0.003921569) - -r3.z;
    r3.y = min(r3.x, 255.0);
    r3.x = ps;
    ps = 0.003921569 * r3.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.xxxx)) clip(-1.0);
    r3.x = ps;
    oC0.x = max(r3.x, 0.0);
    oC0.yzw = 0.0;
    r3.x = min(r3.x, 0.0);
    oC0.yz = (float2(1.0, 0.0) == 0.0) ? abs(r3.xx) : 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
