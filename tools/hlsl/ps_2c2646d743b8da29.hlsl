// ps_2c2646d743b8da29.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10000300 00000004 00000000 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 FalloffExponent : register(c9); // float
float4 LightPosition : register(c4); // float4
float4 MinZ_MaxZRatio : register(c2); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToShadowMatrix[4] : register(c10); // float4x4 (matrix_columns)
float4 ScreenToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ShadowModulateColor : register(c3); // float4
float4 VSMEpsilon : register(c14); // float
float4 VSMExponent : register(c15); // float
sampler2D SceneDepthTexture : register(s0);
sampler2D ShadowVarianceTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = 0.0;
    float4 r2 = 0.0;
    float4 r3 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r0.w;
    r1.z = ps;
    r1.xy = r1.zz * ScreenPositionScaleBias.xy;
    r0 = r1.zzyx * r0.xyyx;
    r1.xy = r0.zw + ScreenPositionScaleBias.zw;
    r1.x = tex2D(SceneDepthTexture, r1.yx).x;
    r1.x = r1.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r1.x;
    r0.z = ps;
    r1 = r0.zzzz * ScreenToShadowMatrix[2].xywz + ScreenToShadowMatrix[3].xywz;
    r0.xw = r0.yx * r0.zz;
    r1 = r0.xxxx * ScreenToShadowMatrix[1].xywz + r1;
    r1 = r0.wwww * ScreenToShadowMatrix[0] + r1.xywz;
    ps = 1.0 / r1.w;
    r0.y = ps;
    r2.xy = r1.xy * r0.yy;
    r1.xy = tex2D(ShadowVarianceTexture, r2.xy).xy;
    r0.y = -r1.x * r1.x + r1.y;
    r0.y = max(r0.y, 0.0);
    ps = VSMEpsilon.x + r0.y;
    r0.y = ps;
    ps = ScreenToWorld[0].x * r0.w;
    r3.x = min(r0.y, 1.0);
    r2.y = ps;
    ps = ScreenToWorld[0].z * r0.w;
    r0.y = min(r1.z, 0.999);
    r2.z = ps;
    ps = ScreenToWorld[0].y * r0.w;
    r1.z = -r0.y + r1.x;
    r2.w = ps;
    ps = r1.z * r1.z;
    r3.yzw = r0.xxx * ScreenToWorld[1].xzy;
    r2.x = ps;
    r2 = r2.ywzx + r3.ywzx;
    r2.xyz = r0.zzz * ScreenToWorld[2].xzy + r2.xzy;
    ps = 1.0 / r2.w;
    r0.x = ps;
    ps = r3.x;
    r0.z = float((r0.y > r1.x));
    ps = r0.x * ps;
    r1.xyz = r2.xzy + ScreenToWorld[3].xyz;
    r0.x = ps;
    ps = log2(abs(r0.x));
    r1.xyz = -r1.xyz + LightPosition.xyz;
    r0.y = ps;
    ps = VSMExponent.x * r0.y;
    r1.xyz = r1.xyz * LightPosition.www;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r0.x = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    r0.z = (r0.z == 0.0) ? 1.0 : r0.y;
    ps = 1.0 - r0.x;
    r0.x = saturate(ps);
    ps = log2(r0.x);
    r0.y = ps;
    ps = FalloffExponent.x * r0.y;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r1 = ShadowModulateColor - 1.0;
    r0.x = ps;
    r1 = r1 * r0.xxxx + 1.0;
    r2 = -r1 + 1.0;
    oC0 = r2 * r0.zzzz + r1;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
