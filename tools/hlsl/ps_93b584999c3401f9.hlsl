// ps_93b584999c3401f9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 150 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000258 10040E00 00000606 00000000 000050C6 003F003F 00000001 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LightMapScale : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D LightMapTexture : register(s2);
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
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = dot(r5.zxy, r5.zxy);
    r1.w = ps;
    r1.zw = r1.zw * abs(r6.xy);
    r13.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r6 = tex2D(Texture2D_1, r1.xy);
    r8.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r0.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r1.x = dot(r2.zxy, r2.zxy);
    ps = LightMapScale.x * r0.y;
    r1.y = dot(r4.zxy, r4.zxy);
    r8.x = ps;
    r14.xyz = r8.wyz * 2.0 - 1.0;
    ps = rsqrt(abs(r1.y));
    r9.xyz = r7.xyz * r6.xyz;
    r1.y = ps;
    r10.xyz = r9.xyz * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r0.w));
    r12.xyz = r1.yyy * r4.xyz;
    r0.w = ps;
    ps = LightMapScale.y * r0.z;
    r5.xyz = r0.www * r5.xyz;
    r8.y = ps;
    ps = rsqrt(abs(r1.x));
    r0.w = dot(r14.xyz, r14.xyz);
    r1.x = ps;
    ps = rsqrt(abs(r0.w));
    r1.xyz = r1.xxx * r2.zxy;
    r0.w = ps;
    ps = LightMapScale.z * r0.x;
    r2.xyz = r14.xyz * r0.www;
    r8.z = ps;
    r4.xyz = r8.xyz * r2.xxx;
    ps = 0.1 - -r1.x;
    r13.x = dot(r5.zxy, r2.xyz);
    r0.x = ps;
    ps = 5.0 * r0.x;
    r0.y = dot(r2.xyz, r12.zxy);
    r0.x = saturate(ps);
    ps = OpacityOverride.x;
    r0.z = -r0.x + 1.0;
    r5.z = saturate(ps);
    ps = ModShadowGroupColor.x * r0.z;
    r0.xyw = r2.yzx * r0.yyy;
    r5.x = ps;
    r12.xyz = r0.xyw * 2.0 - r12.xyz;
    ps = ModShadowGroupColor.y * r0.z;
    r2 = r13.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r5.y = ps;
    ps = r2.y;
    r4.xyz = r4.xyz * r6.xyz;
    r0.x = ps;
    ps = 0.5 + r0.x;
    r1.x = saturate(dot(r1.xyz, r12.zxy));
    r1.y = ps;
    ps = 0.5 + r2.x;
    r0.xyw = -r5.xyz + 1.0;
    r1.z = ps;
    r0.yz = r2.zw * r0.xy + 0.125;
    ps = log2(r1.x);
    r2.xy = abs(r1.yz) * abs(r1.yz);
    r0.x = ps;
    ps = 15.0 * r0.x;
    r0.w = float((r0.w >= 0.004));
    r1.w = ps;
    ps = r0.y * r0.z;
    r1.xyz = r9.xzy * r2.yyy;
    r0.x = ps;
    r0.xyz = r0.xxx * r11.xyz + ModShadowColor.xyz;
    r1.xyz = r1.xzy * UpperSkyColor.xyz + r10.xyz;
    ps = pow(2.0, r1.w);
    r5.xyz = r9.xzy * r2.xxx;
    r1.w = ps;
    r2.xyz = r8.xzy * r1.www;
    r1.xyz = r5.xyz * LowerSkyColor.xzy + r1.xzy;
    r1.xyz = r2.xyz * r6.www + r1.xyz;
    r1.xyz = r4.xyz * r7.xyz + r1.xzy;
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
