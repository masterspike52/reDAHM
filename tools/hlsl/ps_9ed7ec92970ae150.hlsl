// ps_9ed7ec92970ae150.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 207 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000033C 10000B00 00000004 00000000 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 FalloffExponent : register(c9); // float
float4 LightPosition : register(c4); // float4
float4 MinZ_MaxZRatio : register(c2); // float4
float4 SampleOffsets[8] : register(c12); // float4[8]
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToShadowMatrix[4] : register(c20); // float4x4 (matrix_columns)
float4 ScreenToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ShadowModulateColor : register(c3); // float4
float4 SpotAngles : register(c11); // float2
float4 SpotDirection : register(c10); // float3
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
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3 = ShadowModulateColor - 1.0;
    r1.x = 1.0 / r0.w;
    r1.yz = r1.xx * ScreenPositionScaleBias.xy;
    r0 = r1.xxzy * r0.xyyx;
    r1.xy = r0.wz + ScreenPositionScaleBias.wz;
    r1.x = tex2D(SceneDepthTexture, r1.xy).x;
    r1.x = r1.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r0.w = 1.0 / r1.x;
    r4 = r0.wwww * ScreenToShadowMatrix[2].xywz + ScreenToShadowMatrix[3].xywz;
    r0.xy = r0.xy * r0.ww;
    r2.w = r0.x;
    r1.w = r0.y;
    r4 = r1.wwww * ScreenToShadowMatrix[1].xywz + r4;
    r9 = r2.wwww * ScreenToShadowMatrix[0] + r4.xywz;
    r0.x = min(r9.z, 0.999);
    r0.y = 1.0 / r9.w;
    r6 = r9.yxyx * r0.yyyy + SampleOffsets[2].wzyx;
    r4 = r9.yyxx * r0.yyyy + SampleOffsets[3].wyxz;
    r8 = r9.xyxy * r0.yyyy + SampleOffsets[1];
    r7 = r9.xxyy * r0.yyyy + SampleOffsets[0].xzwy;
    r10 = r9.xyxy * r0.yyyy + SampleOffsets[5];
    r5 = r9.xxyy * r0.yyyy + SampleOffsets[4].xzwy;
    r11 = r9.yxyx * r0.yyyy + SampleOffsets[6].wzyx;
    r9 = r9.yyxx * r0.yyyy + SampleOffsets[7].wyxz;
    r9.x = tex2D(ShadowDepthTexture, r9.wx).x;
    r9.y = tex2D(ShadowDepthTexture, r9.zy).x;
    r9.z = tex2D(ShadowDepthTexture, r11.yx).x;
    r9.w = tex2D(ShadowDepthTexture, r11.wz).x;
    r5.x = tex2D(ShadowDepthTexture, r5.xw).x;
    r5.y = tex2D(ShadowDepthTexture, r5.yz).x;
    r5.z = tex2D(ShadowDepthTexture, r10.xy).x;
    r5.w = tex2D(ShadowDepthTexture, r10.zw).x;
    r7.x = tex2D(ShadowDepthTexture, r7.xw).x;
    r7.y = tex2D(ShadowDepthTexture, r7.yz).x;
    r7.z = tex2D(ShadowDepthTexture, r8.xy).x;
    r7.w = tex2D(ShadowDepthTexture, r8.zw).x;
    r4.x = tex2D(ShadowDepthTexture, r4.wx).x;
    r4.y = tex2D(ShadowDepthTexture, r4.zy).x;
    r4.z = tex2D(ShadowDepthTexture, r6.yx).x;
    r4.w = tex2D(ShadowDepthTexture, r6.wz).x;
    r6 = float4((r4 > r0.xxxx));
    r4.y = ScreenToWorld[2].x * r0.w;
    r7 = float4((r7 > r0.xxxx));
    r4.z = ScreenToWorld[2].z * r0.w;
    r8 = float4((r5 > r0.xxxx));
    r5.y = ScreenToWorld[0].x * r2.w;
    r9 = float4((r9 > r0.xxxx));
    r5.z = ScreenToWorld[0].z * r2.w;
    r1.x = dot(r9.xywz, float4(0.0625, 0.0625, 0.0625, 0.0625));
    r5.w = ScreenToWorld[0].y * r2.w;
    r4.x = dot(r8.wzxy, float4(0.0625, 0.0625, 0.0625, 0.0625));
    r2.y = ScreenToWorld[1].x * r1.w;
    r5.x = dot(r7.wzxy, float4(0.0625, 0.0625, 0.0625, 0.0625));
    r2.z = ScreenToWorld[1].z * r1.w;
    r2.x = dot(r6.xywz, float4(0.0625, 0.0625, 0.0625, 0.0625));
    r2.w = ScreenToWorld[1].y * r1.w;
    r2 = r5.xywz + r2.xywz;
    r4.w = ScreenToWorld[2].y * r0.w;
    r0 = r2.ywxz + r4.yzxw;
    r0.z = r0.z + r1.x;
    r0.xyw = r0.xwy + ScreenToWorld[3].xyz;
    r0.xyw = -r0.xyw + LightPosition.xyz;
    r1.xyz = r0.xyw * LightPosition.www;
    r0.y = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.y));
    r0.x = saturate(-r0.y + 1.0);
    r0.y = ps;
    ps = log2(r0.x);
    r1.xyz = r1.xyz * r0.yyy;
    r0.y = ps;
    r0.x = dot(r1.zxy, -SpotDirection.zxy);
    ps = FalloffExponent.x * r0.y;
    r0.w = r0.x - SpotAngles.x;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r0.w = saturate(r0.w * SpotAngles.y);
    r0.x = ps;
    r0.x = r0.w * r0.x;
    r2.xy = r0.xz * r0.wz;
    r0 = r2.xxxx * r3 + 1.0;
    r1 = -r0 + 1.0;
    oC0 = r2.yyyy * r1 + r0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
