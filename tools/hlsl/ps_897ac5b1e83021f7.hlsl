// ps_897ac5b1e83021f7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 72 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000120 10040500 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.xy = r0.zz * ScreenPositionScaleBias.xy;
    r3.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = dot(r1.zxy, r1.zxy);
    r3.z = ps;
    r5.xy = r3.zw * abs(r5.xy);
    r3.xy = r3.xy * r4.xy + ScreenPositionScaleBias.wz;
    r3.yzw = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r4.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = r1.z;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r4.xyz = r5.xyz * r4.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r0.w));
    r0.y = saturate(r0.y * 5.0);
    r0.w = ps;
    ps = 1.0 - r0.y;
    r1.x = saturate(r0.w * r1.z);
    r0.y = ps;
    r0.yw = -r0.yy * ModShadowGroupColor.xy + 1.0;
    ps = 0.875 * r0.x;
    r1.xyz = r4.xyz * r1.xxx;
    r3.x = ps;
    ps = 0.875 * r0.z;
    r1.xyz = r1.xyz * r3.yzw;
    r3.y = ps;
    r0.xy = r3.xy * r0.yw + 0.125;
    ps = r0.x * r0.y;
    r1.xyz = r1.xyz * LightColor.xyz;
    r0.x = ps;
    r0.xyz = r0.xxx * r2.xyz + ModShadowColor.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
