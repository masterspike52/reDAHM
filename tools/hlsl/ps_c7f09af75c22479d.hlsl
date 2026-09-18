// ps_c7f09af75c22479d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 267 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000042C 10041200 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
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
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
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
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_2, r0.xy);
    ps = (-0.5) + r10.w;
    r5.xy = r0.xy * UniformScalar_0.xx;
    r5.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r11.xyz = tex2D(Texture2D_0, r5.xy).xyw;
    ps = r0.z;
    r5.yw = r0.wz * UniformVector_4.xy;
    r6.y = saturate(ps);
    ps = r4.w;
    r8.xy = r0.xy * UniformScalar_7.xx;
    ps = 0.0001 * ps;
    r5.z = -UniformScalar_5.x + 1.0;
    r6.z = saturate(ps);
    ps = UniformScalar_6.x;
    r9.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = -UniformScalar_5.x + ps;
    r5.x = r1.z + 0.1;
    r6.x = ps;
    r15.xy = r11.xy * 2.0 - 1.0;
    ps = 1.0 / r6.x;
    r5.z = r5.z - r6.y;
    r6.x = ps;
    ps = 5.0 * r5.x;
    r17.y = saturate(r5.z * r6.x);
    r17.x = saturate(ps);
    ps = 1.0 / r4.w;
    r5.xz = -r17.xy + 1.0;
    r15.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r5.xx * ModShadowGroupColor.xy;
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xyz = -r6.xzy + 1.0;
    r4.y = ps;
    ps = UniformScalar_1.x * r6.y;
    r7.zw = r4.xy * abs(r7.xy);
    r9.x = ps;
    r7.xy = r9.yz * r15.zz + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r14.z = tex2D(Texture2D_4, r8.xy).x;
    r14.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r16.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r18.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r7.xyz = tex2D(Texture2D_5, r5.yw).xyz;
    r8.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r6.w = dot(r3.zxy, r3.zxy);
    r1.w = float((UniformScalar_10.x >= 1.0));
    r0.y = float((UniformScalar_10.x > 1.0));
    r0.x = dot(r1.zxy, r1.zxy);
    r5.w = dot(r2.zxy, r2.zxy);
    r13.z = r8.z * 2.0 - 1.0;
    r13.xy = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.x));
    r5.y = saturate(-r5.w + 1.0);
    r0.x = ps;
    r0.yzw = (-abs(r0.yyy) >= 0.0) ? r7.xyz : 1.0;
    r8.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r0.yzw;
    ps = rsqrt(abs(r6.w));
    r12.xyz = r0.xxx * r1.xyz;
    r6.w = ps;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r1.xyz = r18.xyz * r2.www;
    ps = rsqrt(abs(r5.w));
    r3.yzw = r6.www * r3.xyz;
    r5.w = ps;
    ps = log2(r5.y);
    r18.xyz = r5.www * -SpotDirection.xyz;
    r5.x = ps;
    r5.y = dot(r18.zxy, r2.zxy);
    r2.xyz = r17.yyy * r10.xyz;
    r10.xyz = r16.xyz * r10.xyz - r2.xyz;
    r13.xy = r9.xx * r15.xy + r13.xy;
    r13.xyz = r13.xyz * UniformVector_2.xyz;
    ps = -SpotAngles.x - -r5.y;
    r5.w = dot(r13.zxy, r13.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r3.x = saturate(r5.y * SpotAngles.y);
    r5.y = ps;
    r13.xyz = r13.xyz * r5.yyy;
    r5.y = dot(r13.zxy, r3.wyz);
    ps = LightColorAndFalloffExponent.w * r5.x;
    r15.xyz = r13.xzy * r5.yyy;
    r5.w = ps;
    r3.yzw = r15.xyz * 2.0 - r3.ywz;
    ps = pow(2.0, r5.w);
    r5.y = saturate(dot(r12.zxy, r3.zyw));
    r5.w = ps;
    ps = log2(r5.y);
    r1.xyz = r1.xyz * r5.www;
    r14.w = ps;
    r5.xyw = r14.xyw * float3(0.875, 0.875, 15.0);
    r14.xy = r5.xy * r6.xz;
    r3.yzw = r14.xyz + float3(0.125, 0.125, 0.5);
    ps = r5.z;
    r6.w = saturate(dot(r13.zxy, r12.zxy));
    ps = r3.w * ps;
    r5.xz = r3.yx * r3.zx;
    r11.w = ps;
    r0.xyz = r5.xxx * r0.xyz + ModShadowColor.xyz;
    r5.xy = r11.wz + float2(-0.5, -1.0);
    r6.x = r5.y * r6.y + 1.0;
    ps = 5.0000005 * r5.x;
    r3.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r6.y = saturate(ps);
    r2.xyz = r6.yyy * r10.xyz + r2.xyz;
    r6.x = (r9.x > 0.0) ? r6.x : 1.0;
    r6.x = (r9.x >= 0.0) ? r6.x : 1.0;
    r2.xyz = r3.xyz * r2.xyz;
    r2.xyz = r2.xyz * r8.xyz;
    r2.xyz = r2.xyz * r6.xxx;
    r6.xyz = r2.xyz * r7.xyz;
    ps = pow(2.0, r5.w);
    r3.xyz = -r2.xyz + r4.xyz;
    r5.y = ps;
    r2.xyz = r3.xyz * UniformScalar_11.xxx + r2.xyz;
    r2.xyz = r2.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r5.xyw = r2.xyz * r5.yyy;
    r6.xy = r6.xy * r6.ww + r5.xy;
    r6.z = r6.z * r6.w + r5.w;
    r6.xyz = r1.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xyz * r5.zzz;
    r5.xyz = r5.xyz * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
