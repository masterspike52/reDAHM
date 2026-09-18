// ps_9879f61a8c359462.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040900 00000806 00000000 00006908 00FF00FF 00000001 00003050 00003151 0000F252 0000F353 00007454 0000F555 00007656 0000F757
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

float4 LightColor : register(c5); // float3
float4 ModShadowAccumResolution : register(c8); // float2
float4 ModShadowColor : register(c6); // float3
float4 ModShadowGroupColor : register(c7); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r7.w;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.zw = r0.zz * ScreenPositionScaleBias.xy;
    r1.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r1.x = ps;
    r1.xy = r1.xy * abs(r8.xy);
    r0.zw = r0.zw * r7.xy + ScreenPositionScaleBias.wz;
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r3.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r0.zw).zxy;
    r1.xy = tex2D(ModShadowAccumTexture, r1.xy).xy;
    ps = r4.z;
    r2.x = dot(r6.zxy, r6.zxy);
    ps = 0.1 + ps;
    r2.y = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    ps = 0.875 * r1.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r1.z = ps;
    ps = 0.875 * r1.y;
    r5.xyz = r8.xyz * r5.xyz;
    r1.w = ps;
    ps = rsqrt(abs(r2.y));
    r3 = r3.xyxz * float4(5.0, 5.0, 5e+01, 5.0);
    r2.y = ps;
    ps = 5.0 * r0.w;
    r1.y = dot(r7.zxy, r7.zxy);
    r1.x = saturate(ps);
    ps = rsqrt(abs(r2.x));
    r4.xyz = r2.yyy * r4.xyz;
    r0.w = ps;
    ps = rsqrt(abs(r1.y));
    r2.xyz = r0.www * r6.xyz;
    r0.w = ps;
    ps = 1.0 - r1.x;
    r6.xyz = r0.www * r7.xyz;
    r0.w = ps;
    r1.xy = -r0.ww * ModShadowGroupColor.xy + 1.0;
    r1.yz = r1.zw * r1.xy + 0.125;
    r6.xyz = r6.xyz * TwoSidedSign.xxx;
    r0.w = dot(r6.zxy, r2.zxy);
    r7.xyz = r6.xzy * r0.www;
    r2.xyz = r7.xyz * 2.0 - r2.xzy;
    ps = LightColor.x * r0.y;
    r0.w = saturate(dot(r4.zxy, r2.yxz));
    r2.x = ps;
    ps = log2(r0.w);
    r1.x = max(r3.z, 0.0001);
    r1.w = ps;
    ps = LightColor.z * r0.x;
    r1.xw = r1.yx * r1.zw;
    r2.y = ps;
    r1.xyz = r1.xxx * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.w);
    r0.w = saturate(dot(r6.zxy, r4.zxy));
    r1.w = ps;
    ps = LightColor.y * r0.z;
    r3.xyz = r3.xyw * r1.www;
    r2.z = ps;
    r0.xy = r5.xy * r0.ww + r3.xy;
    r0.z = r5.z * r0.w + r3.z;
    r0.xyz = r2.xzy * r0.xyz;
    r0.xyz = r0.xzy * r1.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
