// ps_e397a776f6d2521c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 171 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002AC 10040B00 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ShadowTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r6.xx * ScreenPositionScaleBias.xy;
    r6.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.z = dot(r2.zxy, r2.zxy);
    r6.z = ps;
    r7.xy = r6.zw * abs(r9.xy);
    r6.xy = r6.xy * r5.xy + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r5.y = tex2D(ShadowTexture, r0.xy).x;
    r9.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r10.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r6.yzw = tex2D(Texture2D_3, r1.xy).xzy;
    r1.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r7.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r8.w = dot(r4.zxy, r4.zxy);
    r7.w = ps;
    ps = r2.z;
    r6.x = dot(r3.zxy, r3.zxy);
    r1.xyz = r1.xyz * 2.0 - 1.0;
    ps = 0.1 + ps;
    r5.xzw = r6.zzz * UniformVector_3.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r8.w));
    r3.xyz = -r9.xyz + r10.xyz;
    r8.w = ps;
    r10.xyz = r3.xyz * UniformScalar_0.xxx + r9.xyz;
    ps = rsqrt(abs(r7.z));
    r4.xyz = r8.www * r4.xyz;
    r7.z = ps;
    ps = 1.0 - r6.x;
    r3.xyz = r7.zzz * r2.xyz;
    r7.z = saturate(ps);
    r2.xyz = r6.www * UniformVector_2.xyz + r5.xzw;
    ps = 5.0 * r6.z;
    r6.x = dot(r1.zxy, r1.zxy);
    r8.w = saturate(ps);
    ps = log2(r7.z);
    r8.w = -r8.w + 1.0;
    r7.z = ps;
    r5.zw = -r8.ww * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r6.x));
    r7.z = r7.z * LightColorAndFalloffExponent.w;
    r6.x = ps;
    r6.yzw = r6.yyy * UniformVector_1.xyz + r2.xyz;
    r6.yzw = (-abs(r7.www) >= 0.0) ? 1.0 : r6.yzw;
    r1.xyz = r1.xyz * r6.xxx;
    r7.w = saturate(dot(r1.zxy, r3.zxy));
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r6.x = dot(r1.zxy, r4.zxy);
    r8.w = ps;
    r6.yzw = (-abs(r8.www) >= 0.0) ? 1.0 : r6.yzw;
    ps = UniformScalar_5.x * r6.y;
    r9.xyz = r1.xzy * r6.xxx;
    r2.x = ps;
    ps = UniformScalar_5.x * r6.z;
    r1.xyz = r10.xyz * r6.yzw;
    r2.y = ps;
    ps = UniformScalar_5.x * r6.w;
    r1.xyz = r1.xyz * r11.xyz;
    r2.z = ps;
    r2.xyz = r2.xyz * r10.xyz;
    r6.xyz = r9.xyz * 2.0 - r4.xzy;
    r5.x = saturate(dot(r3.zxy, r6.yxz));
    ps = 0.875 * r7.x;
    r6.xy = r5.xy * r5.xy;
    r6.z = ps;
    ps = 0.875 * r7.y;
    r8.xyz = r6.yyy * r8.xyz;
    r6.w = ps;
    ps = pow(2.0, r7.z);
    r6.xyz = r6.zwx * r5.zwx;
    r6.w = ps;
    ps = 0.125 + r6.x;
    r8.xyz = r8.xzy * r6.www;
    r6.w = ps;
    ps = 0.125 + r6.y;
    r7.xyz = r2.xyz * r6.zzz;
    r6.x = ps;
    r7.xy = r1.xy * r7.ww + r7.xy;
    r7.z = r1.z * r7.w + r7.z;
    r6.x = r6.w * r6.x;
    r6.xyz = r6.xxx * r0.xyz + ModShadowColor.xyz;
    r7.xyz = r8.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
