// ps_5837f6f2020297da.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 213 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000354 10040D00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c11); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = ps;
    ps = 1.0 / r4.w;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r6.xy = r5.zw * abs(r7.xy);
    r5.xy = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r13.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r5.yzw = tex2D(Texture2D_1, r0.xy).yxz;
    r4.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = UniformVector_2.x * UniformVector_2.x;
    r8.w = max(UniformScalar_24.x, 0.0001);
    r0.y = ps;
    ps = UniformVector_2.z * UniformVector_2.z;
    r6.z = UniformScalar_22.x - UniformScalar_21.x;
    r0.z = ps;
    ps = r1.z;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r11.yz = r6.xy * 0.875;
    r5.x = ps;
    r4.xyz = r4.wxy * 2.0 - 1.0;
    ps = r5.w + r5.w;
    r6.w = dot(r3.zxy, r3.zxy);
    r12.z = ps;
    ps = 5.0 * r5.x;
    r1.w = dot(r1.zxy, r1.zxy);
    r5.x = saturate(ps);
    ps = 4.0 * r5.z;
    r10.xyz = r10.xyz + r10.xyz;
    r12.x = ps;
    ps = 4.0 * r5.y;
    r5.z = -r5.x + 1.0;
    r12.y = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r8.xyz = r8.xyz * UniformVector_8.xyz;
    r5.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r12.xyz = r12.yxz + float3(-2.0, -2.0, -1.0);
    r5.w = ps;
    ps = r12.x;
    r5.x = dot(r13.zxy, float3(1.0, 1.0, 1.0));
    ps = -r4.z + ps;
    r5.xyz = -r5.ywx + 1.0;
    r10.w = ps;
    ps = UniformScalar_23.x * r5.z;
    r6.xy = r12.yz - r4.yx;
    r4.x = ps;
    ps = UniformVector_2.y * r5.z;
    r6.xyz = r6.xzy * UniformScalar_0.xxx;
    r0.w = ps;
    ps = UniformScalar_21.x + r6.y;
    r8.xyz = r8.xyz * r5.zzz;
    r5.w = ps;
    r10.xyz = r8.xyz * r10.xyz - r8.xyz;
    ps = r4.y;
    r0.x = r6.z - 2.0;
    r11.x = r4.w * 2.0 + r0.x;
    r8.xyz = r10.xyz * UniformScalar_0.xxx + r8.xyz;
    r0.x = r10.w * UniformScalar_0.x + r4.z;
    ps = r6.x + ps;
    r0.w = r0.w * r0.x;
    r11.w = ps;
    r13.xy = r11.xw * r5.zz + float2(1.0, 0.0);
    r12.yzw = r11.xyz * r5.zxy + float3(1.0, 0.125, 0.125);
    ps = r0.z;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    ps = r12.y * ps;
    r13.zw = r0.xy * r5.zz;
    r12.x = ps;
    ps = r13.w;
    r10.xyz = r8.xyz * r5.www;
    ps = r11.w * ps;
    r0.xyz = r13.yxz * UniformVector_2.xzy;
    r5.w = ps;
    ps = r5.w;
    r4.yz = r12.xz * r12.yw;
    r6.xyz = r4.zzz * r6.xyz + ModShadowColor.xyz;
    ps = r5.z * ps;
    r5.w = r0.w * r0.z;
    r5.x = ps;
    r10.w = r5.x * r11.w + r5.w;
    ps = rsqrt(abs(r1.w));
    r4 = r10 + r4.xxxy;
    r5.x = ps;
    ps = rsqrt(abs(r4.w));
    r5.xyz = r5.xxx * r1.xyz;
    r5.w = ps;
    r1.xyz = r0.xyw * r5.www;
    ps = rsqrt(abs(r6.w));
    r5.w = dot(r1.yxz, r1.yxz);
    r6.w = ps;
    ps = rsqrt(abs(r5.w));
    r0.xyz = r6.www * r3.xyz;
    r5.w = ps;
    r3.xyz = r1.xyz * r5.www;
    r5.w = dot(r3.yxz, r0.zxy);
    r1.xyz = r3.xzy * r5.www;
    r0.xyz = r1.xyz * 2.0 - r0.xyz;
    r5.w = saturate(dot(r5.zxy, r0.zxy));
    ps = log2(r5.w);
    r0.xyz = r9.xyz * r2.www;
    r7.w = ps;
    r1 = r8 * r7;
    ps = pow(2.0, r1.w);
    r5.w = saturate(dot(r3.yxz, r5.zxy));
    r5.x = ps;
    r5.xyz = r4.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r0.xyz * r5.xyz;
    r5.xyz = r5.xzy * LightColor.xzy;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
