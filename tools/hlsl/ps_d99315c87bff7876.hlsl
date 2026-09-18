// ps_d99315c87bff7876.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10040B00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.w = dot(r2.zxy, r2.zxy);
    r5.z = ps;
    ps = ScreenPositionScaleBias.x * r5.z;
    r5.xy = r0.xy * 0.2;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = ps;
    ps = ScreenPositionScaleBias.y * r5.z;
    r7.xy = r6.yz * abs(r7.xy);
    r6.y = ps;
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r4.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r1.w = tex2D(Texture2D_1, r5.xy).w;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r5.x));
    r5.y = saturate(-r5.w + 1.0);
    r0.x = ps;
    r6.w = saturate(r0.x * r1.z);
    ps = r1.z;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r0.yzw = r9.xyz - 0.2;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r11.xyz = -r9.xyz + r1.www;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r5.z));
    r7.xyz = r0.xxx * r1.zxy;
    r5.z = ps;
    ps = rsqrt(abs(r5.w));
    r3.xyz = r5.zzz * r3.xyz;
    r5.z = ps;
    r1.xyz = r11.xyz * r9.zzz + r9.xyz;
    ps = log2(r5.y);
    r9.xyz = r5.zzz * -SpotDirection.xyz;
    r5.y = ps;
    ps = 1.0 - r5.x;
    r1.xyz = r1.xyz * r10.xyz;
    r5.x = ps;
    r5.xz = -r5.xx * ModShadowGroupColor.xy + 1.0;
    r5.w = dot(r9.zxy, r2.zxy);
    r2.yz = -r3.xy;
    r2.x = r3.z * 2.0 - r3.z;
    r0.x = saturate(dot(r7.yzx, r2.yzx));
    ps = log2(r0.x);
    r5.w = r5.w - SpotAngles.x;
    r4.z = ps;
    r2.xyz = r4.xyz * float3(0.875, 0.875, 15.0);
    r5.xz = r2.xy * r5.xz + 0.125;
    ps = pow(2.0, r2.z);
    r5.w = saturate(r5.w * SpotAngles.y);
    r0.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r0.xyz = r0.yzw * r0.xxx;
    r5.y = ps;
    r0.xy = r1.xy * r6.ww + r0.xy;
    r0.z = r1.z * r6.w + r0.z;
    ps = pow(2.0, r5.y);
    r5.xw = r5.xw * r5.zw;
    r6.w = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    r0.xyz = r0.xyz * r6.www;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
