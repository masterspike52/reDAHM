// ps_b5a45eb0cc01452f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10040A00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r2.xy = r0.xy + UniformVector_2.xy;
    r2.z = ps;
    ps = 1.0 / r4.w;
    r0.zw = r0.xy + UniformVector_1.xy;
    r0.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.xy = r0.xx * ScreenPositionScaleBias.xy;
    r2.w = ps;
    r0.xy = r0.xy * r4.xy + ScreenPositionScaleBias.wz;
    r2.zw = r2.zw * abs(r5.xy);
    r5.xy = tex2D(ModShadowAccumTexture, r2.zw).xy;
    r7.xyz = tex2D(Texture2D_2, r0.zw).xyz;
    r8.xyz = tex2D(Texture2D_3, r2.xy).xyz;
    r6.yzw = tex2D(Texture2D_0, r0.zw).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r0.xy).zxy;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r3.w = dot(r3.zxy, r3.zxy);
    ps = -UniformVector_0.x;
    r1.w = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r0.w = r1.z + 0.1;
    r6.x = ps;
    ps = rsqrt(abs(r1.w));
    r2.w = dot(r6.wyz, r6.wyz);
    r1.w = ps;
    ps = rsqrt(abs(r3.w));
    r1.yzw = r1.www * r1.xyz;
    r1.x = ps;
    ps = 5.0 * r0.w;
    r9.xyz = r1.xxx * r3.xyz;
    r0.w = saturate(ps);
    ps = rsqrt(abs(r2.w));
    r1.x = -r0.w + 1.0;
    r0.w = ps;
    r4.xy = -r1.xx * ModShadowGroupColor.xy + 1.0;
    ps = -UniformVector_0.y;
    r3.xyz = r0.www * r6.yzw;
    ps = 1.0 + ps;
    r0.w = dot(r3.zxy, r9.zxy);
    r6.y = ps;
    ps = -UniformVector_0.z;
    r10.xyz = r3.xzy * r0.www;
    r9.xyz = r10.xyz * 2.0 - r9.xzy;
    ps = 1.0 + ps;
    r1.x = saturate(dot(r1.wyz, r9.yxz));
    r6.z = ps;
    ps = log2(r1.x);
    r0.w = saturate(dot(r3.zxy, r1.wyz));
    r8.w = ps;
    ps = LightColor.x * r0.y;
    r1 = r8 * float4(1.5, 1.5, 1.5, 15.0);
    r3.x = ps;
    ps = LightColor.y * r0.z;
    r7.xyz = r1.xyz * r7.xyz;
    r3.y = ps;
    ps = pow(2.0, r1.w);
    r1.xyz = r7.xyz * r6.xyz;
    r5.z = ps;
    ps = LightColor.z * r0.x;
    r5.xyz = r5.xyz * float3(0.875, 0.875, 0.21952);
    r3.z = ps;
    r1.xyz = r1.xyz * r0.www + r5.zzz;
    r0.xy = r5.xy * r4.xy + 0.125;
    ps = r0.x * r0.y;
    r1.xyz = r3.xyz * r1.xyz;
    r0.x = ps;
    r0.xyz = r0.xxx * r2.xyz + ModShadowColor.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
