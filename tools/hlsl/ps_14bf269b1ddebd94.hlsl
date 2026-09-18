// ps_14bf269b1ddebd94.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 186 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002E8 10040D00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 LightMapScale : register(c16); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r0.zw = r1.xy + UniformVector_1.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.yzw = UniformVector_3.xyz * UniformScalar_6.xxx;
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r11.yw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.yzw = tex2D(Texture2D_3, r1.xy).yzx;
    r8.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r12.xyz = tex2D(Texture2D_2, r0.zw).xyz;
    r6.x = tex2D(Texture2D_1, r1.xy).x;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r11.z = max(UniformScalar_9.x, 0.0001);
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = dot(r2.zxy, r2.zxy);
    r7.x = dot(r5.zxy, r5.zxy);
    r0.y = dot(r4.zxy, r4.zxy);
    r13.xyz = UniformVector_2.xyz * UniformScalar_5.xxx;
    r7.yzw = r13.xyz * r12.xyz + r7.yzw;
    r13.xyz = r9.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.y));
    r8.xyz = r8.xyz * LightMapScale.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r7.x));
    r9.xyz = r0.yyy * r4.xyz;
    r7.x = ps;
    r12.xyz = r7.xxx * r5.xyz;
    ps = rsqrt(abs(r0.x));
    r7.x = dot(r13.xyz, r13.xyz);
    r0.x = ps;
    r7.yzw = r7.yzw * r6.xxx + UniformVector_0.xyz;
    ps = 1.0 - r6.x;
    r0.xyz = r0.xxx * r2.zxy;
    r2.x = ps;
    r2.yzw = r2.xxx * r6.wyz;
    ps = OpacityOverride.x;
    r1.xyz = r2.yzw * r1.xyz;
    r6.y = saturate(ps);
    r4.yzw = r1.xyz * AmbientColorAndSkyFactor.xyz + r7.yzw;
    ps = rsqrt(abs(r7.x));
    r7.yzw = r2.zwx * UniformScalar_7.xxx;
    r6.x = ps;
    ps = 0.1 - -r0.x;
    r5.xyz = r13.xyz * r6.xxx;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r2.xyz = r8.xzy * r5.xxx;
    r6.x = saturate(ps);
    ps = r7.w;
    r11.x = dot(r12.zxy, r5.xyz);
    ps = r6.w * ps;
    r6.z = dot(r5.xyz, r9.zxy);
    r7.x = ps;
    ps = 1.0 - r6.x;
    r5.xyz = r5.yzx * r6.zzz;
    r6.z = ps;
    r9.xyz = r5.xyz * 2.0 - r9.xyz;
    ps = 1.0 - r6.y;
    r5 = r11.xxyw * float4(-0.5, 0.5, 0.875, 0.875);
    r6.w = ps;
    r6.xy = -r6.zz * ModShadowGroupColor.xy + 1.0;
    r11.xy = r5.zw * r6.xy + 0.125;
    r0.x = saturate(dot(r0.xyz, r9.zxy));
    r6.xy = r5.xy + 0.5;
    ps = r7.x;
    r6.xz = abs(r6.xy) * abs(r6.xy);
    r6.y = ps;
    ps = UniformScalar_8.x + r6.y;
    r9.xyz = r1.xzy * r6.xxx;
    r4.x = ps;
    ps = log2(r0.x);
    r6.xyz = r1.xzy * r6.zzz;
    r11.w = ps;
    r5.xyz = r6.xyz * UpperSkyColor.xzy + r4.ywz;
    ps = UniformScalar_8.x + r7.y;
    r0.xw = r11.xz * r11.yw;
    r4.y = ps;
    r6.xyz = r0.xxx * r10.xyz + ModShadowColor.xyz;
    r0.xyz = r9.xzy * LowerSkyColor.xyz + r5.xzy;
    ps = pow(2.0, r0.w);
    r6.w = float((r6.w >= 0.004));
    r0.w = ps;
    ps = UniformScalar_8.x + r7.z;
    r5.xyz = r8.xzy * r0.www;
    r4.z = ps;
    r7.xyz = r5.xzy * r4.xyz + r0.xyz;
    r7.xyz = r2.xzy * r1.xyz + r7.xyz;
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
