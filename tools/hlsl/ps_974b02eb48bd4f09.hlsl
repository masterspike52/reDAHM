// ps_974b02eb48bd4f09.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 159 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000027C 10040B00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c11); // float4
float4 ConstantLighting : register(c12); // float3
float4 LowerSkyColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UpperSkyColor : register(c9); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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

    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.z = max(UniformScalar_0.x, 0.0001);
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r8.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r10.xyw = tex2D(Texture2D_2, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.yzw = tex2D(Texture2D_3, r0.xy).zxy;
    ps = -UniformVector_0.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r6.w = dot(r1.zxy, r1.zxy);
    r7.x = ps;
    ps = -UniformVector_0.y;
    r5.x = dot(r4.zxy, r4.zxy);
    ps = 1.0 + ps;
    r0.w = dot(r3.zxy, r3.zxy);
    r7.y = ps;
    r0.xyz = r11.xyz * UniformVector_1.xyz + UniformVector_0.xyz;
    r6.xyz = r6.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r11.xyz = r10.xyw * UniformVector_2.xyz;
    r0.w = ps;
    ps = rsqrt(abs(r5.x));
    r10.xyw = r0.www * r3.xyz;
    r5.x = ps;
    ps = -UniformVector_0.z;
    r4.xyz = r5.xxx * r4.xyz;
    ps = 1.0 + ps;
    r5.x = dot(r6.xyz, r6.xyz);
    r7.z = ps;
    ps = rsqrt(abs(r6.w));
    r3.xyz = r11.xyz * r7.xyz;
    r6.w = ps;
    r7.xyz = r3.xyz * AmbientColorAndSkyFactor.xyz + r0.xyz;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r6.www * r1.xzy;
    r5.x = ps;
    ps = OpacityOverride.x;
    r6.xyw = r6.yzx * r5.xxx;
    r1.z = saturate(ps);
    ps = UniformVector_3.x * r5.z;
    r8.x = dot(r4.zxy, r6.wxy);
    r4.x = ps;
    ps = 0.1 - -r0.y;
    r5.z = dot(r6.wxy, r10.wxy);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r1.xyw = r6.xyw * r5.zzz;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r8 = r8.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r5.z = ps;
    r1.xyw = r1.xyw * 2.0 - r10.xyw;
    ps = ModShadowGroupColor.x * r5.z;
    r6.z = saturate(dot(r0.yxz, r1.wxy));
    r1.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r0.xy = r8.xy + 0.5;
    r1.y = ps;
    ps = UniformVector_3.y * r5.w;
    r1.xyw = -r1.xyz + 1.0;
    r4.y = ps;
    r10.xy = r8.zw * r1.xy + 0.125;
    ps = UniformVector_3.z * r5.y;
    r0.xy = abs(r0.xy) * abs(r0.xy);
    r4.z = ps;
    ps = ConstantLighting.x * r6.w;
    r8.xyz = r3.xzy * r0.xxx;
    r0.x = ps;
    ps = log2(r6.z);
    r5.xyz = r3.xzy * r0.yyy;
    r10.w = ps;
    r7.xyz = r5.xyz * UpperSkyColor.xzy + r7.xzy;
    ps = ConstantLighting.y * r6.w;
    r0.zw = r10.xz * r10.yw;
    r0.y = ps;
    r5.xyz = r0.zzz * r9.xyz + ModShadowColor.xyz;
    r1.xyz = r8.xzy * LowerSkyColor.xyz + r7.xzy;
    ps = pow(2.0, r0.w);
    r5.w = float((r1.w >= 0.004));
    r6.z = ps;
    ps = ConstantLighting.z * r6.w;
    r7.xyz = r6.zzz * ConstantLighting.xzy;
    r0.z = ps;
    r6.xyz = r7.xyz * r4.xzy + r1.xzy;
    r6.xyz = r0.xyz * r3.xyz + r6.xzy;
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
