// ps_0449d7abeb1340a4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 249 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003E4 10041200 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 LowerSkyColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 OpacityOverride : register(c13); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_11 : register(c10); // float
float4 UniformScalar_12 : register(c11); // float
float4 UniformScalar_13 : register(c12); // float
float4 UniformScalar_8 : register(c9); // float
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
sampler2D Texture2D_4 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord3 : TEXCOORD3; // r1
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
    float4 r1 = In.texcoord3;
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
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.y = ps;
    ps = r7.w;
    r6.xz = r0.wz * UniformVector_5.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r9.x = ps;
    ps = (-0.5) + r6.y;
    r8.xy = r9.xy * abs(r8.xy);
    r6.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r12.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r11 = tex2D(Texture2D_2, r0.xy);
    r14 = tex2D(Texture2D_1, r0.xy);
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.yzw = tex2D(Texture2D_3, r6.xz).xyz;
    ps = OpacityOverride.x;
    r16.xyz = UniformVector_3.xzy * 2e+01;
    r13.w = saturate(ps);
    ps = UniformVector_4.x;
    r8.x = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = 2e+01 * ps;
    r9.w = float((UniformScalar_11.x >= 1.0));
    r18.x = ps;
    ps = UniformVector_4.z;
    r6.x = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r18.y = ps;
    ps = UniformVector_4.y;
    r6.z = dot(r5.zxy, r5.zxy);
    ps = 2e+01 * ps;
    r13.xyz = -UniformVector_0.xyz + 1.0;
    r18.z = ps;
    ps = r3.w;
    r0.w = float((UniformScalar_11.x > 1.0));
    ps = 0.0001 * ps;
    r15.xyz = r13.xyz * AmbientColorAndSkyFactor.xyz;
    r6.y = saturate(ps);
    r9.xyz = (-abs(r0.www) >= 0.0) ? r8.yzw : 1.0;
    r8.yzw = r0.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r14.xyz = r14.xzy * r14.www;
    r6.z = ps;
    ps = rsqrt(abs(r6.w));
    r17.xyz = r11.xzy * r11.www;
    r0.w = ps;
    ps = rsqrt(abs(r6.x));
    r11.xyz = r6.zzz * r5.xyz;
    r6.x = ps;
    ps = r7.x;
    r0.xyz = r6.xxx * r2.xzy;
    r6.z = ps;
    ps = UniformScalar_12.x * r6.z;
    r2.xyz = r18.xyz * r17.xyz;
    r5.x = ps;
    ps = UniformScalar_12.x * r7.y;
    r6.xzw = r16.xyz * r14.xyz;
    r5.y = ps;
    ps = UniformScalar_12.x * r7.z;
    r8.yzw = r8.yzw * UniformVector_2.zxy;
    r5.z = ps;
    r14.xyz = (-abs(r9.www) >= 0.0) ? 1.0 : r9.xyz;
    r5.xyz = r5.xzy * r14.xzy + UniformScalar_13.xxx;
    r2.xyw = (-abs(r8.xxx) >= 0.0) ? r2.yzx : r6.zwx;
    ps = 0.1 - -r0.y;
    r6.z = dot(r2.xwy, float3(0.11, 0.3, 0.59));
    r6.x = ps;
    ps = 5.0 * r6.x;
    r9.xyz = r2.wyx + UniformVector_0.xyz;
    r8.x = saturate(ps);
    r14.xyz = r14.xyz * r7.xyz + r2.wyx;
    r9.xyz = r15.xyz * r14.xyz + r9.xyz;
    ps = r6.z;
    r6.w = saturate(dot(r2.yxw, float3(0.59, 0.11, 0.3)));
    ps = -r2.w + ps;
    r7.yz = -r8.zw * r6.ww;
    r6.x = ps;
    ps = r6.x;
    r2.xyz = r14.xyz * r13.xyz;
    ps = r2.w + ps;
    r6.xz = -r8.yx + 1.0;
    r13.x = saturate(ps);
    ps = ModShadowGroupColor.x * r6.z;
    r7.x = r6.x * r6.w;
    r13.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r8.yzw = r8.yzw + r7.xyz;
    r13.z = ps;
    ps = 1.0 - r6.y;
    r7 = -r13.wyzx + 1.0;
    r2.w = ps;
    ps = r0.w;
    r8.x = r8.y - 1.0;
    ps = r4.x * ps;
    r8.yzw = r8.zwx * r2.www;
    r6.x = ps;
    ps = r0.w;
    r8.x = r8.w + 1.0;
    r6.yzw = (r2.www > 0.0) ? r8.xyz : float3(1.0, 0.0, 0.0);
    r8.xyz = (r2.www >= 0.0) ? r6.yzw : float3(1.0, 0.0, 0.0);
    ps = r4.y * ps;
    r6.z = dot(r8.xyz, r8.xyz);
    r6.y = ps;
    ps = rsqrt(abs(r6.z));
    r6.w = float((r7.x >= 0.004));
    r6.z = ps;
    ps = r0.w;
    r8.xyz = r8.xyz * r6.zzz;
    ps = r4.z * ps;
    r12.x = dot(r11.zxy, r8.xyz);
    r6.z = ps;
    r0.w = dot(r8.xyz, r6.zxy);
    r11.xyz = r8.yzx * r0.www;
    ps = r8.x;
    r4 = r12.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.xyz = r11.xyz * 2.0 - r6.xyz;
    ps = r1.x * ps;
    r6.x = saturate(dot(r0.yxz, r6.zxy));
    r0.x = ps;
    r7.xy = r4.zw * r7.yz + 0.125;
    ps = r8.x;
    r6.yz = r4.xy + 0.5;
    ps = r1.y * ps;
    r6.yz = abs(r6.yz) * abs(r6.yz);
    r0.y = ps;
    ps = log2(r6.x);
    r0.z = r7.x * r7.y;
    r6.x = ps;
    r7.xyz = r0.zzz * r10.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r4.xyz = r2.xzy * r6.yyy;
    r0.z = ps;
    ps = pow(2.0, r0.z);
    r6.xyz = r2.xzy * r6.zzz;
    r0.z = ps;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r9.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    ps = r8.x;
    r4.xyz = r0.zzz * r1.xyz;
    ps = r1.z * ps;
    r4.xyz = r4.xzy * r7.www;
    r0.z = ps;
    r6.xyz = r4.xyz * r5.xyz + r6.xzy;
    r6.xyz = r0.xyz * r2.xyz + r6.xzy;
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
