// ps_50e3fa230ddf5dd4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 159 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000027C 10040B00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c4); // float4
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c6); // float2
float4 SpotDirection : register(c5); // float3
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
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

    ps = 1.0 / r5.w;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yz = r6.yy * ScreenPositionScaleBias.xy;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.w = dot(r2.zxy, r2.zxy);
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r7.xy = r7.xy * abs(r8.xy);
    r6.x = ps;
    r0.zw = r6.yz * r5.xy + ScreenPositionScaleBias.wz;
    r10.xyz = r6.xxx * r4.xyz;
    r6 = xe_cube(r10.xyz);
    ps = 1.0 / abs(r6.z);
    r4.z = r6.w;
    r7.z = ps;
    r4.xy = r6.yx * r7.zz + 1.5;
    r4.xyz = texCUBE(TextureCube_0, xe_cube_dir(r4.xyz)).xyz;
    r5.yzw = tex2D(Texture2D_2, r1.xy).xyz;
    r8.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r9.w = tex2D(ShadowTexture, r0.xy).x;
    r9.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r0.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r7.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    ps = r2.z;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r11.xyz * r0.xyz;
    r6.z = ps;
    ps = 1.0 - r6.x;
    r7.z = dot(r9.zxy, r9.zxy);
    r6.y = saturate(ps);
    ps = rsqrt(abs(r7.w));
    r6.x = saturate(r6.w * 5.0);
    r6.w = ps;
    ps = 1.0 - r6.x;
    r2.xyz = r6.www * r2.xyz;
    r6.w = ps;
    ps = log2(r6.y);
    r11.xyz = r6.zzz * -SpotDirection.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r7.z));
    r6.z = dot(r11.zxy, r3.zxy);
    r6.x = ps;
    r7.zw = -r6.ww * ModShadowGroupColor.xy + 1.0;
    ps = 0.875 * r7.x;
    r3.xyz = r6.xxx * r9.xyz;
    r9.x = ps;
    ps = 0.875 * r7.y;
    r6.w = saturate(dot(r3.zxy, r2.zxy));
    r9.y = ps;
    r9.xy = r9.xy * r7.zw + 0.125;
    r6.x = dot(r3.zxy, r10.zxy);
    ps = -SpotAngles.x - -r6.z;
    r7.xyz = r3.xzy * r6.xxx;
    r6.x = ps;
    r7.xyz = r7.xyz * 2.0 - r10.xzy;
    ps = SpotAngles.y * r6.x;
    r7.w = saturate(dot(r2.zxy, r7.yxz));
    r9.z = saturate(ps);
    ps = LightColorAndFalloffExponent.w * r6.y;
    r7.xyz = r9.wxz * r9.wyz;
    r0.w = ps;
    r6.xyz = r7.yyy * r1.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.w);
    r1.xyz = r7.xxx * r8.xyz;
    r0.w = ps;
    ps = log2(r7.w);
    r1.xyz = r1.xzy * r0.www;
    r5.x = ps;
    r2 = r5.yzwx * float4(3e+01, 3e+01, 3e+01, 15.0);
    ps = pow(2.0, r2.w);
    r2.xyz = r2.xyz * r4.xyz;
    r7.w = ps;
    r7.xyw = r2.xyz * r7.www;
    r0.xy = r0.xy * r6.ww + r7.xy;
    r0.z = r0.z * r6.w + r7.w;
    r0.xyz = r1.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r0.xzy * r7.zzz;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
