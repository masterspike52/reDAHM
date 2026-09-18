// ps_efd44ad6ab442265.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 168 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002A0 10000400 00000008 00000000 00003063 00010007 00000001 0000F055 0000F1A0 0000F2A2
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
    r2.z = ps;
    r2.xy = r2.zz * ScreenPositionScaleBias.xy;
    r2 = r2.yxzz * r0.yxyx;
    r1.xy = r2.xy + ScreenPositionScaleBias.zw;
    ps = DepthFilterSampleOffsets[0].z + r1.y;
    r3.yz = r1.wz + r2.xy;
    r3.x = ps;
    ps = DepthFilterSampleOffsets[0].y + r1.x;
    r4 = r1.yxyx + DepthFilterSampleOffsets[1].zwxy;
    r3.w = ps;
    r1.x = tex2D(SceneDepthTexture, r3.zw).x;
    r1.y = tex2D(SceneDepthTexture, r4.xy).x;
    r1.z = tex2D(SceneDepthTexture, r4.zw).x;
    r1.w = tex2D(SceneDepthTexture, r3.xy).x;
    r1 = r1.yzwx * MinZ_MaxZRatio.zzzz - MinZ_MaxZRatio.wwww;
    ps = 1.0 / r1.x;
    r1.x = ps;
    ps = 1.0 / r1.y;
    r1.y = ps;
    ps = 1.0 / r1.z;
    r1.z = ps;
    ps = 1.0 / r1.w;
    r1.w = ps;
    r1.x = dot(r1.xywz, float4(0.25, 0.25, 0.25, 0.25));
    r1.y = min(r1.x, r0.z);
    r1.xw = r2.zw * r1.yy;
    r2.xyz = r1.yyy * ScreenToWorld[2].xyz + ScreenToWorld[3].xyz;
    r1.xyz = r1.xxx * ScreenToWorld[1].xzy + r2.xzy;
    r1.yzw = r1.www * ScreenToWorld[0].xyz + r1.xzy;
    ps = -FirstDensityFunctionParameters.x - -r1.y;
    r2.xyz = -r1.ywz + FogCameraPosition.xzy;
    r0.x = ps;
    ps = -FirstDensityFunctionParameters.y - -r1.z;
    r1.x = dot(r2.yxz, r2.yxz);
    r0.y = ps;
    ps = -FirstDensityFunctionParameters.z - -r1.w;
    r2.w = dot(r2.yxz, SecondDensityFunctionParameters.zxy);
    r0.z = ps;
    r1.w = dot(r0.zxy, SecondDensityFunctionParameters.zxy);
    r3.y = r2.w * r1.w;
    r2.y = dot(r2.yxz, r0.zxy);
    ps = 0.5 * r1.x;
    r2.x = dot(r0.zxy, r0.zxy);
    r2.z = ps;
    ps = r2.w * r2.w;
    r1.y = -r2.z + 0.0001;
    r1.z = ps;
    r1.y = r1.y + r1.z;
    ps = 1.0 / r1.y;
    r2.z = r1.z - r2.z;
    r2.w = ps;
    ps = r1.w * r1.w;
    r2 = r2.zxyw * float4(4.0, 0.5, 0.5, 0.5);
    r3.x = ps;
    r1.yz = r3.yx - r2.zy;
    ps = r1.y + r1.y;
    r1.y = ps;
    ps = sqrt(abs(r1.x));
    r0.x = r2.x * r1.z;
    r1.z = ps;
    r1.x = r1.y * r1.y - r0.x;
    ps = sqrt(abs(r1.x));
    r1.z = r1.z * FirstDensityFunctionParameters.w;
    r0.x = ps;
    ps = r1.y;
    r2.xyz = InvMaxIntegral.xxx * float3(262144.0, 4096.0, 64.0);
    ps = r0.x + ps;
    r0.y = r1.y - r0.x;
    r0.x = ps;
    r0.xy = saturate(r2.ww * -r0.xy);
    ps = r0.y - r0.x;
    r1.y = ps;
    r1.y = r1.z * r1.y;
    r1.x = (r1.x >= 0.0) ? r1.y : 0.0;
    r1.y = (r1.w >= 0.0) ? r1.x : 0.0;
    ps = InvMaxIntegral.x * r1.y;
    r1.xzw = r2.xyz * r1.yyy;
    r1.y = ps;
    ps = frac(r1.y);
    r1.xzw = frac(r1.xzw);
    r1.y = ps;
    r1.y = -r1.w * 0.015625 + r1.y;
    r2.xy = -r1.xz * 0.015625 + r1.zw;
    oC0.yz = r2.xy * 0.25;
    oC0.xw = r1.xy * 0.25;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
