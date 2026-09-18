// ps_e807e5ea05237e24.bin
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

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 ConstantLighting : register(c9); // float3
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
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

    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r11.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.xyw = tex2D(Texture2D_1, r0.xy).zxy;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = dot(r1.zxy, r1.zxy);
    r5.z = dot(r4.zxy, r4.zxy);
    r7.xyz = r8.xyz * r5.ywx;
    r10.xyz = r10.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r0.xyz = r5.ywx * AmbientColorAndSkyFactor.xyz;
    r6.y = ps;
    r8.xyz = r0.xyz * r8.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r5.z));
    r0.xyz = r6.yyy * r3.xyz;
    r5.z = ps;
    ps = OpacityOverride.x;
    r3.yzw = r5.zzz * r4.xyz;
    r4.z = saturate(ps);
    ps = rsqrt(abs(r6.x));
    r5.z = dot(r10.xyz, r10.xyz);
    r6.x = ps;
    ps = rsqrt(abs(r5.z));
    r6.xyz = r6.xxx * r1.zxy;
    r5.z = ps;
    ps = UniformVector_1.x * r5.y;
    r1.xyz = r10.xyz * r5.zzz;
    r3.x = ps;
    ps = 0.1 - -r6.x;
    r11.x = dot(r3.wyz, r1.xyz);
    r5.y = ps;
    ps = 5.0 * r5.y;
    r6.w = dot(r1.xyz, r0.zxy);
    r5.z = saturate(ps);
    ps = UniformVector_1.z * r5.x;
    r5.z = -r5.z + 1.0;
    r3.y = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r10.xyz = r1.yzx * r6.www;
    r4.x = ps;
    r10.xyz = r10.xyz * 2.0 - r0.xyz;
    ps = ModShadowGroupColor.y * r5.z;
    r0 = r11.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r4.y = ps;
    ps = r0.y;
    r1.xyz = r1.xxx * ConstantLighting.xyz;
    r5.x = ps;
    ps = 0.5 + r5.x;
    r5.z = saturate(dot(r6.xyz, r10.zxy));
    r3.z = ps;
    ps = 0.5 + r0.x;
    r6.xyz = -r4.zxy + 1.0;
    r3.w = ps;
    r6.yz = r0.zw * r6.yz + 0.125;
    ps = log2(r5.z);
    r0.xy = abs(r3.zw) * abs(r3.zw);
    r5.x = ps;
    ps = 15.0 * r5.x;
    r6.x = float((r6.x >= 0.004));
    r5.z = ps;
    ps = r6.y * r6.z;
    r4.xyz = r7.xzy * r0.xxx;
    r6.y = ps;
    r6.yzw = r6.yyy * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r5.z);
    r0.xyz = r7.xzy * r0.yyy;
    r5.z = ps;
    r0.xyz = r0.xyz * UpperSkyColor.xzy + r8.xzy;
    r0.xyz = r4.xzy * LowerSkyColor.xyz + r0.xzy;
    ps = UniformVector_1.y * r5.w;
    r4.xyz = r5.zzz * ConstantLighting.xzy;
    r3.z = ps;
    r5.xyz = r4.xyz * r3.xyz + r0.xzy;
    r5.xyz = r1.xyz * r7.xyz + r5.xzy;
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
