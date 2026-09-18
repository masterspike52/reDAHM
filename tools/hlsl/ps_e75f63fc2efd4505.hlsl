// ps_e75f63fc2efd4505.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 10000300 00000004 00000001 00001021 00010001 00000001 0000F050
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
// Definition header: 00000000 00000001 00000001 00000000
// Non-float definitions (raw): 00000000 239C0001 00000002 00000000

#include "xenos_common.hlsli"

float4 DynamicVelocityParameters : register(c8); // float4 // default: 0.025, -0.044444446, -0.0125, 0.022222223
float4 MinZ_MaxZRatio : register(c2); // float4
float4 PrevViewProjMatrix[4] : register(c3); // float4x4 (matrix_columns)
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 StaticVelocityParameters : register(c7); // float4 // default: 0.5, -0.5, 0.0125, 0.022222223
sampler2D SceneDepthTexture : register(s0);
sampler2D SceneColorTexture : register(s1);
sampler2D VelocityBuffer : register(s2);

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
    float4 oC0 = 0.0;
    bool p0 = false;
    int aL = 0;

    r1.yz = tex2D(VelocityBuffer, r0.zw).xy;
    r1.x = r1.y + r1.z;
    r1.x = float((r1.x > 0.0001));
    p0 = (0.0 == 0.0 && r1.x != 0.0);
    r1.x = (0.0 == 0.0 && r1.x != 0.0) ? 0.0 : 0.0 + 1.0;
    if (p0)
    {
        r1.yz = r1.zy * 2.0 - 1.0;
        r0.xy = float2((-r1.yz > 0.0));
        r1.yz = abs(r1.zy) - r0.yx;
        r0.xy = r1.zy * DynamicVelocityParameters.yx;
    }
    p0 = (r1.x == 1.0);
    r1.x = p0 ? 0.0 : ((r1.x == 0.0) ? 1.0 : r1.x);
    if (p0)
    {
        r1.y = tex2D(SceneDepthTexture, r0.zw).x;
        r1.y = r1.y * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
        r1.y = 1.0 / r1.y;
        r1.y = min(r1.y, 65504.0);
        r1.z = float((14.0 > r1.y));
    }
    p0 = (r1.x == 0.0 && r1.z != 0.0);
    r1.x = (r1.x == 0.0 && r1.z != 0.0) ? 0.0 : r1.x + 1.0;
    if (p0)
    {
        r1.y = 65504.0;
    }
    p0 = (r1.x - 1.0 <= 0.0);
    r1.x = p0 ? 0.0 : (r1.x - 1.0);
    if (p0)
    {
        r2.xyz = r0.xxx * PrevViewProjMatrix[0].xyw;
    }
    if (p0)
    {
        if (p0)
        {
            r3.xyz = r0.yyy * PrevViewProjMatrix[1].xyw;
            r1.xzw = r1.yyy * PrevViewProjMatrix[2].xyw + PrevViewProjMatrix[3].xyw;
            r1.xzw = r3.xyz * r1.yyy + r1.xzw;
            r1.xyz = r2.zxy * r1.yyy + r1.wxz;
            r1.x = 1.0 / r1.x;
            r0.xy = -r1.zy * r1.xx + r0.yx;
        }
    }
    if (p0)
    {
        r0.xy = r0.xy * StaticVelocityParameters.yx;
        r0.xy = max(r0.xy, -StaticVelocityParameters.wz);
        r1.x = 1.0 / StaticVelocityParameters.z;
        r0.xy = min(r0.xy, StaticVelocityParameters.wz);
        r1.y = 1.0 / StaticVelocityParameters.w;
        r1.yz = r0.yx * r1.xy;
    }
    r1.x = 0.33333334 * r0.y;
    r0.y = dot(r1.yz, r1.yz) + 0.0;
    r1.y = r1.x * r0.y;
    r0.y = 0.33333334 * r0.y;
    r1.x = r0.y * r0.x;
    r1.zw = r1.yx * (-2.0) + r0.zw;
    r0.xyz = tex2D(SceneColorTexture, r1.zw).xyz;
    for (int xe_iter0 = 0, aL = 0; xe_iter0 < 2; xe_iter0++, aL += 0)
    {
        r1.zw = r1.yx + r1.zw;
        r2.xyz = tex2D(SceneColorTexture, r1.zw).xyz;
        r0.xyz = r2.xyz + r0.xyz;
    }
    r0.w = SCENE_COLOR_BIAS_FACTOR.x * 0.33333334;
    oC0.xyz = r0.www * r0.xyz;
    oC0.w = 1.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
