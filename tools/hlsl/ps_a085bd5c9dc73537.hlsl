// ps_a085bd5c9dc73537.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 249 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003E4 10041100 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 ConstantLighting : register(c17); // float3
float4 LowerSkyColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
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
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.y = ps;
    ps = r6.w;
    r5.xz = r0.wz * UniformVector_5.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r8.x = ps;
    ps = (-0.5) + r5.y;
    r7.xy = r8.xy * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r11.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r10 = tex2D(Texture2D_2, r0.xy);
    r13 = tex2D(Texture2D_1, r0.xy);
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.yzw = tex2D(Texture2D_3, r5.xz).xyz;
    ps = OpacityOverride.x;
    r15.xyz = UniformVector_3.xzy * 2e+01;
    r7.w = saturate(ps);
    ps = UniformVector_4.x;
    r8.x = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = 2e+01 * ps;
    r9.w = float((UniformScalar_11.x >= 1.0));
    r17.x = ps;
    ps = UniformVector_4.z;
    r5.x = dot(r1.zxy, r1.zxy);
    ps = 2e+01 * ps;
    r5.z = dot(r3.zxy, r3.zxy);
    r17.y = ps;
    ps = UniformVector_4.y;
    r5.y = dot(r4.zxy, r4.zxy);
    ps = 2e+01 * ps;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r17.z = ps;
    ps = r2.w;
    r0.w = float((UniformScalar_11.x > 1.0));
    ps = 0.0001 * ps;
    r14.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz;
    r5.w = saturate(ps);
    r8.yzw = (-abs(r0.www) >= 0.0) ? r8.yzw : 1.0;
    r12.xyz = r0.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r13.xyz = r13.xzy * r13.www;
    r5.y = ps;
    ps = rsqrt(abs(r5.z));
    r16.xyz = r10.xzy * r10.www;
    r0.w = ps;
    ps = rsqrt(abs(r5.x));
    r10.xyz = r5.yyy * r4.xyz;
    r5.x = ps;
    ps = r6.x;
    r0.xyz = r5.xxx * r1.xzy;
    r5.y = ps;
    ps = UniformScalar_12.x * r5.y;
    r1.xyz = r17.xyz * r16.xyz;
    r4.x = ps;
    ps = UniformScalar_12.x * r6.y;
    r5.xyz = r15.xyz * r13.xyz;
    r4.y = ps;
    ps = UniformScalar_12.x * r6.z;
    r12.yzw = r12.xyz * UniformVector_2.zxy;
    r4.z = ps;
    r13.xyz = (-abs(r9.www) >= 0.0) ? 1.0 : r8.yzw;
    r4.xyz = r4.xzy * r13.xzy + UniformScalar_13.xxx;
    r1.xyw = (-abs(r8.xxx) >= 0.0) ? r1.yzx : r5.yzx;
    ps = 0.1 - -r0.y;
    r5.z = dot(r1.xwy, float3(0.11, 0.3, 0.59));
    r5.x = ps;
    ps = 5.0 * r5.x;
    r8.xyz = r1.wyx + UniformVector_0.xyz;
    r12.x = saturate(ps);
    r13.xyz = r13.xyz * r6.xyz + r1.wyx;
    r8.xyz = r14.xyz * r13.xyz + r8.xyz;
    ps = r5.z;
    r5.y = saturate(dot(r1.yxw, float3(0.59, 0.11, 0.3)));
    ps = -r1.w + ps;
    r6.yz = -r12.zw * r5.yy;
    r5.x = ps;
    ps = r5.x;
    r1.xyz = r13.xyz * r7.xyz;
    ps = r1.w + ps;
    r5.xz = -r12.yx + 1.0;
    r7.x = saturate(ps);
    ps = ModShadowGroupColor.x * r5.z;
    r6.x = r5.x * r5.y;
    r7.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r6.yzw = r12.yzw + r6.xyz;
    r7.z = ps;
    ps = 1.0 - r5.w;
    r7 = -r7.wxyz + 1.0;
    r5.w = ps;
    ps = r0.w;
    r6.x = r6.y - 1.0;
    ps = r3.x * ps;
    r12.yzw = r6.zwx * r5.www;
    r6.y = ps;
    ps = r0.w;
    r12.x = r12.w + 1.0;
    r5.xyz = (r5.www > 0.0) ? r12.xyz : float3(1.0, 0.0, 0.0);
    r5.yzw = (r5.www >= 0.0) ? r5.xyz : float3(1.0, 0.0, 0.0);
    ps = r3.y * ps;
    r5.x = dot(r5.yzw, r5.yzw);
    r6.z = ps;
    ps = rsqrt(abs(r5.x));
    r6.x = float((r7.x >= 0.004));
    r5.x = ps;
    ps = r0.w;
    r5.xyw = r5.zwy * r5.xxx;
    ps = r3.z * ps;
    r11.x = dot(r10.zxy, r5.wxy);
    r6.w = ps;
    r5.z = dot(r5.wxy, r6.wyz);
    r10.xyz = r5.xyw * r5.zzz;
    r3 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.yzw = r10.xyz * 2.0 - r6.yzw;
    r6.y = saturate(dot(r0.yxz, r6.wyz));
    r6.zw = r3.zw * r7.zw + 0.125;
    r0.xy = r3.xy + 0.5;
    ps = ConstantLighting.x * r5.w;
    r0.yz = abs(r0.xy) * abs(r0.xy);
    r0.x = ps;
    ps = log2(r6.y);
    r5.z = r6.z * r6.w;
    r5.x = ps;
    r6.yzw = r5.zzz * r9.xyz + ModShadowColor.xyz;
    ps = 15.0 * r5.x;
    r3.xyz = r1.xzy * r0.yyy;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r0.yzw = r1.xzy * r0.zzz;
    r5.z = ps;
    r0.yzw = r0.yzw * UpperSkyColor.xzy + r8.xzy;
    r3.xyz = r3.xzy * LowerSkyColor.xyz + r0.ywz;
    ps = ConstantLighting.y * r5.w;
    r8.xyz = r5.zzz * ConstantLighting.xyz;
    r0.y = ps;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r8.xzy * r7.yyy;
    r0.z = ps;
    r5.xyz = r7.xyz * r4.xyz + r3.xzy;
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
