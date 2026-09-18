// ps_8aa0e38cf60ad0c0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000360 10040E00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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
float4 UniformScalar_2 : register(c6); // float
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r1.xy * UniformVector_1.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r11.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r13.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r6.z = tex2D(Texture2D_2, r1.xy).x;
    r10.yzw = tex2D(Texture2D_4, r1.xy).xyz;
    r14.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r6.xyw = tex2D(Texture2D_1, r1.xy).zxy;
    r0.xyz = tex2D(Texture2D_0, r7.xy).xyz;
    r7.y = dot(r4.zxy, r4.zxy);
    r7.z = dot(r5.zxy, r5.zxy);
    r7.x = dot(r2.zxy, r2.zxy);
    r0.xyz = r0.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.x));
    r6.x = r6.x + r6.x;
    r7.x = ps;
    ps = rsqrt(abs(r7.z));
    r6.yw = r6.yw * 4.0;
    r7.z = ps;
    ps = rsqrt(abs(r7.y));
    r8.xyz = r7.zzz * r5.xyz;
    r7.y = ps;
    r10.x = max(UniformScalar_5.x, 0.0001);
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r5.xyz = r14.xyz * LightMapScale.xyz;
    r1.xyz = r10.yzw + r10.yzw;
    r14.xyz = r6.zzz * UniformVector_2.xzy;
    r4.xyz = r7.yyy * r4.xyz;
    r7.xyz = r7.xxx * r2.xzy;
    ps = 0.1 - -r7.y;
    r2.xyz = r6.xyw + float3(-1.0, -2.0, -2.0);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r2.xyz = r2.xyz - r0.xyz;
    r6.y = saturate(ps);
    r0.xyz = r2.xyz * UniformScalar_2.xxx + r0.xyz;
    ps = OpacityOverride.x;
    r6.xz = -r6.zy + 1.0;
    r2.z = saturate(ps);
    ps = ModShadowGroupColor.x * r6.z;
    r6.y = dot(r0.xyz, r0.xyz);
    r2.x = ps;
    ps = rsqrt(abs(r6.y));
    r10.yzw = r6.xxx * r13.xyz;
    r6.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r0.xyz = r0.xyz * r6.yyy;
    r2.y = ps;
    r6.xyz = r14.xyz * r13.xzy + r10.ywz;
    r1.xyz = r6.xyz * r1.xzy - r6.xyz;
    r10.yzw = -r2.xyz + 1.0;
    r7.w = dot(r0.xyz, r0.xyz);
    ps = rsqrt(abs(r7.w));
    r6.w = float((r10.w >= 0.004));
    r7.w = ps;
    r6.xyz = r1.xzy * UniformScalar_2.xxx + r6.xzy;
    r2.xyz = r6.xzy * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r1.xyz = r0.xyz * r7.www;
    r0.xyz = r6.xyz * r12.xyz;
    r6.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    r11.x = dot(r8.zxy, r1.xyz);
    r7.w = dot(r1.xyz, r4.zxy);
    r8.xyz = r1.yzx * r7.www;
    r8.xyz = r8.xyz * 2.0 - r4.xyz;
    r4 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r10.yz = r4.zw * r10.yz + 0.125;
    r7.w = saturate(dot(r7.yxz, r8.zxy));
    r7.xy = r4.xy + 0.5;
    r7.xy = abs(r7.xy) * abs(r7.xy);
    r8.xyz = r0.xzy * r7.xxx;
    ps = log2(r7.w);
    r7.xyz = r0.xzy * r7.yyy;
    r10.w = ps;
    r4.xyz = r7.xyz * UpperSkyColor.xzy + r6.xzy;
    r7.xw = r10.yx * r10.zw;
    r6.xyz = r7.xxx * r9.xyz + ModShadowColor.xyz;
    r7.xyz = r8.xzy * LowerSkyColor.xyz + r4.xzy;
    ps = pow(2.0, r7.w);
    r1.xyz = r5.xzy * r1.xxx;
    r7.w = ps;
    r4.xyz = r5.xzy * r7.www;
    r7.xyz = r4.xyz * r2.xyz + r7.xzy;
    r7.xyz = r1.xzy * r0.xyz + r7.xzy;
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
