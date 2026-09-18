// ps_2ca3ec337d773d2a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 162 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000288 10040C00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c11); // float4
float4 LowerSkyColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r8.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r9.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r7.yzw = tex2D(Texture2D_1, r0.xy).xyz;
    r6.xyw = tex2D(Texture2D_3, r0.xy).yxz;
    ps = -UniformVector_0.x;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r7.x = dot(r2.zxy, r2.zxy);
    r0.x = ps;
    ps = -UniformVector_0.y;
    r6.z = dot(r5.zxy, r5.zxy);
    ps = 1.0 + ps;
    r0.z = dot(r4.zxy, r4.zxy);
    r0.y = ps;
    r7.yzw = r7.yzw * UniformVector_1.xyz + UniformVector_0.xyz;
    r11.xyz = r11.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.z));
    r12.xyz = r9.xyz * UniformVector_2.xyz;
    r0.z = ps;
    ps = rsqrt(abs(r6.z));
    r9.xyz = r0.zzz * r4.xyz;
    r6.z = ps;
    ps = -UniformVector_0.z;
    r4.xyz = r6.zzz * r5.xyz;
    ps = 1.0 + ps;
    r6.z = dot(r11.xyz, r11.xyz);
    r0.z = ps;
    ps = rsqrt(abs(r7.x));
    r0.xyz = r12.xyz * r0.xyz;
    r7.x = ps;
    r5.yzw = r0.xyz * AmbientColorAndSkyFactor.xyz + r7.yzw;
    ps = rsqrt(abs(r6.z));
    r7.yzw = r7.xxx * r2.xyz;
    r6.z = ps;
    r11.xyz = r11.xyz * r6.zzz;
    ps = OpacityOverride.x;
    r2.xyz = r11.xxx * r1.xyz;
    r4.w = saturate(ps);
    ps = UniformScalar_0.x;
    r8.x = dot(r4.zxy, r11.xyz);
    r4.z = ps;
    ps = 0.1 - -r7.w;
    r7.x = dot(r11.xyz, r9.zxy);
    r6.z = ps;
    ps = 5.0 * r6.z;
    r11.xyz = r11.yzx * r7.xxx;
    r7.x = saturate(ps);
    ps = 1.0 - r7.x;
    r8 = r8.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.z = ps;
    r9.xyz = r11.xyz * 2.0 - r9.xyz;
    ps = ModShadowGroupColor.x * r6.z;
    r7.w = saturate(dot(r7.wyz, r9.zxy));
    r4.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r8.xy = r8.xy + 0.5;
    r4.y = ps;
    ps = 0.0001;
    r7.xyz = -r4.wxy + 1.0;
    r4.w = ps;
    r4.xy = r8.zw * r7.yz + 0.125;
    ps = max(r4.z, r4.w);
    r7.yz = abs(r8.xy) * abs(r8.xy);
    r4.z = ps;
    ps = UniformVector_3.x * r6.y;
    r9.xyz = r0.xzy * r7.yyy;
    r5.x = ps;
    ps = log2(r7.w);
    r8.xyz = r0.xzy * r7.zzz;
    r4.w = ps;
    r8.xyz = r8.xyz * UpperSkyColor.xzy + r5.ywz;
    ps = UniformVector_3.y * r6.x;
    r4.xw = r4.xz * r4.yw;
    r5.y = ps;
    r7.yzw = r4.xxx * r10.xyz + ModShadowColor.xyz;
    r4.xyz = r9.xzy * LowerSkyColor.xyz + r8.xzy;
    ps = pow(2.0, r4.w);
    r7.x = float((r7.x >= 0.004));
    r6.z = ps;
    ps = UniformVector_3.z * r6.w;
    r1.xyz = r6.zzz * r1.xzy;
    r5.z = ps;
    r6.xyz = r1.xyz * r5.xzy + r4.xzy;
    r6.xyz = r2.xyz * r0.xyz + r6.xzy;
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
