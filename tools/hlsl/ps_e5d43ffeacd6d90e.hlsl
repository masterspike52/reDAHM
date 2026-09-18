// ps_e5d43ffeacd6d90e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 72 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000120 10000400 00000008 00000000 00004CA5 0007001F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A2
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
sampler2D Texture2D_7 : register(s1);

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

    r3.z = 1.0 / r1.w;
    r3.zw = r3.zz * ScreenPositionScaleBias.xy;
    r3.zw = r3.wz * r1.yx + ScreenPositionScaleBias.zw;
    r3.z = tex2D(SceneDepthTexture, r3.wz).x;
    r3.z = r3.z * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r3.z = 1.0 / r3.z;
    r3.w = r3.z - r1.w;
    r4.x = float((r3.z != 1.0));
    r3.z = saturate(0.002 * r3.w);
    r3.z = (r4.x == 0.0) ? 1.0 : r3.z;
    r4.x = (-0.003921569) - -r3.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r4.xxxx)) clip(-1.0);
    r4.xy = tex2D(Texture2D_7, r0.xy).xy;
    r4.xy = r4.xy * 4e+01;
    r3.xy = r4.xy * r3.xy;
    r3.xy = max(r3.xy, (-255.0));
    r3.xy = min(r3.xy, 255.0);
    r3.xy = r3.xy * 0.003921569;
    r3.zw = min(r3.xy, 0.0);
    oC0.zw = abs(r3.zw);
    oC0.xy = max(r3.xy, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
