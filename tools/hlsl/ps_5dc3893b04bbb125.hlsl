// ps_5dc3893b04bbb125.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 198 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000318 10000A00 00000004 00000000 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 FalloffExponent : register(c9); // float
float4 LightPosition : register(c4); // float4
float4 MinZ_MaxZRatio : register(c2); // float4
float4 SampleOffsets[8] : register(c10); // float4[8]
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToShadowMatrix[4] : register(c18); // float4x4 (matrix_columns)
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
    float4 r4 = 0.0;
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.x = 1.0 / r0.w;
    r1.yz = r1.xx * ScreenPositionScaleBias.xy;
    r0 = r1.xxyz * r0.xyxy;
    r1.xy = r0.zw + ScreenPositionScaleBias.wz;
    r1.x = tex2D(SceneDepthTexture, r1.xy).x;
    r1.x = r1.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r1.w = 1.0 / r1.x;
    r3 = r1.wwww * ScreenToShadowMatrix[2].xywz + ScreenToShadowMatrix[3].xywz;
    r0.xy = r0.xy * r1.ww;
    r2.w = r0.x;
    r0.w = r0.y;
    r3 = r0.wwww * ScreenToShadowMatrix[1].xywz + r3;
    r5 = r2.wwww * ScreenToShadowMatrix[0] + r3.xywz;
    r0.x = min(r5.z, 0.999);
    r0.y = 1.0 / r5.w;
    r7 = r5.yxyx * r0.yyyy + SampleOffsets[2].wzyx;
    r6 = r5.yyxx * r0.yyyy + SampleOffsets[3].wyxz;
    r8 = r5.xyxy * r0.yyyy + SampleOffsets[1];
    r3 = r5.xxyy * r0.yyyy + SampleOffsets[0].xzwy;
    r9 = r5.xyxy * r0.yyyy + SampleOffsets[5];
    r4 = r5.xxyy * r0.yyyy + SampleOffsets[4].xzwy;
    r10 = r5.yxyx * r0.yyyy + SampleOffsets[6].wzyx;
    r5 = r5.yyxx * r0.yyyy + SampleOffsets[7].wyxz;
    r5.x = tex2D(ShadowDepthTexture, r5.wx).x;
    r5.y = tex2D(ShadowDepthTexture, r5.zy).x;
    r5.z = tex2D(ShadowDepthTexture, r10.yx).x;
    r5.w = tex2D(ShadowDepthTexture, r10.wz).x;
    r4.x = tex2D(ShadowDepthTexture, r4.xw).x;
    r4.y = tex2D(ShadowDepthTexture, r4.yz).x;
    r4.z = tex2D(ShadowDepthTexture, r9.xy).x;
    r4.w = tex2D(ShadowDepthTexture, r9.zw).x;
    r3.x = tex2D(ShadowDepthTexture, r3.xw).x;
    r3.y = tex2D(ShadowDepthTexture, r3.yz).x;
    r3.z = tex2D(ShadowDepthTexture, r8.xy).x;
    r3.w = tex2D(ShadowDepthTexture, r8.zw).x;
    r6.x = tex2D(ShadowDepthTexture, r6.wx).x;
    r6.y = tex2D(ShadowDepthTexture, r6.zy).x;
    r6.z = tex2D(ShadowDepthTexture, r7.yx).x;
    r6.w = tex2D(ShadowDepthTexture, r7.wz).x;
    r6 = float4((r6 > r0.xxxx));
    r7 = float4((r3 > r0.xxxx));
    r3.y = ScreenToWorld[2].x * r1.w;
    r4 = float4((r4 > r0.xxxx));
    r3.z = ScreenToWorld[2].z * r1.w;
    r8 = float4((r5 > r0.xxxx));
    r5.y = ScreenToWorld[0].x * r2.w;
    r3.x = dot(r8.xywz, float4(0.0625, 0.0625, 0.0625, 0.0625));
    r5.z = ScreenToWorld[0].z * r2.w;
    r4.x = dot(r4.wzxy, float4(0.0625, 0.0625, 0.0625, 0.0625));
    r5.w = ScreenToWorld[0].y * r2.w;
    ps = ScreenToWorld[1].x * r0.w;
    r0.y = dot(r7.wzxy, float4(0.0625, 0.0625, 0.0625, 0.0625));
    r4.y = ps;
    ps = ScreenToWorld[1].z * r0.w;
    r0.x = dot(r6.xywz, float4(0.0625, 0.0625, 0.0625, 0.0625));
    r4.z = ps;
    ps = ScreenToWorld[1].y * r0.w;
    r5.x = r0.y + r0.x;
    r4.w = ps;
    ps = ScreenToWorld[2].y * r1.w;
    r0 = r5.xywz + r4.xywz;
    r3.w = ps;
    r0 = r0.ywxz + r3.yzxw;
    r1.xyz = r0.xwy + ScreenToWorld[3].xyz;
    r1.xyz = -r1.xyz + LightPosition.xyz;
    r1.xyz = r1.xyz * LightPosition.www;
    r0.x = dot(r1.zxy, r1.zxy);
    ps = 1.0 - r0.x;
    r2.x = saturate(ps);
    ps = log2(r2.x);
    r1 = ShadowModulateColor - 1.0;
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
