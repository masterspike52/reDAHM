// ps_0da2f4d2839831aa.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 135 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000021C 10000400 00000008 00000000 00003063 00010007 00000001 0000F055 0000F1A0 0000F2A2
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> COLOR0 (flags 0xF)
//   interpolator: r2 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 DepthFilterSampleOffsets[2] : register(c10); // float4[2]
float4 FirstDensityFunctionParameters : register(c3); // float4
float4 FogCameraPosition : register(c9); // float4
float4 InvMaxIntegral : register(c12); // float
float4 MinZ_MaxZRatio : register(c2); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 SecondDensityFunctionParameters : register(c4); // float4
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

    ps = 1.0 / r0.w;
    r1.zw = DepthFilterSampleOffsets[0].xw + ScreenPositionScaleBias.wz;
    r2.x = ps;
    r2.yz = r2.xx * ScreenPositionScaleBias.xy;
    r2 = r2.xxzy * r0.xyyx;
    r1.xy = r2.zw + ScreenPositionScaleBias.zw;
    ps = DepthFilterSampleOffsets[0].y + r1.x;
    r3.xw = r1.zw + r2.wz;
    r3.y = ps;
    ps = DepthFilterSampleOffsets[0].z + r1.y;
    r4 = r1.yxyx + DepthFilterSampleOffsets[1];
    r3.z = ps;
    r1.x = tex2D(SceneDepthTexture, r3.xy).x;
    r1.y = tex2D(SceneDepthTexture, r4.zw).x;
    r1.z = tex2D(SceneDepthTexture, r4.xy).x;
    r1.w = tex2D(SceneDepthTexture, r3.zw).x;
    r1 = r1.yxzw * MinZ_MaxZRatio.zzzz - MinZ_MaxZRatio.wwww;
    ps = 1.0 / r1.y;
    r3.x = ps;
    ps = 1.0 / r1.w;
    r3.y = ps;
    ps = 1.0 / r1.z;
    r2.w = FirstDensityFunctionParameters.x * (-5e-05);
    r3.z = ps;
    ps = 1.0 / r1.x;
    r1.y = dot(SecondDensityFunctionParameters.zxy, FogCameraPosition.zxy);
    r3.w = ps;
    r1.x = dot(r3.wzxy, float4(0.25, 0.25, 0.25, 0.25));
    r1.x = min(r1.x, r0.z);
    r2.xy = r2.xy * r1.xx;
    r1.xzw = r1.xxx * ScreenToWorld[2].xyz + ScreenToWorld[3].xyz;
    r1.xzw = r2.yyy * ScreenToWorld[1].xzy + r1.xwz;
    r2.xyz = r2.xxx * ScreenToWorld[0].xyz + r1.xwz;
    r1.x = dot(r2.zxy, SecondDensityFunctionParameters.zxy);
    r2.xyz = -r2.xyz + FogCameraPosition.xyz;
    r1.w = dot(r2.zxy, r2.zxy);
    r0.x = dot(r2.zxy, SecondDensityFunctionParameters.zxy);
    r1.yz = r1.xy + SecondDensityFunctionParameters.ww;
    ps = sqrt(abs(r1.w));
    r1.x = float((-r1.z >= 0.0));
    r1.w = ps;
    r2.yz = r1.xy + r1.xz;
    ps = abs(r0.x);
    r2.x = -r2.y + 1.0;
    ps = 0.0001 + ps;
    r1.xyz = r2.xwz * r1.ywx;
    r2.x = ps;
    ps = 1.0 / r2.x;
    r1.w = min(r1.x, 0.0);
    r2.x = ps;
    r2.x = r1.w * r2.x;
    r1.x = -r2.x * r1.w + r1.z;
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
