// ps_7a9816f275b4ad05.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000360 10040F00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = ps;
    ps = 1.0 / r4.w;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.yy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r13.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r15.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).zxy;
    r7.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = UniformVector_2.x * UniformVector_2.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r12.x = ps;
    ps = UniformVector_2.z * UniformVector_2.z;
    r14.z = UniformScalar_22.x - UniformScalar_21.x;
    r12.y = ps;
    ps = r1.z;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r5.z = dot(r2.zxy, r2.zxy);
    r5.x = ps;
    ps = 0.875 * r6.x;
    r6.z = dot(r3.zxy, r3.zxy);
    r12.z = ps;
    r0.xzw = r7.wxy * 2.0 - 1.0;
    ps = r4.x + r4.x;
    r1.w = dot(r1.zxy, r1.zxy);
    r14.w = ps;
    ps = 5.0 * r5.x;
    r7.xyz = r15.xyz * r2.www;
    r5.y = saturate(ps);
    ps = 4.0 * r4.y;
    r10.xyz = r10.xyz + r10.xyz;
    r14.x = ps;
    ps = 4.0 * r4.z;
    r5.x = dot(r11.zxy, float3(1.0, 1.0, 1.0));
    r14.y = ps;
    ps = 1.0 - r5.x;
    r5.y = -r5.y + 1.0;
    r0.y = ps;
    r11.zw = -r5.yy * ModShadowGroupColor.xy + 1.0;
    ps = UniformScalar_23.x * r0.y;
    r5.xyw = r14.yxw + float3(-2.0, -2.0, -1.0);
    r6.w = ps;
    ps = r5.x;
    r14.xy = r5.yw - r0.zx;
    ps = -r0.w + ps;
    r5.xyw = r14.xyz * UniformScalar_0.xxx;
    r10.w = ps;
    ps = UniformScalar_21.x + r5.w;
    r2.xyz = r13.xyz * UniformVector_8.xyz;
    r0.x = ps;
    ps = (-2.0) + r5.y;
    r11.x = r0.z + r5.x;
    r5.x = ps;
    r2.w = r7.w * 2.0 + r5.x;
    ps = rsqrt(abs(r1.w));
    r2 = r2 * r0.yyyy;
    r5.x = ps;
    ps = r2.w;
    r4.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    r10.xyz = r2.xyz * r10.xyz - r2.xyz;
    r11.y = r10.w * UniformScalar_0.x + r0.w;
    r1.xyz = r10.xyz * UniformScalar_0.xxx + r2.xyz;
    r2.xyz = r1.xyz * r0.xxx + r6.www;
    ps = 1.0 + r5.x;
    r0.xw = r11.xy * r0.yy;
    r0.z = ps;
    ps = 0.875 * r6.y;
    r10 = r0.xzyw * UniformVector_2.xzyy;
    r12.w = ps;
    ps = r10.z;
    r5.yw = r12.xy * r0.yz;
    ps = r11.y * ps;
    r5.x = r5.y * r11.x;
    r6.x = ps;
    ps = rsqrt(abs(r6.z));
    r12.xy = r5.xw * r0.yz;
    r5.y = ps;
    r5.x = r6.x * r10.w + r12.y;
    r6.yz = r12.zw * r11.zw + 0.125;
    r5.x = r12.x * r11.x + r5.x;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r5.yyy * r3.xyz;
    r6.w = ps;
    r3.xy = r10.xy * r6.ww;
    ps = 1.0 - r5.z;
    r3.zw = r6.xy * r6.wz;
    r6.x = saturate(ps);
    r5.xyz = r3.www * r9.xyz + ModShadowColor.xyz;
    ps = log2(r6.x);
    r5.w = dot(r3.yxz, r3.yxz);
    r6.x = ps;
    ps = rsqrt(abs(r5.w));
    r6.w = r6.x * LightColorAndFalloffExponent.w;
    r5.w = ps;
    ps = UniformScalar_24.x;
    r6.xyz = r3.xyz * r5.www;
    r9.x = ps;
    ps = 0.0001;
    r5.w = dot(r6.yxz, r0.zxy);
    r9.y = ps;
    ps = max(r9.x, r9.y);
    r3.xyz = r6.xzy * r5.www;
    r7.w = ps;
    r0.xyz = r3.xyz * 2.0 - r0.xyz;
    ps = pow(2.0, r6.w);
    r5.w = saturate(dot(r4.zxy, r0.zxy));
    r0.x = ps;
    ps = log2(r5.w);
    r1.xyz = r1.xyz * r8.xyz;
    r0.y = ps;
    r0 = r7.xzyw * r0.xxxy;
    ps = pow(2.0, r0.w);
    r5.w = saturate(dot(r6.yxz, r4.zxy));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
