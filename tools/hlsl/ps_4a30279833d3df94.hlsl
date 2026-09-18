// ps_4a30279833d3df94.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 117 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001D4 10000400 00000008 00000000 00003063 00010007 00000001 0000F055 0000F1A0 0000F2A2
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> COLOR0 (flags 0xF)
//   interpolator: r2 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 DepthFilterSampleOffsets[2] : register(c9); // float4[2]
float4 FirstDensityFunctionParameters : register(c3); // float4
float4 FogCameraPosition : register(c8); // float4
float4 InvMaxIntegral : register(c11); // float
float4 MinZ_MaxZRatio : register(c2); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToWorld[4] : register(c4); // float4x4 (matrix_columns)
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
    float4 r4 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.zw = DepthFilterSampleOffsets[0].xw + ScreenPositionScaleBias.wz;
    r2.x = 1.0 / r0.w;
    r2.yz = r2.xx * ScreenPositionScaleBias.xy;
    r2 = r2.xxyz * r0.xyxy;
    r1.xy = r2.wz + ScreenPositionScaleBias.zw;
    r3.xw = r1.zw + r2.zw;
    r3.y = DepthFilterSampleOffsets[0].y + r1.x;
    r4 = r1.yxyx + DepthFilterSampleOffsets[1];
    r3.z = DepthFilterSampleOffsets[0].z + r1.y;
    r1.x = tex2D(SceneDepthTexture, r3.xy).x;
    r1.y = tex2D(SceneDepthTexture, r4.zw).x;
    r1.z = tex2D(SceneDepthTexture, r4.xy).x;
    r1.w = tex2D(SceneDepthTexture, r3.zw).x;
    r1 = r1 * MinZ_MaxZRatio.zzzz - MinZ_MaxZRatio.wwww;
    r3.x = 1.0 / r1.x;
    r3.y = 1.0 / r1.w;
    r3.w = FogCameraPosition.z - FirstDensityFunctionParameters.y;
    r3.z = 1.0 / r1.z;
    ps = 1.0 / r1.y;
    r1.x = float((-r3.w >= 0.0));
    r3.w = ps;
    r1.y = dot(r3.wzxy, float4(0.25, 0.25, 0.25, 0.25));
    r1.y = min(r1.y, r0.z);
    r2.xy = r2.xy * r1.yy;
    r1.yzw = r1.yyy * ScreenToWorld[2].xyz + ScreenToWorld[3].xyz;
    r1.yzw = r2.yyy * ScreenToWorld[1].xzy + r1.ywz;
    r1.yzw = r2.xxx * ScreenToWorld[0].xyz + r1.ywz;
    r2.xyz = -r1.ywz + FogCameraPosition.xzy;
    r2.x = dot(r2.yxz, r2.yxz);
    ps = sqrt(abs(r2.x));
    r1.z = abs(r2.y) + 0.0001;
    r1.y = ps;
    ps = 1.0 / r1.z;
    r1.w = r1.w - FirstDensityFunctionParameters.y;
    r1.z = ps;
    r1.x = saturate(-r1.w * r1.z + r1.x);
    ps = FirstDensityFunctionParameters.x * r1.y;
    r1.y = ps;
    r1.x = r1.y * r1.x;
    r1 = r1.xxxx * float4(262144.0, 4096.0, 64.0, 1.0);
    r1 = r1 * InvMaxIntegral.xxxx;
    r1 = frac(r1);
    oC0.x = r1.x * 0.25;
    r1.xyz = -r1.xzy * 0.015625 + r1.ywz;
    oC0.yzw = r1.xzy * 0.25;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
