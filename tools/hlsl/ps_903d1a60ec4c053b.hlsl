// ps_903d1a60ec4c053b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 135 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000021C 10040800 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
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

    r6.xy = r1.xy * 2.0 + UniformVector_1.xy;
    r7.xy = r1.xy * 0.5 + UniformVector_2.xy;
    ps = 1.0 / r5.w;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r6.zz * ScreenPositionScaleBias.xy;
    r7.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r7.z = ps;
    r7.zw = r7.zw * abs(r8.xy);
    r6.zw = r6.zw * r5.xy + ScreenPositionScaleBias.wz;
    r1.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r6.w = tex2D(ShadowTexture, r0.xy).x;
    r0.yz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r5.xyz = tex2D(Texture2D_0, r7.xy).xyz;
    r7.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    ps = r2.z;
    r0.x = dot(r4.zxy, r4.zxy);
    ps = 0.1 + ps;
    r6.y = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    r7.xyz = r7.xyz * 4.0 - 4.0;
    ps = rsqrt(abs(r6.y));
    r6.x = saturate(r6.x * 5.0);
    r6.y = ps;
    ps = -UniformVector_0.x;
    r2.xyz = r6.yyy * r2.xyz;
    r7.yzw = r5.xyz * 4.0 + r7.xyz;
    ps = 1.0 + ps;
    r6.x = -r6.x + 1.0;
    r7.x = ps;
    r6.yz = -r6.xx * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r0.x));
    r6.x = dot(r7.wyz, r7.wyz);
    r0.x = ps;
    ps = rsqrt(abs(r6.x));
    r5.xyz = r0.xxx * r4.xyz;
    r6.x = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r7.yzw * r6.xxx;
    ps = 1.0 + ps;
    r6.x = dot(r4.zxy, r5.zxy);
    r7.y = ps;
    ps = -UniformVector_0.z;
    r8.xyz = r4.xzy * r6.xxx;
    r5.xyz = r8.xyz * 2.0 - r5.xzy;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r2.zxy, r5.yxz));
    r7.z = ps;
    ps = log2(r6.x);
    r7.xyz = r7.xyz * UniformVector_3.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r7.w = ps;
    ps = pow(2.0, r7.w);
    r6.x = saturate(dot(r4.zxy, r2.zxy));
    r0.x = ps;
    r0.xyz = r0.xyz * float3(0.21952, 0.875, 0.875);
    r7.xyz = r7.xyz * r6.xxx + r0.xxx;
    r6.yz = r0.yz * r6.yz + 0.125;
    r6.xw = r6.yw * r6.zw;
    r6.xyz = r6.xxx * r3.xyz + ModShadowColor.xyz;
    r0.xyz = r6.www * r1.xyz;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xyz * LightColor.xyz;
    r6.xyz = r7.xyz * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
