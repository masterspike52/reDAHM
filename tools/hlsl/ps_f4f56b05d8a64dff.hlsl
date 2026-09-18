// ps_f4f56b05d8a64dff.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 273 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000444 10041300 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c16); // float4
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c18); // float2
float4 SpotDirection : register(c17); // float3
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
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ShadowTexture : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 r19 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_2, r1.xy);
    ps = (-0.5) + r10.w;
    r6.xy = r1.xy * UniformScalar_0.xx;
    r6.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r11.xyz = tex2D(Texture2D_0, r6.xy).xyw;
    ps = r1.z;
    r6.yz = r1.wz * UniformVector_4.xy;
    r7.y = saturate(ps);
    ps = r5.w;
    r12.xy = r1.xy * UniformScalar_7.xx;
    ps = 0.0001 * ps;
    r6.w = -UniformScalar_5.x + 1.0;
    r7.z = saturate(ps);
    ps = UniformScalar_6.x;
    r9.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = -UniformScalar_5.x + ps;
    r6.x = r2.z + 0.1;
    r7.x = ps;
    r16.xy = r11.xy * 2.0 - 1.0;
    ps = 1.0 / r7.x;
    r6.w = r6.w - r7.y;
    r7.x = ps;
    ps = 5.0 * r6.x;
    r19.y = saturate(r6.w * r7.x);
    r19.x = saturate(ps);
    ps = 1.0 / r5.w;
    r0.zw = -r19.xy + 1.0;
    r16.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xy = r0.zz * ModShadowGroupColor.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xyz = -r7.xzy + 1.0;
    r6.w = ps;
    ps = UniformScalar_1.x * r7.y;
    r8.xy = r6.xw * abs(r8.xy);
    r9.x = ps;
    r6.xw = r9.yz * r16.zz + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r12.z = tex2D(Texture2D_4, r12.xy).x;
    r12.yw = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r17.xyz = tex2D(LightAttenuationTexture, r6.xw).xyz;
    r18.x = tex2D(ShadowTexture, r0.xy).x;
    r18.yzw = tex2D(Texture2D_3, r1.xy).xyz;
    r8.xyz = tex2D(Texture2D_5, r6.yz).xyz;
    r1.yzw = tex2D(Texture2D_1, r1.xy).xyz;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = dot(r4.zxy, r4.zxy);
    r7.w = float((UniformScalar_10.x >= 1.0));
    r1.x = float((UniformScalar_10.x > 1.0));
    r6.w = dot(r2.zxy, r2.zxy);
    r6.x = dot(r3.zxy, r3.zxy);
    r14.z = r1.w * 2.0 - 1.0;
    r14.xy = r1.yz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r6.z = saturate(-r6.x + 1.0);
    r6.w = ps;
    r1.xyz = (-abs(r1.xxx) >= 0.0) ? r8.xyz : 1.0;
    r8.xyz = (-abs(r7.www) >= 0.0) ? 1.0 : r1.xyz;
    ps = rsqrt(abs(r6.y));
    r13.xyz = r6.www * r2.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r15.xyz = r6.yyy * r4.xyz;
    r6.x = ps;
    ps = log2(r6.z);
    r6.xyw = r6.xxx * -SpotDirection.xyz;
    r6.z = ps;
    r6.y = dot(r6.wxy, r3.zxy);
    r2.xyz = r19.yyy * r10.xyz;
    r10.xyz = r18.yzw * r10.xyz - r2.xyz;
    ps = -SpotAngles.x - -r6.y;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = SpotAngles.y * r6.x;
    r4.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r18.y = saturate(ps);
    r6.xw = r18.xy * r18.xy;
    r1.xyz = r6.xxx * r17.xyz;
    r14.xy = r9.xx * r16.xy + r14.xy;
    ps = LightColorAndFalloffExponent.w * r6.z;
    r14.xyz = r14.xyz * UniformVector_2.xyz;
    r6.z = ps;
    ps = pow(2.0, r6.z);
    r6.y = dot(r14.zxy, r14.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r1.xyz = r1.xzy * r6.zzz;
    r6.y = ps;
    r14.xyz = r14.xyz * r6.yyy;
    r6.y = dot(r14.zxy, r15.zxy);
    r16.xyz = r14.xzy * r6.yyy;
    r15.xyz = r16.xyz * 2.0 - r15.xzy;
    r6.y = saturate(dot(r13.zxy, r15.yxz));
    ps = log2(r6.y);
    r7.w = saturate(dot(r14.zxy, r13.zxy));
    r12.x = ps;
    r6.xyz = r12.ywx * float3(0.875, 0.875, 15.0);
    r12.xy = r6.xy * r7.xz;
    r12.xyz = r12.xyz + float3(0.125, 0.125, 0.5);
    ps = r12.x * r12.y;
    r11.w = r0.w * r12.z;
    r0.w = ps;
    r0.xyz = r0.www * r0.xyz + ModShadowColor.xyz;
    r6.xy = r11.wz + float2(-0.5, -1.0);
    r7.x = r6.y * r7.y + 1.0;
    ps = 5.0000005 * r6.x;
    r7.y = saturate(ps);
    r2.xyz = r7.yyy * r10.xyz + r2.xyz;
    r7.x = (r9.x > 0.0) ? r7.x : 1.0;
    r7.x = (r9.x >= 0.0) ? r7.x : 1.0;
    r2.xyz = r4.xyz * r2.xyz;
    r2.xyz = r2.xyz * r8.xyz;
    r2.xyz = r2.xyz * r7.xxx;
    r7.xyz = r2.xyz * r3.xyz;
    ps = pow(2.0, r6.z);
    r3.xyz = -r2.xyz + r5.xyz;
    r6.y = ps;
    r2.xyz = r3.xyz * UniformScalar_11.xxx + r2.xyz;
    r2.xyz = r2.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r6.xyz = r2.xyz * r6.yyy;
    r7.xy = r7.xy * r7.ww + r6.xy;
    r7.z = r7.z * r7.w + r6.z;
    r7.xyz = r1.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.www;
    r6.xyz = r6.xzy * r0.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
