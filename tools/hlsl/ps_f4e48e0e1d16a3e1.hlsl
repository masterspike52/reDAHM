// ps_f4e48e0e1d16a3e1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 180 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002D0 10040F00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c8); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color1;
    float4 r7 = In.color2;
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
    r9.xyz = -UniformVector_0.xzy + 1.0;
    r5.z = ps;
    ps = ScreenPositionScaleBias.x * r5.z;
    r6.xy = r0.xy + UniformVector_1.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = dot(r1.zxy, r1.zxy);
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    ps = ScreenPositionScaleBias.y * r5.z;
    r8.xy = r6.zw * abs(r8.xy);
    r5.w = ps;
    r5.xz = r5.xw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r11.xyw = tex2D(Texture2D_3, r6.xy).xzy;
    r14.x = tex2D(Texture2D_2, r0.xy).w;
    r10.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r14.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r5.xz).xyz;
    r5.w = tex2D(Texture2D_4, r0.xy).w;
    r0.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    ps = r1.z;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r8.zw = r0.xy * 0.875;
    r5.x = ps;
    ps = 0.2 * r5.w;
    r7.xyz = r7.xyz * r2.www;
    r15.x = ps;
    r2.xyw = r6.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r0.xyz = r14.zyw * UniformScalar_8.xxx;
    r5.z = ps;
    r8.xy = r10.yz * UniformScalar_11.xx + r0.xz;
    ps = rsqrt(abs(r5.y));
    r6.yzw = r5.zzz * r3.xyz;
    r5.y = ps;
    ps = 3.0 * r5.w;
    r1.xyz = r5.yyy * r1.xyz;
    r15.y = ps;
    ps = 0.5 * r5.w;
    r6.x = dot(r2.wxy, r2.wxy);
    r15.z = ps;
    ps = 5.0 * r5.x;
    r13.xy = r14.xw * 0.5;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r3.xyz = r15.xzy * r11.xyw;
    r7.w = ps;
    ps = r13.y;
    r5 = r14.xxzy * float4(0.2, 3.0, 3.0, 0.2);
    ps = r11.y * ps;
    r13.z = r13.x * r3.y;
    r2.z = ps;
    ps = rsqrt(abs(r6.x));
    r13.xy = r5.xy * r3.xz;
    r6.x = ps;
    r3.xy = -r7.ww * ModShadowGroupColor.xy + 1.0;
    r5.xy = r8.zw * r3.xy + 0.125;
    ps = r5.w;
    r3.xyz = r2.xyw * r6.xxx;
    ps = r11.x * ps;
    r6.x = saturate(dot(r3.zxy, r1.zxy));
    r2.x = ps;
    ps = r5.z;
    r5.w = dot(r3.zxy, r6.wyz);
    r11.xyz = r14.xxx * r11.xwy + r13.xyz;
    ps = r11.w * ps;
    r5.x = r5.x * r5.y;
    r2.y = ps;
    r5.xyz = r5.xxx * r12.xyz + ModShadowColor.xyz;
    r2.xyw = r11.xyz + r2.xyz;
    ps = r2.y;
    r3.xyz = r3.xzy * r5.www;
    r6.yzw = r3.xyz * 2.0 - r6.ywz;
    r2.xyz = r10.xyz * UniformScalar_11.xxx + r2.xyw;
    ps = r8.x + ps;
    r5.w = r2.w + r8.y;
    r0.w = ps;
    ps = r5.w;
    r0.xyz = r2.xyz + r0.yxz;
    ps = r4.z + ps;
    r6.y = saturate(dot(r1.zxy, r6.zyw));
    r5.w = ps;
    ps = r6.y * r6.y;
    r2 = r0 + r4.xyzy;
    r1.w = ps;
    ps = r5.w;
    r0.xyz = r2.xyz * UniformScalar_15.xxx;
    ps = r9.y * ps;
    r1.xy = r2.xw * r9.xz;
    r1.z = ps;
    r6 = r1.xzyw * r6.xxxy;
    r6.y = r0.z * r6.w + r6.y;
    r6.xz = r0.xy * r6.ww + r6.xz;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
