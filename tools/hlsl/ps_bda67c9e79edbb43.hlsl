// ps_bda67c9e79edbb43.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 219 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000036C 10040F00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 LightMapScale : register(c17); // float3
float4 LowerSkyColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 OpacityOverride : register(c13); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c14); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D LightMapTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r1.xy * UniformScalar_0.xx;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r1.wz * UniformVector_3.xy;
    r6.w = ps;
    r6.zw = r6.zw * abs(r8.xy);
    r9.yzw = tex2D(Texture2D_3, r1.xy).xyz;
    r14.xyz = tex2D(Texture2D_2, r7.xy).xyz;
    r7.zw = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r8.xyw = tex2D(Texture2D_1, r1.xy).xyz;
    r1.xyz = tex2D(Texture2D_0, r6.xy).xyw;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r4.zxy, r4.zxy);
    r7.y = dot(r5.zxy, r5.zxy);
    r10.xyz = UniformVector_4.yzx * UniformVector_4.www;
    r7.x = dot(r2.zxy, r2.zxy);
    r1.xy = r1.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.x));
    r8.z = r1.z - 1.0;
    r7.x = ps;
    r0.xyz = r8.wxy * 2.0 - 1.0;
    r11.xyz = r10.xyz * UniformVector_5.yzx - r10.xyz;
    ps = rsqrt(abs(r7.y));
    r8.xy = r7.zw * 0.875;
    r7.w = ps;
    r13.yzw = r11.xyz * r14.xxx + r10.xyz;
    ps = r3.w;
    r11.xyz = r7.xxx * r2.xyz;
    ps = 0.0001 * ps;
    r7.x = r11.z + 0.1;
    r2.z = saturate(ps);
    ps = OpacityOverride.x;
    r7.x = saturate(r7.x * 5.0);
    r7.y = saturate(ps);
    ps = rsqrt(abs(r6.w));
    r7.xz = -r7.yx + 1.0;
    r6.w = ps;
    ps = ModShadowGroupColor.x * r7.z;
    r10.xyz = r6.www * r4.xyz;
    r2.x = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r6.w = float((r7.x >= 0.004));
    r2.y = ps;
    r7.xyz = -r2.xzy + 1.0;
    r2.xyz = r8.xyz * r7.xzy + float3(0.125, 0.125, 1.0);
    ps = UniformScalar_1.x * r7.y;
    r8.xyz = UniformVector_0.xyz + UniformScalar_7.xxx;
    r1.z = ps;
    r1.xy = r1.zz * r1.xy + r0.yz;
    r0.w = (r1.z > 0.0) ? r2.z : 1.0;
    ps = r2.x * r2.y;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r7.x = ps;
    r7.xyz = r7.xxx * r15.xyz + ModShadowColor.xyz;
    r13.x = (r1.z >= 0.0) ? r0.w : 1.0;
    ps = UniformVector_2.z * r0.x;
    r1.xy = r1.xy * UniformVector_2.xy;
    r1.z = ps;
    r0.x = dot(r1.zxy, r1.zxy);
    ps = LightMapScale.x * r6.y;
    r0.yzw = r13.xyz * r14.xyz;
    r4.x = ps;
    ps = LightMapScale.y * r6.z;
    r0.yzw = r0.yzw * r13.wxx;
    r4.y = ps;
    ps = rsqrt(abs(r0.x));
    r2.xyz = r0.yzw * UniformScalar_5.xxx;
    r0.x = ps;
    ps = r7.w;
    r1.xyz = r1.xyz * r0.xxx;
    ps = r5.x * ps;
    r0.xyz = r2.xyz * r12.xyz;
    r9.x = ps;
    ps = r7.w;
    r12.xyz = -r2.xyz + r9.yzw;
    ps = r5.y * ps;
    r0.w = dot(r1.zxy, r10.zxy);
    r9.y = ps;
    ps = r7.w;
    r13.xyz = r1.xyz * r0.www;
    r12.xyz = r12.xyz * UniformScalar_5.xxx + r2.xyz;
    r2.xyz = r12.xzy * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r10.xyz = r13.xyz * 2.0 - r10.xyz;
    r8.xyz = r12.xyz * UniformScalar_6.xxx + r8.xyz;
    r8.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + r8.xyz;
    ps = r5.z * ps;
    r7.w = saturate(dot(r11.zxy, r10.zxy));
    r9.z = ps;
    ps = log2(r7.w);
    r4.z = dot(r9.zxy, r1.zxy);
    r4.w = ps;
    ps = LightMapScale.z * r6.x;
    r1.xyw = r4.zzw * float3(-0.5, 0.5, 15.0);
    r4.z = ps;
    ps = pow(2.0, r1.w);
    r6.xy = r1.yx + 0.5;
    r6.z = ps;
    ps = abs(r6.y) * abs(r6.y);
    r1.xyz = r4.xzy * r1.zzz;
    r6.y = ps;
    ps = abs(r6.x) * abs(r6.x);
    r4.xyz = r4.xzy * r6.zzz;
    r6.x = ps;
    r5.xyz = r0.xzy * r6.yyy;
    r6.xyz = r0.xzy * r6.xxx;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r8.xzy;
    r6.xyz = r5.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r4.xyz * r2.xyz + r6.xzy;
    r6.xyz = r1.xzy * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
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
