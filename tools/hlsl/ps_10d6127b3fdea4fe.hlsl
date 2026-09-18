// ps_10d6127b3fdea4fe.bin
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

float4 AmbientColorAndSkyFactor : register(c12); // float4
float4 LightMapScale : register(c13); // float3
float4 LowerSkyColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 OpacityOverride : register(c9); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_3 : register(c7); // float4
float4 UniformVector_4 : register(c8); // float4
float4 UpperSkyColor : register(c10); // float3
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

    r7.xw = r1.xy + UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.yz = UniformVector_2.yx - 0.5;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r6.yz + r1.yx;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r7.z = dot(r6.zw, UniformVector_4.yx) + 0.5;
    r7.y = dot(r6.zw, UniformVector_3.yx) + 0.5;
    r12.xy = tex2D(Texture2D_2, r1.xy).xy;
    r16.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r9.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r17.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r11.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r7.xw = tex2D(Texture2D_1, r7.xw).yx;
    r0.xz = tex2D(Texture2D_1, r7.yz).xy;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r1.x = dot(r2.zxy, r2.zxy);
    r6.w = dot(r5.zxy, r5.zxy);
    r1.y = dot(r4.zxy, r4.zxy);
    ps = OpacityOverride.x;
    r0.y = r7.x * r0.z;
    r15.z = saturate(ps);
    ps = LightMapScale.x * r6.y;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r10.x = ps;
    ps = LightMapScale.y * r6.z;
    r0.w = dot(r11.wyz, r11.wyz);
    r10.y = ps;
    ps = LightMapScale.z * r6.x;
    r7.xyz = r8.zxy * r17.zxy;
    r10.z = ps;
    ps = AmbientColorAndSkyFactor.x * r7.y;
    r9 = r9.xzxy * float4(5e+01, 5.0, 5.0, 5.0);
    r11.x = ps;
    ps = rsqrt(abs(r1.y));
    r13.z = max(r9.x, 0.0001);
    r6.x = ps;
    ps = rsqrt(abs(r6.w));
    r15.xyw = r6.xxx * r4.xyz;
    r6.x = ps;
    ps = rsqrt(abs(r1.x));
    r6.yzw = r6.xxx * r5.xyz;
    r6.x = ps;
    ps = rsqrt(abs(r0.w));
    r1.xyz = r6.xxx * r2.zxy;
    r6.x = ps;
    ps = AmbientColorAndSkyFactor.y * r7.z;
    r2.xyz = r6.xxx * r11.wyz;
    r11.y = ps;
    ps = 0.1 - -r1.x;
    r4.xyz = r2.xyz * TwoSidedSign.xxx;
    r6.x = ps;
    ps = 0.5 * r0.x;
    r16.x = dot(r6.wyz, r4.xyz);
    r13.w = ps;
    ps = 5.0 * r0.y;
    r6.y = dot(r4.xyz, r15.wxy);
    r13.y = ps;
    ps = 5.0 * r6.x;
    r0.xyz = r10.xyz * r4.xxx;
    r6.x = saturate(ps);
    ps = r13.w;
    r2.xyz = r0.xyz * r17.xyz;
    ps = r7.w * ps;
    r0.xyz = r4.yzx * r6.yyy;
    r13.x = ps;
    ps = 1.0 - r6.x;
    r4 = r16.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.z = ps;
    r6.xyw = r0.xyz * 2.0 - r15.xyw;
    ps = ModShadowGroupColor.x * r6.z;
    r0.x = saturate(dot(r1.xyz, r6.wxy));
    r15.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r0.yz = r4.xy + 0.5;
    r15.y = ps;
    ps = abs(r0.y) * abs(r0.y);
    r6.xyz = -r15.zxy + 1.0;
    r7.w = ps;
    ps = abs(r0.z) * abs(r0.z);
    r6.w = float((r6.x >= 0.004));
    r6.x = ps;
    r6.yz = r4.zw * r6.yz + 0.125;
    ps = r6.y * r6.z;
    r4.xyz = r7.yzx * r7.www;
    r7.w = ps;
    ps = log2(r0.x);
    r6.xyz = r7.yzx * r6.xxx;
    r12.z = ps;
    r0.xyz = r7.www * r14.xyz + ModShadowColor.xyz;
    ps = AmbientColorAndSkyFactor.z * r7.x;
    r1.xyz = r13.xyz * r12.xyz;
    r11.z = ps;
    r6.xyz = r6.xyz * UpperSkyColor.xyz + r11.xyz;
    r6.xyz = r4.xyz * LowerSkyColor.xyz + r6.xyz;
    ps = pow(2.0, r1.z);
    r7.xy = r1.xy + UniformVector_0.xy;
    r7.z = ps;
    r1.xyz = r10.xyz * r7.zzz;
    r6.xyz = r1.xyz * r9.zwy + r6.xyz;
    r6.xyz = r2.zxy * r8.zxy + r6.zxy;
    ps = UniformVector_0.z + r6.x;
    r7.xz = r7.xy + r6.yz;
    r7.y = ps;
    ps = -r3.w;
    r6.xyz = r7.xyz * r0.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
