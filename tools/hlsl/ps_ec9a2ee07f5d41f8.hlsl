// ps_ec9a2ee07f5d41f8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 174 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002B8 10040D00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 ConstantLighting : register(c16); // float3
float4 LowerSkyColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 OpacityOverride : register(c12); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_5 : register(c7); // float
float4 UniformScalar_6 : register(c8); // float
float4 UniformScalar_7 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformScalar_9 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UpperSkyColor : register(c13); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xz = r0.xy + UniformVector_1.xy;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    r5.yw = r5.yw * abs(r7.xy);
    r8.yz = tex2D(ModShadowAccumTexture, r5.yw).xy;
    r6.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r5.y = tex2D(Texture2D_1, r0.xy).x;
    r11.xyz = tex2D(Texture2D_2, r5.xz).xyz;
    r13.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10.z = max(UniformScalar_9.x, 0.0001);
    ps = OpacityOverride.x;
    r5.x = dot(r1.zxy, r1.zxy);
    r10.x = saturate(ps);
    ps = -UniformVector_0.x;
    r5.z = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r7.x = ps;
    ps = -UniformVector_0.y;
    r12.xyz = UniformVector_2.xyz * UniformScalar_5.xxx;
    ps = 1.0 + ps;
    r0.xyz = UniformVector_3.xyz * UniformScalar_6.xxx;
    r7.y = ps;
    r13.xyz = r13.zxy * 2.0 - 1.0;
    r0.xyz = r12.xyz * r11.xyz + r0.xyz;
    ps = rsqrt(abs(r5.w));
    r12.x = -r5.y + 1.0;
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r11.xyz = r5.www * r3.xyz;
    r5.z = ps;
    ps = rsqrt(abs(r5.x));
    r3.yzw = r5.zzz * r4.xyz;
    r5.x = ps;
    r4.xyz = r0.xyz * r5.yyy + UniformVector_0.xyz;
    ps = -UniformVector_0.z;
    r0.xyz = r5.xxx * r1.xzy;
    ps = 1.0 + ps;
    r12.yzw = r12.xxx * r6.xyz;
    r7.z = ps;
    ps = 0.1 - -r0.y;
    r5.y = dot(r13.xyz, r13.xyz);
    r5.x = ps;
    ps = rsqrt(abs(r5.y));
    r1.xyz = r12.yzw * r7.xyz;
    r5.y = ps;
    r7.xyz = r1.xyz * AmbientColorAndSkyFactor.xyz + r4.xyz;
    ps = 5.0 * r5.x;
    r5.yzw = r13.yzx * r5.yyy;
    r5.x = saturate(ps);
    ps = ConstantLighting.x * r5.w;
    r6.yzw = r12.zwx * UniformScalar_7.xxx;
    r3.x = ps;
    ps = ConstantLighting.y * r5.w;
    r8.x = dot(r3.wyz, r5.wyz);
    r3.y = ps;
    ps = r6.w;
    r0.w = dot(r5.wyz, r11.zxy);
    ps = r6.x * ps;
    r4.xyz = r5.yzw * r0.www;
    r6.x = ps;
    ps = 1.0 - r5.x;
    r8 = r8.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r5.z = ps;
    r4.xyz = r4.xyz * 2.0 - r11.xyz;
    ps = ModShadowGroupColor.x * r5.z;
    r0.x = saturate(dot(r0.yxz, r4.zxy));
    r10.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r0.yz = r8.xy + 0.5;
    r10.w = ps;
    ps = ConstantLighting.z * r5.w;
    r4.xyz = -r10.ywx + 1.0;
    r3.z = ps;
    r10.xy = r8.zw * r4.xy + 0.125;
    ps = r6.x;
    r5.xz = abs(r0.yz) * abs(r0.yz);
    r5.y = ps;
    ps = UniformScalar_8.x + r5.y;
    r8.xyz = r1.xzy * r5.xxx;
    r4.x = ps;
    ps = log2(r0.x);
    r5.xyz = r1.xzy * r5.zzz;
    r10.w = ps;
    r7.xyz = r5.xyz * UpperSkyColor.xzy + r7.xzy;
    ps = UniformScalar_8.x + r6.y;
    r0.xw = r10.xz * r10.yw;
    r4.y = ps;
    r5.xyz = r0.xxx * r9.xyz + ModShadowColor.xyz;
    r0.xyz = r8.xzy * LowerSkyColor.xyz + r7.xzy;
    ps = pow(2.0, r0.w);
    r5.w = float((r4.z >= 0.004));
    r0.w = ps;
    ps = UniformScalar_8.x + r6.z;
    r7.xyz = r0.www * ConstantLighting.xzy;
    r4.z = ps;
    r6.xyz = r7.xzy * r4.xyz + r0.xyz;
    r6.xyz = r3.xyz * r1.xyz + r6.xyz;
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
