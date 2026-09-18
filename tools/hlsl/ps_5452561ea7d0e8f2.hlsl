// ps_5452561ea7d0e8f2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 117 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001D4 10040A00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c4); // float3
float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = r0.xy * 0.2;
    r5.x = 1.0 / r4.w;
    r5.xy = r5.xx * ScreenPositionScaleBias.xy;
    r6.w = 1.0 / ModShadowAccumResolution.y;
    r5.yz = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    r5.x = r1.z + 0.1;
    r6.z = 1.0 / ModShadowAccumResolution.x;
    r6.zw = r6.zw * abs(r7.xy);
    r9.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r6.z = tex2D(Texture2D_1, r6.xy).w;
    r8.xyz = tex2D(LightAttenuationTexture, r5.yz).xyz;
    r5.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = dot(r3.zxy, r3.zxy);
    r6.y = dot(r1.zxy, r1.zxy);
    r0.xyz = r8.xyz * r2.www;
    r5.x = saturate(5.0 * r5.x);
    r2.xyz = -r5.yzw + r6.zzz;
    r6.z = rsqrt(abs(r6.y));
    r8.xyz = r2.xyz * r5.www + r5.yzw;
    r10.xyz = r6.zzz * r1.zxy;
    r6.x = rsqrt(abs(r6.x));
    r6.xyw = r6.xxx * r3.xzy;
    r5.x = 1.0 - r5.x;
    r2.xy = -r5.xx * ModShadowGroupColor.xy + 1.0;
    r3.yz = -r6.xw;
    r6.x = (-0.2) + r5.y;
    r3.x = r6.y * 2.0 - r6.y;
    ps = (-0.2) + r5.z;
    r5.x = saturate(dot(r10.yzx, r3.yzx));
    r6.y = ps;
    ps = log2(r5.x);
    r6.w = saturate(r6.z * r1.z);
    r9.x = ps;
    ps = (-0.2) + r5.w;
    r3.xyz = r9.xyz * float3(15.0, 0.875, 0.875);
    r6.z = ps;
    ps = pow(2.0, r3.x);
    r1.xyz = r8.xyz * r7.xyz;
    r5.z = ps;
    r5.xy = r3.yz * r2.xy + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
