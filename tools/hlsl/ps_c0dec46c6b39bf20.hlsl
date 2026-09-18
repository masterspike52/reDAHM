// ps_c0dec46c6b39bf20.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000264 10040D00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D Texture2D_2 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord3 : TEXCOORD3; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.y = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r11.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r8.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xyw = tex2D(Texture2D_1, r0.xy).yxz;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = dot(r2.zxy, r2.zxy);
    r6.z = dot(r5.zxy, r5.zxy);
    r10.xyz = r8.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.y));
    r8.xyz = r9.xyz * r6.yxw;
    r7.y = ps;
    ps = rsqrt(abs(r6.z));
    r12.xyz = r7.yyy * r4.xyz;
    r6.z = ps;
    r5.xyz = r6.zzz * r5.xyz;
    ps = rsqrt(abs(r7.x));
    r6.z = dot(r10.zxy, r10.zxy);
    r7.x = ps;
    ps = rsqrt(abs(r6.z));
    r7.yzw = r7.xxx * r2.xzy;
    r6.z = ps;
    r4.xyz = r10.xyz * r6.zzz;
    ps = OpacityOverride.x;
    r10.xyz = r4.zzz * r1.xyz;
    r2.w = saturate(ps);
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r13.x = dot(r5.zxy, r4.zxy);
    r2.x = ps;
    ps = 0.1 - -r7.z;
    r7.x = dot(r4.zxy, r12.zxy);
    r6.z = ps;
    ps = 5.0 * r6.z;
    r5.xyz = r4.xzy * r7.xxx;
    r7.x = saturate(ps);
    ps = 1.0 - r7.x;
    r4 = r13.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r6.z = ps;
    r5.xyz = r5.xyz * 2.0 - r12.xzy;
    ps = ModShadowGroupColor.x * r6.z;
    r7.y = saturate(dot(r7.zyw, r5.yxz));
    r2.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r7.xz = r4.xy + 0.5;
    r2.z = ps;
    ps = abs(r7.x) * abs(r7.x);
    r2.yzw = -r2.yzw + 1.0;
    r6.z = ps;
    ps = abs(r7.z) * abs(r7.z);
    r7.x = float((r2.w >= 0.004));
    r7.z = ps;
    r2.yz = r4.zw * r2.yz + 0.125;
    ps = r2.y * r2.z;
    r4.xyz = r8.xzy * r6.zzz;
    r6.z = ps;
    ps = log2(r7.y);
    r5.xyz = r8.xzy * r7.zzz;
    r11.w = ps;
    r7.yzw = r6.zzz * r0.xyz + ModShadowColor.xyz;
    ps = AmbientColorAndSkyFactor.y * r6.x;
    r0 = r11 * float4(0.5, 3.0, 4.0, 1e+01);
    r2.y = ps;
    ps = pow(2.0, r0.w);
    r0.xyz = r0.xyz * r6.yxw;
    r6.z = ps;
    ps = AmbientColorAndSkyFactor.z * r6.w;
    r1.xyz = r6.zzz * r1.xzy;
    r2.z = ps;
    r0.xyz = r1.xzy * r0.xyz + UniformVector_0.xyz;
    r0.xyz = r10.xyz * r8.xyz + r0.xyz;
    r0.xyz = r5.xyz * LowerSkyColor.xzy + r0.xzy;
    r0.xyz = r4.xzy * UpperSkyColor.xyz + r0.xzy;
    r0.xyz = r2.xzy * r9.xzy + r0.xzy;
    r6.xyz = r6.yxw * 2.0 + r0.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.x + r3.w;
    r6.xyz = r0.xyz * r7.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
