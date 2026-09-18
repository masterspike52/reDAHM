// ps_134f4738661991c0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040900 00000406 00000000 00003884 000F000F 00000001 00007054 0000F155 00007256 0000F357
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
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r3.w;
    r6.w = -UniformVector_0.y + 1.0;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r0.ww * ScreenPositionScaleBias.xy;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = ps;
    r4.xy = r7.xy * abs(r4.xy);
    r3.xy = r6.xy * r3.xy + ScreenPositionScaleBias.wz;
    r3.yzw = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r7.yz = tex2D(ModShadowAccumTexture, r4.xy).xy;
    ps = r0.z;
    r0.w = dot(r0.zxy, r0.zxy);
    ps = 0.1 + ps;
    r3.x = dot(r1.zxy, r1.zxy);
    r2.w = ps;
    ps = rsqrt(abs(r0.w));
    r4.x = saturate(r2.w * 5.0);
    r4.y = ps;
    r6.x = saturate(r4.y * r0.z);
    ps = 1.0 - r3.x;
    r0.w = dot(r2.zxy, r2.zxy);
    r2.w = saturate(ps);
    ps = rsqrt(abs(r0.w));
    r8.xyz = r4.yyy * r0.xyz;
    r0.x = ps;
    ps = rsqrt(abs(r3.x));
    r0.yzw = r0.xxx * r2.xyz;
    r2.x = ps;
    ps = log2(r2.w);
    r2.y = -r4.x + 1.0;
    r0.x = ps;
    r4.xy = -r2.yy * ModShadowGroupColor.xy + 1.0;
    ps = -r0.y;
    r9.xyz = r2.xxx * -SpotDirection.xyz;
    r2.y = ps;
    r2.x = r0.w * 2.0 - r0.w;
    ps = -r0.z;
    r0.y = dot(r9.zxy, r1.zxy);
    r2.z = ps;
    ps = -SpotAngles.x - -r0.y;
    r0.z = saturate(dot(r8.xyz, r2.yzx));
    r0.y = ps;
    ps = log2(r0.z);
    r2.x = saturate(r0.y * SpotAngles.y);
    r0.y = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r0.y = r0.y * 15.0;
    r0.z = ps;
    ps = pow(2.0, r0.y);
    r2.y = r2.x * r2.x;
    r7.x = ps;
    ps = pow(2.0, r0.z);
    r0.xyw = r7.yzx * float3(0.875, 0.875, 0.21952);
    r2.w = ps;
    r2.z = r0.w * r2.w;
    r6.yz = r0.xy * r4.xy + 0.125;
    ps = r6.x * r6.w;
    r1.xyw = r3.yzw * r1.www;
    r1.z = ps;
    ps = r6.y * r6.z;
    r1.xyw = r1.xwy * r2.zzw;
    r0.z = ps;
    r0.xyz = r0.zzz * r5.xyz + ModShadowColor.xyz;
    r0.w = r1.z + r0.w;
    r1.z = r1.w * r0.w;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xzy;
    r1.yzw = r1.zyx * r2.yyx;
    r1.x = r1.w * r2.x;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
