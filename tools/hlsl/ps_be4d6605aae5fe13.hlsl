// ps_be4d6605aae5fe13.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 150 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000258 10040B00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D Texture2D_4 : register(s3);
samplerCUBE TextureCube_0 : register(s4);
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
    float4 color2 : COLOR2; // r7
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
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.x = dot(r4.zxy, r4.zxy);
    r6.y = 1.0 / r5.w;
    r6.yz = r6.yy * ScreenPositionScaleBias.xy;
    r7.y = 1.0 / ModShadowAccumResolution.y;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = 1.0 / ModShadowAccumResolution.x;
    r7.xy = r7.xy * abs(r8.xy);
    r6.x = rsqrt(abs(r6.x));
    r7.zw = r6.yz * r5.xy + ScreenPositionScaleBias.wz;
    r8.xyz = r6.xxx * r4.xyz;
    r6 = xe_cube(r8.xyz);
    r3.z = r6.w;
    r0.z = 1.0 / abs(r6.z);
    r3.xy = r6.yx * r0.zz + 1.5;
    r5.xyz = tex2D(LightAttenuationTexture, r7.zw).xyz;
    r3.xyz = texCUBE(TextureCube_0, xe_cube_dir(r3.xyz)).xyz;
    r11.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r10 = tex2D(Texture2D_4, r1.xy);
    r6.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r7.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7.x = tex2D(ShadowTexture, r0.xy).x;
    r6.x = 0.1 - -r2.z;
    r4.xy = r7.yz * 0.875;
    r7.x = r7.x * r7.x;
    r0.xyz = r6.yzw * 2.0 - 1.0;
    r7.z = dot(r2.zxy, r2.zxy);
    r6.y = saturate(5.0 * r6.x);
    r6.xzw = -UniformVector_0.xyz + 1.0;
    r7.y = r10.x + r10.x;
    r1.xyz = r6.xzw * r11.xyz;
    r6.x = r10.w;
    ps = 5.0 * r6.x;
    r6.zw = r3.yz * r10.yz;
    r7.w = ps;
    ps = 1.0 - r6.y;
    r7.y = r7.y * r3.x;
    r6.y = ps;
    ps = rsqrt(abs(r7.z));
    r6.x = dot(r0.zxy, r0.zxy);
    r7.z = ps;
    ps = rsqrt(abs(r6.x));
    r3.xyz = r7.zzz * r2.xyz;
    r6.x = ps;
    r2.xy = -r6.yy * ModShadowGroupColor.xy + 1.0;
    r2.yz = r4.xy * r2.xy + 0.125;
    ps = 1.8 * r6.z;
    r4.xyz = r0.xyz * r6.xxx;
    r7.z = ps;
    ps = r7.w;
    r6.x = dot(r4.zxy, r8.zxy);
    r0.x = ps;
    ps = 0.0001;
    r10.xyz = r4.xzy * r6.xxx;
    r0.y = ps;
    r8.xyz = r10.xyz * 2.0 - r8.xzy;
    ps = max(r0.x, r0.y);
    r6.x = saturate(dot(r3.zxy, r8.yxz));
    r2.x = ps;
    ps = log2(r6.x);
    r0.xyz = r7.xxx * r5.xyz;
    r2.w = ps;
    ps = 1.5 * r6.w;
    r2.xy = r2.xy * r2.wz;
    r7.w = ps;
    r6.xyz = r2.yyy * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r2.x);
    r6.w = saturate(dot(r4.zxy, r3.zxy));
    r7.x = ps;
    r7.xyz = r7.ywz * r7.xxx;
    r7.y = r1.z * r6.w + r7.y;
    r7.xz = r1.xy * r6.ww + r7.xz;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
