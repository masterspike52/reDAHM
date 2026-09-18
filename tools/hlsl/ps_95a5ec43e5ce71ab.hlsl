// ps_95a5ec43e5ce71ab.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 117 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001D4 10040800 00000406 00000000 00003884 000F000F 00000001 00007054 0000F155 00007256 0000F357
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c4); // float4
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c6); // float2
float4 SpotDirection : register(c5); // float3
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
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r2.w = dot(r1.zxy, r1.zxy);
    r0.w = 1.0 / r3.w;
    r5.xy = r0.ww * ScreenPositionScaleBias.xy;
    r6.y = 1.0 / ModShadowAccumResolution.y;
    r5.zw = -UniformVector_0.xy + 1.0;
    r6.x = 1.0 / ModShadowAccumResolution.x;
    r3.xy = r5.xy * r3.xy + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r4.xy = r6.xy * abs(r4.xy);
    r0.w = 0.1 - -r0.z;
    r6.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r3.w = dot(r0.zxy, r0.zxy);
    r4.w = saturate(-r2.w + 1.0);
    r5.y = rsqrt(abs(r3.w));
    r6.w = saturate(r5.y * r0.z);
    r2.w = rsqrt(abs(r2.w));
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = saturate(5.0 * r0.w);
    r5.x = dot(r2.zxy, r2.zxy);
    r3.w = 1.0 - r0.w;
    r7.xyz = r5.yyy * r0.zxy;
    r0.x = rsqrt(abs(r5.x));
    r0.yzw = r0.xxx * r2.xyz;
    r0.x = log2(r4.w);
    r5.xy = -r3.ww * ModShadowGroupColor.xy + 1.0;
    r8.xyz = r2.www * -SpotDirection.xyz;
    r2.y = -r0.y;
    r2.x = r0.w * 2.0 - r0.w;
    ps = -r0.z;
    r0.y = dot(r8.zxy, r1.zxy);
    r2.z = ps;
    ps = -SpotAngles.x - -r0.y;
    r0.z = saturate(dot(r7.yzx, r2.yzx));
    r0.y = ps;
    ps = log2(r0.z);
    r2.x = saturate(r0.y * SpotAngles.y);
    r6.z = ps;
    r6.xyz = r6.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r6.z);
    r2.y = r2.x * r2.x;
    r0.y = ps;
    r0.zw = r6.xy * r5.xy + 0.125;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r1.z = r0.y * 0.21952;
    r0.y = ps;
    r1.xy = r6.ww * r5.zw + r1.zz;
    ps = pow(2.0, r0.y);
    r0.x = r0.z * r0.w;
    r0.w = ps;
    r0.xyz = r0.xxx * r4.xyz + ModShadowColor.xyz;
    r1.xyz = r1.xyz * r0.www;
    r1.xyz = r1.xyz * r3.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.yzw = r1.yzx * r2.yyx;
    r1.x = r1.w * r2.x;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
