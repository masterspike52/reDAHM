// ps_fbf6f3c8ebe1d86e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 63 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000FC 10040700 0000070A 00000000 000060E7 001F007F 00000001 00003050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
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
sampler2D Texture2D_2 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
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
    float4 r6 = In.color1;
    float4 r7 = 0.0;
    float4 oC0 = 0.0;

    r5.x = r1.z + 0.1;
    r5.y = 1.0 / r4.w;
    r6.xy = r5.yy * ScreenPositionScaleBias.xy;
    r5.z = 1.0 / ModShadowAccumResolution.y;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = 1.0 / ModShadowAccumResolution.x;
    r5.yz = r5.yz * abs(r7.xy);
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r2.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r0.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r5.yz).xy;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r5.y = saturate(5.0 * r5.x);
    r0.xyz = r3.xyz * r0.xyz;
    r5.z = 0.875 * r6.x;
    r0.xyz = r0.xyz * r2.xyz;
    r5.w = 0.875 * r6.y;
    r6.xyz = r0.xyz * LightColor.xyz;
    r5.x = 1.0 - r5.y;
    r5.xy = -r5.xx * ModShadowGroupColor.xy + 1.0;
    r5.xy = r5.zw * r5.xy + 0.125;
    r5.x = r5.x * r5.y;
    r5.xyz = r5.xxx * r1.xyz + ModShadowColor.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
