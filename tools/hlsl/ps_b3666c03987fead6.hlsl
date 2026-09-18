// ps_b3666c03987fead6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 207 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000033C 10040600 00000106 00000000 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 EdgeSampleOffsets[2] : register(c13); // float4[2]
float4 InvRandomAngleTextureSize : register(c15); // float2
float4 MinZ_MaxZRatio : register(c2); // float4
float4 RefiningSampleOffsets[6] : register(c7); // float4[6]
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToShadowMatrix[4] : register(c3); // float4x4 (matrix_columns)
sampler2D SceneDepthTexture : register(s0);
sampler2D ShadowDepthTexture : register(s1);
sampler2D RandomAngleTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float2 vPos : VPOS;   // r1 (pixel parameters)
    float vFace : VFACE;  // r1
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r2 = 0.0;
    float4 r3 = 0.0;
    float4 r4 = 0.0;
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 oC0 = 0.0;
    bool p0 = false;

    r2.xy = abs(r1.xy) * InvRandomAngleTextureSize.xy;
    r1.z = 1.0 / r0.w;
    r1.xy = r1.zz * ScreenPositionScaleBias.xy;
    r1 = r1.yzzx * r0.yxyx;
    r0.xy = r1.xw + ScreenPositionScaleBias.zw;
    r0.x = tex2D(SceneDepthTexture, r0.yx).x;
    r0.yz = tex2D(RandomAngleTexture, r2.xy).xy;
    r4.xz = r0.yz * 2.0 - 1.0;
    r0.x = r0.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r1.x = 1.0 / r0.x;
    r0 = r1.xxxx * ScreenToShadowMatrix[2] + ScreenToShadowMatrix[3];
    r1.xy = r1.zy * r1.xx;
    r0 = r1.xxxx * ScreenToShadowMatrix[1].xywz + r0.xywz;
    r0 = r1.yyyy * ScreenToShadowMatrix[0] + r0.xywz;
    r4.y = r4.z * (-1.0);
    r1.x = 1.0 / r0.w;
    r0.xy = r0.xy * r1.xx;
    r1.w = dot(r4.xz, EdgeSampleOffsets[1].xy) + r0.x;
    r1.z = dot(r4.yx, EdgeSampleOffsets[1].xy) + r0.y;
    r2.y = dot(r4.xz, EdgeSampleOffsets[1].zw) + r0.x;
    r2.x = dot(r4.yx, EdgeSampleOffsets[1].zw) + r0.y;
    r3 = r4.xyxy * EdgeSampleOffsets[0].xxzz + r0.xyxy;
    r3 = r4.zxxz * EdgeSampleOffsets[0].wwyy + r3.zwyx;
    r1.x = tex2D(ShadowDepthTexture, r3.wz).x;
    r1.y = tex2D(ShadowDepthTexture, r3.xy).x;
    r1.z = tex2D(ShadowDepthTexture, r1.wz).x;
    r1.w = tex2D(ShadowDepthTexture, r2.yx).x;
    r0.w = min(r0.z, 0.999);
    r1 = float4((r1 > r0.wwww));
    r0.z = dot(r1.zwyx, float4(0.25, 0.25, 0.25, 0.25));
    r1.y = float((r0.z > 0.0001));
    r1.x = float((0.9999 > r0.z));
    r1.x = r1.y * r1.x;
    p0 = (r1.x != 0.0);
    if (p0)
    {
        r4 = r0.xyxy + RefiningSampleOffsets[3];
        r1 = r0.xxyy + RefiningSampleOffsets[2].xzwy;
        r5 = r0.xyxy + RefiningSampleOffsets[1];
        r2 = r0.xxyy + RefiningSampleOffsets[0].xzwy;
    }
    if (p0)
    {
        if (p0)
        {
            r6 = r0.xyxy + RefiningSampleOffsets[5];
            r3 = r0.xxyy + RefiningSampleOffsets[4].xzwy;
            r3.x = tex2D(ShadowDepthTexture, r3.xw).x;
            r3.y = tex2D(ShadowDepthTexture, r3.yz).x;
            r3.z = tex2D(ShadowDepthTexture, r6.xy).x;
            r3.w = tex2D(ShadowDepthTexture, r6.zw).x;
        }
    }
    if (p0)
    {
        if (p0)
        {
            r2.x = tex2D(ShadowDepthTexture, r2.xw).x;
            r2.y = tex2D(ShadowDepthTexture, r2.yz).x;
            r2.z = tex2D(ShadowDepthTexture, r5.xy).x;
            r2.w = tex2D(ShadowDepthTexture, r5.zw).x;
            r1.x = tex2D(ShadowDepthTexture, r1.xw).x;
            r1.y = tex2D(ShadowDepthTexture, r1.yz).x;
        }
    }
    if (p0)
    {
        if (p0)
        {
            r1.z = tex2D(ShadowDepthTexture, r4.xy).x;
            r1.w = tex2D(ShadowDepthTexture, r4.zw).x;
            r1 = float4((r1 > r0.wwww));
            r2 = float4((r2 > r0.wwww));
            r3 = float4((r3 > r0.wwww));
            r0.y = dot(r3.wzxy, float4(0.083333336, 0.083333336, 0.083333336, 0.083333336));
        }
    }
    if (p0)
    {
        if (p0)
        {
            r0.w = dot(r2.wzxy, float4(0.083333336, 0.083333336, 0.083333336, 0.083333336));
            r0.x = dot(r1.wzxy, float4(0.083333336, 0.083333336, 0.083333336, 0.083333336));
            r0.x = r0.w + r0.x;
            r0.x = r0.x + r0.y;
            r0.x = r0.x - r0.z;
            r0.z = r0.x * 0.7 + r0.z;
        }
    }
    r0.x = r0.z * r0.z;
    oC0 = r0.xxxx * r0.zzzz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
