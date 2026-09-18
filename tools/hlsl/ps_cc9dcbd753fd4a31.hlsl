// ps_cc9dcbd753fd4a31.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 162 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000288 10040C00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c10); // float4
float4 LowerSkyColor : register(c9); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 OpacityOverride : register(c7); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UpperSkyColor : register(c8); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord3 : TEXCOORD3; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord3;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = r0.xy * 2.0 + UniformVector_1.xy;
    r7.xy = r0.xy * 0.5 + UniformVector_2.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = dot(r4.zxy, r4.zxy);
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.w = ps;
    r7.zw = r7.zw * abs(r8.xy);
    r11.yz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r12.xyz = tex2D(Texture2D_0, r7.xy).xyz;
    r7.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r8.xyz = AmbientColorAndSkyFactor.xyz * UniformVector_3.xyz;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = dot(r2.zxy, r2.zxy);
    r6.y = dot(r5.zxy, r5.zxy);
    r9.xyz = r7.zxy * 4.0 - 4.0;
    ps = rsqrt(abs(r6.z));
    r7.yzw = r0.xyz * UniformVector_3.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r4.xyz = r6.zzz * r4.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r6.yzw = r6.yyy * r5.xyz;
    r6.x = ps;
    r5.xyz = r6.xxx * r2.xyz;
    r2.xyz = r12.zxy * 4.0 + r9.xyz;
    r7.x = dot(r2.xyz, r2.xyz);
    ps = rsqrt(abs(r7.x));
    r6.x = r5.z + 0.1;
    r7.x = ps;
    ps = OpacityOverride.x;
    r12.xyz = r2.xyz * r7.xxx;
    r2.z = saturate(ps);
    ps = 5.0 * r6.x;
    r9.xyz = r12.xxx * r1.xyz;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r11.x = dot(r6.wyz, r12.xyz);
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r6.x = dot(r12.xyz, r4.zxy);
    r2.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r6.xyw = r12.yzx * r6.xxx;
    r2.y = ps;
    r4.xyz = r6.xyw * 2.0 - r4.xyz;
    r6.xyz = -r2.xyz + 1.0;
    r2 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r7.x = float((r6.z >= 0.004));
    r6.zw = r2.zw * r6.xy + 0.125;
    r6.x = saturate(dot(r5.zxy, r4.zxy));
    ps = log2(r6.x);
    r2.xy = r2.xy + 0.5;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.y = r1.z * 0.21952;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r2.xw = abs(r2.yx) * abs(r2.yx);
    r6.x = ps;
    ps = 0.21952 * r6.x;
    r2.xyz = r7.ywz * r2.xxx;
    r0.w = ps;
    ps = r6.y * r6.x;
    r4.xyz = r7.ywz * r2.www;
    r5.z = ps;
    ps = r6.z * r6.w;
    r5.xy = r0.ww * r1.xy;
    r5.w = ps;
    r6.xyz = r5.www * r10.xyz + ModShadowColor.xyz;
    r7.yzw = r9.xyz * r7.yzw + r5.xyz;
    r7.yzw = r4.xzy * LowerSkyColor.xyz + r7.yzw;
    r7.yzw = r2.xzy * UpperSkyColor.xyz + r7.yzw;
    r7.yzw = r8.xyz * r0.xyz + r7.yzw;
    r7.yzw = r7.yzw + UniformVector_0.xyz;
    ps = -r3.w;
    r6.xyz = r7.yzw * r6.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.x + r3.w;
    r6.xyz = r0.xyz * r7.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
