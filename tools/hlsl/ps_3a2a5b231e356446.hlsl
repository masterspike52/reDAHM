// ps_3a2a5b231e356446.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 114 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001C8 10040800 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
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
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.w = dot(r3.zxy, r3.zxy);
    r5.x = 1.0 / r4.w;
    r5.xz = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r5.xz * r4.xy + ScreenPositionScaleBias.wz;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.x = 1.0 / ModShadowAccumResolution.x;
    r5.xy = r5.xy * abs(r7.xy);
    r4.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r8.xyz = r0.xyz * 2.0 - 1.0;
    r2.xyz = r7.xyz * r2.www;
    r6.w = rsqrt(abs(r6.w));
    ps = 0.1 - -r1.z;
    r1.xyz = r6.www * r1.xyz;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r6.w = dot(r8.zxy, r8.zxy);
    r5.x = saturate(ps);
    ps = rsqrt(abs(r1.w));
    r0.x = -r5.x + 1.0;
    r5.x = ps;
    r0.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r6.w));
    r7.xyz = r5.xxx * r3.xyz;
    r5.x = ps;
    r3.xyz = r8.xyz * r5.xxx;
    r5.x = dot(r3.zxy, r7.zxy);
    r8.xyz = r3.xzy * r5.xxx;
    r7.xyz = r8.xyz * 2.0 - r7.xzy;
    r5.x = saturate(dot(r1.zxy, r7.yxz));
    ps = log2(r5.x);
    r6.xyz = r6.xyz * r5.yzw;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.yzw = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    ps = pow(2.0, r6.w);
    r5.x = saturate(dot(r3.zxy, r1.zxy));
    r4.x = ps;
    r1.xyz = r4.xyz * float3(0.21952, 0.875, 0.875);
    r6.xyz = r6.xyz * r5.xxx + r1.xxx;
    r0.xy = r1.yz * r0.xy + 0.125;
    ps = r0.x * r0.y;
    r6.xyz = r2.xyz * r6.xyz;
    r5.x = ps;
    r5.xyz = r5.xxx * r5.yzw + ModShadowColor.xyz;
    r6.xyz = r6.xyz * LightColor.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
