// ps_ffe0543a53f500b4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 264 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000420 10041100 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c19); // float4
float4 LightMapScale : register(c20); // float3
float4 LowerSkyColor : register(c18); // float3
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 OpacityOverride : register(c16); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c12); // float
float4 UniformScalar_11 : register(c13); // float
float4 UniformScalar_12 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformScalar_7 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UpperSkyColor : register(c17); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D LightMapTexture : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

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

    r10 = tex2D(Texture2D_2, r1.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xz = r1.xy * UniformScalar_0.xx;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.xy = r1.wz * UniformVector_4.xy;
    r7.y = ps;
    ps = r10.w;
    r0.zw = r1.xy * UniformScalar_7.xx;
    r6.y = ps;
    ps = (-0.5) + r6.y;
    r11.xy = r7.xy * abs(r8.xy);
    r6.y = ps;
    ps = r1.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r8.w = saturate(ps);
    r8.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r7.yzw = tex2D(LightMapTexture, r0.xy).xyz;
    r13.w = tex2D(Texture2D_4, r0.zw).x;
    r0.xzw = tex2D(Texture2D_3, r1.xy).xyz;
    r9.xyz = tex2D(Texture2D_5, r9.xy).xyz;
    r11.xy = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r6.xyz = tex2D(Texture2D_0, r6.xz).xyw;
    r12.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    ps = UniformScalar_6.x;
    r7.x = dot(r5.zxy, r5.zxy);
    ps = -UniformScalar_5.x + ps;
    r6.w = float((UniformScalar_10.x >= 1.0));
    r1.y = ps;
    ps = -UniformScalar_5.x;
    r1.x = float((UniformScalar_10.x > 1.0));
    ps = 1.0 + ps;
    r1.z = dot(r2.zxy, r2.zxy);
    r0.y = ps;
    r14.x = r12.z * 2.0 - 1.0;
    r16.xy = r6.xy * 2.0 - 1.0;
    r14.yz = r12.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r1.z));
    r17.yz = r11.xy * 0.875;
    r6.y = ps;
    ps = 1.0 / r1.y;
    r0.y = r0.y - r8.w;
    r6.x = ps;
    r1.xyz = (-abs(r1.xxx) >= 0.0) ? r9.xyz : 1.0;
    r9.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r1.xyz;
    ps = r0.y;
    r6.w = dot(r4.zxy, r4.zxy);
    ps = r6.x * ps;
    r13.xyz = r6.yyy * r2.xyz;
    r0.y = saturate(ps);
    r2.xyz = r0.yyy * r10.xyz;
    r10.xyz = r0.xzw * r10.xyz - r2.xyz;
    r6.xy = r13.zw + float2(0.1, 0.5);
    ps = 5.0 * r6.x;
    r7.yzw = r7.yzw * LightMapScale.xyz;
    r0.x = saturate(ps);
    ps = rsqrt(abs(r6.w));
    r0.xw = -r0.yx + 1.0;
    r6.w = ps;
    ps = rsqrt(abs(r7.x));
    r11.w = r0.x * r6.y;
    r7.x = ps;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r11.xyz = r7.xxx * r5.xyz;
    r1.x = saturate(ps);
    ps = r3.w;
    r12.xyz = r6.www * r4.xyz;
    ps = 0.0001 * ps;
    r1.yz = r0.ww * ModShadowGroupColor.xy;
    r1.w = saturate(ps);
    ps = (-1.0) + r6.z;
    r1 = -r1.wyzx + 1.0;
    r17.x = ps;
    r6.xyw = r17.yzx * r1.yzx + float3(0.125, 0.125, 1.0);
    r7.x = r1.x * UniformScalar_1.x;
    r14.yz = r7.xx * r16.xy + r14.yz;
    r6.w = (r7.x > 0.0) ? r6.w : 1.0;
    ps = r6.x * r6.y;
    r5.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r6.x = ps;
    r6.xyz = r6.xxx * r15.xyz + ModShadowColor.xyz;
    r0.w = (r7.x >= 0.0) ? r6.w : 1.0;
    r1.xyz = r14.xyz * UniformVector_2.zxy;
    r7.x = dot(r1.xyz, r1.xyz);
    ps = rsqrt(abs(r7.x));
    r6.w = float((r1.w >= 0.004));
    r7.x = ps;
    r4.xyz = r1.xyz * r7.xxx;
    r1.xyz = r7.ywz * r4.xxx;
    r7.x = dot(r4.xyz, r12.zxy);
    r14.xyz = r4.yzx * r7.xxx;
    r12.xyz = r14.xyz * 2.0 - r12.xyz;
    r7.x = saturate(dot(r13.zxy, r12.zxy));
    ps = log2(r7.x);
    r4.x = dot(r11.zxy, r4.xyz);
    r4.y = ps;
    r11.xyz = r4.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r11.z);
    r4.xzw = r11.wxy + float3(-0.5, 0.5, 0.5);
    r7.x = ps;
    ps = r7.y;
    r1.w = saturate(r4.x * 5.0000005);
    r2.xyz = r1.www * r10.xyz + r2.xyz;
    ps = r7.x * ps;
    r2.xyz = r5.xyz * r2.xyz;
    r4.x = ps;
    ps = r7.w;
    r2.xyz = r2.xyz * r9.xyz;
    ps = r7.x * ps;
    r2.xyz = r2.xyz * r0.www;
    r4.y = ps;
    ps = abs(r4.z) * abs(r4.z);
    r9.xyz = -r2.xyz + r8.xyz;
    r0.w = ps;
    ps = abs(r4.w) * abs(r4.w);
    r0.xyz = r2.xyz * r0.xyz;
    r7.y = ps;
    ps = r7.z;
    r5.xyz = r0.xzy * r0.www;
    ps = r7.x * ps;
    r8.xyz = r0.xzy * r7.yyy;
    r4.z = ps;
    r7.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    r2.xyz = r9.xyz * UniformScalar_11.xxx + r2.xyz;
    r2.xyz = r2.xzy * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r7.xyz = r8.xyz * UpperSkyColor.xzy + r7.xzy;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
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
