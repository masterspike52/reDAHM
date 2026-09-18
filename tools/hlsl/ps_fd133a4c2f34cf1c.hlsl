// ps_fd133a4c2f34cf1c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 210 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000348 10041000 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c11); // float4
float4 LightMapScale : register(c12); // float3
float4 LowerSkyColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UpperSkyColor : register(c9); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D LightMapTexture : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r14.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r15.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r16.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r0.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r7.yzw = tex2D(Texture2D_2, r1.xy).xyz;
    ps = OpacityOverride.x;
    r6.z = dot(r4.zxy, r4.zxy);
    r6.y = saturate(ps);
    ps = UniformVector_3.x * UniformVector_3.w;
    r6.w = dot(r2.zxy, r2.zxy);
    r8.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r1.xyz = UniformVector_2.xyz * UniformVector_2.www;
    r8.y = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r6.x = dot(r5.zxy, r5.zxy);
    r8.z = ps;
    ps = UniformVector_1.x * UniformVector_1.w;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r12.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r13.xyz = r11.xyz * AmbientColorAndSkyFactor.xyz;
    r12.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r9.xyz = r0.xyz * LightMapScale.xyz;
    r12.z = ps;
    r0.xyw = r16.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r12.xyz = r12.xyz * r15.yyy;
    r7.x = ps;
    r1.xyz = r1.xyz * r15.zzz + UniformVector_0.xyz;
    r12.xyz = r12.xyz * r7.yzw + r1.xyz;
    ps = 0.7 * r0.x;
    r6.x = dot(r15.xzy, float3(1.0, 1.0, 1.0));
    r16.x = ps;
    ps = rsqrt(abs(r6.w));
    r15.xyz = r7.xxx * r5.xyz;
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r1.xyz = r6.www * r2.zxy;
    r6.z = ps;
    ps = 1.0 * r0.y;
    r4.xyz = r6.zzz * r4.zxy;
    r16.y = ps;
    ps = log2(abs(r6.x));
    r6.z = dot(r4.xyz, r0.xyw);
    r0.z = ps;
    ps = 1.0 * r0.w;
    r2 = r0.xywz * float4(0.7, 1.0, 1.0, 0.1);
    r16.z = ps;
    ps = 0.1 - -r1.x;
    r6.w = dot(r2.xyz, r2.xyz);
    r6.x = ps;
    ps = rsqrt(abs(r6.w));
    r6.x = saturate(r6.x * 5.0);
    r6.w = ps;
    ps = 1.0 - r6.x;
    r0.w = max(r6.z, 0.0);
    r6.z = ps;
    ps = 1.0 - r6.y;
    r5.xyz = r16.xyz * r6.www;
    r6.x = ps;
    ps = UniformScalar_0.x * r7.y;
    r6.w = float((r6.x >= 0.004));
    r7.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r2.xyz = r9.xzy * r5.xxx;
    r0.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r14.x = dot(r15.zxy, r5.xyz);
    r0.z = ps;
    ps = pow(2.0, r2.w);
    r6.z = dot(r5.xyz, r4.xyz);
    r0.x = ps;
    ps = UniformScalar_0.x * r7.z;
    r0 = -r0.wyzx + float4(0.45, 1.0, 1.0, 1.0);
    r1.w = ps;
    ps = UniformScalar_0.x * r7.w;
    r6.y = saturate(r0.x * 4.0);
    r6.x = ps;
    ps = r7.x;
    r5.xyz = r5.yzx * r6.zzz;
    r4.yzw = r5.xyz * 2.0 - r4.yzx;
    ps = r0.w * ps;
    r7.xyz = r0.www * r7.yzw;
    r4.x = ps;
    ps = r6.x;
    r14 = r14.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r5.xy = r14.zw * r0.yz + 0.125;
    r8.xyz = r7.xyz * r8.xyz - r7.xyz;
    ps = r0.w * ps;
    r5.w = saturate(dot(r1.xyz, r4.wyz));
    r4.y = ps;
    ps = r5.w * r5.w;
    r6.xz = r14.xy + 0.5;
    r5.z = ps;
    ps = abs(r6.x) * abs(r6.x);
    r1.xyz = r7.xyz * UniformVector_3.www;
    r7.w = ps;
    r1.xyz = r1.xyz * UniformVector_3.xyz - r7.xyz;
    r8.xyz = r6.yyy * r8.xyz + r7.xyz;
    ps = abs(r6.z) * abs(r6.z);
    r8.xyz = r8.xyz * r11.xyz;
    r6.x = ps;
    r1.xyz = r6.yyy * r1.xyz + r7.xyz;
    r7.xyz = r13.xyz * r1.xyz + r12.xyz;
    ps = r5.x * r5.y;
    r8.xyz = r8.xzy * r6.xxx;
    r6.x = ps;
    ps = r5.z * r5.w;
    r0.xyz = r1.xyz * r11.xyz;
    r1.x = ps;
    r6.xyz = r6.xxx * r10.xyz + ModShadowColor.xyz;
    ps = r1.w;
    r1.xyz = r9.xzy * r1.xxx;
    ps = r0.w * ps;
    r5.xyz = r0.xzy * r7.www;
    r4.z = ps;
    r7.xyz = r8.xzy * UpperSkyColor.xyz + r7.xyz;
    r7.xyz = r5.xyz * LowerSkyColor.xzy + r7.xzy;
    r7.xyz = r1.xyz * r4.xyz + r7.xyz;
    r7.xyz = r2.xzy * r0.xyz + r7.xzy;
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
