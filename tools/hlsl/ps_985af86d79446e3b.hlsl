// ps_985af86d79446e3b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 129 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000204 10040A00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
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
sampler2D ShadowTexture : register(s1);
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
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r1.w = dot(r3.zxy, r3.zxy);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.zw = r0.zz * ScreenPositionScaleBias.xy;
    r6.y = ps;
    r0.zw = r0.zw * r4.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    r5.xy = r6.xy * abs(r5.xy);
    r6.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r7.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r9.y = tex2D(ShadowTexture, r0.xy).x;
    r9.zw = -UniformVector_0.xy + 1.0;
    ps = r1.z;
    r0.y = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r0.x = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r0.z = saturate(r0.z * 5.0);
    r0.y = ps;
    ps = 1.0 - r0.x;
    r9.x = saturate(r0.y * r1.z);
    r0.w = saturate(ps);
    ps = rsqrt(abs(r0.x));
    r8.xyz = r0.yyy * r1.zxy;
    r0.x = ps;
    ps = rsqrt(abs(r1.w));
    r10.xyz = r0.xxx * -SpotDirection.xyz;
    r0.y = ps;
    ps = log2(r0.w);
    r0.z = -r0.z + 1.0;
    r0.x = ps;
    r5.yz = -r0.zz * ModShadowGroupColor.xy + 1.0;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r1.xyw = r0.yyy * r3.xzy;
    r0.z = ps;
    r3.x = r1.y * 2.0 - r1.y;
    ps = -r1.x;
    r0.y = dot(r10.zxy, r2.zxy);
    r3.y = ps;
    ps = -r1.w;
    r1.xyz = r9.xxy * r9.zwy;
    r3.z = ps;
    ps = -SpotAngles.x - -r0.y;
    r0.w = saturate(dot(r8.yzx, r3.yzx));
    r0.x = ps;
    ps = log2(r0.w);
    r3.xyz = r1.zzz * r7.xyz;
    r0.y = ps;
    ps = SpotAngles.y * r0.x;
    r0.y = r0.y * 15.0;
    r2.x = saturate(ps);
    ps = pow(2.0, r0.y);
    r2.y = r2.x * r2.x;
    r6.x = ps;
    ps = pow(2.0, r0.z);
    r0.xyw = r6.yzx * float3(0.875, 0.875, 0.21952);
    r5.x = ps;
    r0.xyz = r0.xwy * r5.yxz;
    r1.z = r3.z * r0.y;
    r2.zw = r3.xy * r5.xx;
    ps = 0.125 + r0.x;
    r1.xy = r1.xy + r0.ww;
    r0.w = ps;
    ps = 0.125 + r0.z;
    r1.xy = r2.zw * r1.xy;
    r0.x = ps;
    r0.x = r0.w * r0.x;
    r0.xyz = r0.xxx * r4.xyz + ModShadowColor.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.yzw = r1.yzx * r2.yyx;
    r1.x = r1.w * r2.x;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
