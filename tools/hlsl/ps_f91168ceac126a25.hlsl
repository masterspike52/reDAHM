// ps_f91168ceac126a25.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 99 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000018C 10040800 00000606 00000000 000058C6 003F003F 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
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
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.xy * 2.0 + UniformVector_2.xy;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    r0.zw = r0.zw * abs(r6.xy);
    r8.x = tex2D(Texture2D_2, r0.xy).x;
    r8.yzw = tex2D(Texture2D_1, r5.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    ps = OpacityOverride.x;
    r0.z = dot(r2.zxy, r2.zxy);
    r7.x = saturate(ps);
    ps = rsqrt(abs(r0.z));
    r6.zw = r5.xy * 0.875;
    r0.z = ps;
    ps = r8.x + r8.x;
    r6.xy = r0.xy + UniformVector_1.xy;
    r5.x = ps;
    r0.x = r0.z * r2.z + 0.1;
    ps = r8.y + r8.y;
    r0.x = saturate(r0.x * 5.0);
    r5.y = ps;
    ps = r8.z + r8.z;
    r0.x = -r0.x + 1.0;
    r5.z = ps;
    ps = r8.w + r8.w;
    r7.yz = r0.xx * ModShadowGroupColor.xy;
    r5.w = ps;
    ps = r5.x;
    r0.xyz = -r7.yxz + 1.0;
    ps = r1.w * ps;
    r2.xy = r6.zw * r0.xz;
    r2.z = ps;
    r0.xzw = r2.xyz + float3(0.125, 0.125, -0.1);
    ps = r0.x * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.wwww)) clip(-1.0);
    r0.x = ps;
    r2.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r2.xyz = r2.xyz + r2.xyz;
    r1.xyz = r2.xyz * r5.yzw + r1.xyz;
    r1.xyz = r1.xyz * 0.8 + UniformVector_0.xyz;
    r0.w = float((r0.y >= 0.004));
    r0.xyz = r0.xxx * r4.xyz + ModShadowColor.xyz;
    ps = -r3.w;
    r0.xyz = r1.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r3.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
