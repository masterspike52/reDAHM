// ps_53767115f392188d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000264 10040B00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c7); // float4
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c9); // float2
float4 SpotDirection : register(c8); // float3
float4 UniformScalar_0 : register(c6); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.x = max(UniformScalar_0.x, 0.0001);
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r8.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = r1.z;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    ps = 5.0 * r5.w;
    r5.z = dot(r2.zxy, r2.zxy);
    r0.w = saturate(ps);
    ps = 1.0 - r5.z;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.w = saturate(ps);
    ps = 0.875 * r5.x;
    r1.w = dot(r3.zxy, r3.zxy);
    r10.x = ps;
    ps = 0.875 * r5.y;
    r0.xyz = r0.xyz * UniformVector_3.xyz;
    r10.y = ps;
    r9.xyz = r9.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r8.yzw = r8.yzw * UniformVector_2.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r6.w));
    r7.xyz = r8.yzw * r7.xyz;
    r6.w = ps;
    ps = rsqrt(abs(r5.z));
    r8.yzw = r5.xxx * r3.xyz;
    r5.x = ps;
    ps = r6.w;
    r11.xyz = r5.xxx * -SpotDirection.xyz;
    ps = r1.x * ps;
    r5.z = dot(r9.zxy, r9.zxy);
    r3.x = ps;
    ps = log2(r5.w);
    r5.y = -r0.w + 1.0;
    r5.x = ps;
    r3.yz = -r5.yy * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r5.z));
    r5.y = dot(r11.zxy, r2.zxy);
    r5.z = ps;
    r3.zw = r10.xy * r3.yz + 0.125;
    ps = r6.w;
    r2.xyz = r9.xyz * r5.zzz;
    ps = r1.y * ps;
    r5.z = dot(r2.zxy, r8.wyz);
    r3.y = ps;
    ps = r6.w;
    r5.w = r3.z * r3.w;
    r6.xyz = r5.www * r6.xyz + ModShadowColor.xyz;
    ps = r1.z * ps;
    r9.xyz = r2.xzy * r5.zzz;
    r3.z = ps;
    r1.xyz = r9.xyz * 2.0 - r8.ywz;
    ps = -SpotAngles.x - -r5.y;
    r5.z = saturate(dot(r3.zxy, r1.yxz));
    r5.y = ps;
    ps = log2(r5.z);
    r8.y = saturate(r5.y * SpotAngles.y);
    r8.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.yz = r8.xy * r8.zy;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r5.w = saturate(dot(r2.zxy, r3.zxy));
    r6.w = ps;
    ps = pow(2.0, r5.x);
    r0.xyz = r0.xyz * r6.www;
    r5.x = ps;
    r0.xy = r7.xy * r5.ww + r0.xy;
    r0.z = r7.z * r5.w + r0.z;
    r0.xyz = r0.xyz * r5.xxx;
    r0.xyz = r0.xyz * r4.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r0.xzy * r5.zzz;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
