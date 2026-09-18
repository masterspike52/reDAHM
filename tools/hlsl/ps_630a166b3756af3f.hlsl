// ps_630a166b3756af3f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000330 10040F00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
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
float4 LightMapScale : register(c12); // float3
float4 LowerSkyColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UpperSkyColor : register(c9); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D LightMapTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
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
    float4 r1 = In.texcoord1;
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
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7.zw = r1.xy + UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.yz = UniformVector_2.yx - 0.5;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r6.yz + r1.yx;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r7.y = dot(r6.zw, UniformVector_4.yx) + 0.5;
    r7.x = dot(r6.zw, UniformVector_3.yx) + 0.5;
    r8.xzw = tex2D(Texture2D_4, r1.xy).xyz;
    r15.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r11.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r9 = tex2D(Texture2D_1, r1.xy);
    r6.xzw = tex2D(LightMapTexture, r0.xy).xyz;
    r0.y = tex2D(Texture2D_2, r7.zw).x;
    r7.z = tex2D(Texture2D_2, r7.xy).x;
    r0.xzw = tex2D(Texture2D_0, r1.xy).xyz;
    r6.y = dot(r5.zxy, r5.zxy);
    r7.x = dot(r2.zxy, r2.zxy);
    r7.y = dot(r4.zxy, r4.zxy);
    r0.xzw = r0.wxz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.y));
    r14.w = r7.z * r7.z;
    r7.y = ps;
    r4.xyz = r7.yyy * r4.xyz;
    ps = rsqrt(abs(r7.x));
    r7.w = dot(r0.xzw, r0.xzw);
    r7.x = ps;
    ps = rsqrt(abs(r7.w));
    r7.xyz = r7.xxx * r2.zxy;
    r7.w = ps;
    r14.xyz = r0.xzw * r7.www;
    r0.x = dot(r14.xyz, r4.zxy);
    r1 = r14.yzxw * r0.xxxy;
    r12.xyz = r1.xyz * 2.0 - r4.xyz;
    ps = rsqrt(abs(r6.y));
    r8.y = r1.w * r0.y;
    r6.y = ps;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r0.xyz = -UniformVector_0.yzx + 1.0;
    r4.xyz = r6.xzw * LightMapScale.xyz;
    r6.xzw = r0.xyz * AmbientColorAndSkyFactor.yzx;
    ps = OpacityOverride.x;
    r1.xyz = r11.yzx + r9.yzx;
    r13.z = saturate(ps);
    ps = 0.1 - -r7.x;
    r11.xyz = r6.xzw * r1.xyz;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r1.xyz = r1.xyz * r0.xyz;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r0.xyz = r6.yyy * r5.xyz;
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r15.x = dot(r0.zxy, r14.xyz);
    r13.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r0 = r15.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r13.y = ps;
    ps = r0.y;
    r2.xyz = r4.yzx * r14.xxx;
    r6.x = ps;
    ps = 0.5 + r6.x;
    r5.xyz = -r13.xyz + 1.0;
    r6.x = ps;
    ps = 0.5 + r0.x;
    r6.w = float((r5.z >= 0.004));
    r6.y = ps;
    r0.xy = r0.zw * r5.xy + 0.125;
    r6.yz = abs(r6.xy) * abs(r6.xy);
    ps = r8.y;
    r0.w = saturate(dot(r7.xyz, r12.zxy));
    r6.x = ps;
    ps = 5e+01 * r6.x;
    r7.xyz = r1.xyz * r6.yyy;
    r7.w = ps;
    ps = 5e+01 * r8.x;
    r6.xyz = r1.xyz * r6.zzz;
    r0.z = ps;
    ps = log2(r0.w);
    r0.z = max(r0.z, 0.0001);
    r0.w = ps;
    r6.xyz = r6.xyz * UpperSkyColor.yzx + r11.xyz;
    r7.xyz = r7.xyz * LowerSkyColor.yzx + r6.xyz;
    r0.xz = r0.zx * r0.wy;
    r6.xyz = r0.zzz * r10.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.x);
    r0.z = r7.w * r9.w;
    r7.w = ps;
    r0.xyw = r4.yzx * r7.www;
    r7.xyz = r0.xyw * r8.zwx + r7.xyz;
    r0.xyw = r2.xyz * r1.xyz + r7.xyz;
    r7.yzw = r0.xyz + UniformVector_0.yzx;
    r7.x = r7.w + r0.w;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
