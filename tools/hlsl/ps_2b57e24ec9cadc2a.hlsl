// ps_2b57e24ec9cadc2a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 111 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001BC 10040800 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c4); // float3
float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D ShadowTexture : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.x = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r6.yy * ScreenPositionScaleBias.xy;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    r6.yz = r6.yz * abs(r8.xy);
    r0.zw = r7.xy * r5.xy + ScreenPositionScaleBias.wz;
    r7.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r1.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r0.x = tex2D(ShadowTexture, r0.xy).x;
    r6.yz = tex2D(ModShadowAccumTexture, r6.yz).xy;
    ps = rsqrt(abs(r6.x));
    r0.yz = r6.yz * 0.875;
    r6.z = ps;
    r6.w = saturate(r6.z * r2.z);
    ps = r2.z;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r6.y = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r6.y));
    r8.xyz = r6.zzz * r2.zxy;
    r6.y = ps;
    ps = 5.0 * r6.x;
    r2.xyz = r6.yyy * r4.zxy;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r2.yz = -r2.yz;
    r6.x = ps;
    r2.x = r2.x * 2.0 - r2.x;
    r6.xy = -r6.xx * ModShadowGroupColor.xy + 1.0;
    r0.yz = r0.yz * r6.xy + 0.125;
    r7.x = saturate(dot(r8.yzx, r2.yzx));
    r0.xy = r0.xy * r0.xz;
    r6.xyz = r0.yyy * r5.xyz + ModShadowColor.xyz;
    ps = log2(r7.x);
    r0.xyz = r0.xxx * r1.xyz;
    r7.x = ps;
    r7 = r7 * float4(15.0, 3.0, 3.0, 3.0);
    ps = pow(2.0, r7.x);
    r1.xyz = r7.yzw * r3.xyz;
    r7.x = ps;
    r7.xyz = r7.yzw * r7.xxx;
    r7.xy = r1.xy * r6.ww + r7.xy;
    r7.z = r1.z * r6.w + r7.z;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xzy * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
