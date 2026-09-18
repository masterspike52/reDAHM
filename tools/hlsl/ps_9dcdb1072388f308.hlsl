// ps_9dcdb1072388f308.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 93 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000174 10040600 00000406 00000000 00003884 000F000F 00000001 00007054 0000F155 00007256 0000F357
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c4); // float3
float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord4 : TEXCOORD4; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float2 vPos : VPOS;   // r4 (pixel parameters)
    float vFace : VFACE;  // r4
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord4;
    float4 r1 = In.texcoord5;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 oC0 = 0.0;

    r5.z = dot(r2.zxy, r2.zxy);
    r0.w = 1.0 / r3.w;
    r5.xw = r0.ww * ScreenPositionScaleBias.xy;
    r5.y = 1.0 / ModShadowAccumResolution.y;
    r3.xy = r5.xw * r3.xy + ScreenPositionScaleBias.wz;
    r1.x = dot(r0.zxy, r0.zxy);
    r5.x = 1.0 / ModShadowAccumResolution.x;
    r3.zw = r5.xy * abs(r4.xy);
    r5.xy = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r0.w = r0.z + 0.1;
    r2.w = rsqrt(abs(r1.x));
    r3.xyz = r3.zxy * float3(0.21952, 1.0, 1.0);
    r1.x = saturate(5.0 * r0.w);
    r6.xyz = r2.www * r0.zxy;
    r0.w = rsqrt(abs(r5.z));
    r2.xyz = r0.www * r2.zxy;
    r0.w = 1.0 - r1.x;
    r4.xy = -r0.ww * ModShadowGroupColor.xy + 1.0;
    r2.yz = -r2.yz;
    r2.x = r2.x * 2.0 - r2.x;
    r0.w = saturate(dot(r6.yzx, r2.yzx));
    r5.w = saturate(r2.w * r0.z);
    r5.z = log2(r0.w);
    r5.xyz = r5.xyz * float3(0.875, 0.875, 15.0);
    r2.xyz = r3.yzx * r1.www;
    r0.x = pow(2.0, r5.z);
    r4.zw = -UniformVector_0.xy + 1.0;
    r0.y = 0.21952 * r0.x;
    r3.xy = r5.xy * r4.xy + 0.125;
    r0.yz = r5.ww * r4.zw + r0.yy;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = r3.x * r3.y;
    r1.xyz = r0.www * r1.xyz + ModShadowColor.xyz;
    r0.xyz = r2.xzy * r0.yxz;
    r0.xyz = r0.xyz * LightColor.xzy;
    r0.xyz = r0.xzy * r1.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
