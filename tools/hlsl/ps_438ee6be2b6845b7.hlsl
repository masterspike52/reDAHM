// ps_438ee6be2b6845b7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10040B00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.zw = r0.zz * ScreenPositionScaleBias.xy;
    r2.y = ps;
    r0.zw = r0.zw * r4.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r2.x = ps;
    r2.xy = r2.xy * abs(r5.xy);
    r4.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r8.yz = tex2D(ModShadowAccumTexture, r2.xy).xy;
    r9.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r5.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r2.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    ps = r1.z;
    r0.y = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r0.z = dot(r3.zxy, r3.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r0.z));
    r0.x = saturate(r0.x * 5.0);
    r0.z = ps;
    ps = rsqrt(abs(r0.y));
    r2.xyz = r2.xyz * LightColor.xyz;
    r0.w = ps;
    ps = r0.w;
    r0.y = dot(r5.wyz, r5.wyz);
    ps = r1.x * ps;
    r3.xyz = r0.zzz * r3.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r0.y));
    r0.x = -r0.x + 1.0;
    r0.z = ps;
    r0.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    ps = r0.w;
    r5.yzw = r0.zzz * r5.yzw;
    ps = r1.y * ps;
    r7.xyz = r5.yzw * TwoSidedSign.xxx;
    r5.y = ps;
    ps = r0.w;
    r0.z = dot(r7.zxy, r3.zxy);
    ps = r1.z * ps;
    r11.xyz = r7.xzy * r0.zzz;
    r5.z = ps;
    r1.xyz = r11.xyz * 2.0 - r3.xzy;
    r0.z = saturate(dot(r5.zxy, r1.yxz));
    ps = log2(r0.z);
    r3.xyz = r10.xyz * r9.xyz;
    r8.x = ps;
    r1.xyz = r8.xyz * float3(15.0, 0.875, 0.875);
    ps = pow(2.0, r1.x);
    r0.w = saturate(dot(r7.zxy, r5.zxy));
    r0.z = ps;
    r0.xy = r1.yz * r0.xy + 0.125;
    ps = r0.x * r0.y;
    r1.xyz = r0.zzz * r4.xyz;
    r0.x = ps;
    r0.xyz = r0.xxx * r6.xyz + ModShadowColor.xyz;
    r1.xy = r3.xy * r0.ww + r1.xy;
    r1.z = r3.z * r0.w + r1.z;
    r1.xyz = r2.xyz * r1.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
