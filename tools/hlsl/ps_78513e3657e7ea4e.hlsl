// ps_78513e3657e7ea4e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 252 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003F0 10041100 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 ConstantLighting : register(c16); // float3
float4 LowerSkyColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 OpacityOverride : register(c12); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c13); // float3
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

    r13 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = ps;
    ps = r13.w;
    r6.xy = r0.wz * UniformVector_5.xy;
    r5.y = ps;
    ps = (-0.5) + r5.y;
    r5.xz = r5.xz * abs(r7.xy);
    r5.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.yyyy)) clip(-1.0);
    r11.yz = tex2D(ModShadowAccumTexture, r5.xz).xy;
    r17 = tex2D(Texture2D_2, r0.xy);
    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r14 = tex2D(Texture2D_1, r0.xy);
    r8.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    ps = OpacityOverride.x;
    r5.w = float((UniformScalar_5.x >= 0.0));
    r10.x = saturate(ps);
    ps = r2.w;
    r0.w = dot(r3.zxy, r3.zxy);
    ps = 0.0001 * ps;
    r15.xyz = UniformVector_3.xzy * 2e+01;
    r6.y = saturate(ps);
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r8.w = float((UniformScalar_8.x >= 1.0));
    r7.w = ps;
    ps = UniformVector_4.x;
    r9.w = dot(r4.zxy, r4.zxy);
    ps = 2e+01 * ps;
    r6.x = dot(r1.zxy, r1.zxy);
    r16.x = ps;
    ps = UniformVector_4.z;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = 2e+01 * ps;
    r6.z = float((UniformScalar_8.x > 1.0));
    r16.y = ps;
    ps = UniformVector_4.y;
    r12.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    ps = 2e+01 * ps;
    r7.xyz = r13.xyz * UniformScalar_9.xxx;
    r16.z = ps;
    r8.xyz = (-abs(r6.zzz) >= 0.0) ? r8.xyz : 1.0;
    ps = rsqrt(abs(r6.x));
    r14.xyz = r14.xzy * r14.www;
    r6.z = ps;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    ps = UniformVector_2.z * r5.x;
    r10.yzw = r17.xzy * r17.www;
    r6.x = ps;
    ps = UniformVector_2.x * r5.y;
    r9.xyz = r6.zzz * r1.xyz;
    r6.z = ps;
    ps = UniformVector_2.y * r5.z;
    r10.yzw = r16.xyz * r10.yzw;
    r6.w = ps;
    ps = rsqrt(abs(r9.w));
    r1.xyz = r15.xyz * r14.xyz;
    r5.y = ps;
    r14.xyz = (-abs(r8.www) >= 0.0) ? 1.0 : r8.xyz;
    r7.xyz = r7.xzy * r14.xzy + UniformScalar_10.xxx;
    r1.xyz = (-abs(r7.www) >= 0.0) ? r10.yzw : r1.xyz;
    ps = rsqrt(abs(r0.w));
    r5.x = r9.z + 0.1;
    r5.z = ps;
    ps = 5.0 * r5.x;
    r8.xyz = r5.zzz * r3.xyz;
    r5.x = saturate(ps);
    ps = r6.x;
    r4.xyz = r5.yyy * r4.xyz;
    r5.y = ps;
    r10.yzw = (-abs(r5.www) >= 0.0) ? r10.yzw : r1.xyz;
    ps = 1.0 - r5.y;
    r5.z = saturate(dot(r10.wzy, float3(0.59, 0.11, 0.3)));
    r5.w = ps;
    ps = 1.0 - r6.y;
    r1.xyz = r10.ywz + UniformVector_0.xyz;
    r0.w = ps;
    r3.xyz = r14.xyz * r13.xyz + r10.ywz;
    r1.yzw = r12.xyz * r3.xyz + r1.xyz;
    ps = r5.w;
    r5.y = dot(r10.zyw, float3(0.11, 0.3, 0.59));
    ps = r5.z * ps;
    r1.x = r5.y - r10.y;
    r5.y = ps;
    ps = r1.x;
    r5.zw = -r6.zw * r5.zz;
    ps = r10.y + ps;
    r6.yzw = r6.xzw + r5.yzw;
    r5.z = saturate(ps);
    ps = (-1.0) - -r6.y;
    r5.zw = -r5.zx + 1.0;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r5.w;
    r0.xyz = r3.xyz * r0.xyz;
    r10.y = ps;
    ps = ModShadowGroupColor.y * r5.w;
    r6.yzw = r6.xzw * r0.www;
    r10.z = ps;
    ps = 1.0 + r6.y;
    r3.xyz = -r10.yxz + 1.0;
    r6.x = ps;
    r5.xyw = (r0.www > 0.0) ? r6.xzw : float3(1.0, 0.0, 0.0);
    r6.yzw = (r0.www >= 0.0) ? r5.xyw : float3(1.0, 0.0, 0.0);
    r5.x = dot(r6.yzw, r6.yzw);
    ps = rsqrt(abs(r5.x));
    r6.x = float((r3.y >= 0.004));
    r5.x = ps;
    r5.xyw = r6.zwy * r5.xxx;
    ps = -ModShadowColor.x;
    r11.x = dot(r4.zxy, r5.wxy);
    ps = 1.0 + ps;
    r6.z = dot(r5.wxy, r8.zxy);
    r6.y = ps;
    ps = -ModShadowColor.y;
    r10.xyz = r5.xyw * r6.zzz;
    ps = 1.0 + ps;
    r4 = r11.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    r6.z = ps;
    r8.xyz = r10.xyz * 2.0 - r8.xyz;
    ps = -ModShadowColor.z;
    r3.y = saturate(dot(r9.zxy, r8.zxy));
    r4.xy = r4.xy * r3.xz + 0.125;
    ps = 1.0 + ps;
    r3.xz = r4.zw + 0.5;
    r6.w = ps;
    ps = ConstantLighting.x * r5.w;
    r3.xw = abs(r3.xz) * abs(r3.xz);
    r1.x = ps;
    ps = log2(r3.y);
    r0.w = r4.x * r4.y;
    r5.x = ps;
    r6.yzw = r0.www * r6.yzw + ModShadowColor.xyz;
    ps = 15.0 * r5.x;
    r3.xyz = r0.xzy * r3.xxx;
    r0.w = ps;
    ps = pow(2.0, r0.w);
    r4.xyz = r0.xzy * r3.www;
    r0.w = ps;
    r1.yzw = r4.xyz * UpperSkyColor.xzy + r1.ywz;
    r3.xyz = r3.xzy * LowerSkyColor.xyz + r1.ywz;
    ps = ConstantLighting.y * r5.w;
    r4.xyz = r0.www * ConstantLighting.xyz;
    r1.y = ps;
    ps = ConstantLighting.z * r5.w;
    r4.xyz = r4.xzy * r5.zzz;
    r1.z = ps;
    r5.xyz = r4.xyz * r7.xyz + r3.xzy;
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
