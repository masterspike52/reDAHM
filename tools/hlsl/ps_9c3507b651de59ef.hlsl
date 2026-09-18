// ps_9c3507b651de59ef.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 147 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000024C 10040C00 00000606 00000000 000058C6 003F003F 00000001 00003050 0000F153 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord3 : TEXCOORD3; // r1
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
    float4 r1 = In.texcoord3;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = dot(r4.zxy, r4.zxy);
    r7.y = ps;
    r6.xy = r7.xy * abs(r6.xy);
    r12.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r7 = tex2D(Texture2D_1, r0.xy);
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r2.zxy, r2.zxy);
    r0.x = dot(r5.zxy, r5.zxy);
    r6.xyz = r8.xyz * r7.xyz;
    r10.xyz = r10.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r11.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz;
    r0.y = ps;
    r8.xyz = r11.xyz * r8.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r0.x));
    r4.xyz = r0.yyy * r4.xyz;
    r0.x = ps;
    r0.xyz = r0.xxx * r5.xyz;
    ps = rsqrt(abs(r6.w));
    r0.w = dot(r10.xyz, r10.xyz);
    r4.w = ps;
    ps = rsqrt(abs(r0.w));
    r2.xyz = r4.www * r2.zxy;
    r0.w = ps;
    r5.xyz = r10.xyz * r0.www;
    ps = 0.1 - -r2.x;
    r12.x = dot(r0.zxy, r5.xyz);
    r0.x = ps;
    ps = 5.0 * r0.x;
    r0.y = dot(r5.xyz, r4.zxy);
    r0.x = saturate(ps);
    ps = OpacityOverride.x;
    r0.z = -r0.x + 1.0;
    r10.z = saturate(ps);
    ps = ModShadowGroupColor.x * r0.z;
    r0.xyw = r5.yzx * r0.yyy;
    r10.x = ps;
    r11.xyz = r0.xyw * 2.0 - r4.xyz;
    ps = ModShadowGroupColor.y * r0.z;
    r4 = r12.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r10.y = ps;
    ps = r4.y;
    r5.xyz = r5.xxx * r1.xyz;
    r0.x = ps;
    ps = 0.5 + r0.x;
    r2.x = saturate(dot(r2.xyz, r11.zxy));
    r2.y = ps;
    ps = 0.5 + r4.x;
    r0.xyw = -r10.xyz + 1.0;
    r2.z = ps;
    r0.yz = r4.zw * r0.xy + 0.125;
    ps = log2(r2.x);
    r2.yz = abs(r2.yz) * abs(r2.yz);
    r0.x = ps;
    ps = 15.0 * r0.x;
    r0.w = float((r0.w >= 0.004));
    r2.x = ps;
    ps = r0.y * r0.z;
    r4.xyz = r6.xzy * r2.zzz;
    r0.x = ps;
    r0.xyz = r0.xxx * r9.xyz + ModShadowColor.xyz;
    r4.xyz = r4.xzy * UpperSkyColor.xyz + r8.xyz;
    ps = pow(2.0, r2.x);
    r8.xyz = r6.xzy * r2.yyy;
    r2.x = ps;
    r2.xyz = r2.xxx * r1.xzy;
    r1.xyz = r8.xyz * LowerSkyColor.xzy + r4.xzy;
    r1.xyz = r2.xzy * r7.www + r1.xzy;
    r1.xyz = r5.xzy * r6.xzy + r1.xzy;
    ps = -r3.w;
    r0.xyz = r1.xzy * r0.xyz;
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
