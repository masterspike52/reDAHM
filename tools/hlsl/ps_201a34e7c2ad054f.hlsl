// ps_201a34e7c2ad054f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 150 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000258 10040B00 00000606 00000000 000050C6 003F003F 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
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
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    r0.zw = r0.zw * abs(r6.xy);
    r5.xy = r7.xy * r5.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r7.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r0.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    ps = r2.z;
    r1.w = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r0.z = dot(r3.zxy, r3.zxy);
    r6.w = ps;
    ps = 1.0 - r0.z;
    r5.w = dot(r4.zxy, r4.zxy);
    r0.w = saturate(ps);
    ps = 0.875 * r0.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r9.x = ps;
    ps = 0.875 * r0.y;
    r6.xyz = r8.xyz * r6.xyz;
    r9.y = ps;
    ps = rsqrt(abs(r0.z));
    r4.w = dot(r11.zxy, r11.zxy);
    r2.w = ps;
    ps = rsqrt(abs(r5.w));
    r0.x = saturate(r6.w * 5.0);
    r0.z = ps;
    ps = 1.0 - r0.x;
    r7 = r7.xyxz * float4(5.0, 5.0, 5e+01, 5.0);
    r0.y = ps;
    ps = rsqrt(abs(r1.w));
    r8.y = max(r7.z, 0.0001);
    r1.w = ps;
    ps = rsqrt(abs(r4.w));
    r8.xzw = r0.zzz * r4.xyz;
    r0.z = ps;
    ps = log2(r0.w);
    r10.xyz = r2.www * -SpotDirection.xyz;
    r0.x = ps;
    ps = r1.w;
    r4.xyz = r0.zzz * r11.xyz;
    r0.zw = -r0.yy * ModShadowGroupColor.xy + 1.0;
    ps = r2.x * ps;
    r0.y = dot(r10.zxy, r3.zxy);
    r3.x = ps;
    r3.zw = r9.xy * r0.zw + 0.125;
    ps = r1.w;
    r4.xyz = r4.xyz * TwoSidedSign.xxx;
    ps = r2.y * ps;
    r0.z = dot(r4.zxy, r8.wxz);
    r3.y = ps;
    ps = r1.w;
    r0.w = r3.z * r3.w;
    r1.xyz = r0.www * r1.xyz + ModShadowColor.xyz;
    ps = r2.z * ps;
    r9.xyz = r4.xzy * r0.zzz;
    r3.z = ps;
    r2.xyz = r9.xyz * 2.0 - r8.xwz;
    ps = -SpotAngles.x - -r0.y;
    r0.z = saturate(dot(r3.zxy, r2.yxz));
    r0.y = ps;
    ps = log2(r0.z);
    r8.x = saturate(r0.y * SpotAngles.y);
    r8.z = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r0.yz = r8.xy * r8.xz;
    r0.x = ps;
    ps = pow(2.0, r0.z);
    r0.w = saturate(dot(r4.zxy, r3.zxy));
    r1.w = ps;
    ps = pow(2.0, r0.x);
    r2.xyz = r7.xyw * r1.www;
    r0.x = ps;
    r2.xy = r6.xy * r0.ww + r2.xy;
    r2.z = r6.z * r0.w + r2.z;
    r2.xyz = r2.xyz * r0.xxx;
    r2.xyz = r2.xyz * r5.xyz;
    r2.xyz = r2.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r2.xzy * r0.yyy;
    r0.xyz = r0.xzy * r1.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
