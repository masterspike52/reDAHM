// ps_3f74dae12a9b71ae.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 129 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000204 10040900 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D ShadowTexture : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r6.xx * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.x = max(UniformScalar_0.x, 0.0001);
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r6.zw = r6.zw * r5.xy + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r2.w = tex2D(ShadowTexture, r0.xy).x;
    r3.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r7.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r0 = tex2D(Texture2D_1, r1.xy);
    ps = -ModShadowColor.x;
    r6.w = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r6.z = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    ps = r2.z;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r7.zw = r7.xy * 0.875;
    r6.x = ps;
    r5.xyz = r3.xyz * 2.0 - 1.0;
    ps = 5.0 * r6.x;
    r7.xy = r0.ww * UniformVector_1.xy;
    r6.x = saturate(ps);
    ps = r2.w * r2.w;
    r3.xyw = r1.xyz * r0.xyz;
    r1.x = ps;
    ps = rsqrt(abs(r6.z));
    r0.xyz = r1.xxx * r8.xyz;
    r6.z = ps;
    ps = 1.0 - r6.x;
    r1.xyz = r6.zzz * r2.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r6.w));
    r6.x = dot(r5.zxy, r5.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r4.xyz = r6.www * r4.xyz;
    r6.x = ps;
    r6.zw = -r6.zz * ModShadowGroupColor.xy + 1.0;
    r9.yz = r7.zw * r6.zw + 0.125;
    ps = -ModShadowColor.y;
    r2.xyz = r5.xyz * r6.xxx;
    ps = 1.0 + ps;
    r6.x = dot(r2.zxy, r4.zxy);
    r6.z = ps;
    ps = -ModShadowColor.z;
    r5.xyz = r2.xzy * r6.xxx;
    r4.xyz = r5.xyz * 2.0 - r4.xzy;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r1.zxy, r4.yxz));
    r6.w = ps;
    ps = log2(r6.x);
    r1.x = saturate(dot(r2.zxy, r1.zxy));
    r9.w = ps;
    ps = r0.w;
    r7.zw = r9.yx * r9.zw;
    r6.x = ps;
    r6.yzw = r7.zzz * r6.yzw + ModShadowColor.xyz;
    ps = pow(2.0, r7.w);
    r7.z = r3.w * r1.x;
    r1.y = ps;
    ps = UniformVector_1.z * r6.x;
    r7.xy = r7.xy * r1.yy;
    r3.z = ps;
    r7.xyz = r3.xyz * r1.xxy + r7.xyz;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xyz * LightColor.xyz;
    r6.xyz = r7.xyz * r6.yzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
