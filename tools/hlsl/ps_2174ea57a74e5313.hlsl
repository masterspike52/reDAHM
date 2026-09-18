// ps_2174ea57a74e5313.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 180 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002D0 10040C00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c11); // float4
float4 LowerSkyColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_3 : register(c7); // float4
float4 UpperSkyColor : register(c9); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r0.xy + UniformVector_2.xy;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r0.xy + UniformVector_1.xy;
    r7.y = ps;
    r7.xy = r7.xy * abs(r8.xy);
    r10.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7.xyz = tex2D(Texture2D_0, r6.zw).xyz;
    r9.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = dot(r2.zxy, r2.zxy);
    r7.w = dot(r5.zxy, r5.zxy);
    r0.w = dot(r4.zxy, r4.zxy);
    r6.xyz = r6.zxy * 2.0 - 2.0;
    ps = rsqrt(abs(r0.w));
    r12.xyz = r11.xyz * UniformVector_3.xyz;
    r0.w = ps;
    ps = rsqrt(abs(r7.w));
    r4.xyz = r0.www * r4.xyz;
    r7.w = ps;
    r11.xyz = r7.www * r5.xyz;
    ps = rsqrt(abs(r6.w));
    r9.xyz = r12.xyz * r9.xyz;
    r6.w = ps;
    r5.xyz = r6.www * r2.xyz;
    r7.xyz = r7.zxy * 2.0 + r6.xyz;
    ps = OpacityOverride.x;
    r6.z = dot(r7.xyz, r7.xyz);
    r6.y = saturate(ps);
    ps = rsqrt(abs(r6.z));
    r6.x = r5.z + 0.1;
    r6.z = ps;
    ps = 5.0 * r6.x;
    r7.xyz = r7.xyz * r6.zzz;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r6.z = dot(r7.xyz, r7.xyz);
    r6.x = ps;
    ps = rsqrt(abs(r6.z));
    r6.xw = r6.xx * ModShadowGroupColor.xy;
    r6.z = ps;
    ps = 1.0 - r6.x;
    r0.xyz = r9.xyz * r0.xyz;
    r9.x = ps;
    ps = 1.0 - r6.w;
    r7.xyz = r7.xyz * r6.zzz;
    r9.y = ps;
    ps = 1.0 - r6.y;
    r2.xyz = r7.xyz * TwoSidedSign.xxx;
    r9.z = ps;
    r7.x = float((r9.z >= 0.004));
    r7.yzw = r2.xxx * r1.xyz;
    r10.x = dot(r11.zxy, r2.xyz);
    r6.x = dot(r2.xyz, r4.zxy);
    r6.xyz = r2.yzx * r6.xxx;
    r4.xyz = r6.xyz * 2.0 - r4.xyz;
    r2 = r10.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.zw = r2.zw * r9.xy + 0.125;
    r6.x = saturate(dot(r5.zxy, r4.zxy));
    ps = log2(r6.x);
    r2.xy = r2.xy + 0.5;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.y = r1.z * 0.1;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r2.xw = abs(r2.yx) * abs(r2.yx);
    r6.x = ps;
    ps = 0.1 * r6.x;
    r2.xyz = r0.xzy * r2.xxx;
    r0.w = ps;
    ps = r6.y * r6.x;
    r4.xyz = r0.xzy * r2.www;
    r5.z = ps;
    ps = r6.z * r6.w;
    r5.xy = r0.ww * r1.xy;
    r5.w = ps;
    r6.xyz = r5.www * r8.xyz + ModShadowColor.xyz;
    r7.yzw = r7.yzw * r0.xyz + r5.xyz;
    r7.yzw = r4.xzy * LowerSkyColor.xyz + r7.yzw;
    r7.yzw = r2.xzy * UpperSkyColor.xyz + r7.yzw;
    r7.yzw = r0.xyz * AmbientColorAndSkyFactor.xyz + r7.yzw;
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
