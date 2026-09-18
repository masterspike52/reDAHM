// ps_2351f0426680b196.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 135 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000021C 10040A00 0000090A 00000000 00008129 007F01FF 00000001 00003050 0000F151 0000F252 00007354 0000F455 00007556 0000F657 0000F7A0 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
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
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D ShadowTexture : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord4 : TEXCOORD4; // r3
    float4 texcoord5 : TEXCOORD5; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
    float4 color0 : COLOR0; // r7
    float4 color2 : COLOR2; // r8
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord4;
    float4 r4 = In.texcoord5;
    float4 r5 = In.texcoord6;
    float4 r6 = In.texcoord7;
    float4 r7 = In.color0;
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7.zw = r2.xy + r2.xy;
    r7.x = 1.0 / r6.w;
    r8.xy = r7.xx * ScreenPositionScaleBias.xy;
    r7.y = 1.0 / ModShadowAccumResolution.y;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r7.x = 1.0 / ModShadowAccumResolution.x;
    r7.xy = r7.xy * abs(r9.xy);
    r8.xy = r8.xy * r6.xy + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r9 = tex2D(Texture2D_1, r1.xy);
    r7.z = tex2D(Texture2D_0, r7.zw).w;
    r10.w = tex2D(ShadowTexture, r0.xy).x;
    r0.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7.x = r3.z + 0.1;
    r7.w = dot(r3.zxy, r3.zxy);
    r7.y = dot(r4.zxy, r4.zxy);
    r8.x = saturate(-r7.y + 1.0);
    r8.z = rsqrt(abs(r7.w));
    r8.w = saturate(r8.z * r3.z);
    r7.y = rsqrt(abs(r7.y));
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = saturate(5.0 * r7.x);
    r8.y = dot(r5.zxy, r5.zxy);
    r7.w = 1.0 - r7.x;
    r10.xyz = r8.zzz * r3.zxy;
    r7.x = rsqrt(abs(r8.y));
    r3.xyz = r7.xxx * r5.zxy;
    r7.x = log2(r8.x);
    r8.xy = -r7.ww * ModShadowGroupColor.xy + 1.0;
    r5.xyz = r7.yyy * -SpotDirection.xyz;
    r3.y = -r3.y;
    r3.x = r3.x * 2.0 - r3.x;
    r7.y = dot(r5.zxy, r4.zxy);
    r3.z = -r3.z;
    ps = -SpotAngles.x - -r7.y;
    r7.w = saturate(dot(r10.yzx, r3.yzx));
    r7.y = ps;
    ps = log2(r7.w);
    r10.x = saturate(r7.y * SpotAngles.y);
    r0.x = ps;
    r0.xyz = r0.xyz * float3(15.0, 0.875, 0.875);
    r10.yz = r0.yz * r8.xy + 0.125;
    ps = pow(2.0, r0.x);
    r8.xyz = r10.wxy * r10.wxz;
    r7.w = ps;
    r0 = r7.zzwz * r9.xywz;
    r7.yzw = r8.zzz * r1.xyz + ModShadowColor.xyz;
    ps = LightColorAndFalloffExponent.w * r7.x;
    r2.xyz = r0.xyw * r2.xyz;
    r7.x = ps;
    ps = pow(2.0, r7.x);
    r1.xyz = r8.xxx * r6.xyz;
    r7.x = ps;
    r1.xyz = r1.xzy * r7.xxx;
    r0.xy = r2.xy * r8.ww + r0.zz;
    r0.z = r2.z * r8.w + r0.z;
    r0.xyz = r1.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r8.xyz = r0.xzy * r8.yyy;
    r7.xyz = r8.xzy * r7.yzw;
    oC0.xyz = r7.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
