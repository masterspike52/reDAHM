// ps_b6cb3e1e58dc6c07.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 10040C00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r12.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_1, r0.xy).zxy;
    ps = OpacityOverride.x;
    r0.x = dot(r4.zxy, r4.zxy);
    r11.w = saturate(ps);
    ps = ConstantLighting.z;
    r0.y = dot(r3.zxy, r3.zxy);
    ps = 0.21952 * ps;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r11.x = ps;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r9.xyz = r7.xyz * r6.yzx;
    r8.x = ps;
    ps = rsqrt(abs(r0.y));
    r5.w = dot(r5.zxy, r5.zxy);
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r3.yzw = r0.yyy * r3.xyz;
    r0.x = ps;
    ps = rsqrt(abs(r6.w));
    r4.xyz = r0.xxx * r4.xyz;
    r6.w = ps;
    ps = rsqrt(abs(r5.w));
    r0.xyz = r6.www * r1.xzy;
    r5.w = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r5.xyw = r5.www * r5.xyz;
    r8.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r12.x = dot(r4.zxy, r5.wxy);
    r8.z = ps;
    ps = 0.1 - -r0.y;
    r6.x = dot(r5.wxy, r3.wyz);
    r5.z = ps;
    ps = ConstantLighting.x * r5.w;
    r5.z = saturate(r5.z * 5.0);
    r3.x = ps;
    ps = 1.0 - r5.z;
    r6.xyz = r5.xyw * r6.xxx;
    r5.z = ps;
    r6.xyz = r6.xyz * 2.0 - r3.yzw;
    ps = ModShadowGroupColor.x * r5.z;
    r1 = r12.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r11.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1.xy = r1.xy + 0.5;
    r11.z = ps;
    ps = abs(r1.x) * abs(r1.x);
    r5.z = saturate(dot(r0.yxz, r6.zxy));
    r6.w = ps;
    ps = abs(r1.y) * abs(r1.y);
    r6.xyz = -r11.yzw + 1.0;
    r0.x = ps;
    ps = log2(r5.z);
    r0.xyz = r9.xzy * r0.xxx;
    r5.z = ps;
    r11.yz = r1.zw * r6.xy + 0.125;
    ps = ConstantLighting.y * r5.w;
    r5.z = r5.z * 15.0;
    r3.y = ps;
    ps = pow(2.0, r5.z);
    r1.xyz = r9.xzy * r6.www;
    r11.w = ps;
    ps = ConstantLighting.z * r5.w;
    r5.z = r11.w * 0.21952;
    r3.z = ps;
    ps = ConstantLighting.x * r5.z;
    r5.w = float((r6.z >= 0.004));
    r6.x = ps;
    ps = ConstantLighting.y * r5.z;
    r6.zw = r11.xy * r11.wz;
    r6.y = ps;
    r5.xyz = r6.www * r10.xyz + ModShadowColor.xyz;
    r6.xyz = r3.xyz * r9.xyz + r6.xyz;
    r6.xyz = r1.xzy * LowerSkyColor.xyz + r6.xyz;
    r6.xyz = r0.xzy * UpperSkyColor.xyz + r6.xyz;
    r6.xyz = r8.xyz * r7.xyz + r6.xyz;
    r6.xyz = r6.xyz + UniformVector_0.xyz;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
