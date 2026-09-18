// ps_2cbe880600940831.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000003A8 10040D00 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c13); // float4
float4 LowerSkyColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7 = tex2D(Texture2D_2, r0.xy).xwyz;
    ps = r7.y;
    r6.xz = r0.wz * UniformVector_4.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.xw = r7.zw * UniformScalar_4.xx;
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r9.y = ps;
    ps = (-0.5) + r6.y;
    r8.xy = r9.xy * abs(r8.xy);
    r6.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r12.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r11 = tex2D(Texture2D_1, r0.xy);
    r0.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_3, r6.xz).xyz;
    r0.x = dot(r5.zxy, r5.zxy);
    r6.w = float((UniformScalar_3.x > 1.0));
    r6.yzw = (-abs(r6.www) >= 0.0) ? r6.xyz : 1.0;
    r8.xyz = r0.wyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.x));
    r6.x = dot(r4.zxy, r4.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r6.x));
    r13.xyz = r0.xxx * r5.xyz;
    r5.w = ps;
    r5.xyz = UniformVector_3.xyz * 2e+01;
    r0.x = float((UniformScalar_3.x >= 1.0));
    r6.x = dot(r2.zxy, r2.zxy);
    r9.xyz = r10.xyz * AmbientColorAndSkyFactor.xyz;
    r0.yzw = r11.xyz * r11.www;
    r8.yzw = r8.xyz * UniformVector_2.zxy;
    r11.xyz = r5.www * r4.xyz;
    ps = rsqrt(abs(r6.x));
    r4.xyw = r5.yzx * r0.zwy;
    r6.x = ps;
    r6.yzw = (-abs(r0.xxx) >= 0.0) ? 1.0 : r6.yzw;
    ps = UniformScalar_4.x * r6.y;
    r0.xyz = r6.xxx * r2.zxy;
    r0.w = ps;
    ps = 0.1 - -r0.x;
    r5.xyz = r4.wxy + UniformVector_0.xyz;
    r6.x = ps;
    r2.xyz = r6.yzw * r7.xzw + r4.wxy;
    r9.xyz = r9.xyz * r2.xyz + r5.xyz;
    ps = 5.0 * r6.x;
    r7.zw = r12.xw * r6.zw;
    r8.x = saturate(ps);
    ps = r0.w;
    r6.x = dot(r4.ywx, float3(0.11, 0.3, 0.59));
    ps = r7.x * ps;
    r6.x = r6.x - r4.w;
    r7.y = ps;
    ps = r6.x;
    r4.xyz = r2.xyz * r10.xyz;
    ps = r4.w + ps;
    r6.xz = -r8.yx + 1.0;
    r6.y = saturate(ps);
    ps = OpacityOverride.x;
    r2.yz = -r8.zw * r6.yy;
    r5.x = saturate(ps);
    ps = ModShadowGroupColor.x * r6.z;
    r2.x = r6.x * r6.y;
    r5.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.yzw = r8.yzw + r2.xyz;
    r5.z = ps;
    ps = (-1.0) - -r2.y;
    r5.w = saturate(r3.w * 0.0001);
    r2.x = ps;
    r10 = -r5.wxyz + 1.0;
    r2.yzw = r2.xzw * r10.xxx;
    ps = 1.0 + r2.y;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r2.x = ps;
    r6.xzw = (r10.xxx > 0.0) ? r2.xzw : float3(1.0, 0.0, 0.0);
    r2.xyz = (r10.xxx >= 0.0) ? r6.xzw : float3(1.0, 0.0, 0.0);
    r6.x = dot(r2.xyz, r2.xyz);
    ps = rsqrt(abs(r6.x));
    r6.w = float((r10.y >= 0.004));
    r6.x = ps;
    ps = 1.0 - r6.y;
    r5.xyw = r2.yzx * r6.xxx;
    r0.w = ps;
    ps = UniformScalar_5.x + r7.y;
    r12.x = dot(r13.zxy, r5.wxy);
    r2.x = ps;
    ps = UniformScalar_5.x + r7.z;
    r6.x = dot(r5.wxy, r11.zxy);
    r2.y = ps;
    ps = UniformScalar_5.x + r7.w;
    r6.xyz = r5.xyw * r6.xxx;
    r2.z = ps;
    ps = r5.w;
    r7 = r12.yzxx * float4(0.875, 0.875, -0.5, 0.5);
    r6.xyz = r6.xyz * 2.0 - r11.xyz;
    ps = r1.x * ps;
    r6.x = saturate(dot(r0.xyz, r6.zxy));
    r0.x = ps;
    r7.xy = r7.xy * r10.zw + 0.125;
    ps = r5.w;
    r6.yz = r7.zw + 0.5;
    ps = r1.y * ps;
    r6.yz = abs(r6.yz) * abs(r6.yz);
    r0.y = ps;
    ps = log2(r6.x);
    r7.x = r7.x * r7.y;
    r6.x = ps;
    r7.xyz = r7.xxx * r8.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r8.xyz = r4.xzy * r6.yyy;
    r7.w = ps;
    ps = pow(2.0, r7.w);
    r6.xyz = r4.xzy * r6.zzz;
    r7.w = ps;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r9.xzy;
    r6.xyz = r8.xzy * LowerSkyColor.xyz + r6.xzy;
    ps = r5.w;
    r5.xyz = r7.www * r1.xyz;
    ps = r1.z * ps;
    r5.xyz = r5.xzy * r0.www;
    r0.z = ps;
    r6.xyz = r5.xyz * r2.xzy + r6.xzy;
    r6.xyz = r0.xyz * r4.xyz + r6.xzy;
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
