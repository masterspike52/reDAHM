// ps_d7fcd3a88eeeb1d0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 252 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003F0 10040F00 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c21); // float2
float4 SpotDirection : register(c20); // float3
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_14 : register(c17); // float
float4 UniformScalar_15 : register(c18); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
float4 UniformVector_6 : register(c9); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_4 : register(s3);
sampler2D Texture2D_5 : register(s4);
sampler2D Texture2D_6 : register(s5);
sampler2D Texture2D_7 : register(s6);
sampler2D ShadowTexture : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
    float4 color2 : COLOR2; // r8
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
    float4 r7 = In.color1;
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r12.w = UniformScalar_15.x - UniformScalar_14.x;
    r6.z = ps;
    ps = ScreenPositionScaleBias.x * r6.z;
    r7.xy = r1.xy * UniformVector_1.xy;
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = ps;
    ps = ScreenPositionScaleBias.y * r6.z;
    r6.xy = r6.xy * abs(r9.xy);
    r7.w = ps;
    r6.zw = r7.zw * r5.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r9.y = tex2D(ShadowTexture, r0.xy).x;
    r0.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r12.xyz = tex2D(Texture2D_6, r7.xy).xyz;
    r9.xzw = tex2D(Texture2D_7, r1.xy).xyz;
    r6.xzw = tex2D(Texture2D_1, r1.xy).zxy;
    r8.xyz = tex2D(Texture2D_0, r7.xy).xyz;
    r7.xy = tex2D(Texture2D_5, r1.xy).yx;
    r0.w = tex2D(Texture2D_4, r1.xy).x;
    ps = (UniformScalar_11.x >= 0.0) ? 1.0 : 0.0;
    r7.z = dot(r4.zxy, r4.zxy);
    r8.w = ps;
    ps = r2.z;
    r0.z = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r7.w = dot(r3.zxy, r3.zxy);
    r2.w = ps;
    ps = (UniformScalar_11.x > 0.0) ? 1.0 : 0.0;
    r15.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r6.y = ps;
    r0.w = r0.w * UniformScalar_9.x + UniformScalar_10.x;
    ps = r7.y + r7.x;
    r14.xyw = UniformVector_3.xyz * UniformVector_3.www;
    r1.z = ps;
    r8.xyz = r8.xzy * 2.0 - 1.0;
    ps = r6.x + r6.x;
    r9.xzw = r9.xzw + r9.xzw;
    r14.z = ps;
    r13.xyz = (-abs(r6.yyy) >= 0.0) ? UniformVector_4.xyz : r14.xyw;
    r1.xyw = (-abs(r6.yyy) >= 0.0) ? UniformVector_6.xyz : r15.xyz;
    ps = rsqrt(abs(r0.z));
    r6.y = saturate(-r7.w + 1.0);
    r0.z = ps;
    ps = rsqrt(abs(r7.z));
    r6.x = saturate(r2.w * 5.0);
    r7.z = ps;
    ps = rsqrt(abs(r7.w));
    r2.yzw = r0.zzz * r2.xyz;
    r7.w = ps;
    r1.xyw = (-abs(r8.www) >= 0.0) ? r15.xyz : r1.xyw;
    r13.xyz = (-abs(r8.www) >= 0.0) ? r14.xyw : r13.xyz;
    ps = log2(r6.y);
    r15.xyz = r7.www * -SpotDirection.xyz;
    r6.y = ps;
    ps = 4.0 * r6.z;
    r13.xyz = r13.xyz * r7.yyy;
    r14.x = ps;
    ps = 4.0 * r6.w;
    r7.y = dot(r15.zxy, r3.zxy);
    r14.y = ps;
    ps = 1.0 - r6.x;
    r3.xyz = r14.xyz + float3(-2.0, -2.0, -1.0);
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r14.xyz = r1.xyw * r7.xxx;
    r1.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r3.xyz = -r8.xyz + r3.xzy;
    r1.y = ps;
    r1.xyz = -r1.xyz + 1.0;
    r3.xyz = r3.xzy * UniformScalar_2.xxx + r8.xzy;
    ps = r7.z;
    r6.x = dot(r3.zxy, r3.zxy);
    ps = r4.x * ps;
    r8.xyz = r1.zzz * r12.xyz;
    r7.x = ps;
    r8.xyz = r14.xyz * r12.xyz + r8.xyz;
    ps = rsqrt(abs(r6.x));
    r6.z = r7.y - SpotAngles.x;
    r6.x = ps;
    ps = r7.z;
    r3.xyz = r3.xzy * r6.xxx;
    r8.xyz = r13.xyz * r12.xyz + r8.xyz;
    r12.xyz = r8.xyz * r9.xzw - r8.xyz;
    ps = r4.y * ps;
    r6.x = dot(r3.yxz, r3.yxz);
    r7.y = ps;
    ps = rsqrt(abs(r6.x));
    r9.x = saturate(r6.z * SpotAngles.y);
    r6.x = ps;
    r8.w = r12.w * UniformScalar_2.x + UniformScalar_14.x;
    r8.xyz = r12.xyz * UniformScalar_2.xxx + r8.xyz;
    ps = r7.z;
    r3.xyz = r3.xzy * r6.xxx;
    ps = r4.z * ps;
    r7.w = saturate(dot(r3.zxy, r2.wyz));
    r7.z = ps;
    r6.xzw = r8.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r0.z = dot(r3.zxy, r7.zxy);
    ps = r8.w;
    r3.xyz = r3.xzy * r0.zzz;
    r2.x = ps;
    r7.xyz = r3.xyz * 2.0 - r7.xzy;
    ps = 0.0001;
    r7.x = saturate(dot(r2.wyz, r7.yxz));
    r2.y = ps;
    ps = log2(r7.x);
    r8.yzw = r8.xyz - UniformVector_2.xyz;
    r0.z = ps;
    ps = max(r2.x, r2.y);
    r7.xyz = r0.xyz * float3(0.875, 0.875, 4e+02);
    r8.x = ps;
    r8 = r8 * r0.zwww;
    r9.zw = r7.xy * r1.xy + 0.125;
    r1.xyz = r8.yzw + UniformVector_2.xyz;
    ps = pow(2.0, r7.z);
    r1.xyz = r1.xyz * r11.xyz;
    r7.x = ps;
    r6.xzw = r7.xxx * UniformScalar_8.xxx + r6.xzw;
    r7.xyz = r9.zxy * r9.wxy;
    ps = pow(2.0, r8.x);
    r8.yzw = r6.xzw * r0.www;
    r8.x = ps;
    r6.xzw = r7.xxx * r10.xyz + ModShadowColor.xyz;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r8.xyz = r8.yzw * r8.xxx;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r0.xyz = r7.zzz * r5.xyz;
    r6.y = ps;
    r0.xyz = r0.xzy * r6.yyy;
    r8.xy = r1.xy * r7.ww + r8.xy;
    r8.z = r1.z * r7.w + r8.z;
    r8.xyz = r0.xzy * r8.xyz;
    r8.xyz = r8.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r8.xzy * r7.yyy;
    r6.xyz = r7.xzy * r6.xzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
