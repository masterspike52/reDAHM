// ps_270c605ed25691f4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000264 10040C00 00000606 00000000 000058C6 003F003F 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 ConstantLighting : register(c9); // float3
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    r0.zw = r0.zw * abs(r6.xy);
    r10.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r1 = tex2D(Texture2D_1, r0.xy);
    ps = -UniformVector_0.x;
    r6.w = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r0.x = dot(r5.zxy, r5.zxy);
    r11.x = ps;
    ps = -UniformVector_0.y;
    r0.y = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r7.xyz = r1.xyz * 0.05;
    r11.y = ps;
    r6.xyz = r6.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.y));
    r12.xyz = r1.xyz * UniformVector_1.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r9.xyz = r0.yyy * r4.xyz;
    r0.x = ps;
    ps = -UniformVector_0.z;
    r0.xyz = r0.xxx * r5.xyz;
    ps = 1.0 + ps;
    r0.w = dot(r6.xyz, r6.xyz);
    r11.z = ps;
    ps = rsqrt(abs(r6.w));
    r4.xyz = r12.xyz * r11.xyz;
    r4.w = ps;
    r5.xyz = r7.xyz * UniformVector_1.xyz + UniformVector_0.xyz;
    r7.xyz = r4.xyz * AmbientColorAndSkyFactor.xyz + r5.xyz;
    ps = rsqrt(abs(r0.w));
    r1.xyz = r4.www * r2.xzy;
    r0.w = ps;
    r5.xyz = r6.xyz * r0.www;
    ps = 0.1 - -r1.y;
    r10.x = dot(r0.zxy, r5.xyz);
    r0.x = ps;
    ps = 5.0 * r0.x;
    r0.y = dot(r5.xyz, r9.zxy);
    r0.x = saturate(ps);
    ps = OpacityOverride.x;
    r0.z = -r0.x + 1.0;
    r6.w = saturate(ps);
    ps = ModShadowGroupColor.x * r0.z;
    r0.xyw = r5.yzx * r0.yyy;
    r6.y = ps;
    r9.xyz = r0.xyw * 2.0 - r9.xyz;
    ps = ModShadowGroupColor.y * r0.z;
    r2 = r10.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r6.z = ps;
    ps = r2.y;
    r5.xyz = r5.xxx * ConstantLighting.xyz;
    r0.x = ps;
    ps = 0.5 + r0.x;
    r4.w = saturate(dot(r1.yxz, r9.zxy));
    r6.x = ps;
    ps = 0.5 + r2.x;
    r0.xyw = -r6.yzw + 1.0;
    r6.y = ps;
    r0.yz = r2.zw * r0.xy + 0.125;
    ps = log2(r4.w);
    r1.xy = abs(r6.xy) * abs(r6.xy);
    r0.x = ps;
    ps = 15.0 * r0.x;
    r0.w = float((r0.w >= 0.004));
    r2.x = ps;
    ps = r0.y * r0.z;
    r6.xyz = r4.xzy * r1.xxx;
    r0.x = ps;
    r0.xyz = r0.xxx * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r2.x);
    r2.yzw = r4.xzy * r1.yyy;
    r2.x = ps;
    r2.yzw = r2.ywz * UpperSkyColor.xyz + r7.xyz;
    r1.xyz = r6.xyz * LowerSkyColor.xzy + r2.ywz;
    r2.xyz = r2.xxx * ConstantLighting.xzy;
    r1.xyz = r2.xzy * r1.www + r1.xzy;
    r1.xyz = r5.xzy * r4.xzy + r1.xzy;
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
