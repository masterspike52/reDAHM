// ps_98d63a743b9470b3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 210 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000348 10041200 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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

float4 LightColorAndFalloffExponent : register(c8); // float4
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c10); // float2
float4 SpotDirection : register(c9); // float3
float4 UniformScalar_11 : register(c6); // float
float4 UniformScalar_15 : register(c7); // float
float4 UniformScalar_8 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
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
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.z = ps;
    ps = ScreenPositionScaleBias.x * r6.z;
    r7.xy = r1.xy + UniformVector_1.xy;
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -UniformVector_0.xzy + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.w = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    ps = ScreenPositionScaleBias.y * r6.z;
    r6.xy = r6.xy * abs(r9.xy);
    r8.y = ps;
    r6.zw = r8.xy * r5.xy + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r5.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r11.y = tex2D(ShadowTexture, r0.xy).x;
    r14.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r15.x = tex2D(Texture2D_2, r1.xy).w;
    r12.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r15.yzw = tex2D(Texture2D_5, r1.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r6.w = tex2D(Texture2D_4, r1.xy).w;
    r7.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = r2.z;
    r8.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r6.y = saturate(-r8.w + 1.0);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r11.xz = r7.xy * 0.875;
    r6.x = saturate(ps);
    ps = 0.2 * r6.w;
    r8.y = dot(r4.zxy, r4.zxy);
    r7.x = ps;
    r13.xyz = r0.xyz * 2.0 - 1.0;
    ps = 3.0 * r6.w;
    r0.xyz = r15.zyw * UniformScalar_8.xxx;
    r7.y = ps;
    r8.xz = r12.yz * UniformScalar_11.xx + r0.xz;
    ps = 0.5 * r6.w;
    r6.z = dot(r13.zxy, r13.zxy);
    r7.z = ps;
    ps = rsqrt(abs(r8.w));
    r17.xy = r15.xw * 0.5;
    r6.w = ps;
    ps = 1.0 - r6.x;
    r16.xyz = r6.www * -SpotDirection.xyz;
    r6.w = ps;
    ps = log2(r6.y);
    r1.xyz = r7.xyz * r14.xyz;
    r6.x = ps;
    ps = r17.y;
    r18 = r15.xyxz * float4(0.2, 0.2, 3.0, 3.0);
    ps = r14.z * ps;
    r7.xy = r18.yw * r14.xy;
    r7.z = ps;
    ps = r17.x;
    r1.xy = r18.xz * r1.xy;
    ps = r1.z * ps;
    r6.y = dot(r16.zxy, r3.zxy);
    r1.z = ps;
    r3.xy = -r6.ww * ModShadowGroupColor.xy + 1.0;
    r11.zw = r11.xz * r3.xy + 0.125;
    r1.xyz = r15.xxx * r14.xyz + r1.xyz;
    ps = rsqrt(abs(r8.y));
    r7.xyz = r1.xyz + r7.xyz;
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r1.w = r7.y + r8.x;
    r6.z = ps;
    r1.xyz = r6.www * r4.xyz;
    r8.xyw = r13.xyz * r6.zzz;
    ps = -SpotAngles.x - -r6.y;
    r6.w = dot(r8.wxy, r1.zxy);
    r6.z = ps;
    ps = SpotAngles.y * r6.z;
    r3.xyz = r8.xwy * r6.www;
    r11.x = saturate(ps);
    r3.xyz = r3.xyz * 2.0 - r1.xzy;
    r1.xyz = r12.xyz * UniformScalar_11.xxx + r7.xyz;
    ps = r7.z;
    r6.yzw = -ModShadowColor.xyz + 1.0;
    ps = r8.z + ps;
    r7.xyz = r11.zxy * r11.wxy;
    r8.z = ps;
    r6.yzw = r7.xxx * r6.yzw + ModShadowColor.xyz;
    ps = rsqrt(abs(r7.w));
    r8.z = r8.z + r5.z;
    r7.w = ps;
    r2.xyz = r7.www * r2.xyz;
    r8.x = saturate(dot(r8.wxy, r2.zxy));
    r1.xyz = r1.xyz + r0.yxz;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r0.xyz = r7.zzz * r9.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r8.y = saturate(dot(r2.zxy, r3.yxz));
    r6.x = ps;
    r0.xyz = r0.xzy * r6.xxx;
    ps = r8.y * r8.y;
    r2 = r1 + r5.xyzy;
    r1.w = ps;
    ps = r8.z;
    r7.xzw = r2.xyz * UniformScalar_15.xxx;
    ps = r10.y * ps;
    r1.xy = r2.xw * r10.xz;
    r1.z = ps;
    r8 = r1 * r8.xxxy;
    r8.xy = r7.xz * r8.ww + r8.xy;
    r8.z = r7.w * r8.w + r8.z;
    r8.xyz = r0.xzy * r8.xyz;
    r8.xyz = r8.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r8.xzy * r7.yyy;
    r6.xyz = r7.xzy * r6.yzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
