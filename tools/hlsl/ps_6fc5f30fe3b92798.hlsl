// ps_6fc5f30fe3b92798.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 84 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000150 10000300 00000008 00000000 00003063 00010007 00000001 0000F055 0000F1A0 0000F2A2
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> COLOR0 (flags 0xF)
//   interpolator: r2 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 DepthFilterSampleOffsets[2] : register(c4); // float4[2]
float4 FirstDensityFunctionParameters : register(c3); // float4
float4 InvMaxIntegral : register(c6); // float
float4 MinZ_MaxZRatio : register(c2); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
sampler2D SceneDepthTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord5 : TEXCOORD5; // r0
    float4 color0 : COLOR0; // r1
    float4 color2 : COLOR2; // r2
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord5;
    float4 r1 = In.color0;
    float4 r2 = In.color2;
    float4 r3 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.zw = DepthFilterSampleOffsets[0].xw + ScreenPositionScaleBias.wz;
    r1.x = 1.0 / r0.w;
    r1.xy = r1.xx * ScreenPositionScaleBias.xy;
    r2.xw = r1.xy * r0.xy + r1.zw;
    r1.xy = r1.yx * r0.yx + ScreenPositionScaleBias.zw;
    r2.yz = r1.xy + DepthFilterSampleOffsets[0].yz;
    r3 = r1.yxyx + DepthFilterSampleOffsets[1];
    r1.x = tex2D(SceneDepthTexture, r2.xy).x;
    r1.y = tex2D(SceneDepthTexture, r3.zw).x;
    r1.z = tex2D(SceneDepthTexture, r3.xy).x;
    r1.w = tex2D(SceneDepthTexture, r2.zw).x;
    r1 = r1.yxzw * MinZ_MaxZRatio.zzzz - MinZ_MaxZRatio.wwww;
    r2.x = 1.0 / r1.y;
    r2.y = 1.0 / r1.w;
    r2.z = 1.0 / r1.z;
    ps = 1.0 / r1.x;
    r1.y = InvMaxIntegral.x * FirstDensityFunctionParameters.x;
    r2.w = ps;
    r1.x = dot(r2.wzxy, float4(0.25, 0.25, 0.25, 0.25));
    r1.x = min(r1.x, r0.z);
    r1.w = r1.y * r1.x;
    r1.xyz = r1.www * float3(262144.0, 4096.0, 64.0);
    ps = frac(r1.w);
    r1.xyz = frac(r1.xyz);
    r1.w = ps;
    r1.w = -r1.z * 0.015625 + r1.w;
    r2.xy = -r1.xy * 0.015625 + r1.yz;
    oC0.yz = r2.xy * 0.25;
    oC0.xw = r1.xw * 0.25;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
