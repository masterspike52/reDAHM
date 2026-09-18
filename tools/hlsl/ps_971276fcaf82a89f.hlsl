// ps_971276fcaf82a89f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 78 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000138 10000200 00000004 00000000 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 MinZ_MaxZRatio : register(c2); // float4
float4 SampleOffsets[2] : register(c4); // float4[2]
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToShadowMatrix[4] : register(c6); // float4x4 (matrix_columns)
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
    r2 = r0.zwzw * r0.yyyy + SampleOffsets[1];
    r1 = r0.zzww * r0.yyyy + SampleOffsets[0].xzwy;
    r1.x = tex2D(ShadowDepthTexture, r1.xw).x;
    r1.y = tex2D(ShadowDepthTexture, r1.yz).x;
    r1.z = tex2D(ShadowDepthTexture, r2.xy).x;
    r1.w = tex2D(ShadowDepthTexture, r2.zw).x;
    r0 = float4((r1 > r0.xxxx));
    r1.x = dot(r0.wzxy, float4(0.25, 0.25, 0.25, 0.25));
    ps = r1.x * r1.x;
    r0 = -ShadowModulateColor + 1.0;
    r1.x = ps;
    oC0 = r1.xxxx * r0 + ShadowModulateColor;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
