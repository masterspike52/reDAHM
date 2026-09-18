// ps_e712accf33221913.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 210 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000348 10040D00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c13); // float4
float4 ConstantLighting : register(c14); // float3
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
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r0.xy * UniformVector_1.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r10.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r12.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    r5.z = tex2D(Texture2D_2, r0.xy).x;
    r9.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r5.xyw = tex2D(Texture2D_1, r0.xy).zxy;
    r0.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r6.y = dot(r3.zxy, r3.zxy);
    r6.z = dot(r4.zxy, r4.zxy);
    r6.x = dot(r1.zxy, r1.zxy);
    r0.xyz = r0.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r5.x = r5.x + r5.x;
    r6.x = ps;
    ps = rsqrt(abs(r6.z));
    r5.yw = r5.yw * 4.0;
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r7.xyz = r6.zzz * r4.xyz;
    r6.y = ps;
    r9.x = max(UniformScalar_5.x, 0.0001);
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r9.yzw = r9.yzw + r9.yzw;
    r13.xyz = r5.zzz * UniformVector_2.xzy;
    r4.xyz = r6.yyy * r3.xyz;
    r6.xyz = r6.xxx * r1.xzy;
    ps = 0.1 - -r6.y;
    r1.xyz = r5.xyw + float3(-1.0, -2.0, -2.0);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r1.xyz = r1.xyz - r0.xyz;
    r5.y = saturate(ps);
    r0.xyz = r1.xyz * UniformScalar_2.xxx + r0.xyz;
    ps = OpacityOverride.x;
    r5.xz = -r5.zy + 1.0;
    r3.x = saturate(ps);
    ps = ModShadowGroupColor.x * r5.z;
    r5.y = dot(r0.xyz, r0.xyz);
    r3.y = ps;
    ps = rsqrt(abs(r5.y));
    r1.xyz = r5.xxx * r12.xyz;
    r5.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r0.xyz = r0.xyz * r5.yyy;
    r3.z = ps;
    r5.xyz = r13.xyz * r12.xzy + r1.xzy;
    r1.xyz = r5.xyz * r9.ywz - r5.xyz;
    r9.yzw = -r3.xyz + 1.0;
    r6.w = dot(r0.xyz, r0.xyz);
    ps = rsqrt(abs(r6.w));
    r5.w = float((r9.y >= 0.004));
    r6.w = ps;
    r5.xyz = r1.xzy * UniformScalar_2.xxx + r5.xzy;
    r3.xyz = r5.xzy * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r1.xyz = r0.xyz * r6.www;
    r0.xyz = r5.xyz * r11.xyz;
    r5.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    r10.x = dot(r7.zxy, r1.xyz);
    r6.w = dot(r1.xyz, r4.zxy);
    r7.xyz = r1.yzx * r6.www;
    r7.xyz = r7.xyz * 2.0 - r4.xyz;
    r4 = r10.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r9.yz = r4.zw * r9.zw + 0.125;
    r6.w = saturate(dot(r6.yxz, r7.zxy));
    r6.xy = r4.xy + 0.5;
    r6.xy = abs(r6.xy) * abs(r6.xy);
    r7.xyz = r0.xzy * r6.xxx;
    ps = log2(r6.w);
    r6.xyz = r0.xzy * r6.yyy;
    r9.w = ps;
    r4.xyz = r6.xyz * UpperSkyColor.xzy + r5.xzy;
    r6.xw = r9.yx * r9.zw;
    r5.xyz = r6.xxx * r8.xyz + ModShadowColor.xyz;
    r6.xyz = r7.xzy * LowerSkyColor.xyz + r4.xzy;
    ps = pow(2.0, r6.w);
    r1.xyz = r1.xxx * ConstantLighting.xyz;
    r6.w = ps;
    r4.xyz = r6.www * ConstantLighting.xzy;
    r6.xyz = r4.xyz * r3.xyz + r6.xzy;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
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
