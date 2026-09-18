// ps_063ae02c86408404.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 201 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000324 10040E00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c12); // float4
float4 ConstantLighting : register(c13); // float3
float4 LowerSkyColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 OpacityOverride : register(c9); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_3 : register(c7); // float4
float4 UniformVector_4 : register(c8); // float4
float4 UpperSkyColor : register(c10); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    r6.xy = UniformVector_2.yx - 0.5;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r6.xy + r0.yx;
    r5.y = ps;
    r6.xy = r5.xy * abs(r7.xy);
    r5.y = dot(r6.zw, UniformVector_4.yx) + 0.5;
    r5.x = dot(r6.zw, UniformVector_3.yx) + 0.5;
    r12.xy = tex2D(Texture2D_2, r0.xy).xy;
    r14.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r13.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    ps = OpacityOverride.x - r2.w;
    r5.zw = r0.xy + UniformVector_1.xy;
    r7.w = ps;
    r0.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xw = tex2D(Texture2D_1, r5.zw).yx;
    r5.zw = tex2D(Texture2D_1, r5.xy).xy;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = dot(r1.zxy, r1.zxy);
    r6.z = dot(r3.zxy, r3.zxy);
    r5.x = dot(r4.zxy, r4.zxy);
    ps = OpacityOverride.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r13.z = saturate(ps);
    ps = r6.x;
    r8.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    ps = r5.w * ps;
    r9.xyz = r7.xyz * r0.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r10 = r10.xzxy * float4(5e+01, 5.0, 5.0, 5.0);
    r5.x = ps;
    ps = rsqrt(abs(r6.z));
    r0.w = dot(r13.wxy, r13.wxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r0.xyz = r6.zzz * r3.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r0.w));
    r6.xyz = r6.yyy * r1.zxy;
    r0.w = ps;
    ps = 0.1 - -r6.x;
    r3.xyz = r5.xxx * r4.xyz;
    r5.x = ps;
    ps = 5.0 * r5.y;
    r1.xzw = r0.www * r13.wxy;
    r1.y = ps;
    ps = 0.5 * r5.z;
    r4.xyz = r1.xzw * TwoSidedSign.xxx;
    r1.z = ps;
    ps = 5.0 * r5.x;
    r14.x = dot(r3.zxy, r4.xyz);
    r5.y = saturate(ps);
    ps = r1.z;
    r5.x = dot(r4.xyz, r0.zxy);
    ps = r6.w * ps;
    r5.z = -r5.y + 1.0;
    r1.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r5.xyw = r4.yzx * r5.xxx;
    r13.x = ps;
    r3.xyw = r5.xyw * 2.0 - r0.xyz;
    ps = ModShadowGroupColor.y * r5.z;
    r0 = r14.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r13.y = ps;
    ps = r0.y;
    r3.z = max(r10.x, 0.0001);
    r5.x = ps;
    ps = 0.5 + r5.x;
    r5.z = saturate(dot(r6.xyz, r3.wxy));
    r6.x = ps;
    ps = 0.5 + r0.x;
    r5.xyw = -r13.xyz + 1.0;
    r6.y = ps;
    r3.xy = r0.zw * r5.xy + 0.125;
    ps = log2(r5.z);
    r6.xw = abs(r6.xy) * abs(r6.xy);
    r3.w = ps;
    ps = r9.x;
    r1.xy = r1.xy * r12.xy;
    ps = r6.w * ps;
    r6.yz = r3.xz * r3.yw;
    r0.x = ps;
    r5.xyz = r6.yyy * r11.xzy + ModShadowColor.xzy;
    ps = pow(2.0, r6.z);
    r3.xyz = r9.xyz * r6.xxx;
    r4.w = ps;
    ps = r9.y;
    r6.yz = r4.ww * ConstantLighting.xy;
    ps = r6.w * ps;
    r6.yz = r6.yz * r10.zw;
    r0.y = ps;
    ps = r9.z;
    r4 = r4.xxxw * ConstantLighting.xyzz;
    ps = r6.w * ps;
    r6.x = r4.w * r10.y;
    r0.z = ps;
    r6.xyz = r4.zxy * r9.zxy + r6.xyz;
    r6.xyz = r3.zxy * LowerSkyColor.zxy + r6.xyz;
    r6.xyz = r0.yzx * UpperSkyColor.yzx + r6.zxy;
    r0.x = r8.y * r7.y + r6.x;
    r1.zw = r8.zx * r7.zx + r6.yz;
    r6.yzw = r1.xyz + UniformVector_0.xyz;
    r6.x = r6.y + r1.w;
    r0.x = r6.z + r0.x;
    ps = r0.x;
    r5.w = float((r5.w >= 0.004));
    ps = r5.z * ps;
    r5.xy = r6.xw * r5.xy;
    r5.z = ps;
    r7.xyz = r5.xyz - r5.xyz;
    oC0.w = r7.w * r5.w + r2.w;
    r5.xyz = r7.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
