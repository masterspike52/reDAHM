// ps_86a897abd9d5dee9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 102 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000198 10040700 00000406 00000000 00003884 000F000F 00000001 00007054 0000F155 00007256 0000F357
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c5); // float4
float4 ModShadowAccumResolution : register(c8); // float2
float4 ModShadowColor : register(c6); // float3
float4 ModShadowGroupColor : register(c7); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r3.w;
    r5.z = dot(r2.zxy, r2.zxy);
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r0.ww * ScreenPositionScaleBias.xy;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r7.x = ps;
    r4.xy = r7.xy * abs(r4.xy);
    r3.xy = r5.xy * r3.xy + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    ps = r0.z;
    r3.w = dot(r0.zxy, r0.zxy);
    ps = 0.1 + ps;
    r1.x = dot(r1.zxy, r1.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r3.w));
    r2.w = saturate(-r1.x + 1.0);
    r3.w = ps;
    ps = 5.0 * r0.w;
    r1.yzw = r6.xyz * UniformVector_1.xyz;
    r1.x = saturate(ps);
    ps = rsqrt(abs(r5.z));
    r7.xyz = r3.www * r0.zxy;
    r0.w = ps;
    ps = 1.0 - r1.x;
    r6.xyz = r0.www * r2.zxy;
    r0.w = ps;
    r2.xy = -r0.ww * ModShadowGroupColor.xy + 1.0;
    r6.yz = -r6.yz;
    r6.x = r6.x * 2.0 - r6.x;
    r0.w = saturate(dot(r7.yzx, r6.yzx));
    ps = log2(r0.w);
    r1.x = saturate(r3.w * r0.z);
    r0.x = ps;
    ps = log2(r2.w);
    r0.x = r0.x * 15.0;
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r0.z = r0.y * LightColorAndFalloffExponent.w;
    r5.z = ps;
    ps = pow(2.0, r0.z);
    r0.xyw = r5.xyz * float3(0.875, 0.875, 0.21952);
    r0.z = ps;
    r1.xyz = r1.yzw * r1.xxx + r0.www;
    r0.xy = r0.xy * r2.xy + 0.125;
    ps = r0.x * r0.y;
    r1.xyz = r1.xyz * r0.zzz;
    r0.x = ps;
    r0.xyz = r0.xxx * r4.xyz + ModShadowColor.xyz;
    r1.xyz = r1.xyz * r3.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
