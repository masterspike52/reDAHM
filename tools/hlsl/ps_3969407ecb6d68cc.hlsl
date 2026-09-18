// ps_3969407ecb6d68cc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 108 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001B0 10040800 0000060A 00000000 000058C6 000F003F 00000001 00007054 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
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

    ps = 1.0 / r3.w;
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.xy = r4.xx * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r5.xy = r4.xy * r3.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.xzw = -ModShadowColor.xyz + 1.0;
    r5.z = ps;
    r5.zw = r5.zw * abs(r6.xy);
    r7.xy = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r6.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    ps = -UniformVector_0.x;
    r5.y = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r5.x = dot(r0.zxy, r0.zxy);
    r3.w = ps;
    ps = r0.z;
    r3.xy = -UniformVector_0.yz + 1.0;
    ps = 0.1 + ps;
    r4.y = dot(r1.zxy, r1.zxy);
    r5.z = ps;
    ps = 1.0 - r4.y;
    r3.yz = r3.xy * float2(0.5, 0.1);
    r5.w = saturate(ps);
    ps = rsqrt(abs(r5.x));
    r4.y = saturate(r5.z * 5.0);
    r5.x = ps;
    ps = 1.0 - r4.y;
    r6.xyz = r6.xyz * r1.www;
    r4.y = ps;
    ps = rsqrt(abs(r5.y));
    r8.xyz = r5.xxx * r0.zxy;
    r5.y = ps;
    ps = r5.x;
    r1.xyz = r5.yyy * r2.zxy;
    r5.xy = -r4.yy * ModShadowGroupColor.xy + 1.0;
    ps = r0.z * ps;
    r1.yz = -r1.yz;
    r3.x = saturate(ps);
    r1.x = r1.x * 2.0 - r1.x;
    ps = log2(r5.w);
    r5.z = saturate(dot(r8.yzx, r1.yzx));
    r4.y = ps;
    ps = log2(r5.z);
    r4.y = r4.y * LightColorAndFalloffExponent.w;
    r7.z = ps;
    ps = pow(2.0, r4.y);
    r1.xyz = r7.xyz * float3(0.875, 0.875, 15.0);
    r4.y = ps;
    ps = pow(2.0, r1.z);
    r0.xyz = r6.xyz * r4.yyy;
    r4.y = ps;
    r5.zw = r1.xy * r5.xy + 0.125;
    ps = r5.z * r5.w;
    r5.xy = r4.yy * float2(0.3, 0.6);
    r4.y = ps;
    r4.xyz = r4.yyy * r4.xzw + ModShadowColor.xyz;
    r5.xyz = r3.xyz * r3.wxx + r5.xyx;
    r5.xyz = r0.xyz * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r4.xyz = r5.xyz * r4.xyz;
    oC0.xyz = r4.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
