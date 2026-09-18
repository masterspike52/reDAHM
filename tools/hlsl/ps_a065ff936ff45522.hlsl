// ps_a065ff936ff45522.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 102 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000198 10040700 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
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
sampler2D ShadowTexture : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.xy = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = -UniformVector_0.x + 1.0;
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r2.xy = r2.xy * r4.xy + ScreenPositionScaleBias.wz;
    r2.xyz = tex2D(LightAttenuationTexture, r2.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0.z = tex2D(ShadowTexture, r0.xy).x;
    ps = r1.z;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r0.y = dot(r1.zxy, r1.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r0.y));
    r0.w = r0.z * r0.z;
    r0.y = ps;
    ps = 5.0 * r0.x;
    r0.z = dot(r3.zxy, r3.zxy);
    r0.x = saturate(ps);
    ps = rsqrt(abs(r0.z));
    r7.xyz = r0.yyy * r1.zxy;
    r0.z = ps;
    ps = 1.0 - r0.x;
    r6.xyz = r0.zzz * r3.zxy;
    r0.x = ps;
    r3.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r6.yz = -r6.yz;
    r6.x = r6.x * 2.0 - r6.x;
    r0.x = saturate(dot(r7.yzx, r6.yzx));
    ps = log2(r0.x);
    r6.z = saturate(r0.y * r1.z);
    r5.z = ps;
    r0.xyz = r5.zxy * float3(15.0, 0.875, 0.875);
    r6.xy = r0.yz * r3.xy + 0.125;
    ps = pow(2.0, r0.x);
    r0.yzw = r0.www * r2.xzy;
    r0.x = ps;
    ps = 0.21952 * r0.x;
    r2.xyz = r0.wzy * float3(0.21952, 1.0, 1.0);
    r1.y = ps;
    ps = 1.0 * r0.x;
    r0.yw = r6.xz * r6.yw;
    r1.z = ps;
    r0.xyz = r0.yyy * r4.xyz + ModShadowColor.xyz;
    r1.x = r0.w + r1.y;
    r1.xyz = r2.zyx * r1.xyz;
    r1.xyz = r1.xyz * LightColor.xzy;
    r0.xyz = r1.xzy * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
