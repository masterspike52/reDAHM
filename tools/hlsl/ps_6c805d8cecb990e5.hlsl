// ps_6c805d8cecb990e5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 132 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000210 10040B00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c5); // float4
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
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.w = dot(r1.zxy, r1.zxy);
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r4.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r5.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r8.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r9.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    ps = r1.z;
    r3.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r0.w = dot(r2.zxy, r2.zxy);
    r2.y = ps;
    ps = rsqrt(abs(r3.w));
    r0.w = saturate(-r0.w + 1.0);
    r2.x = ps;
    ps = rsqrt(abs(r1.w));
    r3.w = saturate(r2.y * 5.0);
    r2.w = ps;
    ps = r2.w;
    r1.w = dot(r6.zxy, r6.zxy);
    ps = r1.x * ps;
    r2.xyz = r2.xxx * r3.xyz;
    r3.x = ps;
    ps = rsqrt(abs(r1.w));
    r3.y = -r3.w + 1.0;
    r1.w = ps;
    r7.xy = -r3.yy * ModShadowGroupColor.xy + 1.0;
    ps = r2.w;
    r3.yzw = r1.www * r6.xyz;
    ps = r1.y * ps;
    r6.xyz = r3.yzw * TwoSidedSign.xxx;
    r3.y = ps;
    ps = r2.w;
    r1.w = dot(r6.zxy, r2.zxy);
    ps = r1.z * ps;
    r11.xyz = r6.xzy * r1.www;
    r3.z = ps;
    r1.xyz = r11.xyz * 2.0 - r2.xzy;
    r1.x = saturate(dot(r3.zxy, r1.yxz));
    ps = log2(r1.x);
    r2.xyz = r10.xyz * r9.xyz;
    r8.z = ps;
    ps = log2(r0.w);
    r1.xyz = r8.zxy * float3(15.0, 0.875, 0.875);
    r0.w = ps;
    ps = pow(2.0, r1.x);
    r0.w = r0.w * LightColorAndFalloffExponent.w;
    r1.x = ps;
    r1.yz = r1.yz * r7.xy + 0.125;
    ps = r1.y * r1.z;
    r1.w = saturate(dot(r6.zxy, r3.zxy));
    r2.w = ps;
    ps = pow(2.0, r0.w);
    r1.xyz = r1.xxx * r5.xyz;
    r0.w = ps;
    r0.xyz = r2.www * r0.xyz + ModShadowColor.xyz;
    r1.xy = r2.xy * r1.ww + r1.xy;
    r1.z = r2.z * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.www;
    r1.xyz = r1.xyz * r4.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
