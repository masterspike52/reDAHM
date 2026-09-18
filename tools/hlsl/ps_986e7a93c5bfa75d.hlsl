// ps_986e7a93c5bfa75d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10000400 00000004 00000000 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 FalloffExponent : register(c9); // float
float4 LightPosition : register(c4); // float4
float4 MinZ_MaxZRatio : register(c2); // float4
float4 SampleOffsets[2] : register(c12); // float4[2]
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToShadowMatrix[4] : register(c14); // float4x4 (matrix_columns)
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1 = ShadowModulateColor - 1.0;
    r2.x = 1.0 / r0.w;
    r2.yz = r2.xx * ScreenPositionScaleBias.xy;
    r2 = r2.xyxz * r0.xxyy;
    r0.xy = r2.yw + ScreenPositionScaleBias.wz;
    r0.x = tex2D(SceneDepthTexture, r0.xy).x;
    r0.x = r0.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r2.y = 1.0 / r0.x;
    r0 = r2.yyyy * ScreenToShadowMatrix[2].xywz + ScreenToShadowMatrix[3].xywz;
    r2.xw = r2.zx * r2.yy;
    r0 = r2.xxxx * ScreenToShadowMatrix[1].xywz + r0;
    r0 = r2.wwww * ScreenToShadowMatrix[0].xywz + r0;
    r2.z = 1.0 / r0.z;
    r4 = r0.xyxy * r2.zzzz + SampleOffsets[1];
    r3 = r0.xxyy * r2.zzzz + SampleOffsets[0].xzwy;
    r3.x = tex2D(ShadowDepthTexture, r3.xw).x;
    r3.y = tex2D(ShadowDepthTexture, r3.yz).x;
    r3.z = tex2D(ShadowDepthTexture, r4.xy).x;
    r3.w = tex2D(ShadowDepthTexture, r4.zw).x;
    r4.xyz = r2.yyy * ScreenToWorld[2].xyz + ScreenToWorld[3].xyz;
    r2.xyz = r2.xxx * ScreenToWorld[1].xzy + r4.xzy;
    r2.xyz = r2.www * ScreenToWorld[0].xyz + r2.xzy;
    r0.xyz = -r2.xyz + LightPosition.xyz;
    ps = LightPosition.w * r0.x;
    r0.w = min(r0.w, 0.999);
    r2.x = ps;
    ps = LightPosition.w * r0.y;
    r3 = float4((r3 > r0.wwww));
    r2.z = ps;
    ps = LightPosition.w * r0.z;
    r2.y = dot(r3.wzxy, float4(0.25, 0.25, 0.25, 0.25));
    r2.w = ps;
    r0.x = dot(r2.wxz, r2.wxz);
    ps = rsqrt(abs(r0.x));
    r0.y = saturate(-r0.x + 1.0);
    r0.x = ps;
    ps = log2(r0.y);
    r0.xzw = r2.xzw * r0.xxx;
    r0.y = ps;
    r0.x = dot(r0.wxz, -SpotDirection.zxy);
    ps = FalloffExponent.x * r0.y;
    r0.z = r0.x - SpotAngles.x;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r2.z = saturate(r0.z * SpotAngles.y);
    r0.x = ps;
    r2.x = r2.z * r0.x;
    r2.xy = r2.xy * r2.zy;
    r0 = r2.xxxx * r1 + 1.0;
    r1 = -r0 + 1.0;
    oC0 = r2.yyyy * r1 + r0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
