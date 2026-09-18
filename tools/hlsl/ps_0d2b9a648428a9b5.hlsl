// ps_0d2b9a648428a9b5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10040A00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c4); // float4
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c6); // float2
float4 SpotDirection : register(c5); // float3
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.zw = r0.zz * ScreenPositionScaleBias.xy;
    r6.y = ps;
    r4.xy = r0.zw * r4.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = r1.z + 0.1;
    r6.x = ps;
    r4.zw = r6.xy * abs(r5.xy);
    r5 = tex2D(Texture2D_1, r0.xy);
    r7.yz = tex2D(ModShadowAccumTexture, r4.zw).xy;
    r8.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = -UniformVector_0.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r0.y = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    ps = -UniformVector_0.y;
    r0.z = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r0.x = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    r10.xyz = r9.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r8.xyz = r8.xyz * r2.www;
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r1.xyz = r0.zzz * r1.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r9.xyz = r0.yyy * r3.xyz;
    r0.y = ps;
    ps = 1.0 - r0.x;
    r3.xyz = r0.yyy * -SpotDirection.xyz;
    r0.x = saturate(ps);
    ps = 5.0 * r0.w;
    r1.w = dot(r10.zxy, r10.zxy);
    r0.y = saturate(ps);
    ps = log2(r0.x);
    r0.y = -r0.y + 1.0;
    r0.x = ps;
    r0.zw = -r0.yy * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r1.w));
    r0.y = dot(r3.zxy, r2.zxy);
    r1.w = ps;
    ps = -UniformVector_0.z;
    r3.xyz = r10.xyz * r1.www;
    ps = 1.0 + ps;
    r1.w = dot(r3.zxy, r9.zxy);
    r6.z = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r2.xyz = r3.xzy * r1.www;
    r1.w = ps;
    r2.xyz = r2.xyz * 2.0 - r9.xzy;
    ps = -SpotAngles.x - -r0.y;
    r2.x = saturate(dot(r1.zxy, r2.yxz));
    r0.x = ps;
    ps = log2(r2.x);
    r0.x = saturate(r0.x * SpotAngles.y);
    r7.x = ps;
    ps = pow(2.0, r1.w);
    r7.xyz = r7.xyz * float3(15.0, 0.875, 0.875);
    r0.y = ps;
    ps = pow(2.0, r7.x);
    r2.xyz = r8.xzy * r0.yyy;
    r6.w = ps;
    r0.yz = r7.yz * r0.zw + 0.125;
    ps = r0.x * r0.x;
    r2.w = saturate(dot(r3.zxy, r1.zxy));
    r0.w = ps;
    ps = r0.y * r0.z;
    r1 = r6 * r5;
    r0.x = ps;
    r0.xyz = r0.xxx * r4.xyz + ModShadowColor.xyz;
    r1.xy = r1.xy * r2.ww + r1.ww;
    r1.z = r1.z * r2.w + r1.w;
    r1.xyz = r2.xzy * r1.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r1.xzy * r0.www;
    r0.xyz = r1.xzy * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
