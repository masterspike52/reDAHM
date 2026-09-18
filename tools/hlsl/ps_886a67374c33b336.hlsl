// ps_886a67374c33b336.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 90 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000168 10000100 00000004 00000000 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 MinZ_MaxZRatio : register(c2); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 ScreenToShadowMatrix[4] : register(c4); // float4x4 (matrix_columns)
float4 ShadowModulateColor : register(c3); // float4
float4 VSMEpsilon : register(c8); // float
float4 VSMExponent : register(c9); // float
sampler2D SceneDepthTexture : register(s0);
sampler2D ShadowVarianceTexture : register(s1);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.z = 1.0 / r0.w;
    r1.xy = r1.zz * ScreenPositionScaleBias.xy;
    r1 = r1.yzzx * r0.yxyx;
    r0.xy = r1.xw + ScreenPositionScaleBias.zw;
    r0.x = tex2D(SceneDepthTexture, r0.yx).x;
    r0.x = r0.x * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    r1.x = 1.0 / r0.x;
    r0 = r1.xxxx * ScreenToShadowMatrix[2].xywz + ScreenToShadowMatrix[3].xywz;
    r1.xy = r1.yz * r1.xx;
    r0 = r1.yyyy * ScreenToShadowMatrix[1].xywz + r0;
    r0 = r1.xxxx * ScreenToShadowMatrix[0].zwxy + r0.wzxy;
    ps = 1.0 / r0.y;
    r0.x = min(r0.x, 0.999);
    r0.y = ps;
    r0.yz = r0.zw * r0.yy;
    r0.yz = tex2D(ShadowVarianceTexture, r0.yz).yx;
    r0.y = -r0.z * r0.z + r0.y;
    r0.y = max(r0.y, 0.0);
    ps = VSMEpsilon.x + r0.y;
    r1.x = -r0.x + r0.z;
    r0.y = ps;
    r0.w = min(r0.y, 1.0);
    r0.y = r1.x * r1.x + r0.w;
    ps = 1.0 / r0.y;
    r0.y = ps;
    r0.y = r0.w * r0.y;
    ps = log2(abs(r0.y));
    r1 = -ShadowModulateColor + 1.0;
    r0.y = ps;
    ps = VSMExponent.x * r0.y;
    r0.w = ps;
    ps = pow(2.0, r0.w);
    r0.y = float((r0.x > r0.z));
    r0.x = ps;
    r0.x = (r0.y == 0.0) ? 1.0 : r0.x;
    oC0 = r1 * r0.xxxx + ShadowModulateColor;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
