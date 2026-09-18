// ps_181d001d47fe6792.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 135 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000021C 10040A00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r0.xy * 0.2;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r5.z = ps;
    r5.zw = r5.zw * abs(r7.xy);
    r9.yw = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r6.y = tex2D(Texture2D_1, r5.xy).w;
    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = dot(r4.zxy, r4.zxy);
    r6.w = dot(r3.zxy, r3.zxy);
    r6.x = dot(r1.zxy, r1.zxy);
    ps = OpacityOverride.x;
    r7.xyz = r10.xyz * AmbientColorAndSkyFactor.xyz;
    r9.z = saturate(ps);
    ps = rsqrt(abs(r6.x));
    r0.xyz = -r5.xyz + r6.yyy;
    r6.x = ps;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r6.xxx * r1.xzy;
    r6.w = ps;
    ps = (-0.2) + r5.x;
    r1.yzw = r6.www * r3.zxy;
    r1.x = ps;
    r0.xyz = r0.xyz * r5.zzz + r5.xyz;
    r7.xyz = r7.xyz * r0.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r5.w));
    r1.zw = -r1.zw;
    r9.x = ps;
    r1.y = r1.y * 2.0 - r1.y;
    ps = 0.1 - -r6.y;
    r0.xyz = r0.xyz * r10.xyz;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r3 = r9.xxyw * float4(-0.5, 0.5, 0.875, 0.875);
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r5.w = saturate(dot(r6.xzy, r1.zwy));
    r6.x = ps;
    ps = log2(r5.w);
    r9.xy = r6.xx * ModShadowGroupColor.xy;
    r5.w = ps;
    ps = 15.0 * r5.w;
    r3.xy = r3.xy * r4.zz;
    r5.w = ps;
    ps = pow(2.0, r5.w);
    r6.xyz = -r9.xyz + 1.0;
    r5.w = ps;
    ps = (-0.2) + r5.y;
    r3.zw = r3.zw * r6.xy;
    r1.y = ps;
    ps = (-0.2) + r5.z;
    r6.x = float((r6.z >= 0.004));
    r1.z = ps;
    ps = ConstantLighting.x * r5.w;
    r4 = r3 + float4(0.5, 0.5, 0.125, 0.125);
    r3.x = ps;
    ps = r4.z * r4.w;
    r6.yz = abs(r4.xy) * abs(r4.xy);
    r5.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.z * r5.w;
    r4.xyz = r0.xzy * r6.yyy;
    r3.y = ps;
    ps = ConstantLighting.y * r5.w;
    r6.yzw = r0.xzy * r6.zzz;
    r3.z = ps;
    r6.yzw = r6.ywz * UpperSkyColor.xyz + r7.xyz;
    r6.yzw = r4.xyz * LowerSkyColor.xzy + r6.ywz;
    r6.yzw = r3.xzy * r1.xyz + r6.ywz;
    r6.yzw = r0.xzy * ConstantLighting.xzy + r6.ywz;
    ps = -r2.w;
    r5.xyz = r6.ywz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.x + r2.w;
    r5.xyz = r0.xyz * r6.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
