// ps_121879aa5003500d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 159 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000027C 10040C00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 ConstantLighting : register(c8); // float3
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
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.z = saturate(OpacityOverride.x);
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r11.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r8.yzw = tex2D(Texture2D_1, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = -ModShadowColor.x;
    r5.x = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r5.y = dot(r4.zxy, r4.zxy);
    r9.x = ps;
    ps = -ModShadowColor.y;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r5.z = dot(r3.zxy, r3.zxy);
    r9.y = ps;
    r6.xyz = r6.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r0.xyz = r7.xyz * r8.yzw;
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r12.xyz = r5.zzz * r3.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r4.xyz = r5.yyy * r4.xyz;
    r5.x = ps;
    ps = -ModShadowColor.z;
    r3.xyz = r5.xxx * r1.xyz;
    ps = 1.0 + ps;
    r5.y = dot(r6.xyz, r6.xyz);
    r9.z = ps;
    ps = rsqrt(abs(r5.y));
    r5.x = r3.z + 0.1;
    r5.y = ps;
    ps = 5.0 * r5.x;
    r6.xyw = r6.yzx * r5.yyy;
    r5.z = saturate(ps);
    ps = ConstantLighting.x * r6.w;
    r11.x = dot(r4.zxy, r6.wxy);
    r5.x = ps;
    ps = ConstantLighting.y * r6.w;
    r6.z = dot(r6.wxy, r12.zxy);
    r5.y = ps;
    ps = ConstantLighting.z * r6.w;
    r5.z = -r5.z + 1.0;
    r5.w = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6.xyz = r6.xyw * r6.zzz;
    r10.x = ps;
    r1.xyz = r6.xyz * 2.0 - r12.xyz;
    ps = ModShadowGroupColor.y * r5.z;
    r6 = r11.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r10.y = ps;
    ps = r6.y;
    r4.xyz = r5.xwy * r8.ywz;
    r5.x = ps;
    ps = 0.5 + r5.x;
    r0.w = saturate(dot(r3.zxy, r1.zxy));
    r1.x = ps;
    ps = 0.5 + r6.x;
    r5.xyw = -r10.xyz + 1.0;
    r1.y = ps;
    r5.yz = r6.zw * r5.xy + 0.125;
    ps = log2(r0.w);
    r6.yz = abs(r1.xy) * abs(r1.xy);
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.w = float((r5.w >= 0.004));
    r6.x = ps;
    ps = r5.y * r5.z;
    r1.xyz = r0.xzy * r6.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.x);
    r3.xyz = r0.xzy * r6.yyy;
    r6.x = ps;
    r6.xyz = r6.xxx * ConstantLighting.xyz;
    r8.x = r6.x * r8.w;
    r6.xw = r8.xy * r8.yw;
    r6.yz = r6.yz * r6.ww;
    r6.xyz = r4.xzy * r7.xyz + r6.xyz;
    r6.xyz = r3.xzy * LowerSkyColor.xyz + r6.xyz;
    r6.xyz = r1.xzy * UpperSkyColor.xyz + r6.xyz;
    r6.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + r6.xyz;
    r6.xyz = r6.xyz + UniformVector_0.xyz;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
