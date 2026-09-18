// ps_1cf013fd69ebe945.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 252 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003F0 10040F00 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c19); // float4
float4 ConstantLighting : register(c20); // float3
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
sampler2D ModShadowAccumTexture : register(s7);

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
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xz = r0.xy * UniformScalar_0.xx;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r0.wz * UniformVector_4.xy;
    r6.y = ps;
    ps = r10.w;
    r8.xy = r0.xy * UniformScalar_7.xx;
    r5.y = ps;
    ps = (-0.5) + r5.y;
    r6.xy = r6.xy * abs(r7.xy);
    r5.y = ps;
    ps = r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r7.w = saturate(ps);
    r7.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r12.w = tex2D(Texture2D_4, r8.xy).x;
    r13.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_5, r6.zw).xyz;
    r9.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r5.xyz = tex2D(Texture2D_0, r5.xz).xyw;
    r0.yzw = tex2D(Texture2D_1, r0.xy).xyz;
    ps = UniformScalar_6.x;
    r6.z = dot(r4.zxy, r4.zxy);
    ps = -UniformScalar_5.x + ps;
    r5.w = float((UniformScalar_10.x >= 1.0));
    r6.w = ps;
    ps = -UniformScalar_5.x;
    r6.y = float((UniformScalar_10.x > 1.0));
    ps = 1.0 + ps;
    r0.x = dot(r1.zxy, r1.zxy);
    r6.x = ps;
    r11.x = r0.w * 2.0 - 1.0;
    r14.xy = r5.xy * 2.0 - 1.0;
    r11.yz = r0.yz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.x));
    r15.yz = r9.xy * 0.875;
    r5.y = ps;
    ps = 1.0 / r6.w;
    r6.x = r6.x - r7.w;
    r5.x = ps;
    r0.xyz = (-abs(r6.yyy) >= 0.0) ? r8.xyz : 1.0;
    r8.xyz = (-abs(r5.www) >= 0.0) ? 1.0 : r0.xyz;
    ps = r6.x;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = r5.x * ps;
    r12.xyz = r5.yyy * r1.xyz;
    r6.y = saturate(ps);
    r9.xyz = r6.yyy * r10.xyz;
    r10.xyz = r13.xyz * r10.xyz - r9.xyz;
    r5.xy = r12.zw + float2(0.1, 0.5);
    ps = 5.0 * r5.x;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = saturate(ps);
    ps = rsqrt(abs(r5.w));
    r6.xy = -r6.yx + 1.0;
    r5.w = ps;
    ps = rsqrt(abs(r6.z));
    r11.w = r6.x * r5.y;
    r6.z = ps;
    ps = OpacityOverride.x;
    r0.xyz = r6.zzz * r4.xyz;
    r6.x = saturate(ps);
    ps = r2.w;
    r1.xyz = r5.www * r3.xyz;
    ps = 0.0001 * ps;
    r6.yz = r6.yy * ModShadowGroupColor.xy;
    r6.w = saturate(ps);
    ps = (-1.0) + r5.z;
    r6 = -r6.xwyz + 1.0;
    r15.x = ps;
    r5.xzw = r15.xyz * r6.yzw + float3(1.0, 0.125, 0.125);
    ps = UniformScalar_1.x * r6.y;
    r5.y = ps;
    r11.yz = r5.yy * r14.xy + r11.yz;
    r5.x = (r5.y > 0.0) ? r5.x : 1.0;
    ps = r5.z * r5.w;
    r4.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r5.z = ps;
    r6.yzw = r5.zzz * r13.xyz + ModShadowColor.xyz;
    r0.w = (r5.y >= 0.0) ? r5.x : 1.0;
    r5.yzw = r11.xyz * UniformVector_2.zxy;
    r5.x = dot(r5.yzw, r5.yzw);
    ps = rsqrt(abs(r5.x));
    r6.x = float((r6.x >= 0.004));
    r5.x = ps;
    r5.xyz = r5.yzw * r5.xxx;
    r5.w = dot(r5.xyz, r1.zxy);
    r3.xyz = r5.yzx * r5.www;
    r1.xyz = r3.xyz * 2.0 - r1.xyz;
    r5.w = saturate(dot(r12.zxy, r1.zxy));
    ps = log2(r5.w);
    r0.x = dot(r0.zxy, r5.xyz);
    r0.y = ps;
    r11.xyz = r0.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r11.z);
    r1.xyz = r5.xxx * ConstantLighting.xyz;
    r5.w = ps;
    r5.xyz = r11.wxy + float3(-0.5, 0.5, 0.5);
    ps = 5.0000005 * r5.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r1.w = saturate(ps);
    r3.xyz = r1.www * r10.xyz + r9.xyz;
    r3.xyz = r4.xyz * r3.xyz;
    r3.xyz = r3.xyz * r8.xyz;
    ps = ConstantLighting.x * r5.w;
    r3.xyz = r3.xyz * r0.www;
    r4.x = ps;
    ps = abs(r5.y) * abs(r5.y);
    r9.xyz = -r3.xyz + r7.xyz;
    r0.w = ps;
    ps = abs(r5.z) * abs(r5.z);
    r0.xyz = r3.xyz * r0.xyz;
    r5.x = ps;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r0.xzy * r0.www;
    r4.y = ps;
    ps = ConstantLighting.y * r5.w;
    r8.xyz = r0.xzy * r5.xxx;
    r4.z = ps;
    r5.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    r3.xyz = r9.xyz * UniformScalar_11.xxx + r3.xyz;
    r3.xyz = r3.xzy * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r5.xyz = r8.xyz * UpperSkyColor.xzy + r5.xzy;
    r5.xyz = r7.xzy * LowerSkyColor.xyz + r5.xzy;
    r5.xyz = r4.xyz * r3.xyz + r5.xzy;
    r5.xyz = r1.xyz * r0.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.x + r2.w;
    r5.xyz = r0.xyz * r6.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
