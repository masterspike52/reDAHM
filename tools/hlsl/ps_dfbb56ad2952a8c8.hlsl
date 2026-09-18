// ps_dfbb56ad2952a8c8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 96 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000180 10040800 0000060A 00000000 000058C6 000F003F 00000001 00007054 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
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
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord4 : TEXCOORD4; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 color0 : COLOR0; // r4
    float4 color2 : COLOR2; // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord4;
    float4 r1 = In.texcoord5;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r4.x = r0.z + 0.1;
    r4.y = 1.0 / r3.w;
    r4.yz = r4.yy * ScreenPositionScaleBias.xy;
    r5.y = 1.0 / ModShadowAccumResolution.y;
    r4.zw = r4.yz * r3.xy + ScreenPositionScaleBias.wz;
    r4.y = dot(r0.zxy, r0.zxy);
    r5.x = 1.0 / ModShadowAccumResolution.x;
    r5.xy = r5.xy * abs(r6.xy);
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r6.xyz = tex2D(LightAttenuationTexture, r4.zw).xyz;
    r6.w = -UniformVector_0.x + 1.0;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r4.z = rsqrt(abs(r4.y));
    ps = 5.0 * r4.x;
    r4.y = dot(r2.zxy, r2.zxy);
    r4.x = saturate(ps);
    ps = rsqrt(abs(r4.y));
    r7.xyz = r4.zzz * r0.zxy;
    r4.y = ps;
    ps = 1.0 - r4.x;
    r8.xyz = r4.yyy * r2.xyz;
    r4.x = ps;
    r2.xy = -r4.xx * ModShadowGroupColor.xy + 1.0;
    r4.yw = -r8.xy;
    r4.x = r8.z * 2.0 - r8.z;
    r5.z = saturate(dot(r7.yzx, r4.ywx));
    ps = log2(r5.z);
    r4.xyw = r6.yxz * float3(0.21952, 1.0, 1.0);
    r5.z = ps;
    r5.xyz = r5.xyz * float3(0.875, 0.875, 15.0);
    r6.yz = r5.xy * r2.xy + 0.125;
    ps = pow(2.0, r5.z);
    r6.x = saturate(r4.z * r0.z);
    r4.z = ps;
    ps = 0.21952 * r4.z;
    r0.xyz = r4.ywx * r1.www;
    r5.y = ps;
    ps = 1.0 * r4.z;
    r4.xw = r6.yx * r6.zw;
    r5.z = ps;
    r4.xyz = r4.xxx * r3.xyz + ModShadowColor.xyz;
    r5.x = r4.w + r5.y;
    r5.xyz = r0.xzy * r5.xzy;
    r5.xyz = r5.xzy * LightColor.xzy;
    r4.xyz = r5.xzy * r4.xyz;
    oC0.xyz = r4.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
