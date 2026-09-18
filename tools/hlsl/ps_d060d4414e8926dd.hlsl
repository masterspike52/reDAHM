// ps_d060d4414e8926dd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10000300 00000004 00000000 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 FalloffExponent : register(c9); // float
float4 LightPosition : register(c4); // float4
float4 MinZ_MaxZRatio : register(c2); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToShadowMatrix[4] : register(c12); // float4x4 (matrix_columns)
float4 ScreenToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ShadowModulateColor : register(c3); // float4
float4 SpotAngles : register(c11); // float2
float4 SpotDirection : register(c10); // float3
float4 VSMEpsilon : register(c16); // float
float4 VSMExponent : register(c17); // float
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

    r1.z = 1.0 / r0.w;
    r1.xy = r1.zz * ScreenPositionScaleBias.xy;
    r0 = r1.yxzz * r0.yxxy;
    r1.xy = r0.xy + ScreenPositionScaleBias.zw;
    r1.x = tex2D(SceneDepthTexture, r1.yx).x;
    r1.x = r1.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r1.x = 1.0 / r1.x;
    r2 = r1.xxxx * ScreenToShadowMatrix[2].xywz + ScreenToShadowMatrix[3].xywz;
    r0.xz = r0.zw * r1.xx;
    r2 = r0.zzzz * ScreenToShadowMatrix[1].xywz + r2;
    r2 = r0.xxxx * ScreenToShadowMatrix[0] + r2.xywz;
    r0.w = min(r2.z, 0.999);
    r0.y = 1.0 / r2.w;
    r1.yz = r2.xy * r0.yy;
    r1.yz = tex2D(ShadowVarianceTexture, r1.yz).xy;
    r0.y = -r1.y * r1.y + r1.z;
    r0.y = max(r0.y, 0.0);
    r2.xyz = r1.xxx * ScreenToWorld[2].xyz + ScreenToWorld[3].xyz;
    r2.xyz = r0.zzz * ScreenToWorld[1].xzy + r2.xzy;
    r3.xzw = r0.xxx * ScreenToWorld[0].xyz + r2.xzy;
    r3.y = -r0.w + r1.y;
    r2 = ShadowModulateColor - 1.0;
    r0.x = VSMEpsilon.x + r0.y;
    r0.z = min(r0.x, 1.0);
    r3.xzw = -r3.xzw + LightPosition.xyz;
    r3.xzw = r3.xzw * LightPosition.www;
    r0.y = dot(r3.wxz, r3.wxz);
    ps = rsqrt(abs(r0.y));
    r0.x = saturate(-r0.y + 1.0);
    r0.y = ps;
    ps = log2(r0.x);
    r3.xzw = r3.xzw * r0.yyy;
    r0.y = ps;
    r0.x = dot(r3.wxz, -SpotDirection.zxy);
    ps = FalloffExponent.x * r0.y;
    r1.x = r0.x - SpotAngles.x;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r3.z = saturate(r1.x * SpotAngles.y);
    r0.x = ps;
    r3.x = r3.z * r0.x;
    r0.xy = r3.xy * r3.zy;
    r2 = r0.xxxx * r2 + 1.0;
    r0.x = r0.y + r0.z;
    ps = 1.0 / r0.x;
    r0.x = ps;
    r0.x = r0.z * r0.x;
    ps = log2(abs(r0.x));
    r0.z = float((r0.w > r1.y));
    r0.y = ps;
    ps = VSMExponent.x * r0.y;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r1 = -r2 + 1.0;
    r0.x = ps;
    r0.x = (r0.z == 0.0) ? 1.0 : r0.x;
    oC0 = r1 * r0.xxxx + r2;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
