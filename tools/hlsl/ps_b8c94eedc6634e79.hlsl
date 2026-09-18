// ps_b8c94eedc6634e79.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 81 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000144 10040400 00000406 00000000 00003884 000F000F 00000001 00007054 0000F155 00007256 0000F357
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r3.w;
    r0.w = dot(r0.zxy, r0.zxy);
    r0.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.zw = r0.yy * ScreenPositionScaleBias.xy;
    r2.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.y = dot(r1.zxy, r1.zxy);
    r2.x = ps;
    r2.xy = r2.xy * abs(r4.xy);
    r1.xy = r2.zw * r3.xy + ScreenPositionScaleBias.wz;
    r1.xyz = tex2D(LightAttenuationTexture, r1.xy).xyz;
    r2.xy = tex2D(ModShadowAccumTexture, r2.xy).xy;
    ps = rsqrt(abs(r0.w));
    r4.xy = r2.xy * 0.875;
    r0.w = ps;
    ps = r0.z;
    r1.w = saturate(r0.w * r0.z);
    ps = 0.1 + ps;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    ps = 1.0 - r0.y;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r0.z = saturate(ps);
    ps = 5.0 * r0.x;
    r2.xyz = r2.xyz * 0.21952;
    r0.x = saturate(ps);
    ps = log2(r0.z);
    r0.y = -r0.x + 1.0;
    r0.x = ps;
    r0.yw = -r0.yy * ModShadowGroupColor.xy + 1.0;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r2.xyz = r2.xyz * r1.www;
    r0.z = ps;
    r0.xy = r4.xy * r0.yw + 0.125;
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
