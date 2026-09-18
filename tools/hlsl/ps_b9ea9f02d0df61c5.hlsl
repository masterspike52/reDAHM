// ps_b9ea9f02d0df61c5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10040900 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
sampler2D ModShadowAccumTexture : register(s1);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r0.xyw = tex2D(Texture2D_0, r0.xy).yzx;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r6.x = dot(r1.zxy, r1.zxy);
    r8.z = saturate(ps);
    ps = 0.875 * r5.x;
    r8.xyw = r0.wxy * AmbientColorAndSkyFactor.xyz;
    r5.z = ps;
    ps = rsqrt(abs(r6.x));
    r6.yzw = r0.www + UniformVector_0.xyz;
    r6.x = ps;
    r6.yzw = r8.xyw * r9.xyz + r6.yzw;
    ps = rsqrt(abs(r5.w));
    r8.xyw = r6.xxx * r1.xyz;
    r5.w = ps;
    ps = 0.875 * r5.y;
    r1.xyz = r5.www * r3.zxy;
    r5.w = ps;
    r1.x = r1.x * 2.0 - r1.x;
    ps = -r1.y;
    r5.x = r8.w + 0.1;
    r1.y = ps;
    ps = -r1.z;
    r5.x = saturate(r5.x * 5.0);
    r1.z = ps;
    ps = 1.0 - r5.x;
    r0.z = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r0.z));
    r5.y = saturate(dot(r8.xyw, r1.yzx));
    r5.x = ps;
    ps = log2(r5.y);
    r8.xy = r6.xx * ModShadowGroupColor.xy;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r0.xyz = r9.xyz * r0.wxy;
    r3.x = ps;
    ps = (-0.5) * r5.x;
    r8.xyz = -r8.xyz + 1.0;
    r3.y = ps;
    ps = 0.5 * r5.x;
    r1.xy = r5.zw * r8.xy;
    r3.z = ps;
    r1.zw = r3.yz * r4.zz;
    ps = pow(2.0, r3.x);
    r6.x = float((r8.z >= 0.004));
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r3 = r1 + float4(0.125, 0.125, 0.5, 0.5);
    r1.x = ps;
    ps = r3.x * r3.y;
    r1.yz = abs(r3.zw) * abs(r3.zw);
    r5.x = ps;
    r5.xyz = r5.xxx * r7.xyz + ModShadowColor.xyz;
    ps = ConstantLighting.z * r5.w;
    r3.xyz = r0.xzy * r1.yyy;
    r1.y = ps;
    ps = ConstantLighting.y * r5.w;
    r4.xyz = r0.xzy * r1.zzz;
    r1.z = ps;
    r6.yzw = r4.xzy * UpperSkyColor.xyz + r6.yzw;
    r6.yzw = r3.xyz * LowerSkyColor.xzy + r6.ywz;
    r6.yzw = r1.xzy * r0.www + r6.ywz;
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
