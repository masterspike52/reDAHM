// ps_65051becbeefb36a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 258 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000408 10040900 00000106 00000001 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000001 00000000
// Non-float definitions (raw): 00000000 239C0001 00000006 00000000

#include "xenos_common.hlsli"

float4 EdgeSampleOffsets[4] : register(c19); // float4[4]
float4 FalloffExponent : register(c30); // float
float4 InvRandomAngleTextureSize : register(c23); // float2
float4 LightPosition : register(c25); // float4
float4 MinZ_MaxZRatio : register(c2); // float4
float4 RefiningSampleOffsets[12] : register(c7); // float4[12]
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToShadowMatrix[4] : register(c3); // float4x4 (matrix_columns)
float4 ScreenToWorld[4] : register(c26); // float4x4 (matrix_columns)
float4 ShadowModulateColor : register(c24); // float4
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
    r1.xy = abs(r1.xy) * InvRandomAngleTextureSize.xy;
    r2.z = ps;
    r2.xy = r2.zz * ScreenPositionScaleBias.xy;
    r2 = r2.yxzz * r0.yxxy;
    r0.zw = r2.xy + ScreenPositionScaleBias.zw;
    r0.xy = tex2D(RandomAngleTexture, r1.xy).xy;
    r0.z = tex2D(SceneDepthTexture, r0.wz).x;
    r0.w = r0.z * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r1.xy = r0.yx * 2.0 - 1.0;
    ps = 1.0 / r0.w;
    r0.xyz = r1.xyx * float3(1.0, 1.0, -1.0);
    r1.w = ps;
    r3 = r1.wwww * ScreenToShadowMatrix[2] + ScreenToShadowMatrix[3];
    ps = EdgeSampleOffsets[1].x * r0.y;
    r2.xy = r2.wz * r1.ww;
    r8.x = ps;
    r3 = r2.xxxx * ScreenToShadowMatrix[1].xywz + r3.xywz;
    r3 = r2.yyyy * ScreenToShadowMatrix[0] + r3.xywz;
    r5.xyz = (float3(0.0, 1.0, 1.0) == 0.0) ? r3.yyy : EdgeSampleOffsets[1].wwz;
    r6.xyz = (float3(0.0, 1.0, 1.0) == 0.0) ? r3.yyy : EdgeSampleOffsets[2].wwz;
    r7.xyz = (float3(0.0, 1.0, 1.0) == 0.0) ? r3.yyy : EdgeSampleOffsets[3].wwz;
    ps = 1.0 / r3.w;
    r9 = r0.yzyx * EdgeSampleOffsets[3].xxzy;
    r0.w = ps;
    ps = r3.x;
    r4 = r0.yzyx * EdgeSampleOffsets[2].xxzy;
    ps = r0.w * ps;
    r7.y = dot(r0.yzw, r7.yzx);
    r2.z = ps;
    ps = r3.y;
    r6.y = dot(r0.yzw, r6.yzx);
    ps = r0.w * ps;
    r5.y = dot(r0.yzw, r5.yzx);
    r2.w = ps;
    ps = EdgeSampleOffsets[1].x * r0.z;
    r4.xyz = r4.xyz + r2.zwz;
    r8.y = ps;
    ps = EdgeSampleOffsets[1].z * r0.y;
    r5.xzw = r9.xyz + r2.zwz;
    r8.z = ps;
    ps = (-1.0) * r1.x;
    r0.z = min(r3.z, 0.999);
    r1.z = ps;
    r3 = r1.yzyz * EdgeSampleOffsets[0].xxzz + r2.zwzw;
    r3 = r1.xyyx * EdgeSampleOffsets[0].wwyy + r3.zwyx;
    ps = EdgeSampleOffsets[1].y * r0.x;
    r7.z = r5.x + r9.w;
    r8.w = ps;
    r7.xw = r0.xy * EdgeSampleOffsets[3].wy + r5.wz;
    ps = r4.x;
    r1.xyz = r8.xyz + r2.zwz;
    r6.xw = r0.xy * EdgeSampleOffsets[2].wy + r4.zy;
    ps = r4.w + ps;
    r5.z = r1.x + r8.w;
    r6.z = ps;
    r5.xw = r0.xy * EdgeSampleOffsets[1].wy + r1.zy;
    r4.x = tex2D(ShadowDepthTexture, r3.wz).x;
    r4.y = tex2D(ShadowDepthTexture, r7.xy).x;
    r4.z = tex2D(ShadowDepthTexture, r7.zw).x;
    r4.w = tex2D(ShadowDepthTexture, r6.xy).x;
    r3.x = tex2D(ShadowDepthTexture, r3.xy).x;
    r3.y = tex2D(ShadowDepthTexture, r6.zw).x;
    r3.z = tex2D(ShadowDepthTexture, r5.xy).x;
    r3.w = tex2D(ShadowDepthTexture, r5.zw).x;
    r3 = float4((r3 > r0.zzzz));
    r4 = float4((r4 > r0.zzzz));
    r0.y = dot(r4.zywx, float4(0.125, 0.125, 0.125, 0.125));
    r0.x = dot(r3.ywzx, float4(0.125, 0.125, 0.125, 0.125));
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
    for (int xe_iter0 = 0, aL = 0; xe_iter0 < 6; xe_iter0++, aL += 0)
    {
        if (p0)
        {
            if (p0)
            {
                ps = r0.x + r0.x;
                r1.x = ps;
                a0 = xe_mova(r1.x);
                ps = r1.x;
                r4 = r2.zwzw + RefiningSampleOffsets[a0 + 1];
                r3 = r2.zzww + RefiningSampleOffsets[a0].xzwy;
                r3.x = tex2D(ShadowDepthTexture, r3.xw).x;
                r3.y = tex2D(ShadowDepthTexture, r3.yz).x;
            }
        }
        if (p0)
        {
            if (p0)
            {
                r3.z = tex2D(ShadowDepthTexture, r4.xy).x;
                r3.w = tex2D(ShadowDepthTexture, r4.zw).x;
                r3 = float4((r3 > r0.zzzz));
                r1.x = dot(r3.wzxy, float4(0.041666668, 0.041666668, 0.041666668, 0.041666668));
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
    r0.xyz = r1.www * ScreenToWorld[2].xyz + ScreenToWorld[3].xyz;
    r0.xyz = r2.xxx * ScreenToWorld[1].xzy + r0.xzy;
    r0.xyz = r2.yyy * ScreenToWorld[0].xyz + r0.xzy;
    r0.xyz = -r0.xyz + LightPosition.xyz;
    r0.xyz = r0.xyz * LightPosition.www;
    r0.x = dot(r0.zxy, r0.zxy);
    ps = 1.0 - r0.x;
    r0.x = saturate(ps);
    ps = log2(r0.x);
    r1 = ShadowModulateColor - 1.0;
    r0.x = ps;
    ps = r0.w * r0.w;
    r0.x = r0.x * FalloffExponent.x;
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r2.x = r0.y * r0.w;
    r0.x = ps;
    r0 = r1 * r0.xxxx + 1.0;
    r1 = -r0 + 1.0;
    oC0 = r2.xxxx * r1 + r0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
