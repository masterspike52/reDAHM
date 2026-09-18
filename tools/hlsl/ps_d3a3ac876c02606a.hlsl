// ps_d3a3ac876c02606a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10040A00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c4); // float4
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
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.z = -UniformVector_0.z + 1.0;
    r5.x = ps;
    ps = 1.0 / r4.w;
    r5.xy = r5.xy * abs(r7.xy);
    r6.x = ps;
    r5.yw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.x = tex2D(Texture2D_0, r0.xy).w;
    ps = r1.z;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r6.yz = r5.yw * 0.875;
    r5.y = ps;
    ps = rsqrt(abs(r5.z));
    r5.y = saturate(r5.y * 5.0);
    r5.z = ps;
    ps = 1.0 - r5.y;
    r9.xyz = r5.zzz * r3.xyz;
    r5.y = ps;
    r5.yz = -r5.yy * ModShadowGroupColor.xy + 1.0;
    ps = 0.03 * r5.x;
    r5.zw = r6.yz * r5.yz;
    r5.y = ps;
    r3.xzw = r5.yzw + float3(-0.015, 0.125, 0.125);
    r7.xy = r9.xy * r3.xx + r0.xy;
    r5.xyz = tex2D(Texture2D_0, r7.xy).xyz;
    r5.yzw = r5.xyz * 2.0 - 1.0;
    r6.xy = r6.xx * ScreenPositionScaleBias.xy;
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r5.x = ps;
    r8.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r8.zxy, r9.zxy);
    r5.xyz = r8.zxy * r5.xxx;
    r9.xyz = r5.xyz * 2.0 - r9.zxy;
    r5 = xe_cube(r9.yzx);
    ps = 1.0 / abs(r5.z);
    r0.z = r5.w;
    r6.z = ps;
    r0.xy = r5.yx * r6.zz + 1.5;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r4.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    r7.xyz = texCUBE(TextureCube_0, xe_cube_dir(r0.xyz)).xyz;
    ps = -ModShadowColor.x;
    r3.xy = -UniformVector_0.xy + 1.0;
    ps = 1.0 + ps;
    r5.w = dot(r1.zxy, r1.zxy);
    r5.y = ps;
    ps = -ModShadowColor.y;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r10.xy = r7.xy * 4e+01;
    r5.z = ps;
    ps = rsqrt(abs(r5.w));
    r5.x = saturate(-r5.x + 1.0);
    r5.w = ps;
    ps = log2(r5.x);
    r1.xyz = r5.www * r1.xyz;
    r5.x = ps;
    ps = -ModShadowColor.z;
    r0.xyz = r10.xyz * r4.xxz;
    ps = 1.0 + ps;
    r6.w = r3.z * r3.w;
    r5.w = ps;
    r5.yzw = r6.www * r5.yzw + ModShadowColor.xyz;
    r6.w = saturate(dot(r1.zxy, r9.xyz));
    ps = log2(r6.w);
    r1.y = saturate(dot(r8.zxy, r1.zxy));
    r7.w = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r3.zw = r7.zw * float2(4e+01, 15.0);
    r5.x = ps;
    ps = pow(2.0, r3.w);
    r2.xyz = r3.xyz * r4.xyx;
    r1.x = ps;
    ps = pow(2.0, r5.x);
    r0.xyz = r0.xyz * r1.xxy;
    r5.x = ps;
    r0.xyz = r2.xyz * r1.yyx + r0.xyz;
    r0.xyz = r0.xyz * r5.xxx;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xyz * r5.yzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
