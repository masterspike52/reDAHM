// ps_0aecae1648ff7390.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 255 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003FC 10040700 00000106 00000000 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 EdgeSampleOffsets[2] : register(c13); // float4[2]
float4 FalloffExponent : register(c22); // float
float4 InvRandomAngleTextureSize : register(c15); // float2
float4 LightPosition : register(c17); // float4
float4 MinZ_MaxZRatio : register(c2); // float4
float4 RefiningSampleOffsets[6] : register(c7); // float4[6]
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToShadowMatrix[4] : register(c3); // float4x4 (matrix_columns)
float4 ScreenToWorld[4] : register(c18); // float4x4 (matrix_columns)
float4 ShadowModulateColor : register(c16); // float4
float4 SpotAngles : register(c24); // float2
float4 SpotDirection : register(c23); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;
    bool p0 = false;

    ps = 1.0 / r0.w;
    r1.yz = abs(r1.xy) * InvRandomAngleTextureSize.xy;
    r2.z = ps;
    r2.xy = r2.zz * ScreenPositionScaleBias.xy;
    r0 = r2.zyzx * r0.xyyx;
    r1.xw = r0.yw + ScreenPositionScaleBias.zw;
    r1.x = tex2D(SceneDepthTexture, r1.wx).x;
    r1.yz = tex2D(RandomAngleTexture, r1.yz).xy;
    r5.xz = r1.yz * 2.0 - 1.0;
    r1.x = r1.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r1.x;
    r0.y = ps;
    r2 = r0.yyyy * ScreenToShadowMatrix[2] + ScreenToShadowMatrix[3];
    r1.yz = r0.zx * r0.yy;
    r2 = r1.yyyy * ScreenToShadowMatrix[1].xywz + r2.xywz;
    r3 = r1.zzzz * ScreenToShadowMatrix[0] + r2.xywz;
    ps = 1.0 / r3.w;
    r5.y = r5.z * (-1.0);
    r0.x = ps;
    r0.zw = r3.xy * r0.xx;
    r2.w = dot(r5.xz, EdgeSampleOffsets[1].xy) + r0.z;
    r2.z = dot(r5.yx, EdgeSampleOffsets[1].xy) + r0.w;
    r1.w = dot(r5.xz, EdgeSampleOffsets[1].zw) + r0.z;
    r1.x = dot(r5.yx, EdgeSampleOffsets[1].zw) + r0.w;
    r4 = r5.xyxy * EdgeSampleOffsets[0].xxzz + r0.zwzw;
    r4 = r5.zxxz * EdgeSampleOffsets[0].wwyy + r4.zwyx;
    r2.x = tex2D(ShadowDepthTexture, r4.wz).x;
    r2.y = tex2D(ShadowDepthTexture, r4.xy).x;
    r2.z = tex2D(ShadowDepthTexture, r2.wz).x;
    r2.w = tex2D(ShadowDepthTexture, r1.wx).x;
    r0.x = min(r3.z, 0.999);
    r2 = float4((r2 > r0.xxxx));
    r1.x = dot(r2.zwyx, float4(0.25, 0.25, 0.25, 0.25));
    r2.x = float((r1.x > 0.0001));
    r1.w = float((0.9999 > r1.x));
    r1.w = r2.x * r1.w;
    p0 = (r1.w != 0.0);
    ps = p0 ? 0.0 : 1.0;
    if (p0)
    {
        r5 = r0.zwzw + RefiningSampleOffsets[3];
        r2 = r0.zzww + RefiningSampleOffsets[2].xzwy;
        r6 = r0.zwzw + RefiningSampleOffsets[1];
        r3 = r0.zzww + RefiningSampleOffsets[0].xzwy;
    }
    if (p0)
    {
        if (p0)
        {
            r7 = r0.zwzw + RefiningSampleOffsets[5];
            r4 = r0.zzww + RefiningSampleOffsets[4].xzwy;
            r4.x = tex2D(ShadowDepthTexture, r4.xw).x;
            r4.y = tex2D(ShadowDepthTexture, r4.yz).x;
            r4.z = tex2D(ShadowDepthTexture, r7.xy).x;
            r4.w = tex2D(ShadowDepthTexture, r7.zw).x;
        }
    }
    if (p0)
    {
        if (p0)
        {
            r3.x = tex2D(ShadowDepthTexture, r3.xw).x;
            r3.y = tex2D(ShadowDepthTexture, r3.yz).x;
            r3.z = tex2D(ShadowDepthTexture, r6.xy).x;
            r3.w = tex2D(ShadowDepthTexture, r6.zw).x;
            r2.x = tex2D(ShadowDepthTexture, r2.xw).x;
            r2.y = tex2D(ShadowDepthTexture, r2.yz).x;
        }
    }
    if (p0)
    {
        if (p0)
        {
            r2.z = tex2D(ShadowDepthTexture, r5.xy).x;
            r2.w = tex2D(ShadowDepthTexture, r5.zw).x;
            r2 = float4((r2 > r0.xxxx));
            r3 = float4((r3 > r0.xxxx));
            r4 = float4((r4 > r0.xxxx));
            r0.z = dot(r4.wzxy, float4(0.083333336, 0.083333336, 0.083333336, 0.083333336));
        }
    }
    if (p0)
    {
        if (p0)
        {
            r0.w = dot(r3.wzxy, float4(0.083333336, 0.083333336, 0.083333336, 0.083333336));
            r0.x = dot(r2.wzxy, float4(0.083333336, 0.083333336, 0.083333336, 0.083333336));
            r0.x = r0.w + r0.x;
            r0.x = r0.x + r0.z;
            r0.x = r0.x - r1.x;
            r1.x = r0.x * 0.7 + r1.x;
        }
    }
    r2 = ShadowModulateColor - 1.0;
    r0.xyz = r0.yyy * ScreenToWorld[2].xyz + ScreenToWorld[3].xyz;
    r0.xyz = r1.yyy * ScreenToWorld[1].xzy + r0.xzy;
    r0.xyz = r1.zzz * ScreenToWorld[0].xyz + r0.xzy;
    r0.xyz = -r0.xyz + LightPosition.xyz;
    r1.yzw = r0.xyz * LightPosition.www;
    r0.x = dot(r1.wyz, r1.wyz);
    ps = rsqrt(abs(r0.x));
    r0.y = saturate(-r0.x + 1.0);
    r0.x = ps;
    ps = log2(r0.y);
    r0.xzw = r1.yzw * r0.xxx;
    r0.y = ps;
    r0.x = dot(r0.wxz, -SpotDirection.zxy);
    ps = FalloffExponent.x * r0.y;
    r0.x = r0.x - SpotAngles.x;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r0.x = saturate(r0.x * SpotAngles.y);
    r0.y = ps;
    ps = r1.x * r1.x;
    r0.z = r0.x * r0.y;
    r0.y = ps;
    ps = r0.y;
    r0.x = r0.z * r0.x;
    r0 = r0.xxxx * r2 + 1.0;
    ps = r1.x * ps;
    r2 = -r0 + 1.0;
    r1.x = ps;
    oC0 = r1.xxxx * r2 + r0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
