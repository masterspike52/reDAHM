// ps_11638ca6a946e723.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003A8 10040E00 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
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
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UpperSkyColor : register(c11); // float3
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
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.y = ps;
    ps = r6.w;
    r5.xz = r0.wz * UniformVector_4.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.w = saturate(r2.w * 0.0001);
    r8.x = ps;
    ps = (-0.5) + r5.y;
    r7.xy = r8.xy * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r11.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8 = tex2D(Texture2D_1, r0.xy);
    r10.xyz = tex2D(Texture2D_3, r5.xz).xyz;
    ps = UniformVector_3.x;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = 2e+01 * ps;
    r0.x = float((UniformScalar_3.x >= 1.0));
    r14.x = ps;
    ps = UniformVector_3.y;
    r5.x = dot(r1.zxy, r1.zxy);
    ps = 2e+01 * ps;
    r0.z = dot(r3.zxy, r3.zxy);
    r14.y = ps;
    ps = UniformVector_3.z;
    r0.y = dot(r4.zxy, r4.zxy);
    ps = 2e+01 * ps;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r14.z = ps;
    ps = r6.y;
    r5.z = float((UniformScalar_3.x > 1.0));
    r5.y = ps;
    ps = UniformScalar_4.x * r5.y;
    r13.xyz = r12.xyz * AmbientColorAndSkyFactor.xyz;
    r11.x = ps;
    r5.yzw = (-abs(r5.zzz) >= 0.0) ? r10.xyz : 1.0;
    ps = rsqrt(abs(r0.y));
    r8.xyz = r8.xyz * r8.www;
    r0.y = ps;
    r9.xyz = r9.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r9.yzw = r9.xyz * UniformVector_2.zxy;
    r0.w = ps;
    ps = UniformScalar_4.x * r6.z;
    r10.xyz = r0.yyy * r4.xyz;
    r11.w = ps;
    ps = rsqrt(abs(r5.x));
    r4.xyz = r14.xyz * r8.xyz;
    r5.x = ps;
    r5.yzw = (-abs(r0.xxx) >= 0.0) ? 1.0 : r5.yzw;
    ps = UniformScalar_4.x * r5.y;
    r0.xyz = r5.xxx * r1.zxy;
    r1.w = ps;
    ps = 0.1 - -r0.x;
    r8.xyz = r4.xyz + UniformVector_0.xyz;
    r5.x = ps;
    r1.xyz = r5.yzw * r6.xyz + r4.xyz;
    r8.xyz = r13.xyz * r1.xyz + r8.xyz;
    ps = 5.0 * r5.x;
    r6.zw = r11.xw * r5.zw;
    r9.x = saturate(ps);
    ps = r1.w;
    r5.x = dot(r4.zxy, float3(0.11, 0.3, 0.59));
    ps = r6.x * ps;
    r5.x = r5.x - r4.x;
    r6.y = ps;
    ps = r5.x;
    r1.xyz = r1.xyz * r12.xyz;
    ps = r4.x + ps;
    r5.xw = -r9.yx + 1.0;
    r5.z = saturate(ps);
    ps = OpacityOverride.x;
    r4.yz = -r9.zw * r5.zz;
    r12.x = saturate(ps);
    ps = ModShadowGroupColor.x * r5.w;
    r4.x = r5.x * r5.z;
    r12.y = ps;
    ps = ModShadowGroupColor.y * r5.w;
    r9.yzw = r9.yzw + r4.xyz;
    r12.z = ps;
    r4 = -r12.wxyz + 1.0;
    ps = r0.w;
    r9.x = r9.y - 1.0;
    ps = r3.x * ps;
    r12.yzw = r9.zwx * r4.xxx;
    r9.x = ps;
    ps = r0.w;
    r12.x = r12.w + 1.0;
    r5.xyw = (r4.xxx > 0.0) ? r12.xyz : float3(1.0, 0.0, 0.0);
    r12.xyz = (r4.xxx >= 0.0) ? r5.xyw : float3(1.0, 0.0, 0.0);
    ps = r3.y * ps;
    r5.x = dot(r12.xyz, r12.xyz);
    r9.y = ps;
    ps = rsqrt(abs(r5.x));
    r6.x = float((r4.y >= 0.004));
    r5.x = ps;
    ps = r0.w;
    r5.xyw = r12.yzx * r5.xxx;
    ps = r3.z * ps;
    r11.x = dot(r10.zxy, r5.wxy);
    r9.z = ps;
    r0.w = dot(r5.wxy, r9.zxy);
    ps = 1.0 - r5.z;
    r10.xyz = r5.xyw * r0.www;
    r5.z = ps;
    ps = UniformScalar_5.x + r6.y;
    r3 = r11.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    r4.x = ps;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    ps = UniformScalar_5.x + r6.z;
    r0.w = saturate(dot(r0.xyz, r9.zxy));
    r4.y = ps;
    r3.xy = r3.xy * r4.zw + 0.125;
    ps = UniformScalar_5.x + r6.w;
    r0.xy = r3.zw + 0.5;
    r4.z = ps;
    ps = ConstantLighting.x * r5.w;
    r0.yz = abs(r0.xy) * abs(r0.xy);
    r0.x = ps;
    ps = log2(r0.w);
    r6.y = r3.x * r3.y;
    r5.x = ps;
    r6.yzw = r6.yyy * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r5.x;
    r7.xyz = r1.xzy * r0.yyy;
    r0.y = ps;
    ps = pow(2.0, r0.y);
    r3.xyz = r1.xzy * r0.zzz;
    r0.y = ps;
    r3.xyz = r3.xyz * UpperSkyColor.xzy + r8.xzy;
    r3.xyz = r7.xzy * LowerSkyColor.xyz + r3.xzy;
    ps = ConstantLighting.y * r5.w;
    r7.xyz = r0.yyy * ConstantLighting.xyz;
    r0.y = ps;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r7.xzy * r5.zzz;
    r0.z = ps;
    r5.xyz = r7.xyz * r4.xzy + r3.xzy;
    r5.xyz = r0.xyz * r1.xyz + r5.xzy;
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
