// ps_951deb5642dc7c43.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 192 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000300 10041100 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c13); // float4
float4 LightMapScale : register(c14); // float3
float4 LowerSkyColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 OpacityOverride : register(c10); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_3 : register(c7); // float4
float4 UniformVector_4 : register(c8); // float4
float4 UniformVector_5 : register(c9); // float4
float4 UpperSkyColor : register(c11); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D LightMapTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
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
    float4 r1 = In.texcoord1;
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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.yz = UniformVector_3.yx - 0.5;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r6.yz + r1.yx;
    r6.y = ps;
    r6.zw = r6.xy * abs(r8.xy);
    r6.y = dot(r7.xy, UniformVector_5.yx) + 0.5;
    r6.x = dot(r7.xy, UniformVector_4.yx) + 0.5;
    r8.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r14.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    ps = OpacityOverride.x;
    r6.zw = r1.xy + UniformVector_2.xy;
    r12.z = saturate(ps);
    r17.xyz = tex2D(Texture2D_2, r6.zw).xyz;
    r9.yzw = tex2D(Texture2D_2, r6.xy).yxz;
    r12.xyw = tex2D(Texture2D_0, r1.xy).xyz;
    r13.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r16.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    ps = -ModShadowColor.x;
    r6.w = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r7.z = dot(r5.zxy, r5.zxy);
    r11.x = ps;
    ps = -ModShadowColor.y;
    r0.x = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r11.y = ps;
    ps = -ModShadowColor.z;
    r15.xyz = r16.xyz + UniformVector_0.xyz;
    ps = 1.0 + ps;
    r10.xyz = r1.xyz * r13.xyz;
    r11.z = ps;
    ps = LightMapScale.x * r6.y;
    r0.w = dot(r12.wxy, r12.wxy);
    r9.x = ps;
    ps = LightMapScale.y * r6.z;
    r7.xyw = r17.xzy * r9.zwy;
    r9.y = ps;
    ps = rsqrt(abs(r0.x));
    r14.xw = r7.xy * r9.zw;
    r0.x = ps;
    ps = rsqrt(abs(r7.z));
    r0.xyz = r0.xxx * r4.xyz;
    r7.z = ps;
    ps = rsqrt(abs(r6.w));
    r4.xyz = r7.zzz * r5.xyz;
    r6.w = ps;
    ps = LightMapScale.z * r6.x;
    r7.xyz = r6.www * r2.zxy;
    r9.z = ps;
    ps = rsqrt(abs(r0.w));
    r6.yw = r14.xw * r17.xz;
    r6.x = ps;
    ps = r7.w * r7.w;
    r2.xyz = r6.xxx * r12.wxy;
    r6.z = ps;
    ps = 0.1 - -r7.x;
    r5.xyz = r2.xyz * TwoSidedSign.xxx;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r2.xyz = r9.xyz * r5.xxx;
    r7.w = saturate(ps);
    ps = UniformVector_1.x * r6.y;
    r14.x = dot(r4.zxy, r5.xyz);
    r4.x = ps;
    ps = UniformVector_1.y * r6.z;
    r6.x = dot(r5.xyz, r0.zxy);
    r4.y = ps;
    ps = UniformVector_1.z * r6.w;
    r6.z = -r7.w + 1.0;
    r4.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r6.xyw = r5.yzx * r6.xxx;
    r12.x = ps;
    r4.xyz = r4.xyz * r16.xyz + r15.xyz;
    r4.xyz = r10.xyz * AmbientColorAndSkyFactor.xyz + r4.xyz;
    r5.xyz = r6.xyw * 2.0 - r0.xyz;
    ps = ModShadowGroupColor.y * r6.z;
    r0 = r14.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r12.y = ps;
    ps = r0.y;
    r2.xyz = r2.xzy * r13.xzy;
    r6.x = ps;
    ps = 0.5 + r6.x;
    r7.x = saturate(dot(r7.xyz, r5.zxy));
    r7.y = ps;
    ps = 0.5 + r0.x;
    r6.xyw = -r12.xyz + 1.0;
    r7.z = ps;
    r6.yz = r0.zw * r6.xy + 0.125;
    ps = log2(r7.x);
    r0.xy = abs(r7.yz) * abs(r7.yz);
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.w = float((r6.w >= 0.004));
    r7.w = ps;
    ps = r6.y * r6.z;
    r7.xyz = r10.xzy * r0.yyy;
    r6.x = ps;
    r6.xyz = r6.xxx * r11.xyz + ModShadowColor.xyz;
    r7.xyz = r7.xzy * UpperSkyColor.xyz + r4.xyz;
    ps = pow(2.0, r7.w);
    r4.xyz = r10.xzy * r0.xxx;
    r7.w = ps;
    r0.xyz = r9.xzy * r7.www;
    r7.xyz = r4.xyz * LowerSkyColor.xzy + r7.xzy;
    r7.xyz = r0.xyz * r8.xzy + r7.xyz;
    r7.xyz = r2.xzy * r1.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
