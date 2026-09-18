// ps_d90fa453c7c93b21.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 132 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000210 10040B00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xy = -UniformVector_0.xy + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r9.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r7.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r5.yw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = -UniformVector_0.z;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r5.x = dot(r1.zxy, r1.zxy);
    r6.z = ps;
    ps = r1.z;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r8.zw = r5.yw * 0.875;
    r5.y = ps;
    r11.xyz = r6.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r6.xy = r7.yz * float2(0.5, 3.0);
    r5.w = ps;
    ps = rsqrt(abs(r5.x));
    r5.y = saturate(r5.y * 5.0);
    r5.z = ps;
    ps = 1.0 - r5.y;
    r0.xyz = r9.xyz * r2.www;
    r5.x = ps;
    ps = r5.z;
    r9.xyz = r5.www * r3.xyz;
    ps = r1.x * ps;
    r5.y = dot(r11.zxy, r11.zxy);
    r2.x = ps;
    ps = rsqrt(abs(r5.y));
    r6.xyz = r6.xyz * r4.xyz;
    r5.w = ps;
    r5.xy = -r5.xx * ModShadowGroupColor.xy + 1.0;
    r5.xy = r8.zw * r5.xy + 0.125;
    ps = r5.z;
    r3.xyz = r11.xyz * r5.www;
    ps = r1.y * ps;
    r5.w = dot(r3.zxy, r9.zxy);
    r2.y = ps;
    ps = r5.z;
    r5.x = r5.x * r5.y;
    r5.xyz = r5.xxx * r10.xyz + ModShadowColor.xyz;
    ps = r1.z * ps;
    r10.xyz = r3.xzy * r5.www;
    r2.z = ps;
    r1.xyz = r10.xyz * 2.0 - r9.xzy;
    r5.w = saturate(dot(r2.zxy, r1.yxz));
    ps = log2(r5.w);
    r1.y = saturate(dot(r3.zxy, r2.zxy));
    r7.x = ps;
    r8.zw = r7.wx * float2(4.0, 3e+01);
    ps = pow(2.0, r8.w);
    r2.xyz = r8.xyz * r4.xyz;
    r1.x = ps;
    r6.xyz = r6.xyz * r1.xxy;
    r6.xyz = r2.xyz * r1.yyx + r6.xyz;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColor.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
