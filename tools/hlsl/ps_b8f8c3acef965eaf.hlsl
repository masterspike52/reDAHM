// ps_b8f8c3acef965eaf.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 243 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003CC 10041200 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
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
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ShadowTexture : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
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
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
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

    r13 = tex2D(Texture2D_4, r1.xy);
    ps = 1.0 / r5.w;
    r6.yz = r5.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    r6.xz = r6.yz * r6.xx + ScreenPositionScaleBias.wz;
    ps = r13.w;
    r7.xy = r1.wz * UniformVector_5.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r11.z = saturate(r5.w * 0.0001);
    r7.w = ps;
    ps = (-0.5) + r6.y;
    r7.zw = r7.zw * abs(r8.xy);
    r6.y = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r8.yz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r10.xyz = tex2D(LightAttenuationTexture, r6.xz).xyz;
    r11.y = tex2D(ShadowTexture, r0.xy).x;
    r6.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r5 = tex2D(Texture2D_2, r1.xy);
    r15 = tex2D(Texture2D_1, r1.xy);
    r0.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    ps = UniformVector_3.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    ps = 2e+01 * ps;
    r18.xyz = UniformVector_4.xzy * 2e+01;
    r17.x = ps;
    ps = UniformVector_3.z;
    r0.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = 2e+01 * ps;
    r7.y = float((UniformScalar_11.x >= 1.0));
    r17.y = ps;
    ps = UniformVector_3.y;
    r7.z = dot(r4.zxy, r4.zxy);
    ps = 2e+01 * ps;
    r1.w = dot(r2.zxy, r2.zxy);
    r17.z = ps;
    ps = r2.z;
    r7.x = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r7.w = float((UniformScalar_11.x > 1.0));
    r6.x = ps;
    ps = 5.0 * r6.x;
    r12.xyz = r13.xyz * UniformScalar_12.xxx;
    r6.x = saturate(ps);
    r14.xyz = (-abs(r7.www) >= 0.0) ? r0.xyz : 1.0;
    ps = 1.0 - r7.x;
    r15.xyz = r15.xzy * r15.www;
    r7.w = saturate(ps);
    ps = rsqrt(abs(r1.w));
    r0.xyz = r5.xzy * r5.www;
    r1.w = ps;
    r6.yzw = r6.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r7.z));
    r5.xyz = r1.www * r2.xyz;
    r7.z = ps;
    ps = rsqrt(abs(r7.x));
    r4.xyz = r7.zzz * r4.xyz;
    r7.x = ps;
    ps = UniformVector_2.x * r6.y;
    r16.xyz = r7.xxx * -SpotDirection.xyz;
    r7.x = ps;
    ps = UniformVector_2.y * r6.z;
    r0.xyz = r18.xyz * r0.xyz;
    r7.z = ps;
    ps = log2(r7.w);
    r15.xyz = r17.xyz * r15.xyz;
    r6.y = ps;
    r14.xyz = (-abs(r7.yyy) >= 0.0) ? 1.0 : r14.xyz;
    r2.xyz = r12.xyz * r14.xyz + UniformScalar_13.xxx;
    r12.xyz = (-abs(r0.www) >= 0.0) ? r0.yxz : r15.yxz;
    ps = UniformVector_2.z * r6.w;
    r7.y = dot(r16.zxy, r3.zxy);
    r7.w = ps;
    r0.xyw = (abs(r0.www) > 0.0) ? r15.zyx : r0.zyx;
    r3.xyz = r14.xyz * r13.xyz + r0.wxy;
    ps = 1.0 - r7.w;
    r6.z = dot(r0.ywx, float3(0.11, 0.3, 0.59));
    r11.x = ps;
    ps = r6.z;
    r11.w = saturate(dot(r12.zxy, float3(0.59, 0.11, 0.3)));
    ps = -r0.w + ps;
    r0.xy = -r7.xz * r11.ww;
    r6.z = ps;
    ps = r11.x * r11.w;
    r1.xyz = r3.xyz * r1.xyz;
    r0.z = ps;
    ps = r11.y * r11.y;
    r6.z = saturate(r6.z + r0.w);
    r0.w = ps;
    ps = 1.0 - r6.x;
    r10.xyz = r0.www * r10.xyz;
    r6.w = ps;
    ps = 1.0 - r6.z;
    r0.xyz = r7.wxz + r0.zxy;
    r6.z = ps;
    r11.xy = r6.ww * ModShadowGroupColor.xy;
    ps = (-1.0) - -r0.x;
    r3.xyz = -r11.xyz + 1.0;
    r0.w = ps;
    r0.xyw = r0.yzw * r3.zzz;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r0.z = r0.w + 1.0;
    r6.y = ps;
    r7.xzw = (r3.zzz > 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r7.xzw = (r3.zzz >= 0.0) ? r7.xzw : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r6.y);
    r6.x = dot(r7.wxz, r7.wxz);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r10.xzy * r6.yyy;
    r6.x = ps;
    r7.xzw = r7.xzw * r6.xxx;
    r6.x = dot(r7.wxz, r4.zxy);
    r6.xyw = r7.xzw * r6.xxx;
    r6.xyw = r6.xyw * 2.0 - r4.xyz;
    r6.x = saturate(dot(r5.zxy, r6.wxy));
    ps = log2(r6.x);
    r2.xyz = r2.xyz * r6.zzz;
    r8.x = ps;
    ps = -SpotAngles.x - -r7.y;
    r6.yzw = r8.yzx * float3(0.875, 0.875, 15.0);
    r6.x = ps;
    r6.yz = r6.yz * r3.xy + 0.125;
    ps = pow(2.0, r6.w);
    r7.w = saturate(dot(r7.wzx, r5.zyx));
    r6.w = ps;
    ps = SpotAngles.y * r6.x;
    r7.xyz = r2.xyz * r6.www;
    r6.w = saturate(ps);
    r7.xy = r1.xy * r7.ww + r7.xy;
    r7.z = r1.z * r7.w + r7.z;
    r6.xw = r6.yw * r6.zw;
    r6.xyz = r6.xxx * r9.xyz + ModShadowColor.xyz;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r7.xzy * r6.www;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
