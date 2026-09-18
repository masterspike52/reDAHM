// ps_bd2d65b28d7fcc14.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 90 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000168 10040600 00000606 00000000 000050C6 003F003F 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
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
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.x = dot(r4.zxy, r4.zxy);
    r0.x = 1.0 / r5.w;
    r0.xy = r0.xx * ScreenPositionScaleBias.xy;
    r0.w = 1.0 / ModShadowAccumResolution.y;
    r0.xy = r0.xy * r5.xy + ScreenPositionScaleBias.wz;
    r2.w = dot(r2.zxy, r2.zxy);
    r0.z = 1.0 / ModShadowAccumResolution.x;
    r0.zw = r0.zw * abs(r6.xy);
    r5.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r1.yzw = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r0.yzw = -UniformVector_0.xyz + 1.0;
    r0.x = r2.z + 0.1;
    r2.w = rsqrt(abs(r2.w));
    r3.xyz = r1.yzw * LightColor.xyz;
    r0.x = saturate(5.0 * r0.x);
    r6.xyz = r2.www * r2.zxy;
    r1.x = rsqrt(abs(r1.x));
    r1.xyz = r1.xxx * r4.zxy;
    r0.x = 1.0 - r0.x;
    r4.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r1.yz = -r1.yz;
    r1.x = r1.x * 2.0 - r1.x;
    r0.x = saturate(dot(r6.yzx, r1.yzx));
    r1.xyz = r0.yzw * UniformVector_1.xyz;
    r0.x = log2(r0.x);
    ps = 15.0 * r0.x;
    r0.yzw = -ModShadowColor.xyz + 1.0;
    r1.w = ps;
    ps = pow(2.0, r1.w);
    r0.x = saturate(r2.w * r2.z);
    r5.z = ps;
    r2.xyz = r5.xyz * float3(0.875, 0.875, 0.21952);
    r1.xyz = r1.xyz * r0.xxx + r2.zzz;
    r2.xy = r2.xy * r4.xy + 0.125;
    ps = r2.x * r2.y;
    r1.xyz = r3.xyz * r1.xyz;
    r0.x = ps;
    r0.xyz = r0.xxx * r0.yzw + ModShadowColor.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
