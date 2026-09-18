// ps_33d1504cc25583c9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 147 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000024C 10040A00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c4); // float4
float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_5 : register(s2);
sampler2D Texture2D_6 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    r5.xy = r5.xy * abs(r8.xy);
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r9.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.xzw = -ModShadowColor.xyz + 1.0;
    ps = r1.z;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r10.xy = r10.xy * 0.875;
    r5.y = ps;
    r2.xyz = r4.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r5.y = saturate(r5.y * 5.0);
    r5.z = ps;
    ps = 1.0 - r5.y;
    r4.xyz = r5.zzz * r1.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r5.z = dot(r2.zxy, r2.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r1.xyz = r5.www * r3.xyz;
    r5.w = ps;
    r5.yz = -r5.yy * ModShadowGroupColor.xy + 1.0;
    r5.yz = r10.xy * r5.yz + 0.125;
    r3.xyz = r2.xyz * r5.www;
    ps = 1.0 - r5.x;
    r6.w = dot(r3.zxy, r1.zxy);
    r5.w = saturate(ps);
    ps = log2(abs(r8.z));
    r5.x = r5.y * r5.z;
    r7.y = ps;
    r5.xyz = r5.xxx * r7.xzw + ModShadowColor.xyz;
    ps = log2(abs(r8.x));
    r2.xyz = r3.xzy * r6.www;
    r7.z = ps;
    r1.xyz = r2.xyz * 2.0 - r1.xzy;
    ps = log2(abs(r8.y));
    r6.w = saturate(dot(r4.zxy, r1.yxz));
    r7.w = ps;
    ps = log2(r6.w);
    r2.xyz = r9.xyz * 0.4;
    r7.x = ps;
    ps = log2(r5.w);
    r7 = r7 * float4(2e+01, 0.3, 0.3, 0.3);
    r5.w = ps;
    ps = pow(2.0, r7.z);
    r0.xyz = r0.xyz * r8.xyz;
    r1.x = ps;
    ps = pow(2.0, r7.w);
    r5.w = r5.w * LightColorAndFalloffExponent.w;
    r1.y = ps;
    ps = pow(2.0, r7.y);
    r6.w = saturate(dot(r3.zxy, r4.zxy));
    r1.z = ps;
    r1.xyz = saturate(r1.xyz - 0.2);
    ps = pow(2.0, r7.x);
    r7.yzw = r2.xyz * r1.xyz;
    r7.x = ps;
    ps = pow(2.0, r5.w);
    r7.xyz = r7.yzw * r7.xxx;
    r5.w = ps;
    r7.xy = r0.xy * r6.ww + r7.xy;
    r7.z = r0.z * r6.w + r7.z;
    r7.xyz = r7.xyz * r5.www;
    r6.xyz = r7.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
