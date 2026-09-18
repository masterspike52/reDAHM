// ps_7b05d572d797e14c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 78 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000138 10000200 00000004 00000000 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 FalloffExponent : register(c9); // float
float4 LightPosition : register(c4); // float4
float4 MinZ_MaxZRatio : register(c2); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToWorld[4] : register(c5); // float4x4 (matrix_columns)
float4 ShadowModulateColor : register(c3); // float4
float4 SpotAngles : register(c11); // float2
float4 SpotDirection : register(c10); // float3
sampler2D SceneDepthTexture : register(s0);

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
    r0 = r1.yxxz * r0.xxyy;
    r1.xy = r0.xw + ScreenPositionScaleBias.wz;
    r1.x = tex2D(SceneDepthTexture, r1.xy).x;
    r2.x = r1.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r1 = ShadowModulateColor - 1.0;
    r0.x = 1.0 / r2.x;
    r2.xyz = r0.xxx * ScreenToWorld[2].xyz + ScreenToWorld[3].xyz;
    r0.xw = r0.zy * r0.xx;
    r0.xyz = r0.xxx * ScreenToWorld[1].xzy + r2.xzy;
    r0.xyz = r0.www * ScreenToWorld[0].xyz + r0.xzy;
    r0.xyz = -r0.xyz + LightPosition.xyz;
    r2.xyz = r0.xyz * LightPosition.www;
    r0.x = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r0.x));
    r0.y = saturate(-r0.x + 1.0);
    r0.x = ps;
    ps = log2(r0.y);
    r0.xzw = r2.xyz * r0.xxx;
    r0.y = ps;
    r0.x = dot(r0.wxz, -SpotDirection.zxy);
    ps = FalloffExponent.x * r0.y;
    r0.x = r0.x - SpotAngles.x;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r0.x = saturate(r0.x * SpotAngles.y);
    r0.y = ps;
    r0.y = r0.x * r0.y;
    r0.x = r0.y * r0.x;
    oC0 = r0.xxxx * r1 + 1.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
