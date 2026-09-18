// ps_93c5f75617fd0e45.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 147 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000024C 10040B00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 ConstantLighting : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r0.wz * 1e+02;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    r6.xy = r6.xy * abs(r7.xy);
    r10.yw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r7.xyz = tex2D(Texture2D_0, r5.xy).xyz;
    r6.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.y = dot(r1.zxy, r1.zxy);
    ps = OpacityOverride.x;
    r5.w = dot(r3.zxy, r3.zxy);
    r10.z = saturate(ps);
    ps = -ModShadowColor.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r0.xyz = r9.xyz * r6.xyz;
    r8.x = ps;
    ps = -ModShadowColor.y;
    r5.x = dot(r7.zxy, r7.zxy);
    ps = 1.0 + ps;
    r11.xyz = r6.xyz * AmbientColorAndSkyFactor.xyz;
    r8.y = ps;
    ps = rsqrt(abs(r5.w));
    r6.xyz = r6.xyz + UniformVector_0.xyz;
    r5.w = ps;
    r9.xyz = r11.xyz * r9.xyz + r6.xyz;
    ps = rsqrt(abs(r5.z));
    r3.xyz = r5.www * r3.xyz;
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r4.xyz = r5.zzz * r4.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r5.yyy * r1.zxy;
    r5.x = ps;
    ps = -ModShadowColor.z;
    r5.yzw = r5.xxx * r7.xyz;
    ps = 1.0 + ps;
    r10.x = dot(r4.zxy, r5.wyz);
    r8.z = ps;
    ps = 0.1 - -r6.x;
    r6.w = dot(r5.wyz, r3.zxy);
    r5.x = ps;
    ps = ConstantLighting.x * r5.w;
    r5.x = saturate(r5.x * 5.0);
    r1.x = ps;
    ps = 1.0 - r5.x;
    r1.yzw = r5.yzw * r6.www;
    r5.z = ps;
    r4.xyz = r1.yzw * 2.0 - r3.xyz;
    ps = ModShadowGroupColor.x * r5.z;
    r3 = r10.xxyw * float4(-0.5, 0.5, 0.875, 0.875);
    r10.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1.yz = r3.xy + 0.5;
    r10.y = ps;
    ps = abs(r1.y) * abs(r1.y);
    r5.x = saturate(dot(r6.xyz, r4.zxy));
    r0.w = ps;
    ps = abs(r1.z) * abs(r1.z);
    r6.xyz = -r10.zxy + 1.0;
    r6.w = ps;
    ps = ConstantLighting.y * r5.w;
    r4.xyz = r0.xzy * r0.www;
    r1.y = ps;
    ps = log2(r5.x);
    r6.x = float((r6.x >= 0.004));
    r5.x = ps;
    r6.yz = r3.zw * r6.yz + 0.125;
    ps = 15.0 * r5.x;
    r3.xyz = r0.xzy * r6.www;
    r5.x = ps;
    r3.xyz = r3.xzy * UpperSkyColor.xyz + r9.xyz;
    ps = pow(2.0, r5.x);
    r6.y = r6.y * r6.z;
    r5.x = ps;
    r6.yzw = r6.yyy * r8.xyz + ModShadowColor.xyz;
    r3.xyz = r4.xyz * LowerSkyColor.xzy + r3.xzy;
    ps = ConstantLighting.z * r5.w;
    r4.xyz = r5.xxx * ConstantLighting.xzy;
    r1.z = ps;
    r5.xyz = r4.xyz * r7.xzy + r3.xyz;
    r5.xyz = r1.xyz * r0.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.x + r2.w;
    r5.xyz = r0.xyz * r6.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
