// ps_685689974be3bf48.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 162 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000288 10040B00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
sampler2D Texture2D_2 : register(s1);
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xyw = -UniformVector_0.zxy + 1.0;
    r6.y = ps;
    r6.xy = r6.xy * abs(r7.xy);
    r8.yw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r6.w = dot(r3.zxy, r3.zxy);
    r5.z = dot(r4.zxy, r4.zxy);
    r6.x = dot(r1.zxy, r1.zxy);
    r7.xyz = r5.ywx * r0.xyz;
    r9.xyz = r9.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r0.w = dot(r9.xyz, r9.xyz);
    r6.x = ps;
    ps = rsqrt(abs(r0.w));
    r6.xyz = r6.xxx * r1.xzy;
    r0.w = ps;
    r11.yzw = r9.xyz * r0.www;
    ps = rsqrt(abs(r5.z));
    r1.xyz = r11.yyy * ConstantLighting.xyz;
    r5.z = ps;
    ps = rsqrt(abs(r6.w));
    r8.z = r1.z * r7.z;
    r6.w = ps;
    r9 = r0.xxyz * float4(2e+01, 5.0, 5.0, 5.0);
    r11.x = max(r9.x, 0.0001);
    r3.xyw = r6.www * r3.xyz;
    ps = OpacityOverride.x;
    r4.xyz = r5.zzz * r4.xyz;
    r3.z = saturate(ps);
    ps = AmbientColorAndSkyFactor.z * r5.x;
    r8.x = dot(r4.zxy, r11.yzw);
    r1.w = ps;
    ps = 0.1 - -r6.y;
    r5.z = dot(r11.yzw, r3.wxy);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r4.xyz = r11.zwy * r5.zzz;
    r5.x = saturate(ps);
    r4.xyz = r4.xyz * 2.0 - r3.xyw;
    ps = 1.0 - r5.x;
    r1.xyz = r1.xyw * r0.xyz;
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r0 = r8.xxyw * float4(0.5, -0.5, 0.875, 0.875);
    r3.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r8.xy = r1.xy * r5.yw;
    r3.y = ps;
    ps = r0.y;
    r5.y = saturate(dot(r6.yxz, r4.zxy));
    r5.x = ps;
    ps = 0.5 + r5.x;
    r6.xyz = -r3.xyz + 1.0;
    r5.x = ps;
    ps = 0.5 + r0.x;
    r5.w = float((r6.z >= 0.004));
    r5.z = ps;
    r11.yz = r0.zw * r6.xy + 0.125;
    r6.xz = abs(r5.zx) * abs(r5.zx);
    ps = log2(r5.y);
    r0.xyz = r7.xzy * r6.xxx;
    r11.w = ps;
    r6.xy = r11.xy * r11.wz;
    r5.xyz = r6.yyy * r10.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.x);
    r3.xyz = r7.xzy * r6.zzz;
    r6.x = ps;
    r6.xyz = r6.xxx * ConstantLighting.xzy;
    r6.xyz = r6.xzy * r9.yzw + r8.xyz;
    r6.xyz = r3.xzy * LowerSkyColor.xyz + r6.xyz;
    r6.xyz = r0.xzy * UpperSkyColor.xyz + r6.xyz;
    r6.z = r6.z + r1.z;
    r6.xy = r7.xy * AmbientColorAndSkyFactor.xy + r6.xy;
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
