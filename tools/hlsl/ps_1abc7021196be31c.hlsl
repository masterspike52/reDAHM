// ps_1abc7021196be31c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10040900 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c5); // float4
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c7); // float2
float4 SpotDirection : register(c6); // float3
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
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
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6 = tex2D(Texture2D_0, r0.xy).wxyz;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = 1.0 / r4.w;
    r5.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.w = r6.x - 0.5;
    r5.z = 1.0 / ModShadowAccumResolution.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r5.w = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    r5.zw = r5.zw * abs(r7.xy);
    r7.xy = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r8.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r5.x));
    r5.y = dot(r1.zxy, r1.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r5.y));
    r0.x = r1.z + 0.1;
    r5.y = ps;
    ps = 1.0 - r5.x;
    r5.z = dot(r3.zxy, r3.zxy);
    r5.x = saturate(ps);
    ps = rsqrt(abs(r5.z));
    r0.x = saturate(r0.x * 5.0);
    r5.z = ps;
    ps = log2(r5.x);
    r0.x = -r0.x + 1.0;
    r5.x = ps;
    r4.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    ps = TwoSidedSign.x * r5.y;
    r0.yzw = r5.www * -SpotDirection.xyz;
    r0.x = ps;
    ps = TwoSidedSign.x * r5.z;
    r5.w = dot(r0.wyz, r2.zxy);
    r0.w = ps;
    r6.x = saturate(r0.x * r1.z);
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r6.yzw = r9.xyz * r6.yzw;
    r2.xyz = r8.xyz * r2.www;
    r1.xyz = r5.yyy * r1.xyz;
    r8.xyz = r5.zzz * r3.xyz;
    r9.yz = r1.xy * -r8.xy;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r9.x = r0.w * r3.z;
    r5.z = ps;
    ps = -SpotAngles.x - -r5.w;
    r1.xy = r9.xy + r9.xz;
    r5.x = ps;
    r5.y = r1.x * TwoSidedSign.x - r8.z;
    r5.y = saturate(r1.z * r5.y + r1.y);
    ps = log2(r5.y);
    r5.x = saturate(r5.x * SpotAngles.y);
    r5.y = ps;
    ps = pow(2.0, r5.z);
    r5.y = r5.y * 15.0;
    r5.z = ps;
    ps = pow(2.0, r5.y);
    r1.xyz = r2.xyz * r5.zzz;
    r7.z = ps;
    r5.yzw = r7.xyz * float3(0.875, 0.875, 0.21952);
    r6.xyz = r6.yzw * r6.xxx + r5.www;
    r5.zw = r5.yz * r4.xy + 0.125;
    ps = r5.x * r5.x;
    r6.xyz = r1.xyz * r6.xyz;
    r5.y = ps;
    ps = r5.z * r5.w;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.x = ps;
    r6.xyz = r6.xyz * r5.yyy;
    r5.xyz = r5.xxx * r0.xyz + ModShadowColor.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
