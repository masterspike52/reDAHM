// ps_c4539521ef451435.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10040800 00000406 00000000 00003884 000F000F 00000001 00007054 0000F155 00007256 0000F357
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

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = ps;
    ps = 1.0 / r3.w;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r0.ww * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r5.xy = r5.xy * abs(r4.xy);
    r3.xy = r5.zw * r3.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r6.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = -UniformVector_0.x;
    r3.yzw = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r0.w = dot(r2.zxy, r2.zxy);
    r2.w = ps;
    ps = r0.z;
    r4.w = dot(r0.zxy, r0.zxy);
    ps = 0.1 + ps;
    r3.x = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r4.w));
    r5.y = saturate(r5.x * 5.0);
    r5.z = ps;
    ps = 1.0 - r3.x;
    r4.w = saturate(r5.z * r0.z);
    r5.x = saturate(ps);
    ps = rsqrt(abs(r0.w));
    r7.xyz = r5.zzz * r0.zxy;
    r0.x = ps;
    ps = rsqrt(abs(r3.x));
    r0.yzw = r0.xxx * r2.xyz;
    r2.x = ps;
    ps = log2(r5.x);
    r2.y = -r5.y + 1.0;
    r0.x = ps;
    r5.xy = -r2.yy * ModShadowGroupColor.xy + 1.0;
    ps = -r0.y;
    r8.xyz = r2.xxx * -SpotDirection.xyz;
    r2.y = ps;
    r2.x = r0.w * 2.0 - r0.w;
    ps = -r0.z;
    r0.y = dot(r8.zxy, r1.zxy);
    r2.z = ps;
    ps = -SpotAngles.x - -r0.y;
    r0.z = saturate(dot(r7.yzx, r2.yzx));
    r0.y = ps;
    ps = log2(r0.z);
    r2.x = saturate(r0.y * SpotAngles.y);
    r0.y = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r0.y = r0.y * 15.0;
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r2.y = r2.x * r2.x;
    r6.x = ps;
    ps = pow(2.0, r0.x);
    r0.yzw = r6.xyz * float3(0.21952, 0.875, 0.875);
    r5.z = ps;
    r0.x = r4.w * r2.w + r0.y;
    r0 = r0.zwxy * r5.xyzz;
    r0.xy = r0.xy + 0.125;
    r1.xyz = r0.zww * r4.xyz;
    ps = r0.x * r0.y;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.x = ps;
    r0.xyz = r0.xxx * r3.yzw + ModShadowColor.xyz;
    r1.yzw = r1.yzx * r2.yyx;
    r1.x = r1.w * r2.x;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
