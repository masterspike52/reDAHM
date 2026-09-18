// ps_5514b6b1f3f7a5c8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 150 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000258 10040A00 00000806 00000000 00006908 00FF00FF 00000001 00003050 00003151 0000F252 0000F353 00007454 0000F555 00007656 0000F757
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r7 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c5); // float4
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c7); // float2
float4 SpotDirection : register(c6); // float3
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_3 : register(s2);
sampler2D Texture2D_4 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord4 : TEXCOORD4; // r4
    float4 texcoord5 : TEXCOORD5; // r5
    float4 texcoord6 : TEXCOORD6; // r6
    float4 texcoord7 : TEXCOORD7; // r7
    float2 vPos : VPOS;   // r8 (pixel parameters)
    float vFace : VFACE;  // r8
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord3;
    float4 r4 = In.texcoord4;
    float4 r5 = In.texcoord5;
    float4 r6 = In.texcoord6;
    float4 r7 = In.texcoord7;
    float4 r8 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r7.w;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.xy = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    r0.zw = r0.zw * abs(r8.xy);
    r1.xy = r1.xy * r7.xy + ScreenPositionScaleBias.wz;
    r1.xyz = tex2D(LightAttenuationTexture, r1.xy).xyz;
    r3.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r0.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    ps = r4.z;
    r2.w = dot(r4.zxy, r4.zxy);
    ps = 0.1 + ps;
    r0.z = dot(r5.zxy, r5.zxy);
    r0.w = ps;
    ps = 1.0 - r0.z;
    r2.x = dot(r6.zxy, r6.zxy);
    r1.w = saturate(ps);
    ps = 0.875 * r0.x;
    r10.yzw = -UniformVector_0.xyz + 1.0;
    r10.x = ps;
    ps = 0.875 * r0.y;
    r7.xyz = r10.yzw * r7.xyz;
    r10.y = ps;
    ps = rsqrt(abs(r0.z));
    r0.y = dot(r8.zxy, r8.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r2.x));
    r3 = r3.xxyz * float4(5.0, 5e+01, 5.0, 5.0);
    r0.z = ps;
    ps = rsqrt(abs(r2.w));
    r2.xyz = r0.zzz * r6.xyz;
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r6.xyz = r0.zzz * r4.xyz;
    r0.y = ps;
    ps = log2(r1.w);
    r4.xyz = r0.xxx * -SpotDirection.xyz;
    r0.x = ps;
    ps = 5.0 * r0.w;
    r8.xyz = r0.yyy * r8.xyz;
    r0.y = saturate(ps);
    ps = 1.0 - r0.y;
    r0.z = dot(r4.zxy, r5.zxy);
    r0.y = ps;
    r0.yw = -r0.yy * ModShadowGroupColor.xy + 1.0;
    r4.xy = r10.xy * r0.yw + 0.125;
    r5.xyz = r8.xyz * TwoSidedSign.xxx;
    ps = r3.y;
    r1.w = saturate(dot(r5.zxy, r6.zxy));
    r0.y = ps;
    ps = 0.0001;
    r2.w = dot(r5.zxy, r2.zxy);
    r0.w = ps;
    ps = max(r0.y, r0.w);
    r5.xyz = r5.xzy * r2.www;
    r4.z = ps;
    r2.xyz = r5.xyz * 2.0 - r2.xzy;
    ps = -SpotAngles.x - -r0.z;
    r0.y = saturate(dot(r6.zxy, r2.yxz));
    r0.z = ps;
    ps = log2(r0.y);
    r2.x = saturate(r0.z * SpotAngles.y);
    r4.w = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r2.yz = r4.xz * r4.yw;
    r0.w = ps;
    r0.xyz = r2.yyy * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r2.z);
    r2.y = r2.x * r2.x;
    r2.z = ps;
    ps = pow(2.0, r0.w);
    r3.xyz = r3.xzw * r2.zzz;
    r0.w = ps;
    r3.xy = r7.xy * r1.ww + r3.xy;
    r3.z = r7.z * r1.w + r3.z;
    r3.xyz = r3.xyz * r0.www;
    r1.xyz = r3.xyz * r1.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.yzw = r1.yzx * r2.yyx;
    r1.x = r1.w * r2.x;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
