// ps_ba000f33b14f05ac.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10040A00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c5); // float3
float4 ModShadowAccumResolution : register(c8); // float2
float4 ModShadowColor : register(c6); // float3
float4 ModShadowGroupColor : register(c7); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D ShadowTexture : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.z = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xw = r6.xx * ScreenPositionScaleBias.xy;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = dot(r2.zxy, r2.zxy);
    r7.x = ps;
    r6.xw = r6.xw * r5.xy + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r6.xw).xyz;
    r6.w = tex2D(ShadowTexture, r0.xy).x;
    ps = 0.1 - -r2.z;
    r7.xy = r7.xy * abs(r8.xy);
    r6.x = ps;
    r8.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7 = tex2D(Texture2D_1, r1.xy).xywz;
    r5.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r10.xyz = r5.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r9.xyz = r7.xyw * UniformVector_1.xyz;
    r6.y = ps;
    r2.xyz = r6.yyy * r2.xyz;
    ps = 5.0 * r6.x;
    r0.w = dot(r10.zxy, r10.zxy);
    r6.x = saturate(ps);
    ps = rsqrt(abs(r6.z));
    r6.y = -r6.x + 1.0;
    r6.x = ps;
    r5.xy = -r6.yy * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r0.w));
    r6.xyz = r6.xxx * r4.xyz;
    r0.w = ps;
    r4.xyz = r10.xyz * r0.www;
    r0.w = dot(r4.zxy, r6.zxy);
    r10.xyz = r4.xzy * r0.www;
    r6.xyz = r10.xyz * 2.0 - r6.xzy;
    r6.x = saturate(dot(r2.zxy, r6.yxz));
    ps = log2(r6.x);
    r1.xyz = r9.xyz * r1.xyz;
    r8.z = ps;
    r6.xyz = r8.zxy * float3(15.0, 0.875, 0.875);
    r6.yz = r6.yz * r5.xy + 0.125;
    ps = pow(2.0, r6.x);
    r0.w = saturate(dot(r4.zxy, r2.zxy));
    r6.x = ps;
    ps = r6.x;
    r7.xyw = r1.xyz * r0.www;
    ps = r7.z * ps;
    r6.xw = r6.yw * r6.zw;
    r7.z = ps;
    r6.xyz = r6.xxx * r0.xyz + ModShadowColor.xyz;
    r7.xyz = r7.xyz + r7.zzw;
    r0.xyz = r6.www * r3.xyz;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xyz * LightColor.xyz;
    r6.xyz = r7.xyz * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
