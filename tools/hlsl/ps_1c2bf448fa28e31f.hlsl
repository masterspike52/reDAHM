// ps_1c2bf448fa28e31f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 219 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000036C 10040D00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r6.xx * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.zw = UniformVector_2.xz * UniformVector_2.xz;
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r6.zw = r6.zw * r5.xy + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r0.y = tex2D(ShadowTexture, r0.xy).x;
    r12.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r10.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r11.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r7.xyz = tex2D(Texture2D_1, r1.xy).zxy;
    r8.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = UniformScalar_22.x;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    ps = -UniformScalar_21.x + ps;
    r6.w = r2.z + 0.1;
    r13.z = ps;
    r8.xyw = r8.xzy * 2.0 - 1.0;
    ps = r7.x + r7.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r13.w = ps;
    ps = 5.0 * r6.w;
    r6.z = dot(r3.zxy, r3.zxy);
    r2.w = saturate(ps);
    ps = 1.0 - r6.z;
    r6.w = dot(r4.zxy, r4.zxy);
    r0.x = saturate(ps);
    ps = 4.0 * r7.y;
    r1.w = dot(r2.zxy, r2.zxy);
    r13.x = ps;
    ps = 4.0 * r7.z;
    r6.z = dot(r11.zxy, float3(1.0, 1.0, 1.0));
    r13.y = ps;
    ps = 1.0 - r6.z;
    r10.xyz = r10.xyz + r10.xyz;
    r7.w = ps;
    ps = log2(r0.x);
    r7.x = -r2.w + 1.0;
    r6.z = ps;
    r11.zw = -r7.xx * ModShadowGroupColor.xy + 1.0;
    ps = UniformScalar_23.x * r7.w;
    r7.xyz = r13.yxw + float3(-2.0, -2.0, -1.0);
    r0.x = ps;
    ps = r7.x;
    r12.xyz = r12.xyz * UniformVector_8.xyz;
    ps = -r8.w + ps;
    r13.xy = r7.yz - r8.xy;
    r10.w = ps;
    ps = rsqrt(abs(r1.w));
    r7.xyz = r13.xyz * UniformScalar_0.xxx;
    r1.w = ps;
    ps = UniformScalar_21.x + r7.z;
    r3.xyz = r1.www * r2.xyz;
    r1.w = ps;
    ps = (-2.0) + r7.y;
    r11.x = r8.x + r7.x;
    r7.x = ps;
    r12.w = r8.z * 2.0 + r7.x;
    ps = rsqrt(abs(r6.w));
    r2 = r12 * r7.wwww;
    r6.w = ps;
    ps = r2.w;
    r8.xyz = r6.www * r4.xyz;
    r6.w = ps;
    r10.xyz = r2.xyz * r10.xyz - r2.xyz;
    r11.y = r10.w * UniformScalar_0.x + r8.w;
    r10.xyz = r10.xyz * UniformScalar_0.xxx + r2.xyz;
    r2.xyz = r10.xyz * r1.www + r0.xxx;
    ps = 1.0 + r6.w;
    r7.xz = r11.xy * r7.ww;
    r7.y = ps;
    ps = 0.875 * r6.x;
    r0.zw = r0.zw * r7.wy;
    r12.z = ps;
    ps = 0.875 * r6.y;
    r4 = r7.xywz * UniformVector_2.xzyy;
    r12.w = ps;
    ps = r4.z;
    r0.x = r0.z * r11.x;
    ps = r11.y * ps;
    r12.xy = r0.xw * r7.wy;
    r0.x = ps;
    r6.x = r0.x * r4.w + r12.y;
    r7.xy = r12.zw * r11.zw + 0.125;
    r6.x = r12.x * r11.x + r6.x;
    ps = rsqrt(abs(r6.x));
    r1.xyz = r10.xyz * r1.xyz;
    r0.z = ps;
    r4.xy = r4.xy * r0.zz;
    r4.zw = r0.xy * r0.zy;
    ps = UniformScalar_24.x;
    r6.x = dot(r4.yxz, r4.yxz);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r4.www * r9.xyz;
    r6.x = ps;
    ps = 0.0001;
    r4.xyz = r4.xyz * r6.xxx;
    r6.w = ps;
    ps = max(r6.y, r6.w);
    r6.x = dot(r4.yxz, r8.zxy);
    r7.z = ps;
    ps = LightColorAndFalloffExponent.w * r6.z;
    r9.xyz = r4.xzy * r6.xxx;
    r6.y = ps;
    r6.xzw = r9.xyz * 2.0 - r8.xyz;
    ps = pow(2.0, r6.y);
    r6.x = saturate(dot(r3.zxy, r6.wxz));
    r6.y = ps;
    ps = log2(r6.x);
    r0.xyz = r0.xzy * r6.yyy;
    r7.w = ps;
    r7.xy = r7.xz * r7.yw;
    r6.xyz = r7.xxx * r5.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r7.y);
    r6.w = saturate(dot(r4.yxz, r3.zxy));
    r7.x = ps;
    r7.xyz = r2.xyz * r7.xxx;
    r7.xy = r1.xy * r6.ww + r7.xy;
    r7.z = r1.z * r6.w + r7.z;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
