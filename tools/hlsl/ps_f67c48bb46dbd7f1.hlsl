// ps_f67c48bb46dbd7f1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 10040A00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c9); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_1 : register(c6); // float
float4 UniformScalar_2 : register(c7); // float
float4 UniformScalar_8 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r7.xy = UniformVector_1.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.zw = r6.xx * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r7.zw = r7.zw * r5.xy + ScreenPositionScaleBias.wz;
    r9.xyz = tex2D(LightAttenuationTexture, r7.zw).xyz;
    r10.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r7.w = tex2D(ShadowTexture, r0.xy).x;
    r0.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r7.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.z = tex2D(Texture2D_2, r1.xy).x;
    r8.xyz = r7.xyz * r0.xyz - r7.xyz;
    ps = rsqrt(abs(r6.w));
    r0.x = r7.w * r7.w;
    r0.w = ps;
    ps = r2.z;
    r7.w = saturate(r0.w * r2.z);
    ps = 0.1 + ps;
    r5.z = max(UniformScalar_8.x, 0.0001);
    r6.w = ps;
    ps = 1.0 - r6.z;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r10.w = ps;
    ps = 0.875 * r6.x;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = 0.875 * r6.y;
    r1.w = dot(r4.zxy, r4.zxy);
    r5.y = ps;
    ps = 5.0 * r6.w;
    r10.xyz = r10.xyz * r6.zzz;
    r6.x = saturate(ps);
    ps = rsqrt(abs(r1.w));
    r0.xyz = r0.xxx * r9.xyz;
    r6.y = ps;
    ps = 1.0 - r6.x;
    r4.xyz = r6.yyy * r4.zxy;
    r6.x = ps;
    r9.xyz = r8.xyz * UniformScalar_0.xxx + r7.xyz;
    r7.xyz = r9.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    ps = -r4.y;
    r8.xyz = r0.www * r2.zxy;
    r4.y = ps;
    r4.x = r4.x * 2.0 - r4.x;
    r2.zw = -r6.xx * ModShadowGroupColor.xy + 1.0;
    ps = -r4.z;
    r6 = r10.xzwy * r9.xzzy;
    r4.z = ps;
    r2.xy = r10.ww * r9.xy + r6.xw;
    r5.xy = r5.xy * r2.zw + 0.125;
    r6.x = saturate(dot(r8.yzx, r4.yzx));
    ps = log2(r6.x);
    r2.z = r6.y + r6.z;
    r5.w = ps;
    r6.xw = r5.xz * r5.yw;
    r6.xyz = r6.xxx * r3.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r1.xyz = r2.xyz * r1.xyz;
    r6.w = ps;
    r7.xyz = r7.xzy * r6.www;
    r7.y = r1.z * r7.w + r7.y;
    r7.xz = r1.xy * r7.ww + r7.xz;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
