// ps_65c6ec1bf6017a70.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10000400 00000008 00000000 00003063 00010007 00000001 0000F055 0000F1A0 0000F2A2
//   interpolator: r0 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r1 <-> COLOR0 (flags 0xF)
//   interpolator: r2 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 FirstDensityFunctionParameters : register(c3); // float4
float4 FogCameraPosition : register(c9); // float4
float4 InvMaxIntegral : register(c10); // float
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
    r1.z = ps;
    r1.xy = r1.zz * ScreenPositionScaleBias.xy;
    r1 = r1.zyzx * r0.xyyx;
    r2.xy = r1.yw + ScreenPositionScaleBias.zw;
    r2.x = tex2D(SceneDepthTexture, r2.yx).x;
    r2.y = r2.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r2.y;
    r2.x = SecondDensityFunctionParameters.w * SecondDensityFunctionParameters.w;
    r2.y = ps;
    r1.y = min(r2.y, r0.z);
    r1.xw = r1.zx * r1.yy;
    r2.yzw = r1.yyy * ScreenToWorld[2].xyz + ScreenToWorld[3].xyz;
    r1.xyz = r1.xxx * ScreenToWorld[1].xzy + r2.ywz;
    r1.xyz = r1.www * ScreenToWorld[0].xyz + r1.xzy;
    r3.xyz = -r1.zyx + FogCameraPosition.zyx;
    r0.xyz = r1.xyz - SecondDensityFunctionParameters.xyz;
    r3.w = dot(r3.xzy, r0.zxy);
    ps = 1.0;
    r1.x = dot(r3.xzy, r3.xzy);
    r0.w = ps;
    ps = 0.0001 + r1.x;
    r1.z = dot(r0.zxy, r0.zxy);
    r2.y = ps;
    ps = r1.z;
    r1.y = dot(r3.xzyw, r0.zxyw);
    ps = -r2.x + ps;
    r3.xzw = r1.xxy * float3(4.0, 0.33333334, 0.5);
    r1.w = ps;
    ps = 1.0 / r2.y;
    r1.w = r3.x * r1.w;
    r2.y = ps;
    r1.w = r1.y * r1.y - r1.w;
    ps = sqrt(abs(r1.w));
    r2.w = r2.y * 0.5;
    r2.z = ps;
    r2.y = r1.y + r2.z;
    r2.z = r1.y - r2.z;
    r0.zw = saturate(r2.ww * -r2.yz);
    ps = r0.w * r0.w;
    r2.yzw = InvMaxIntegral.xxx * float3(262144.0, 4096.0, 64.0);
    r0.x = ps;
    ps = r0.z * r0.z;
    r3.xy = r0.zw * r1.zz;
    r0.y = ps;
    ps = 1.0 / r2.x;
    r4 = r0.xywz * r0.wzwz;
    r1.z = ps;
    r3.y = dot(r3.zw, r4.xz) + r3.y;
    r3.x = dot(r3.zw, r4.yw) + r3.x;
    r0.xy = -r3.yx * r1.zz + r0.wz;
    r0.xy = r0.xy * FirstDensityFunctionParameters.xx;
    ps = sqrt(abs(r1.x));
    r1.z = r0.x - r0.y;
    r1.x = ps;
    r1.x = r1.z * r1.x;
    r1.y = (r1.w >= 0.0) ? r1.x : 0.0;
    ps = InvMaxIntegral.x * r1.y;
    r1.xzw = r2.yzw * r1.yyy;
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
