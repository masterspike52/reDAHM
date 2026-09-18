// ps_c7ad0ab9533aeee9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 111 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001BC 10040800 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
sampler2D Texture2D_0 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r0.z = dot(r2.zxy, r2.zxy);
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.xy = r0.ww * ScreenPositionScaleBias.xy;
    r2.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r2.z = ps;
    r5.xy = r2.zw * abs(r5.xy);
    r2.xy = r2.xy * r4.xy + ScreenPositionScaleBias.wz;
    r2.xyz = tex2D(LightAttenuationTexture, r2.xy).xyz;
    r7.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r4.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r0.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.x));
    r0.y = saturate(-r0.z + 1.0);
    r0.w = ps;
    r4.x = saturate(r0.w * r1.z);
    ps = r1.z;
    r0.z = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = ps;
    ps = 5.0 * r0.x;
    r5.xyz = r5.xyz * r4.yzw;
    r0.x = saturate(ps);
    ps = rsqrt(abs(r0.z));
    r8.xyz = r0.www * r1.zxy;
    r0.z = ps;
    ps = 1.0 - r0.x;
    r3.xyz = r0.zzz * r3.xyz;
    r0.x = ps;
    r1.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r0.zw = -r3.xy;
    r0.x = r3.z * 2.0 - r3.z;
    ps = log2(r0.y);
    r0.x = saturate(dot(r8.yzx, r0.zwx));
    r0.y = ps;
    ps = log2(r0.x);
    r0.w = r0.y * LightColorAndFalloffExponent.w;
    r7.x = ps;
    r0.xyz = r7.yxz * float3(0.875, 15.0, 0.875);
    r0.xz = r0.xz * r1.xy + 0.125;
    ps = pow(2.0, r0.y);
    r0.x = r0.x * r0.z;
    r5.w = ps;
    r0.xyz = r0.xxx * r6.xyz + ModShadowColor.xyz;
    r1 = r5 * r4.xxxy;
    ps = pow(2.0, r0.w);
    r1.xyz = r1.xyw + r1.wwz;
    r0.w = ps;
    r1.xyz = r1.xyz * r0.www;
    r1.xyz = r1.xyz * r2.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
