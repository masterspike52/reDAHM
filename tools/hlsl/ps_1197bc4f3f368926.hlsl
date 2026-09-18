// ps_1197bc4f3f368926.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 132 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000210 10040B00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_3 : register(s2);
sampler2D Texture2D_4 : register(s3);
sampler2D ShadowTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xw = r6.xx * ScreenPositionScaleBias.xy;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = ps;
    r6.yz = r6.yz * abs(r8.xy);
    r6.xw = r6.xw * r5.xy + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r6.xw).xyz;
    r6.x = tex2D(ShadowTexture, r0.xy).x;
    r7.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r8.yz = tex2D(ModShadowAccumTexture, r6.yz).xy;
    r0.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r5.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    ps = r2.z;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.w));
    r6.z = dot(r2.zxy, r2.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r6.y = saturate(r6.y * 5.0);
    r7.w = ps;
    ps = r7.w;
    r6.z = dot(r5.zxy, r5.zxy);
    ps = r2.x * ps;
    r10.xyz = r6.www * r4.xyz;
    r4.x = ps;
    ps = rsqrt(abs(r6.z));
    r6.y = -r6.y + 1.0;
    r6.w = ps;
    r6.yz = -r6.yy * ModShadowGroupColor.xy + 1.0;
    ps = r7.w;
    r4.yzw = r6.www * r5.xyz;
    ps = r2.y * ps;
    r5.xyz = r4.yzw * TwoSidedSign.xxx;
    r4.y = ps;
    ps = r7.w;
    r6.w = dot(r5.zxy, r10.zxy);
    ps = r2.z * ps;
    r11.xyz = r5.xzy * r6.www;
    r4.z = ps;
    r2.xyz = r11.xyz * 2.0 - r10.xzy;
    r6.w = saturate(dot(r4.zxy, r2.yxz));
    ps = log2(r6.w);
    r0.xyz = r1.xyz * r0.xyz;
    r8.x = ps;
    r1.xyz = r8.xyz * float3(15.0, 0.875, 0.875);
    r6.yz = r1.yz * r6.yz + 0.125;
    ps = pow(2.0, r1.x);
    r6.w = saturate(dot(r5.zxy, r4.zxy));
    r7.w = ps;
    r7.xyz = r7.www * r7.xyz;
    r7.xy = r0.xy * r6.ww + r7.xy;
    r7.z = r0.z * r6.w + r7.z;
    r6.xw = r6.yx * r6.zx;
    r6.xyz = r6.xxx * r9.xyz + ModShadowColor.xyz;
    r0.xyz = r6.www * r3.xyz;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xzy * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
