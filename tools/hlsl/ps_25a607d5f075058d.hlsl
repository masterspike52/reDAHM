// ps_25a607d5f075058d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 102 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000198 10040800 00000806 00000000 00006908 00FF00FF 00000001 00003050 00003151 0000F252 0000F353 00007454 0000F555 00007656 0000F757
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r7 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c4); // float4
float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord4 : TEXCOORD4; // r4
    float4 texcoord5 : TEXCOORD5; // r5
    float4 texcoord6 : TEXCOORD6; // r6
    float4 texcoord7 : TEXCOORD7; // r7
    float2 vPos : VPOS;   // r8 (pixel parameters)
    float vFace : VFACE;  // r8
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
    float4 r3 = In.texcoord3;
    float4 r4 = In.texcoord4;
    float4 r5 = In.texcoord5;
    float4 r6 = In.texcoord6;
    float4 r7 = In.texcoord7;
    float4 r8 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r7.w;
    r0.x = r4.z + 0.1;
    r0.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.xy = r0.yy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r0.y = ps;
    r0.yz = r0.yz * abs(r8.xy);
    r1.xy = r1.xy * r7.xy + ScreenPositionScaleBias.wz;
    r1.xyz = tex2D(LightAttenuationTexture, r1.xy).xyz;
    r2.xy = tex2D(ModShadowAccumTexture, r0.yz).xy;
    ps = -UniformVector_0.x;
    r0.z = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r0.y = dot(r5.zxy, r5.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r0.z));
    r0.y = saturate(-r0.y + 1.0);
    r0.z = ps;
    ps = 5.0 * r0.x;
    r0.w = dot(r6.zxy, r6.zxy);
    r0.x = saturate(ps);
    ps = rsqrt(abs(r0.w));
    r7.xyz = r0.zzz * r4.zxy;
    r0.w = ps;
    ps = 1.0 - r0.x;
    r6.xyz = r0.www * r6.zxy;
    r0.x = ps;
    r5.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    ps = -UniformVector_0.y;
    r6.yz = -r6.yz;
    r6.x = r6.x * 2.0 - r6.x;
    ps = 1.0 + ps;
    r0.x = saturate(dot(r7.yzx, r6.yzx));
    r5.w = ps;
    ps = log2(r0.x);
    r4.w = saturate(r0.z * r4.z);
    r2.z = ps;
    ps = log2(r0.y);
    r4.xyz = r2.xyz * float3(0.875, 0.875, 15.0);
    r0.x = ps;
    ps = pow(2.0, r4.z);
    r0.y = r0.x * LightColorAndFalloffExponent.w;
    r0.x = ps;
    r0.zw = r4.xy * r5.xy + 0.125;
    ps = 0.21952 * r0.x;
    r2.z = ps;
    r2.xy = r4.ww * r5.zw + r2.zz;
    ps = pow(2.0, r0.y);
    r0.x = r0.z * r0.w;
    r0.w = ps;
    r0.xyz = r0.xxx * r3.xyz + ModShadowColor.xyz;
    r2.xyz = r2.xyz * r0.www;
    r1.xyz = r2.xyz * r1.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
