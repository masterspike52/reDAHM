// ps_c6c77a284a6ce198.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000360 10040C00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = ps;
    ps = 1.0 / r4.w;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r0.ww * ScreenPositionScaleBias.xy;
    r0.w = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r4.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r12.xyw = tex2D(Texture2D_2, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).zxy;
    r8.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    ps = UniformVector_2.x * UniformVector_2.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = UniformVector_2.z * UniformVector_2.z;
    r12.z = UniformScalar_22.x - UniformScalar_21.x;
    r6.z = ps;
    ps = r1.z;
    r0.y = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r10.yz = r0.xz * 0.875;
    r0.x = ps;
    r8.xyw = r8.xzy * 2.0 - 1.0;
    ps = r4.x + r4.x;
    r1.w = dot(r3.zxy, r3.zxy);
    r2.z = ps;
    ps = 5.0 * r0.x;
    r2.w = dot(r1.zxy, r1.zxy);
    r0.x = saturate(ps);
    ps = 4.0 * r4.y;
    r9.xyz = r9.xyz + r9.xyz;
    r2.x = ps;
    ps = 4.0 * r4.z;
    r0.z = -r0.x + 1.0;
    r2.y = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r11.xyz = r11.xyz * UniformVector_8.xyz;
    r4.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r2.xyz = r2.yxz + float3(-2.0, -2.0, -1.0);
    r4.z = ps;
    ps = r2.x;
    r4.x = dot(r12.wxy, float3(1.0, 1.0, 1.0));
    ps = -r8.w + ps;
    r0.xzw = -r4.yxz + 1.0;
    r9.w = ps;
    ps = UniformScalar_23.x * r0.z;
    r12.xy = r2.yz - r8.xy;
    r4.x = ps;
    ps = UniformVector_2.y * r0.z;
    r2.xyz = r12.xzy * UniformScalar_0.xxx;
    r4.y = ps;
    ps = UniformScalar_21.x + r2.y;
    r11.xyz = r11.xyz * r0.zzz;
    r3.w = ps;
    r9.xyz = r11.xyz * r9.xyz - r11.xyz;
    ps = r8.x;
    r4.z = r2.z - 2.0;
    r10.x = r8.z * 2.0 + r4.z;
    r8.xyz = r9.xyz * UniformScalar_0.xxx + r11.xyz;
    r6.x = r9.w * UniformScalar_0.x + r8.w;
    ps = r2.x + ps;
    r6.w = r4.y * r6.x;
    r10.w = ps;
    r12.xy = r10.xw * r0.zz + float2(1.0, 0.0);
    r11.yzw = r10.xyz * r0.zxw + float3(1.0, 0.125, 0.125);
    ps = r6.z;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    ps = r11.y * ps;
    r12.zw = r6.xy * r0.zz;
    r11.x = ps;
    ps = r12.w;
    r9.xyz = r8.xyz * r3.www;
    ps = r10.w * ps;
    r6.xyz = r12.yxz * UniformVector_2.xzy;
    r3.w = ps;
    ps = r3.w;
    r4.yz = r11.xz * r11.yw;
    r2.xyz = r4.zzz * r2.xyz + ModShadowColor.xyz;
    ps = r0.z * ps;
    r3.w = r6.w * r6.z;
    r0.x = ps;
    r9.w = r0.x * r10.w + r3.w;
    ps = rsqrt(abs(r2.w));
    r4 = r9 + r4.xxxy;
    r0.x = ps;
    ps = rsqrt(abs(r4.w));
    r1.xyz = r0.xxx * r1.xyz;
    r0.x = ps;
    ps = UniformScalar_24.x;
    r6.xyz = r6.xyw * r0.xxx;
    r0.z = ps;
    ps = rsqrt(abs(r1.w));
    r0.x = dot(r6.yxz, r6.yxz);
    r0.w = ps;
    ps = rsqrt(abs(r0.x));
    r3.xyz = r0.www * r3.xyz;
    r0.x = ps;
    ps = 0.0001;
    r6.xyz = r6.xyz * r0.xxx;
    r0.w = ps;
    ps = max(r0.z, r0.w);
    r0.x = dot(r6.yxz, r3.zxy);
    r8.w = ps;
    ps = 1.0 - r0.y;
    r9.xyz = r6.xzy * r0.xxx;
    r0.x = saturate(ps);
    r0.yzw = r9.xyz * 2.0 - r3.xyz;
    ps = log2(r0.x);
    r0.y = saturate(dot(r1.zxy, r0.wyz));
    r0.x = ps;
    ps = log2(r0.y);
    r0.x = r0.x * LightColorAndFalloffExponent.w;
    r7.w = ps;
    r3 = r8 * r7;
    ps = pow(2.0, r3.w);
    r1.x = saturate(dot(r6.yxz, r1.zxy));
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r0.yzw = r4.xyz * r0.yyy;
    r0.x = ps;
    r0.yz = r3.xy * r1.xx + r0.yz;
    r0.w = r3.z * r1.x + r0.w;
    r0.xyz = r0.yzw * r0.xxx;
    r0.xyz = r0.xyz * r5.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.xzy * r2.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
