// ps_00986303133a5b27.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 129 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000204 10040B00 0000090A 00000000 00008129 007F01FF 00000001 00003050 0000F151 0000F252 00007354 0000F455 00007556 0000F657 0000F7A0 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
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
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ShadowTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord4 : TEXCOORD4; // r3
    float4 texcoord5 : TEXCOORD5; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
    float4 color0 : COLOR0; // r7
    float4 color2 : COLOR2; // r8
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
    float4 r3 = In.texcoord4;
    float4 r4 = In.texcoord5;
    float4 r5 = In.texcoord6;
    float4 r6 = In.texcoord7;
    float4 r7 = In.color0;
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r6.w;
    r7.z = dot(r5.zxy, r5.zxy);
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xw = r7.xx * ScreenPositionScaleBias.xy;
    r8.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.y = dot(r3.zxy, r3.zxy);
    r8.x = ps;
    r7.xw = r7.xw * r6.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r7.xw).xyz;
    r7.w = tex2D(ShadowTexture, r0.xy).x;
    ps = 0.1 - -r3.z;
    r8.xy = r8.xy * abs(r9.xy);
    r7.x = ps;
    r9.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r0.w = tex2D(Texture2D_1, r2.xy).w;
    r8 = tex2D(Texture2D_2, r1.xy).xywz;
    r2.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r11.xyz = r2.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.y));
    r10.xyz = r0.www * r8.xyw;
    r7.y = ps;
    r2.xyz = r7.yyy * r3.xyz;
    ps = 5.0 * r7.x;
    r0.w = dot(r11.zxy, r11.zxy);
    r7.x = saturate(ps);
    ps = rsqrt(abs(r7.z));
    r7.y = -r7.x + 1.0;
    r7.x = ps;
    r6.xy = -r7.yy * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r0.w));
    r7.xyz = r7.xxx * r5.xyz;
    r0.w = ps;
    r3.xyz = r11.xyz * r0.www;
    r0.w = dot(r3.zxy, r7.zxy);
    r5.xyz = r3.xzy * r0.www;
    r7.xyz = r5.xyz * 2.0 - r7.xzy;
    r7.x = saturate(dot(r2.zxy, r7.yxz));
    ps = log2(r7.x);
    r1.xyz = r10.xyz * r1.xyz;
    r9.z = ps;
    r7.xyz = r9.zxy * float3(15.0, 0.875, 0.875);
    r7.yz = r7.yz * r6.xy + 0.125;
    ps = pow(2.0, r7.x);
    r0.w = saturate(dot(r3.zxy, r2.zxy));
    r7.x = ps;
    ps = r7.x;
    r8.xyw = r1.xyz * r0.www;
    ps = r8.z * ps;
    r7.xw = r7.yw * r7.zw;
    r8.z = ps;
    r7.xyz = r7.xxx * r0.xyz + ModShadowColor.xyz;
    r8.xyz = r8.xyz + r8.zzw;
    r0.xyz = r7.www * r4.xyz;
    r8.xyz = r0.xyz * r8.xyz;
    r8.xyz = r8.xyz * LightColor.xyz;
    r7.xyz = r8.xyz * r7.xyz;
    oC0.xyz = r7.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
