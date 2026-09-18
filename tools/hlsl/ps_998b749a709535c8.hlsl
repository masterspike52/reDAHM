// ps_998b749a709535c8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 162 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000288 10000800 00000004 00000000 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 MinZ_MaxZRatio : register(c2); // float4
float4 SampleOffsets[8] : register(c3); // float4[8]
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToShadowMatrix[4] : register(c11); // float4x4 (matrix_columns)
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.x = 1.0 / r0.w;
    r1.yz = r1.xx * ScreenPositionScaleBias.xy;
    r1 = r1.yxxz * r0.xxyy;
    r0.xy = r1.xw + ScreenPositionScaleBias.wz;
    r0.x = tex2D(SceneDepthTexture, r0.xy).x;
    r0.x = r0.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r1.x = 1.0 / r0.x;
    r0 = r1.xxxx * ScreenToShadowMatrix[2].xywz + ScreenToShadowMatrix[3].xywz;
    r1.xy = r1.yz * r1.xx;
    r0 = r1.yyyy * ScreenToShadowMatrix[1].xywz + r0;
    r0 = r1.xxxx * ScreenToShadowMatrix[0].zwxy + r0.wzxy;
    ps = 1.0 / r0.y;
    r0.x = min(r0.x, 0.999);
    r0.y = ps;
    r5 = r0.wzwz * r0.yyyy + SampleOffsets[2].wzyx;
    r1 = r0.wwzz * r0.yyyy + SampleOffsets[3].wyxz;
    r6 = r0.zwzw * r0.yyyy + SampleOffsets[1];
    r2 = r0.zzww * r0.yyyy + SampleOffsets[0].xzwy;
    r7 = r0.zwzw * r0.yyyy + SampleOffsets[5];
    r3 = r0.zzww * r0.yyyy + SampleOffsets[4].xzwy;
    r8 = r0.wzwz * r0.yyyy + SampleOffsets[6].wzyx;
    r4 = r0.wwzz * r0.yyyy + SampleOffsets[7].wyxz;
    r4.x = tex2D(ShadowDepthTexture, r4.wx).x;
    r4.y = tex2D(ShadowDepthTexture, r4.zy).x;
    r4.z = tex2D(ShadowDepthTexture, r8.yx).x;
    r4.w = tex2D(ShadowDepthTexture, r8.wz).x;
    r3.x = tex2D(ShadowDepthTexture, r3.xw).x;
    r3.y = tex2D(ShadowDepthTexture, r3.yz).x;
    r3.z = tex2D(ShadowDepthTexture, r7.xy).x;
    r3.w = tex2D(ShadowDepthTexture, r7.zw).x;
    r2.x = tex2D(ShadowDepthTexture, r2.xw).x;
    r2.y = tex2D(ShadowDepthTexture, r2.yz).x;
    r2.z = tex2D(ShadowDepthTexture, r6.xy).x;
    r2.w = tex2D(ShadowDepthTexture, r6.zw).x;
    r1.x = tex2D(ShadowDepthTexture, r1.wx).x;
    r1.y = tex2D(ShadowDepthTexture, r1.zy).x;
    r1.z = tex2D(ShadowDepthTexture, r5.yx).x;
    r1.w = tex2D(ShadowDepthTexture, r5.wz).x;
    r1 = float4((r1 > r0.xxxx));
    r2 = float4((r2 > r0.xxxx));
    r3 = float4((r3 > r0.xxxx));
    r0 = float4((r4 > r0.xxxx));
    r0.x = dot(r0.xywz, float4(0.0625, 0.0625, 0.0625, 0.0625));
    r0.z = dot(r3.wzxy, float4(0.0625, 0.0625, 0.0625, 0.0625));
    r0.w = dot(r2.wzxy, float4(0.0625, 0.0625, 0.0625, 0.0625));
    r0.y = dot(r1.xywz, float4(0.0625, 0.0625, 0.0625, 0.0625));
    r0.y = r0.w + r0.y;
    r0.y = r0.y + r0.z;
    r0.x = r0.y + r0.x;
    oC0 = r0.xxxx * r0.xxxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
