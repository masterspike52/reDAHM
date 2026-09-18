// ps_4d128efa9bd49a49.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040900 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c4); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = dot(r3.zxy, r3.zxy);
    r7.z = ps;
    ps = 1.0 / r4.w;
    r0.w = r1.z + 0.1;
    r1.w = ps;
    r6.xyz = r6.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r1.ww * ScreenPositionScaleBias.xy;
    r7.w = ps;
    ps = rsqrt(abs(r0.z));
    r5.xy = r7.zw * abs(r5.xy);
    r0.z = ps;
    r5.zw = r7.xy * r4.xy + ScreenPositionScaleBias.wz;
    ps = 5.0 * r0.w;
    r7.xyz = r0.zzz * r3.zxy;
    r0.z = saturate(ps);
    ps = 1.0 - r0.z;
    r3.z = saturate(dot(r7.xyz, r6.zxy));
    r0.z = ps;
    r3.xy = r0.zz * ModShadowGroupColor.xy;
    r4.xyz = -r3.xyz + 1.0;
    r3.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r5.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r9.xyz = tex2D(Texture2D_2, r4.zz).xyz;
    r8.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.yzw = -ModShadowColor.xyz + 1.0;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r1.w = dot(r1.zxy, r1.zxy);
    r0.x = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r1.w));
    r2.yzw = r9.xyz + r8.xyz;
    r1.w = ps;
    ps = 1.0 - r0.x;
    r8.xyz = r1.www * r1.zxy;
    r0.x = saturate(ps);
    ps = r1.w;
    r7.yz = -r7.yz;
    r7.x = r7.x * 2.0 - r7.x;
    ps = r1.z * ps;
    r2.x = saturate(dot(r8.yzx, r7.yzx));
    r1.x = saturate(ps);
    ps = log2(r2.x);
    r1.yzw = r2.yzw * r6.xyz;
    r2.x = ps;
    ps = log2(r0.x);
    r2.x = r2.x * 15.0;
    r0.x = ps;
    ps = pow(2.0, r2.x);
    r0.x = r0.x * LightColorAndFalloffExponent.w;
    r5.x = ps;
    ps = pow(2.0, r0.x);
    r2.xyz = r5.xyz * float3(0.21952, 0.875, 0.875);
    r0.x = ps;
    r1.xyz = r1.yzw * r1.xxx + r2.xxx;
    r2.xy = r2.yz * r4.xy + 0.125;
    ps = r2.x * r2.y;
    r1.xyz = r1.xyz * r0.xxx;
    r0.x = ps;
    r0.xyz = r0.xxx * r0.yzw + ModShadowColor.xyz;
    r1.xyz = r1.xyz * r3.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
