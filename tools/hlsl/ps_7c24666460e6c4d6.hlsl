// ps_7c24666460e6c4d6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 93 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000174 10000500 00000008 00000000 00004CA5 0007001F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A2
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
float4 UniformVector_2 : register(c3); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D Texture2D_2 : register(s1);
sampler2D Texture2D_3 : register(s2);

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
    float4 r5 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r1.w;
    r3.y = dot(r2.zxy, r2.zxy);
    r3.z = ps;
    ps = ScreenPositionScaleBias.x * r3.z;
    r4 = r0.xyxy * float4(0.08, 0.08, 3.0, 3.0);
    r5.x = ps;
    ps = ScreenPositionScaleBias.y * r3.z;
    r4.xy = r4.xy + UniformVector_2.xy;
    r5.y = ps;
    r3.zw = r5.yx * r1.yx + ScreenPositionScaleBias.zw;
    r2.w = tex2D(Texture2D_2, r4.zw).x;
    r4.z = tex2D(Texture2D_2, r0.xy).w;
    r3.z = tex2D(SceneDepthTexture, r3.wz).x;
    r3.w = tex2D(Texture2D_3, r4.xy).x;
    r4.x = r3.w * 0.2 - 0.005;
    ps = rsqrt(abs(r3.y));
    r3.y = ps;
    r3.w = r3.z * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r3.w;
    r3.yz = r3.yy * r2.xy;
    r3.w = ps;
    r4.w = float((r3.w != 1.0));
    r4.xy = r3.yz * r4.xx + r0.xy;
    r4.xy = r4.xy * 4.0;
    r4.xy = max(r4.xy, (-255.0));
    r4.xy = min(r4.xy, 255.0);
    r4.xyz = r4.xyz * float3(0.003921569, 0.003921569, 5.0);
    ps = r3.w;
    r0.xyz = min(r4.xyz, float3(0.0, 0.0, 1.0));
    ps = -r1.w + ps;
    r0.w = r0.z + r2.w;
    r3.z = ps;
    ps = 0.04 * r3.z;
    r3.x = r0.w * r3.x;
    r3.y = saturate(ps);
    r3.y = r3.x * r3.y;
    r3.y = (r4.w == 0.0) ? r3.x : r3.y;
    ps = (-0.003921569) - -r3.y;
    r3.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.xxxx)) clip(-1.0);
    oC0.zw = abs(r0.xy);
    oC0.xy = max(r4.xy, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
