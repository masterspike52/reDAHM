// ps_64aea0e4e8111361.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 135 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000021C 10040A00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
sampler2D Texture2D_2 : register(s3);
samplerCUBE TextureCube_0 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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

    ps = 1.0 / r4.w;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.yz = r5.yy * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r9.xy = r6.xy * abs(r7.xy);
    r5.x = ps;
    r9.zw = r5.yz * r4.xy + ScreenPositionScaleBias.wz;
    r7.xyz = r5.xxx * r3.xyz;
    r5 = xe_cube(r7.xyz);
    ps = 1.0 / abs(r5.z);
    r6.z = r5.w;
    r6.x = ps;
    r6.xy = r5.yx * r6.xx + 1.5;
    r3.xyz = texCUBE(TextureCube_0, xe_cube_dir(r6.xyz)).xyz;
    r6.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r9.zw).xyz;
    r5.yz = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = r1.z;
    r0.xyz = r0.xyz * r2.www;
    ps = 0.1 + ps;
    r2.xyz = r10.xyz * r8.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r5.w));
    r6.x = dot(r4.zxy, r4.zxy);
    r5.w = ps;
    ps = 5.0 * r5.x;
    r1.xyz = r5.www * r1.xyz;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r6.x));
    r5.w = -r5.x + 1.0;
    r5.x = ps;
    r8.xy = -r5.ww * ModShadowGroupColor.xy + 1.0;
    ps = 0.875 * r5.y;
    r4.xyz = r5.xxx * r4.xyz;
    r8.z = ps;
    ps = 0.875 * r5.z;
    r5.w = dot(r4.zxy, r7.zxy);
    r8.w = ps;
    r5.xy = r8.zw * r8.xy + 0.125;
    ps = r5.x * r5.y;
    r8.xyz = r4.xzy * r5.www;
    r5.x = ps;
    r5.xyz = r5.xxx * r9.xyz + ModShadowColor.xyz;
    r7.xyz = r8.xyz * 2.0 - r7.xzy;
    r6.x = saturate(dot(r1.zxy, r7.yxz));
    ps = log2(r6.x);
    r5.w = saturate(dot(r4.zxy, r1.zxy));
    r6.x = ps;
    r6 = r6 * float4(15.0, 3e+01, 3e+01, 3e+01);
    ps = pow(2.0, r6.x);
    r6.yzw = r6.yzw * r3.xyz;
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r2.xy * r5.ww + r6.xy;
    r6.z = r2.z * r5.w + r6.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
