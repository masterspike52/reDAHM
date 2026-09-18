// ps_e3c083d0e2f8e534.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 252 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003F0 10041200 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 LowerSkyColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
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

    r15 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = ps;
    ps = r15.w;
    r7.xy = r0.wz * UniformVector_5.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.x = saturate(OpacityOverride.x);
    r6.x = ps;
    ps = (-0.5) + r6.y;
    r6.xz = r6.xz * abs(r8.xy);
    r6.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r13.yz = tex2D(ModShadowAccumTexture, r6.xz).xy;
    r11 = tex2D(Texture2D_2, r0.xy);
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r16 = tex2D(Texture2D_1, r0.xy);
    r10.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    ps = r3.w;
    r0.w = dot(r4.zxy, r4.zxy);
    ps = 0.0001 * ps;
    r17.xyz = UniformVector_3.xzy * 2e+01;
    r7.y = saturate(ps);
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r9.w = float((UniformScalar_8.x >= 1.0));
    r8.w = ps;
    ps = UniformVector_4.x;
    r10.w = dot(r5.zxy, r5.zxy);
    ps = 2e+01 * ps;
    r7.x = dot(r2.zxy, r2.zxy);
    r18.x = ps;
    ps = UniformVector_4.z;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = 2e+01 * ps;
    r7.z = float((UniformScalar_8.x > 1.0));
    r18.y = ps;
    ps = UniformVector_4.y;
    r14.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    ps = 2e+01 * ps;
    r8.xyz = r15.xyz * UniformScalar_9.xxx;
    r18.z = ps;
    r12.yzw = (-abs(r7.zzz) >= 0.0) ? r10.xyz : 1.0;
    ps = rsqrt(abs(r7.x));
    r10.xyz = r16.xzy * r16.www;
    r7.z = ps;
    r6.xyz = r6.zxy * 2.0 - 1.0;
    ps = UniformVector_2.z * r6.x;
    r16.xyz = r11.xzy * r11.www;
    r7.x = ps;
    ps = UniformVector_2.x * r6.y;
    r11.xyz = r7.zzz * r2.xyz;
    r7.z = ps;
    ps = UniformVector_2.y * r6.z;
    r16.xyz = r18.xyz * r16.xyz;
    r7.w = ps;
    ps = rsqrt(abs(r10.w));
    r10.xyz = r17.xyz * r10.xyz;
    r6.y = ps;
    r2.xyz = (-abs(r9.www) >= 0.0) ? 1.0 : r12.yzw;
    r8.xyz = r8.xzy * r2.xzy + UniformScalar_10.xxx;
    r12.yzw = (-abs(r8.www) >= 0.0) ? r16.xyz : r10.xyz;
    ps = rsqrt(abs(r0.w));
    r6.x = r11.z + 0.1;
    r6.z = ps;
    ps = 5.0 * r6.x;
    r10.xyz = r6.zzz * r4.xyz;
    r6.x = saturate(ps);
    ps = r7.x;
    r5.xyz = r6.yyy * r5.xyz;
    r6.y = ps;
    r12.yzw = (-abs(r6.www) >= 0.0) ? r16.xyz : r12.yzw;
    ps = 1.0 - r6.y;
    r6.w = saturate(dot(r12.wzy, float3(0.59, 0.11, 0.3)));
    r0.w = ps;
    ps = 1.0 - r7.y;
    r4.xyz = r12.ywz + UniformVector_0.xyz;
    r6.y = ps;
    r2.xyz = r2.xyz * r15.xyz + r12.ywz;
    r4.xyz = r14.xyz * r2.xyz + r4.xyz;
    ps = r0.w;
    r6.z = dot(r12.zyw, float3(0.11, 0.3, 0.59));
    ps = r6.w * ps;
    r6.z = r6.z - r12.y;
    r14.x = ps;
    ps = r6.z;
    r14.yz = -r7.zw * r6.ww;
    ps = r12.y + ps;
    r7.yzw = r7.xzw + r14.xyz;
    r6.z = saturate(ps);
    ps = (-1.0) - -r7.y;
    r6.xz = -r6.zx + 1.0;
    r7.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r0.xyz = r2.xyz * r0.xyz;
    r12.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r7.yzw = r7.xzw * r6.yyy;
    r12.z = ps;
    ps = 1.0 + r7.y;
    r2.xyz = -r12.xyz + 1.0;
    r7.x = ps;
    r7.xyz = (r6.yyy > 0.0) ? r7.xzw : float3(1.0, 0.0, 0.0);
    r7.xyz = (r6.yyy >= 0.0) ? r7.xyz : float3(1.0, 0.0, 0.0);
    r6.y = dot(r7.xyz, r7.xyz);
    ps = rsqrt(abs(r6.y));
    r6.w = float((r2.x >= 0.004));
    r6.y = ps;
    r7.xyw = r7.yzx * r6.yyy;
    r13.x = dot(r5.zxy, r7.wxy);
    r6.y = dot(r7.wxy, r10.zxy);
    r12.xyz = r7.xyw * r6.yyy;
    ps = r7.w;
    r5 = r13.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    r10.xyz = r12.xyz * 2.0 - r10.xyz;
    ps = r1.x * ps;
    r6.y = saturate(dot(r11.zxy, r10.zxy));
    r2.x = ps;
    r5.xy = r5.xy * r2.yz + 0.125;
    ps = r7.w;
    r2.yz = r5.zw + 0.5;
    ps = r1.y * ps;
    r2.zw = abs(r2.yz) * abs(r2.yz);
    r2.y = ps;
    ps = log2(r6.y);
    r7.z = r5.x * r5.y;
    r6.y = ps;
    r7.xyz = r7.zzz * r9.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.y;
    r5.xyz = r0.xzy * r2.zzz;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r9.xyz = r0.xzy * r2.www;
    r6.y = ps;
    r4.xyz = r9.xyz * UpperSkyColor.xzy + r4.xzy;
    r4.xyz = r5.xzy * LowerSkyColor.xyz + r4.xzy;
    ps = r7.w;
    r5.xyz = r6.yyy * r1.xyz;
    ps = r1.z * ps;
    r6.xyz = r5.xzy * r6.xxx;
    r2.z = ps;
    r6.xyz = r6.xyz * r8.xyz + r4.xzy;
    r6.xyz = r2.xyz * r0.xyz + r6.xzy;
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
