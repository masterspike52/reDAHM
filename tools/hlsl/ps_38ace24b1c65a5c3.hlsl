// ps_38ace24b1c65a5c3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 99 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000018C 10040800 00000606 00000000 000050C6 003F003F 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
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
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7 = tex2D(Texture2D_0, r0.xy);
    ps = 1.0 / r5.w;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = r7.w - 0.5;
    r0.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    ps = ScreenPositionScaleBias.x * r0.z;
    r0.xy = r0.xy * abs(r6.xy);
    r1.x = ps;
    ps = ScreenPositionScaleBias.y * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.wwww)) clip(-1.0);
    r1.y = ps;
    r0.zw = r1.xy * r5.xy + ScreenPositionScaleBias.wz;
    r1.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r0.xy).xy;
    ps = r2.z;
    r0.w = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r0.z = dot(r3.zxy, r3.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r0.z));
    r0.y = saturate(-r0.z + 1.0);
    r0.z = ps;
    ps = rsqrt(abs(r0.w));
    r6.xy = r5.xy * 0.875;
    r0.w = ps;
    ps = 5.0 * r0.x;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = saturate(ps);
    ps = r0.w;
    r8.xyz = r7.xyz * 0.25;
    ps = r2.z * ps;
    r7.xyz = r0.zzz * -SpotDirection.xyz;
    r0.z = saturate(ps);
    ps = log2(r0.y);
    r2.xyz = r8.xyz * r5.xyz;
    r0.y = ps;
    ps = 1.0 - r0.x;
    r5.xyz = r2.xyz * r0.zzz;
    r0.z = ps;
    ps = LightColorAndFalloffExponent.w * r0.y;
    r0.x = dot(r7.zxy, r3.zxy);
    r0.y = ps;
    r0.zw = -r0.zz * ModShadowGroupColor.xy + 1.0;
    r2.yz = r6.xy * r0.zw + 0.125;
    ps = pow(2.0, r0.y);
    r0.x = r0.x - SpotAngles.x;
    r0.y = ps;
    ps = SpotAngles.y * r0.x;
    r0.yzw = r5.xyz * r0.yyy;
    r2.x = saturate(ps);
    ps = r2.x * r2.x;
    r0.xzw = r0.yzw * r1.xyz;
    r0.y = ps;
    ps = r2.y * r2.z;
    r1.xyz = r0.xzw * LightColorAndFalloffExponent.xyz;
    r0.x = ps;
    r1.xyz = r1.xyz * r0.yyy;
    r0.xyz = r0.xxx * r4.xyz + ModShadowColor.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
