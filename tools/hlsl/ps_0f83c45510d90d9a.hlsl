// ps_0f83c45510d90d9a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 108 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001B0 10040900 00000806 00000000 00006908 00FF00FF 00000001 00003050 00003151 0000F252 0000F353 00007454 0000F555 00007656 0000F757
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r7 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c4); // float4
float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord4 : TEXCOORD4; // r4
    float4 texcoord5 : TEXCOORD5; // r5
    float4 texcoord6 : TEXCOORD6; // r6
    float4 texcoord7 : TEXCOORD7; // r7
    float2 vPos : VPOS;   // r8 (pixel parameters)
    float vFace : VFACE;  // r8
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
    float4 r3 = In.texcoord3;
    float4 r4 = In.texcoord4;
    float4 r5 = In.texcoord5;
    float4 r6 = In.texcoord6;
    float4 r7 = In.texcoord7;
    float4 r8 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r7.w;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    ps = ScreenPositionScaleBias.x * r0.z;
    r0.xw = r0.xy * 2e+01;
    r1.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r1.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.y = dot(r6.zxy, r6.zxy);
    r1.z = ps;
    ps = ScreenPositionScaleBias.y * r0.z;
    r2.xy = r1.yz * abs(r8.xy);
    r1.y = ps;
    r1.xy = r1.xy * r7.xy + ScreenPositionScaleBias.wz;
    r1.xyz = tex2D(LightAttenuationTexture, r1.xy).xyz;
    r7.xy = tex2D(ModShadowAccumTexture, r2.xy).xy;
    r2.xyz = tex2D(Texture2D_0, r0.xw).xyz;
    ps = r4.z;
    r0.w = dot(r4.zxy, r4.zxy);
    ps = 0.1 + ps;
    r0.z = dot(r5.zxy, r5.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r0.w));
    r0.z = saturate(-r0.z + 1.0);
    r0.w = ps;
    ps = 5.0 * r0.x;
    r2.xyz = r9.xyz * r2.xyz;
    r0.x = saturate(ps);
    ps = rsqrt(abs(r0.y));
    r8.xyz = r0.www * r4.zxy;
    r0.y = ps;
    ps = 1.0 - r0.x;
    r5.xyz = r0.yyy * r6.zxy;
    r0.x = ps;
    r0.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r5.yz = -r5.yz;
    r5.x = r5.x * 2.0 - r5.x;
    r1.w = saturate(dot(r8.yzx, r5.yzx));
    ps = log2(r1.w);
    r0.w = saturate(r0.w * r4.z);
    r1.w = ps;
    ps = log2(r0.z);
    r1.w = r1.w * 15.0;
    r0.z = ps;
    ps = pow(2.0, r1.w);
    r0.z = r0.z * LightColorAndFalloffExponent.w;
    r7.z = ps;
    ps = pow(2.0, r0.z);
    r4.xyz = r7.xyz * float3(0.875, 0.875, 0.21952);
    r0.z = ps;
    r2.xyz = r2.xyz * r0.www + r4.zzz;
    r0.xy = r4.xy * r0.xy + 0.125;
    ps = r0.x * r0.y;
    r2.xyz = r2.xyz * r0.zzz;
    r0.x = ps;
    r0.xyz = r0.xxx * r3.xyz + ModShadowColor.xyz;
    r1.xyz = r2.xyz * r1.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
