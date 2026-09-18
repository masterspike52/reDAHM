// ps_9a10bbb751673186.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040800 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
sampler2D ShadowTexture : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.z = dot(r2.zxy, r2.zxy);
    r0.w = 1.0 / r4.w;
    r7.xy = r0.ww * ScreenPositionScaleBias.xy;
    r7.w = 1.0 / ModShadowAccumResolution.y;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r7.z = 1.0 / ModShadowAccumResolution.x;
    r4.xy = r7.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r5.z = tex2D(ShadowTexture, r0.xy).x;
    r5.xy = r7.zw * abs(r5.xy);
    r0.x = 0.1 - -r1.z;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r0.y = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.y));
    r0.w = saturate(-r0.z + 1.0);
    r4.w = ps;
    ps = rsqrt(abs(r0.z));
    r1.w = saturate(r4.w * r1.z);
    r0.y = ps;
    ps = 5.0 * r0.x;
    r7.yzw = -UniformVector_0.xyz + 1.0;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r3.w = dot(r3.zxy, r3.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r3.w));
    r8.xyz = r4.www * r1.zxy;
    r0.x = ps;
    ps = log2(r0.w);
    r1.xyz = r0.xxx * r3.zxy;
    r0.x = ps;
    r0.zw = -r0.zz * ModShadowGroupColor.xy + 1.0;
    ps = -r1.y;
    r3.xyz = r0.yyy * -SpotDirection.xyz;
    r1.y = ps;
    r1.x = r1.x * 2.0 - r1.x;
    ps = -r1.z;
    r0.y = dot(r3.zxy, r2.zxy);
    r1.z = ps;
    ps = -SpotAngles.x - -r0.y;
    r1.x = saturate(dot(r8.yzx, r1.yzx));
    r0.y = ps;
    ps = log2(r1.x);
    r2.x = saturate(r0.y * SpotAngles.y);
    r7.x = ps;
    r7 = r7 * float4(15.0, 0.21952, 0.21952, 0.21952);
    ps = pow(2.0, r7.x);
    r2.y = r2.x * r2.x;
    r5.w = ps;
    r3.xyz = r5.xyw * float3(0.875, 0.875, 0.21952);
    r1.xyz = r7.yzw * r1.www + r3.zzz;
    r5.xy = r3.xy * r0.zw + 0.125;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r2.zw = r5.xz * r5.yz;
    r0.w = ps;
    r0.xyz = r2.zzz * r6.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.w);
    r3.xyz = r2.www * r4.xyz;
    r0.w = ps;
    r3.xyz = r3.xyz * r0.www;
    r1.xyz = r3.xyz * r1.xyz;
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
