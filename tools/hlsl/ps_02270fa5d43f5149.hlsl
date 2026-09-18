// ps_02270fa5d43f5149.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000264 10040800 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
samplerCUBE TextureCube_0 : register(s3);
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = ps;
    ps = 1.0 / r4.w;
    r5.xy = r5.xy * abs(r7.xy);
    r6.w = ps;
    r5.yw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.x = tex2D(Texture2D_0, r0.xy).w;
    ps = r1.z;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r2.xy = r5.yw * 0.875;
    r5.y = ps;
    ps = rsqrt(abs(r5.z));
    r5.y = saturate(r5.y * 5.0);
    r5.z = ps;
    ps = 1.0 - r5.y;
    r6.xyz = r5.zzz * r3.xyz;
    r5.y = ps;
    r5.yz = -r5.yy * ModShadowGroupColor.xy + 1.0;
    ps = 0.03 * r5.x;
    r5.zw = r2.xy * r5.yz;
    r5.y = ps;
    r2.xyz = r5.yzw + float3(-0.015, 0.125, 0.125);
    r0.zw = r6.xy * r2.xx + r0.xy;
    r5.xyz = tex2D(Texture2D_0, r0.zw).xyz;
    r5.yzw = r5.xyz * 2.0 - 1.0;
    r0.xy = r6.ww * ScreenPositionScaleBias.xy;
    r0.xy = r0.xy * r4.xy + ScreenPositionScaleBias.wz;
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r6.w = r2.y * r2.z;
    r5.x = ps;
    r7.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r7.zxy, r6.zxy);
    r5.xyz = r7.zxy * r5.xxx;
    r8.xyz = r5.xyz * 2.0 - r6.zxy;
    r5 = xe_cube(r8.yzx);
    ps = 1.0 / abs(r5.z);
    r6.z = r5.w;
    r6.x = ps;
    r6.xy = r5.yx * r6.xx + 1.5;
    r2.xyz = tex2D(Texture2D_1, r0.zw).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r5.xyz = texCUBE(TextureCube_0, xe_cube_dir(r6.xyz)).xyz;
    ps = -UniformVector_0.z;
    r4.xy = -UniformVector_0.xy + 1.0;
    ps = 1.0 + ps;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r3.z = ps;
    ps = 4e+01 * r5.x;
    r5.w = dot(r1.zxy, r1.zxy);
    r3.x = ps;
    ps = rsqrt(abs(r5.w));
    r0.xyz = r0.xyz * LightColor.xyz;
    r5.w = ps;
    ps = 4e+01 * r5.y;
    r1.xyz = r5.www * r1.xyz;
    r3.y = ps;
    r3.xyz = r3.xyz * r2.xxz;
    r6.xyz = r6.www * r6.xyz + ModShadowColor.xyz;
    r5.w = saturate(dot(r1.zxy, r8.xyz));
    ps = log2(r5.w);
    r1.y = saturate(dot(r7.zxy, r1.zxy));
    r5.w = ps;
    r4.zw = r5.zw * float2(4e+01, 15.0);
    ps = pow(2.0, r4.w);
    r2.xyz = r4.xyz * r2.xyx;
    r1.x = ps;
    r5.xyz = r3.xyz * r1.xxy;
    r5.xyz = r2.xyz * r1.yyx + r5.xyz;
    r5.xyz = r0.xyz * r5.xyz;
    r5.xyz = r5.xyz * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
