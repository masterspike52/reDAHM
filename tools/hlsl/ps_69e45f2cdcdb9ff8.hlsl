// ps_69e45f2cdcdb9ff8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 129 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000204 10040A00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    r6.w = dot(r1.zxy, r1.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r2.xy = r6.xy * abs(r7.xy);
    r5.x = ps;
    r6.xy = r5.yz * r4.xy + ScreenPositionScaleBias.wz;
    r7.xyz = r5.xxx * r3.xyz;
    r5 = xe_cube(r7.xyz);
    ps = 1.0 / abs(r5.z);
    r3.z = r5.w;
    r6.z = ps;
    r3.xy = r5.yx * r6.zz + 1.5;
    r3.xyz = texCUBE(TextureCube_0, xe_cube_dir(r3.xyz)).xyz;
    r4.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).zxy;
    r5.xy = tex2D(ModShadowAccumTexture, r2.xy).xy;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = r1.z;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r2.xyz = r2.xyz * r0.xyz;
    r5.w = ps;
    ps = rsqrt(abs(r6.w));
    r5.z = dot(r10.zxy, r10.zxy);
    r6.w = ps;
    ps = 5.0 * r5.w;
    r0.yzw = r6.www * r1.xyz;
    r5.w = saturate(ps);
    ps = rsqrt(abs(r5.z));
    r5.w = -r5.w + 1.0;
    r5.z = ps;
    r8.xy = -r5.ww * ModShadowGroupColor.xy + 1.0;
    ps = 0.875 * r5.x;
    r1.xyz = r5.zzz * r10.xyz;
    r8.z = ps;
    ps = 0.875 * r5.y;
    r5.z = dot(r1.zxy, r7.zxy);
    r8.w = ps;
    r5.xy = r8.zw * r8.xy + 0.125;
    ps = r5.x * r5.y;
    r8.xyz = r1.xzy * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r9.xyz + ModShadowColor.xyz;
    r7.xyz = r8.xyz * 2.0 - r7.xzy;
    ps = LightColor.x * r6.y;
    r6.w = saturate(dot(r0.wyz, r7.yxz));
    r0.x = ps;
    ps = log2(r6.w);
    r5.w = saturate(dot(r1.zxy, r0.wyz));
    r4.x = ps;
    ps = LightColor.z * r6.x;
    r1 = r4.yzwx * float4(3e+01, 3e+01, 3e+01, 15.0);
    r0.y = ps;
    ps = pow(2.0, r1.w);
    r1.xyz = r1.xyz * r3.xyz;
    r6.w = ps;
    ps = LightColor.y * r6.z;
    r1.xyz = r1.xyz * r6.www;
    r0.z = ps;
    r6.xy = r2.xy * r5.ww + r1.xy;
    r6.z = r2.z * r5.w + r1.z;
    r6.xyz = r0.xzy * r6.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
