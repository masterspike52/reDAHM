// ps_a0e67f59a0848036.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 150 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000258 10040B00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
sampler2D Texture2D_2 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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

    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r10.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r7.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = dot(r1.zxy, r1.zxy);
    r6.y = dot(r4.zxy, r4.zxy);
    r0.xyz = r9.xyz * r11.xyz;
    r5.w = dot(r5.zxy, r5.zxy);
    ps = rsqrt(abs(r6.z));
    r11.xyz = r11.xyz * AmbientColorAndSkyFactor.xyz;
    r6.z = ps;
    r9.xyz = r11.xyz * r9.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r6.y));
    r3.xyw = r6.zzz * r3.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r4.xyz = r6.yyy * r4.xyz;
    r6.x = ps;
    ps = rsqrt(abs(r5.w));
    r6.yzw = r6.xxx * r1.xyz;
    r5.w = ps;
    r5.xyw = r5.www * r5.xyz;
    r7.x = dot(r4.zxy, r5.wxy);
    ps = 0.1 - -r6.w;
    r5.z = dot(r5.wxy, r3.wxy);
    r6.x = ps;
    ps = OpacityOverride.x;
    r6.x = saturate(r6.x * 5.0);
    r3.z = saturate(ps);
    ps = 1.0 - r6.x;
    r1.xyz = r5.xyw * r5.zzz;
    r5.z = ps;
    r4.xyz = r1.xyz * 2.0 - r3.xyw;
    ps = ModShadowGroupColor.x * r5.z;
    r1 = r7.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r3.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1.xy = r1.xy + 0.5;
    r3.y = ps;
    ps = abs(r1.x) * abs(r1.x);
    r5.z = saturate(dot(r6.wyz, r4.zxy));
    r0.w = ps;
    ps = abs(r1.y) * abs(r1.y);
    r6.xyz = -r3.zxy + 1.0;
    r6.w = ps;
    r7.xyz = r0.xzy * r0.www;
    r6.yz = r1.zw * r6.yz + 0.125;
    ps = log2(r5.z);
    r1.yzw = r0.xzy * r6.www;
    r10.w = ps;
    ps = ConstantLighting.x * r5.w;
    r4 = r10 * float4(3.5, 3.5, 3.5, 15.0);
    r1.x = ps;
    r3.xyz = r1.yzw * UpperSkyColor.xzy + r9.xzy;
    ps = ConstantLighting.y * r5.w;
    r5.z = r6.y * r6.z;
    r1.y = ps;
    r6.yzw = r5.zzz * r8.xyz + ModShadowColor.xyz;
    r3.xyz = r7.xzy * LowerSkyColor.xyz + r3.xzy;
    ps = pow(2.0, r4.w);
    r6.x = float((r6.x >= 0.004));
    r5.z = ps;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r5.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r5.xyz = r7.xyz * r4.xzy + r3.xzy;
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
