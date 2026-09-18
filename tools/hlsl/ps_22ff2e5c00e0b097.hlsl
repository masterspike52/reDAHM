// ps_22ff2e5c00e0b097.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 231 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000039C 10040F00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c13); // float2
float4 SpotDirection : register(c12); // float3
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_21 : register(c7); // float
float4 UniformScalar_22 : register(c8); // float
float4 UniformScalar_23 : register(c9); // float
float4 UniformScalar_24 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_8 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r14.yz = UniformVector_2.xz * UniformVector_2.xz;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = UniformScalar_22.x - UniformScalar_21.x;
    r5.z = ps;
    r6.xy = r5.zw * abs(r7.xy);
    r5.xy = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r8.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r5.xyw = tex2D(Texture2D_1, r0.xy).zxy;
    r7.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = UniformScalar_24.x;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r9.x = ps;
    ps = 0.0001;
    r1.w = dot(r3.zxy, r3.zxy);
    r9.y = ps;
    ps = r1.z;
    r6.y = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r10.yz = r6.xw * 0.875;
    r3.w = ps;
    r0.xzw = r7.wxy * 2.0 - 1.0;
    ps = r5.x + r5.x;
    r5.z = dot(r2.zxy, r2.zxy);
    r6.w = ps;
    ps = 1.0 - r5.z;
    r12.xyz = r12.xyz + r12.xyz;
    r0.y = saturate(ps);
    ps = 4.0 * r5.y;
    r13.xyz = r13.xyz * UniformVector_8.xyz;
    r6.x = ps;
    ps = rsqrt(abs(r6.y));
    r5.y = saturate(r3.w * 5.0);
    r5.x = ps;
    ps = 1.0 - r5.y;
    r15.x = dot(r8.zxy, float3(1.0, 1.0, 1.0));
    r6.y = ps;
    ps = rsqrt(abs(r1.w));
    r7.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    ps = log2(r0.y);
    r8.xyz = r5.xxx * r3.xyz;
    r5.x = ps;
    ps = 4.0 * r5.w;
    r15.yz = r6.yy * ModShadowGroupColor.xy;
    r6.y = ps;
    ps = rsqrt(abs(r5.z));
    r6.xyw = r6.yxw + float3(-2.0, -2.0, -1.0);
    r5.y = ps;
    ps = r6.x;
    r1.xyz = r5.yyy * -SpotDirection.xyz;
    ps = -r0.w + ps;
    r5.yzw = -r15.yxz + 1.0;
    r12.w = ps;
    ps = UniformScalar_23.x * r5.z;
    r6.xy = r6.yw - r0.zx;
    r0.x = ps;
    ps = UniformVector_2.y * r5.z;
    r6.xyz = r6.xzy * UniformScalar_0.xxx;
    r6.w = ps;
    ps = UniformScalar_21.x + r6.y;
    r3.xyz = r13.xyz * r5.zzz;
    r0.y = ps;
    r12.xyz = r3.xyz * r12.xyz - r3.xyz;
    ps = r0.z;
    r1.w = r6.z - 2.0;
    r10.x = r7.w * 2.0 + r1.w;
    r3.xyz = r12.xyz * UniformScalar_0.xxx + r3.xyz;
    r14.x = r12.w * UniformScalar_0.x + r0.w;
    ps = r6.x + ps;
    r1.w = r6.w * r14.x;
    r10.w = ps;
    r13.xy = r10.xw * r5.zz + float2(1.0, 0.0);
    r12.yzw = r10.xyz * r5.zyw + float3(1.0, 0.125, 0.125);
    ps = r14.z;
    r6.w = dot(r1.zxy, r2.zxy);
    ps = r12.y * ps;
    r13.zw = r14.xy * r5.zz;
    r12.x = ps;
    ps = r13.w;
    r2.xyz = r3.xyz * r0.yyy;
    ps = r10.w * ps;
    r1.xyz = r13.yxz * UniformVector_2.xzy;
    r6.x = ps;
    ps = r6.x;
    r0.yz = r12.xz * r12.yw;
    r6.xyz = r0.zzz * r11.xyz + ModShadowColor.xyz;
    ps = r5.z * ps;
    r0.w = r1.w * r1.z;
    r5.y = ps;
    r2.w = r5.y * r10.w + r0.w;
    ps = max(r9.x, r9.y);
    r0 = r2 + r0.xxxy;
    r5.z = ps;
    ps = rsqrt(abs(r0.w));
    r5.y = r6.w - SpotAngles.x;
    r5.w = ps;
    ps = -UniformVector_0.x;
    r1.yzw = r1.xyw * r5.www;
    ps = 1.0 + ps;
    r5.w = dot(r1.zyw, r1.zyw);
    r1.x = ps;
    ps = rsqrt(abs(r5.w));
    r5.y = saturate(r5.y * SpotAngles.y);
    r5.w = ps;
    ps = -UniformVector_0.y;
    r2.xyz = r1.yzw * r5.www;
    ps = 1.0 + ps;
    r5.w = dot(r2.yxz, r8.zxy);
    r1.y = ps;
    ps = -UniformVector_0.z;
    r9.xyz = r2.xzy * r5.www;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.w = saturate(dot(r7.zxy, r8.zxy));
    r1.z = ps;
    ps = log2(r5.w);
    r1.xyz = r3.xyz * r1.xyz;
    r5.w = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.yz = r5.yz * r5.yw;
    r5.x = ps;
    ps = pow(2.0, r5.z);
    r5.w = saturate(dot(r2.yxz, r7.zxy));
    r6.w = ps;
    ps = pow(2.0, r5.x);
    r0.xyz = r0.xyz * r6.www;
    r5.x = ps;
    r0.xy = r1.xy * r5.ww + r0.xy;
    r0.z = r1.z * r5.w + r0.z;
    r0.xyz = r0.xyz * r5.xxx;
    r0.xyz = r0.xyz * r4.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r0.xzy * r5.yyy;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
