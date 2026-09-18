// ps_ab7ebefd5d43c9f1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 243 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003CC 10041000 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c17); // float2
float4 SpotDirection : register(c16); // float3
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c14); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_8 : register(c12); // float
float4 UniformScalar_9 : register(c13); // float
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_4, r1.xy);
    r9.y = UniformScalar_2.x * UniformVector_4.y;
    ps = UniformVector_4.y;
    r7.xy = r1.wz * UniformVector_5.xy;
    ps = UniformScalar_5.x * ps;
    r6.y = UniformScalar_1.x * UniformVector_2.x;
    r9.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = UniformVector_2.x * UniformScalar_4.x;
    r0.z = ps;
    ps = 1.0 / r5.w;
    r7.zw = r5.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    r7.zw = r7.zw * r6.xx + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r10.w - 0.5;
    r0.w = ps;
    ps = UniformVector_4.x * r6.y;
    r0.zw = r0.zw * abs(r8.xy);
    r9.x = ps;
    ps = UniformVector_4.x * r6.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r9.z = ps;
    r6 = r9 + r1.xyxy;
    r9.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r11.xyz = tex2D(LightAttenuationTexture, r7.zw).xyz;
    r12.y = tex2D(ShadowTexture, r0.xy).x;
    r14 = tex2D(Texture2D_1, r6.xy);
    r16 = tex2D(Texture2D_2, r6.zw);
    r6.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r13.xyz = -UniformVector_0.xyz + 1.0;
    r7.z = dot(r4.zxy, r4.zxy);
    ps = r5.w;
    r15.xyz = UniformVector_3.xyz * 2e+01;
    ps = 0.0001 * ps;
    r0.w = float((UniformScalar_8.x >= 1.0));
    r12.w = saturate(ps);
    ps = r2.z;
    r7.w = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r7.x = ps;
    ps = 1.0 - r6.x;
    r1.w = float((UniformScalar_8.x > 1.0));
    r7.y = saturate(ps);
    r8.xyz = (-abs(r1.www) >= 0.0) ? r0.xyz : 1.0;
    ps = rsqrt(abs(r6.x));
    r5.xyz = r10.xyz * UniformScalar_9.xxx;
    r6.x = ps;
    r6.yzw = r6.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r0.xyz = r16.xyz * r16.www;
    r7.w = ps;
    r0.xyz = r14.xyz * r14.www + r0.xyz;
    ps = 5.0 * r7.x;
    r16.xyz = r6.xxx * -SpotDirection.xyz;
    r6.x = saturate(ps);
    r14.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r8.xyz;
    ps = log2(r7.y);
    r7.x = -r6.x + 1.0;
    r6.x = ps;
    r8.xy = -r7.xx * ModShadowGroupColor.xy + 1.0;
    r5.xyz = r5.xyz * r14.xyz + UniformScalar_10.xxx;
    ps = UniformVector_2.x * r6.y;
    r7.y = dot(r16.zxy, r3.zxy);
    r6.y = ps;
    ps = UniformVector_2.y * r6.z;
    r0.xyz = r15.xyz * r0.xyz;
    r6.z = ps;
    r3.xyz = r14.xyz * r10.xyz + r0.xyz;
    ps = rsqrt(abs(r7.z));
    r7.x = dot(r0.zxy, float3(0.11, 0.3, 0.59));
    r7.z = ps;
    ps = r7.x;
    r10.xyz = r7.zzz * r4.xyz;
    ps = -r0.x + ps;
    r3.xyz = r3.xyz * r13.xyz;
    r7.x = ps;
    ps = UniformVector_2.z * r6.w;
    r12.z = saturate(r7.x + r0.x);
    r6.w = ps;
    ps = 1.0 - r6.w;
    r0.xy = -r6.yz * r12.zz;
    r12.x = ps;
    ps = r12.x * r12.z;
    r7.xz = -r12.zw + 1.0;
    r0.z = ps;
    ps = r12.y * r12.y;
    r4.xyz = r5.xyz * r7.xxx;
    r0.w = ps;
    r5.xyz = r6.yzw + r0.xyz;
    ps = r7.w;
    r5.w = r5.z - 1.0;
    ps = r2.x * ps;
    r5.xyw = r5.xyw * r7.zzz;
    r7.x = ps;
    ps = r7.w;
    r5.z = r5.w + 1.0;
    r6.yzw = (r7.zzz > 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.xyz = (r7.zzz >= 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    ps = r2.y * ps;
    r6.y = dot(r5.zxy, r5.zxy);
    r7.z = ps;
    ps = rsqrt(abs(r6.y));
    r0.xyz = r0.www * r11.xyz;
    r6.y = ps;
    ps = r7.w;
    r5.xyz = r5.xyz * r6.yyy;
    ps = r2.z * ps;
    r6.y = dot(r5.zxy, r10.zxy);
    r7.w = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r2.xyz = r5.xyz * r6.yyy;
    r6.y = ps;
    r6.xzw = r2.xyz * 2.0 - r10.xyz;
    ps = pow(2.0, r6.y);
    r6.x = saturate(dot(r7.wxz, r6.wxz));
    r6.y = ps;
    ps = log2(r6.x);
    r0.xyz = r0.xzy * r6.yyy;
    r9.x = ps;
    ps = -SpotAngles.x - -r7.y;
    r6.yzw = r9.xyz * float3(15.0, 0.875, 0.875);
    r6.x = ps;
    r6.zw = r6.zw * r8.xy + 0.125;
    ps = pow(2.0, r6.y);
    r7.w = saturate(dot(r5.zyx, r7.wzx));
    r6.y = ps;
    ps = SpotAngles.y * r6.x;
    r7.xyz = r4.xyz * r6.yyy;
    r6.y = saturate(ps);
    r7.xy = r3.xy * r7.ww + r7.xy;
    r7.z = r3.z * r7.w + r7.z;
    r6.xw = r6.zy * r6.wy;
    r6.xyz = r6.xxx * r1.xyz + ModShadowColor.xyz;
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
