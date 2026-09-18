// ps_45398f878597f781.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040900 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r0.xy + UniformVector_2.xy;
    r6.z = ps;
    ps = 1.0 / r4.w;
    r5.zw = r0.xy + UniformVector_1.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r5.xx * ScreenPositionScaleBias.xy;
    r6.w = ps;
    r5.xy = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    r6.zw = r6.zw * abs(r7.xy);
    r4.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r7.xyz = tex2D(Texture2D_2, r5.zw).xyz;
    r6.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    r9.xyz = tex2D(Texture2D_0, r5.zw).xyz;
    r0.xzw = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r5.yzw = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r3.zxy, r3.zxy);
    ps = r1.z;
    r0.y = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r2.xyz = r0.xzw * r2.www;
    r5.x = ps;
    ps = rsqrt(abs(r0.y));
    r0.x = dot(r9.zxy, r9.zxy);
    r0.y = ps;
    ps = rsqrt(abs(r6.w));
    r8.xyz = r0.yyy * r1.xyz;
    r6.w = ps;
    ps = 5.0 * r5.x;
    r1.yzw = r6.www * r3.xyz;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r0.x));
    r6.w = -r5.x + 1.0;
    r5.x = ps;
    r0.xy = -r6.ww * ModShadowGroupColor.xy + 1.0;
    ps = -UniformVector_0.x;
    r3.xyz = r5.xxx * r9.xyz;
    ps = 1.0 + ps;
    r5.x = dot(r3.zxy, r1.wyz);
    r1.x = ps;
    ps = -UniformVector_0.y;
    r9.xyz = r3.xzy * r5.xxx;
    r1.yzw = r9.xyz * 2.0 - r1.ywz;
    ps = 1.0 + ps;
    r6.w = saturate(dot(r8.zxy, r1.zyw));
    r1.y = ps;
    ps = log2(r6.w);
    r5.x = saturate(dot(r3.zxy, r8.zxy));
    r6.w = ps;
    ps = -UniformVector_0.z;
    r6 = r6 * float4(1.5, 1.5, 1.5, 15.0);
    ps = 1.0 + ps;
    r3.xyz = r6.xyz * r7.xyz;
    r1.z = ps;
    ps = pow(2.0, r6.w);
    r6.xyz = r3.xyz * r1.xyz;
    r4.z = ps;
    r1.xyz = r4.xyz * float3(0.875, 0.875, 0.21952);
    r6.xyz = r6.xyz * r5.xxx + r1.zzz;
    r0.xy = r1.xy * r0.xy + 0.125;
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
