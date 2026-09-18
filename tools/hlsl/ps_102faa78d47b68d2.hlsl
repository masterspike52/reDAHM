// ps_102faa78d47b68d2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 156 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000270 10040E00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r9.yzw = tex2D(Texture2D_1, r0.xy).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r7.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r8.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_2, r0.xy).zxy;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = dot(r1.zxy, r1.zxy);
    r6.x = dot(r4.zxy, r4.zxy);
    ps = OpacityOverride.x;
    r0.xyz = r10.xyz * r5.yzx;
    r8.z = saturate(ps);
    r14.xyz = r8.wxy * 2.0 - 1.0;
    ps = AmbientColorAndSkyFactor.x * r5.y;
    r7.xyz = r7.xyz * float3(0.5, 3.0, 4.0);
    r11.x = ps;
    ps = rsqrt(abs(r6.y));
    r7.xyz = r7.xyz * r5.yzx;
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r8.xyw = r6.yyy * r3.xyz;
    r6.x = ps;
    ps = AmbientColorAndSkyFactor.y * r5.z;
    r3.xyz = r6.xxx * r4.xyz;
    r11.y = ps;
    ps = rsqrt(abs(r5.w));
    r5.y = dot(r14.xyz, r14.xyz);
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r6.xyz = r5.zzz * r1.xzy;
    r5.y = ps;
    ps = AmbientColorAndSkyFactor.z * r5.x;
    r5.yzw = r14.yzx * r5.yyy;
    r11.z = ps;
    ps = 0.1 - -r6.y;
    r13.x = dot(r3.zxy, r5.wyz);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r6.w = dot(r5.wyz, r8.wxy);
    r5.x = saturate(ps);
    ps = ConstantLighting.x * r5.w;
    r1.yzw = r5.yzw * r6.www;
    r1.x = ps;
    ps = 1.0 - r5.x;
    r3 = r13.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r5.z = ps;
    r1.yzw = r1.yzw * 2.0 - r8.xyw;
    ps = ModShadowGroupColor.x * r5.z;
    r6.y = saturate(dot(r6.yxz, r1.wyz));
    r8.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r6.xz = r3.xy + 0.5;
    r8.y = ps;
    ps = abs(r6.x) * abs(r6.x);
    r1.yzw = -r8.xyz + 1.0;
    r5.x = ps;
    ps = abs(r6.z) * abs(r6.z);
    r6.x = float((r1.w >= 0.004));
    r6.z = ps;
    r1.yz = r3.zw * r1.yz + 0.125;
    ps = r1.y * r1.z;
    r4.xyz = r0.xzy * r5.xxx;
    r5.x = ps;
    ps = log2(r6.y);
    r8.xyz = r0.xzy * r6.zzz;
    r9.x = ps;
    r6.yzw = r5.xxx * r12.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.y * r5.w;
    r3 = r9 * float4(3e+01, 0.05, 1.0, 0.01);
    r1.y = ps;
    ps = pow(2.0, r3.x);
    r9.xyz = r3.yzw + UniformVector_0.xyz;
    r5.x = ps;
    ps = ConstantLighting.z * r5.w;
    r3.xyz = r5.xxx * ConstantLighting.xzy;
    r1.z = ps;
    r5.xyz = r11.xyz * r10.xyz + r9.xyz;
    r5.xyz = r8.xyz * UpperSkyColor.xzy + r5.xzy;
    r5.xyz = r4.xzy * LowerSkyColor.xyz + r5.xzy;
    r5.xyz = r3.xyz * r7.xzy + r5.xzy;
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
