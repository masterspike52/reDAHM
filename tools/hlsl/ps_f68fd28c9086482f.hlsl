// ps_f68fd28c9086482f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 159 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000027C 10040B00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c6); // float4
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_3 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r4.xy = r7.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r9.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r0.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    ps = r1.z;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r0.w = dot(r2.zxy, r2.zxy);
    r1.w = ps;
    ps = 1.0 - r0.w;
    r2.y = dot(r1.zxy, r1.zxy);
    r0.w = saturate(ps);
    ps = 0.875 * r0.x;
    r0.z = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = 0.875 * r0.y;
    r8.xyz = r11.xyz * UniformScalar_0.xxx;
    r5.y = ps;
    r10.yzw = r10.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r0.x = saturate(r1.w * 5.0);
    r0.y = ps;
    ps = 1.0 - r0.x;
    r1.w = dot(r9.xzy, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    ps = rsqrt(abs(r2.y));
    r2.xzw = r10.wyz * float3(0.7, 1.0, 1.0);
    r0.x = ps;
    ps = log2(r0.w);
    r9.xyz = r0.xxx * r1.xyz;
    r0.x = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r3.xyz = r0.yyy * r3.xyz;
    r2.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r0.w = dot(r2.xzw, r2.xzw);
    r2.z = ps;
    ps = log2(abs(r1.w));
    r0.y = dot(r3.zxy, r10.wyz);
    r10.x = ps;
    ps = rsqrt(abs(r0.w));
    r1 = r10 * float4(0.1, 1.0, 1.0, 0.7);
    r0.z = ps;
    ps = r0.y;
    r10.xyz = r1.yzw * r0.zzz;
    r0.z = ps;
    ps = 0.0;
    r1.w = saturate(dot(r10.zxy, r9.zxy));
    r0.w = ps;
    ps = max(r0.z, r0.w);
    r0.y = dot(r10.zxy, r3.zxy);
    r2.x = ps;
    ps = pow(2.0, r1.x);
    r10.xyz = r10.xzy * r0.yyy;
    r2.w = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r2 = -r2.wxyz + float4(1.0, 0.45, 1.0, 1.0);
    r0.w = ps;
    r5.xy = r5.xy * r2.zw + 0.125;
    ps = r2.y;
    r1.xyz = r2.xxx * r11.xyz;
    r0.x = ps;
    r3.xyz = r10.xyz * 2.0 - r3.xzy;
    ps = 4.0 * r0.x;
    r5.w = saturate(dot(r9.zxy, r3.yxz));
    r3.x = saturate(ps);
    ps = r5.w * r5.w;
    r0.xyz = r1.xyz * UniformVector_3.www;
    r5.z = ps;
    r0.xyz = r0.xyz * UniformVector_3.xyz - r1.xyz;
    r1.xyz = r3.xxx * r0.xyz + r1.xyz;
    ps = r5.x * r5.y;
    r3.xyz = r8.xyz * r2.xxx;
    r0.x = ps;
    ps = r5.z * r5.w;
    r2.xyz = r1.xyz * r7.xyz;
    r1.x = ps;
    r0.xyz = r0.xxx * r6.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.w);
    r1.xyz = r3.xyz * r1.xxx;
    r0.w = ps;
    r1.xy = r2.xy * r1.ww + r1.xy;
    r1.z = r2.z * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.www;
    r1.xyz = r1.xyz * r4.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
