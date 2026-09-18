// ps_dba81b6bd82dba47.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 93 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000174 10040800 00000806 00000000 00006908 00FF00FF 00000001 00003050 00003151 0000F252 0000F353 00007454 0000F555 00007656 0000F757
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

float4 LightColor : register(c4); // float3
float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r7.w;
    r0.x = r4.z + 0.1;
    r0.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.yz = r0.yy * ScreenPositionScaleBias.xy;
    r1.y = ps;
    r0.zw = r0.yz * r7.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.y = dot(r4.zxy, r4.zxy);
    r1.x = ps;
    r1.xy = r1.xy * abs(r8.xy);
    r5.xy = tex2D(ModShadowAccumTexture, r1.xy).xy;
    r3.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    ps = rsqrt(abs(r0.y));
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r0.y = ps;
    ps = 5.0 * r0.x;
    r0.z = dot(r6.zxy, r6.zxy);
    r0.x = saturate(ps);
    ps = rsqrt(abs(r0.z));
    r7.xyz = r0.yyy * r4.xyz;
    r0.z = ps;
    ps = 1.0 - r0.x;
    r6.xyz = r0.zzz * r6.xyz;
    r0.x = ps;
    r1.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r0.zw = -r6.xy;
    r0.x = r6.z * 2.0 - r6.z;
    r0.x = saturate(dot(r7.xyz, r0.zwx));
    ps = log2(r0.x);
    r0.w = r3.y * LightColor.y;
    r0.x = ps;
    ps = 15.0 * r0.x;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r1.z = saturate(r0.y * r4.z);
    r5.z = ps;
    ps = -UniformVector_0.y;
    r0.xyz = r5.xyz * float3(0.875, 0.875, 0.21952);
    r1.xy = r0.xy * r1.xy + 0.125;
    ps = 1.0 + ps;
    r0.xy = r0.zz * r3.zx;
    r1.w = ps;
    r1.xw = r1.xz * r1.yw;
    r1.xyz = r1.xxx * r2.xyz + ModShadowColor.xyz;
    ps = LightColor.x * r0.y;
    r0.z = r1.w + r0.z;
    r2.x = ps;
    ps = LightColor.z * r0.x;
    r2.z = r0.w * r0.z;
    r2.y = ps;
    r0.xyz = r2.xzy * r1.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
