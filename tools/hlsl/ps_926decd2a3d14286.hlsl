// ps_926decd2a3d14286.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 225 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000384 10040900 00000106 00000001 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000001 00000000
// Non-float definitions (raw): 00000000 239C0001 00000008 00000000

#include "xenos_common.hlsli"

float4 EdgeSampleOffsets[4] : register(c23); // float4[4]
float4 InvRandomAngleTextureSize : register(c27); // float2
float4 MinZ_MaxZRatio : register(c2); // float4
float4 RefiningSampleOffsets[16] : register(c7); // float4[16]
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToShadowMatrix[4] : register(c3); // float4x4 (matrix_columns)
float4 ShadowModulateColor : register(c28); // float4
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
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;
    int a0 = 0;
    int aL = 0;

    ps = 1.0 / r0.w;
    r2.xy = abs(r1.xy) * InvRandomAngleTextureSize.xy;
    r1.z = ps;
    r1.xy = r1.zz * ScreenPositionScaleBias.xy;
    r1 = r1.yxzz * r0.yxxy;
    r0.zw = r1.xy + ScreenPositionScaleBias.zw;
    r0.xy = tex2D(RandomAngleTexture, r2.xy).xy;
    r0.z = tex2D(SceneDepthTexture, r0.wz).x;
    r0.w = r0.z * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r1.xy = r0.yx * 2.0 - 1.0;
    ps = 1.0 / r0.w;
    r0.xyz = r1.xyx * float3(1.0, 1.0, -1.0);
    r0.w = ps;
    r2 = r0.wwww * ScreenToShadowMatrix[2] + ScreenToShadowMatrix[3];
    ps = EdgeSampleOffsets[1].x * r0.y;
    r1.zw = r1.wz * r0.ww;
    r7.x = ps;
    r2 = r1.zzzz * ScreenToShadowMatrix[1].xywz + r2.xywz;
    r2 = r1.wwww * ScreenToShadowMatrix[0] + r2.xywz;
    r4.xyz = (float3(0.0, 1.0, 1.0) == 0.0) ? r2.yyy : EdgeSampleOffsets[1].wwz;
    r5.xyz = (float3(0.0, 1.0, 1.0) == 0.0) ? r2.yyy : EdgeSampleOffsets[2].wwz;
    r6.xyz = (float3(0.0, 1.0, 1.0) == 0.0) ? r2.yyy : EdgeSampleOffsets[3].wwz;
    ps = 1.0 / r2.w;
    r8 = r0.yzyx * EdgeSampleOffsets[3].xxzy;
    r0.w = ps;
    ps = r2.x;
    r3 = r0.yzyx * EdgeSampleOffsets[2].xxzy;
    ps = r0.w * ps;
    r6.y = dot(r0.yzw, r6.yzx);
    r2.x = ps;
    ps = r2.y;
    r5.y = dot(r0.yzw, r5.yzx);
    ps = r0.w * ps;
    r4.y = dot(r0.yzw, r4.yzx);
    r2.y = ps;
    ps = EdgeSampleOffsets[1].x * r0.z;
    r4.xzw = r3.xyz + r2.xyx;
    r7.y = ps;
    ps = EdgeSampleOffsets[1].z * r0.y;
    r3.xyz = r8.xyz + r2.xyx;
    r7.z = ps;
    ps = (-1.0) * r1.x;
    r0.z = min(r2.z, 0.999);
    r1.z = ps;
    r9 = r1.yzyz * EdgeSampleOffsets[0].xxzz + r2.xyxy;
    r1 = r1.xyyx * EdgeSampleOffsets[0].wwyy + r9.zwyx;
    ps = EdgeSampleOffsets[1].y * r0.x;
    r6.z = r3.x + r8.w;
    r7.w = ps;
    r6.xw = r0.xy * EdgeSampleOffsets[3].wy + r3.zy;
    ps = r4.x;
    r3.xyz = r7.xyz + r2.xyx;
    r5.xw = r0.xy * EdgeSampleOffsets[2].wy + r4.wz;
    ps = r3.w + ps;
    r4.z = r3.x + r7.w;
    r5.z = ps;
    r4.xw = r0.xy * EdgeSampleOffsets[1].wy + r3.zy;
    r3.x = tex2D(ShadowDepthTexture, r1.wz).x;
    r3.y = tex2D(ShadowDepthTexture, r6.xy).x;
    r3.z = tex2D(ShadowDepthTexture, r6.zw).x;
    r3.w = tex2D(ShadowDepthTexture, r5.xy).x;
    r1.x = tex2D(ShadowDepthTexture, r1.xy).x;
    r1.y = tex2D(ShadowDepthTexture, r5.zw).x;
    r1.z = tex2D(ShadowDepthTexture, r4.xy).x;
    r1.w = tex2D(ShadowDepthTexture, r4.zw).x;
    r1 = float4((r1 > r0.zzzz));
    r3 = float4((r3 > r0.zzzz));
    r0.y = dot(r3.zywx, float4(0.125, 0.125, 0.125, 0.125));
    r0.x = dot(r1.ywzx, float4(0.125, 0.125, 0.125, 0.125));
    r0.w = r0.y + r0.x;
    r0.y = float((r0.w > 0.0001));
    r0.x = float((0.9999 > r0.w));
    r0.x = r0.y * r0.x;
    p0 = (r0.x != 0.0);
    ps = p0 ? 0.0 : 1.0;
    if (p0)
    {
        r0.xy = float2((-abs(r0.xx) > 0.0));
    }
    for (int xe_iter0 = 0, aL = 0; xe_iter0 < 8; xe_iter0++, aL += 0)
    {
        if (p0)
        {
            if (p0)
            {
                ps = r0.x + r0.x;
                r1.x = ps;
                a0 = xe_mova(r1.x);
                ps = r1.x;
                r3 = r2.xyxy + RefiningSampleOffsets[a0 + 1];
                r1 = r2.xxyy + RefiningSampleOffsets[a0].xzwy;
                r1.x = tex2D(ShadowDepthTexture, r1.xw).x;
                r1.y = tex2D(ShadowDepthTexture, r1.yz).x;
            }
        }
        if (p0)
        {
            if (p0)
            {
                r1.z = tex2D(ShadowDepthTexture, r3.xy).x;
                r1.w = tex2D(ShadowDepthTexture, r3.zw).x;
                r1 = float4((r1 > r0.zzzz));
                r1.x = dot(r1.wzxy, float4(0.03125, 0.03125, 0.03125, 0.03125));
                ps = 1.0 + r0.x;
                r0.y = r1.x + r0.y;
                r0.x = ps;
            }
        }
        if (!p0) break;
    }
    if (p0)
    {
        if (p0)
        {
            r0.x = r0.y - r0.w;
            r0.w = r0.x * 0.7 + r0.w;
        }
    }
    ps = r0.w * r0.w;
    r1 = -ShadowModulateColor + 1.0;
    r0.x = ps;
    r0.x = r0.x * r0.w;
    oC0 = r0.xxxx * r1 + ShadowModulateColor;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
