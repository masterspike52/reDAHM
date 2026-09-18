// ps_c895a4f37cb2164e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 159 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000027C 10040E00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c9); // float4
float4 ConstantLighting : register(c10); // float3
float4 LowerSkyColor : register(c8); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UpperSkyColor : register(c7); // float3
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
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.zw = r0.xy + UniformVector_2.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r0.xy + UniformVector_1.xy;
    r6.y = ps;
    r6.xy = r6.xy * abs(r7.xy);
    r10.xyz = tex2D(Texture2D_2, r5.xy).xyz;
    r11.xyz = tex2D(Texture2D_3, r5.zw).xyz;
    r14.yz = tex2D(Texture2D_1, r5.xy).xy;
    r5.xzw = tex2D(Texture2D_0, r5.xy).xyz;
    r0.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = dot(r1.zxy, r1.zxy);
    ps = OpacityOverride.x;
    r6.z = dot(r3.zxy, r3.zxy);
    r13.z = saturate(ps);
    ps = ConstantLighting.z;
    r6.w = dot(r4.zxy, r4.zxy);
    ps = 0.21952 * ps;
    r12.xy = r0.xy * 0.875;
    r5.y = ps;
    ps = rsqrt(abs(r6.w));
    r6.x = dot(r5.wxz, r5.wxz);
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r4.xyz = r6.www * r4.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r3.xyz = r6.zzz * r3.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r6.yyy * r1.xzy;
    r6.x = ps;
    ps = 0.1 - -r0.y;
    r6.xyw = r6.xxx * r5.xzw;
    r5.x = ps;
    ps = ConstantLighting.x * r6.w;
    r5.w = dot(r6.wxy, r3.zxy);
    r8.x = ps;
    ps = ConstantLighting.y * r6.w;
    r5.x = saturate(r5.x * 5.0);
    r8.y = ps;
    ps = 1.0 - r5.x;
    r14.x = dot(r4.zxy, r6.wxy);
    r5.z = ps;
    r1.xy = r14.yz * float2(0.2, 1.2) + UniformVector_0.xy;
    ps = ModShadowGroupColor.x * r5.z;
    r4.xyz = r6.xyw * r5.www;
    r13.x = ps;
    r3.xyz = r4.xyz * 2.0 - r3.xyz;
    r1.zw = r14.xx * float2(-0.5, 0.5) + 0.5;
    ps = ModShadowGroupColor.y * r5.z;
    r6.z = saturate(dot(r0.yxz, r3.zxy));
    r13.y = ps;
    ps = ConstantLighting.z * r6.w;
    r5.xzw = -r13.xyz + 1.0;
    r8.z = ps;
    ps = log2(r6.z);
    r6.x = float((r5.w >= 0.004));
    r11.w = ps;
    r5.zw = r12.xy * r5.xz + 0.125;
    ps = abs(r1.z) * abs(r1.z);
    r0 = r11 * float4(1.5, 1.5, 1.5, 15.0);
    r6.y = ps;
    ps = pow(2.0, r0.w);
    r0.xyz = r0.xyz * r10.xyz;
    r5.x = ps;
    ps = 0.21952 * r5.x;
    r0.xyz = r0.xyz * r7.xyz;
    r6.z = ps;
    ps = abs(r1.w) * abs(r1.w);
    r7.xy = r6.zz * ConstantLighting.xy;
    r6.z = ps;
    ps = r5.z * r5.w;
    r3.xyz = r0.xyz * r6.zzz;
    r7.w = ps;
    ps = r5.y * r5.x;
    r4.xyz = r0.xyz * r6.yyy;
    r7.z = ps;
    r6.yzw = r7.www * r9.xyz + ModShadowColor.xyz;
    r5.xyz = r8.xyz * r0.xyz + r7.xyz;
    r5.xyz = r4.xyz * LowerSkyColor.xyz + r5.xyz;
    r5.xyz = r3.xyz * UpperSkyColor.xyz + r5.xyz;
    r5.xyz = r0.zxy * AmbientColorAndSkyFactor.zxy + r5.zxy;
    ps = UniformVector_0.z + r5.x;
    r0.xy = r1.xy + r5.yz;
    r0.z = ps;
    ps = -r2.w;
    r5.xyz = r0.xyz * r6.yzw;
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
