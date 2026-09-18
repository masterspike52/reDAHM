// ps_327dca81d9113447.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 318 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004F8 10041100 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_7 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D ShadowTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_5, r1.xy).wxyz;
    ps = (-0.5) + r11.x;
    r6.xy = r1.wz * 6.0;
    r6.z = ps;
    ps = UniformVector_2.x * r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r13.x = ps;
    r12.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    r8.xy = r1.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = r5.w - 4e+02;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r4.zxy, r4.zxy);
    r7.y = ps;
    r6.yz = r12.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r6.x = saturate(r6.x * 0.00022222222);
    r6.w = ps;
    ps = -r1.z;
    r4.xyw = r6.www * r4.xyz;
    ps = 1.0 + ps;
    r10.xyz = r6.xzy * float3(-0.025, 0.5, 0.5);
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r13.zw = r4.xy * r10.xx;
    r13.y = ps;
    r6.xy = r13.xy - 0.5;
    r0.zw = float2((r13.xy >= 0.5));
    ps = r7.x;
    r6.xy = r6.xy - r13.xy;
    ps = abs(r9.x) * ps;
    r8.zw = r6.xy * r0.zw;
    r7.z = ps;
    ps = r7.y;
    r6 = r13 + r8.zwxy;
    ps = abs(r9.y) * ps;
    r7.xy = r6.xy + r6.xy;
    r7.w = ps;
    r14.yz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r16 = tex2D(Texture2D_1, r7.xy);
    r8.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    r13.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r9.xyw = tex2D(Texture2D_0, r6.zw).xyz;
    r6.xy = r1.wz * UniformVector_7.xy;
    r7.xyw = r9.xyw * 2.0 - 1.0;
    r17.xyz = r13.xyz * 2.0 - 1.0;
    ps = r8.x + r8.x;
    r13.zw = r5.xy * ScreenPositionScaleBias.xy;
    r15.y = ps;
    ps = r8.y + r8.y;
    r15.x = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r15.z = ps;
    r7.z = (r15.x == 0.0) ? r16.x : r16.y;
    r15 = r15.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    ps = r15.z;
    r8.xyz = r17.xyz * UniformVector_4.xyz;
    r7.z = (r15.y == 0.0) ? r16.z : r7.z;
    r0.w = (r15.x == 0.0) ? r16.w : r7.z;
    ps = r10.z + ps;
    r7.z = max(r0.w, 0.0);
    r10.x = ps;
    ps = r15.w;
    r14.x = min(r7.z, 0.3);
    ps = r10.y + ps;
    r12.xyz = r14.yxz * float3(0.875, 3.3333333, 0.875);
    r10.y = ps;
    r10.xy = r12.yy * r10.xy + r8.xy;
    ps = 1.0 / r5.w;
    r13.xy = r10.xy - r7.xy;
    r7.z = ps;
    r10.xy = r13.zw * r7.zz + ScreenPositionScaleBias.wz;
    r4.z = tex2D(Texture2D_4, r1.xy).x;
    r9.xyz = tex2D(LightAttenuationTexture, r10.xy).xyz;
    r10.y = tex2D(ShadowTexture, r0.xy).x;
    r10.xzw = tex2D(Texture2D_7, r6.zw).xyz;
    r6.yzw = tex2D(Texture2D_6, r6.xy).yzx;
    r0.xyz = tex2D(Texture2D_8, r1.xy).xyz;
    r7.z = dot(r2.zxy, r2.zxy);
    ps = r2.z;
    r6.x = dot(r3.zxy, r3.zxy);
    r1.xyz = r0.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    r11.x = r12.w * r8.w - 1.0;
    ps = 0.1 + ps;
    r6.x = saturate(-r6.x + 1.0);
    r8.w = ps;
    ps = log2(r6.x);
    r0.z = saturate(r8.w * 5.0);
    r6.x = ps;
    ps = rsqrt(abs(r7.z));
    r12.w = -r7.w + r8.z;
    r7.w = ps;
    r3.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r3.xyz = r3.xyz * r11.yzw;
    r3.xyz = r3.xyz * r6.wyz;
    ps = r5.w;
    r6.yz = -r0.wz + 1.0;
    ps = 0.0001 * ps;
    r0.xy = r6.zz * ModShadowGroupColor.xy;
    r0.z = saturate(ps);
    ps = 2.5 * r6.y;
    r11.yzw = -r0.yxz + 1.0;
    r3.w = ps;
    r0.xyw = r12.xzy * r11.zyx + float3(0.125, 0.125, 1.0);
    r12.xyz = r3.xyz * r0.www - r10.xzw;
    r8.w = saturate(r3.w * r0.w - 0.5);
    ps = r0.x * r0.y;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r7.z = ps;
    r8.xyz = r7.zzz * r8.xyz + ModShadowColor.xyz;
    r7.xy = r13.xy * r8.ww + r7.xy;
    r5.xyz = r12.xyz * r8.www + r10.xzw;
    r7.z = r12.w * r8.w - 2.0;
    r7.z = r9.w * 2.0 + r7.z;
    r7.xyz = r7.zxy * r11.www;
    ps = 1.0 + r7.x;
    r2.xyz = r7.www * r2.xyz;
    r7.w = ps;
    r7.xyz = (r11.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.yzw = (r11.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r7.x = dot(r7.wyz, r7.wyz);
    ps = rsqrt(abs(r7.x));
    r0.xyz = r5.xyz * r3.xyz;
    r7.x = ps;
    r7.yzw = r7.yzw * r7.xxx;
    r7.x = dot(r7.wyz, r4.wxy);
    r3.xyz = r7.yzw * r7.xxx;
    r3.xyz = r3.xyz * 2.0 - r4.xyw;
    ps = UniformScalar_8.x * r6.w;
    r7.x = saturate(dot(r2.zxy, r3.zxy));
    r10.z = ps;
    ps = log2(r7.x);
    r6.w = saturate(dot(r7.wzy, r2.zyx));
    r6.y = ps;
    ps = abs(r0.w) * abs(r0.w);
    r6.z = r6.y * UniformScalar_7.x;
    r10.x = ps;
    ps = pow(2.0, r6.z);
    r6.y = r6.y * 15.0;
    r10.w = ps;
    r4.xyw = r10.zxy * r10.wxy;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r7.yzw = r4.www * r9.xyz;
    r7.x = ps;
    ps = pow(2.0, r7.x);
    r6.xz = r4.xy * r4.zy;
    r7.x = ps;
    r7.xyz = r7.ywz * r7.xxx;
    r1.xyz = r1.xyz + r6.xxx;
    r1.xyz = r6.zzz * r1.xyz;
    ps = pow(2.0, r6.y);
    r1.xyz = r1.xyz * r8.www;
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r8.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
