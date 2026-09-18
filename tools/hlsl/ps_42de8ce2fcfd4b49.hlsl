// ps_42de8ce2fcfd4b49.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 111 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001BC 10000300 00000004 00000000 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 FalloffExponent : register(c9); // float
float4 LightPosition : register(c4); // float4
float4 MinZ_MaxZRatio : register(c2); // float4
float4 SampleOffsets[2] : register(c10); // float4[2]
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToShadowMatrix[4] : register(c12); // float4x4 (matrix_columns)
float4 ScreenToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ShadowModulateColor : register(c3); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D ShadowDepthTexture : register(s1);

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

    r1.x = 1.0 / r0.w;
    r1.yz = r1.xx * ScreenPositionScaleBias.xy;
    r1 = r1.xyxz * r0.xxyy;
    r0.xy = r1.yw + ScreenPositionScaleBias.wz;
    r0.x = tex2D(SceneDepthTexture, r0.xy).x;
    r0.x = r0.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r1.y = 1.0 / r0.x;
    r0 = r1.yyyy * ScreenToShadowMatrix[2].xywz + ScreenToShadowMatrix[3].xywz;
    r1.xw = r1.zx * r1.yy;
    r0 = r1.xxxx * ScreenToShadowMatrix[1].xywz + r0;
    r0 = r1.wwww * ScreenToShadowMatrix[0].xywz + r0;
    r1.z = 1.0 / r0.z;
    r3 = r0.xyxy * r1.zzzz + SampleOffsets[1];
    r2 = r0.xxyy * r1.zzzz + SampleOffsets[0].xzwy;
    r2.x = tex2D(ShadowDepthTexture, r2.xw).x;
    r2.y = tex2D(ShadowDepthTexture, r2.yz).x;
    r2.z = tex2D(ShadowDepthTexture, r3.xy).x;
    r2.w = tex2D(ShadowDepthTexture, r3.zw).x;
    r3.xyz = r1.yyy * ScreenToWorld[2].xyz + ScreenToWorld[3].xyz;
    r1.xyz = r1.xxx * ScreenToWorld[1].xzy + r3.xzy;
    r0.xyz = r1.www * ScreenToWorld[0].xyz + r1.xzy;
    r1 = ShadowModulateColor - 1.0;
    r3.x = r0.w;
    r0.xyz = -r0.xyz + LightPosition.xyz;
    r3.y = 0.999;
    r0.xzw = r0.xyz * LightPosition.www;
    r0.y = min(r3.x, r3.y);
    r0.x = dot(r0.wxz, r0.wxz);
    r2 = float4((r2 > r0.yyyy));
    r0.x = saturate(1.0 - r0.x);
    ps = log2(r0.x);
    r0.z = dot(r2.wzxy, float4(0.25, 0.25, 0.25, 0.25));
    r0.y = ps;
    ps = FalloffExponent.x * r0.y;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r2.x = r0.z * r0.z;
    r0.x = ps;
    r0 = r1 * r0.xxxx + 1.0;
    r1 = -r0 + 1.0;
    oC0 = r2.xxxx * r1 + r0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
