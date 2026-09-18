// ps_451e10ecf453abad.bin
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

float4 LightColorAndFalloffExponent : register(c7); // float4
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c9); // float2
float4 SpotDirection : register(c8); // float3
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
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
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.xy * 2.0 + UniformVector_1.xy;
    r6.xy = r0.xy * 0.5 + UniformVector_2.xy;
    ps = 1.0 / r4.w;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.zz * ScreenPositionScaleBias.xy;
    r8.y = ps;
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = dot(r3.zxy, r3.zxy);
    r8.x = ps;
    r4.xy = r8.xy * abs(r7.xy);
    r4.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r11.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r8.xyz = tex2D(Texture2D_0, r5.xy).xyz;
    ps = r1.z;
    r6.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = 1.0 - r5.x;
    r5.yzw = -UniformVector_0.xyz + 1.0;
    r6.y = saturate(ps);
    r9.xyz = r8.xyz * 4.0 - 4.0;
    ps = rsqrt(abs(r6.w));
    r8.xyz = r7.xyz * r2.www;
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r7.xyz = r6.www * r1.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r6.zzz * r3.xyz;
    r5.x = ps;
    ps = 5.0 * r6.x;
    r10.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = saturate(ps);
    r9.xyz = r11.xyz * 4.0 + r9.xyz;
    ps = log2(r6.y);
    r6.x = -r5.x + 1.0;
    r5.x = ps;
    r3.xy = -r6.xx * ModShadowGroupColor.xy + 1.0;
    ps = UniformVector_3.x * r5.y;
    r6.y = dot(r9.zxy, r9.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.y));
    r5.y = dot(r10.zxy, r2.zxy);
    r6.y = ps;
    ps = UniformVector_3.y * r5.z;
    r2.xyz = r9.xyz * r6.yyy;
    r6.y = ps;
    ps = UniformVector_3.z * r5.w;
    r6.w = dot(r2.zxy, r1.zxy);
    r6.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r9.xyz = r2.xzy * r6.www;
    r5.z = ps;
    r1.xyz = r9.xyz * 2.0 - r1.xzy;
    ps = pow(2.0, r5.z);
    r5.x = saturate(dot(r7.zxy, r1.yxz));
    r5.z = ps;
    ps = log2(r5.x);
    r1.xyz = r8.xyz * r5.zzz;
    r5.x = ps;
    ps = -SpotAngles.x - -r5.y;
    r5.z = r5.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.z);
    r5.y = saturate(dot(r2.zxy, r7.zxy));
    r4.z = ps;
    ps = SpotAngles.y * r5.x;
    r2.xyz = r4.xyz * float3(0.875, 0.875, 0.21952);
    r5.w = saturate(ps);
    r6.xyz = r6.xyz * r5.yyy + r2.zzz;
    r5.yz = r2.xy * r3.xy + 0.125;
    ps = r5.y * r5.z;
    r6.xyz = r1.xyz * r6.xyz;
    r5.x = ps;
    ps = r5.w * r5.w;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.y = ps;
    r6.xyz = r6.xyz * r5.yyy;
    r5.xyz = r5.xxx * r0.xyz + ModShadowColor.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
