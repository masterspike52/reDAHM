// ps_90d0c6ff72fa03b0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 195 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000030C 10040E00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

    r5.xy = r0.xy + UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = UniformVector_2.yx - 0.5;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r6.xy + r0.yx;
    r5.w = ps;
    r5.zw = r5.zw * abs(r7.xy);
    r2.y = dot(r6.xy, UniformVector_4.yx) + 0.5;
    r2.x = dot(r6.xy, UniformVector_3.yx) + 0.5;
    r11.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r8.xyw = tex2D(Texture2D_3, r0.xy).xyz;
    r6 = tex2D(Texture2D_1, r0.xy).xywz;
    r5.xyz = tex2D(Texture2D_2, r5.xy).xzy;
    r13.xyz = tex2D(Texture2D_2, r2.xy).xyz;
    r2.xyz = tex2D(Texture2D_4, r0.xy).yxz;
    r9.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = dot(r1.zxy, r1.zxy);
    r0.w = dot(r4.zxy, r4.zxy);
    r7.w = dot(r3.zxy, r3.zxy);
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = OpacityOverride.x;
    r12.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r9.z = saturate(ps);
    r10.xyz = r9.wxy * 2.0 - 1.0;
    ps = 5e+01 * r2.y;
    r14.xyz = r5.xyz * r13.xzy;
    r8.z = ps;
    ps = r14.z * r14.z;
    r8.xyw = r8.xyw + r6.xyw;
    r5.z = ps;
    ps = rsqrt(abs(r7.w));
    r8.z = max(r8.z, 0.0001);
    r7.w = ps;
    ps = rsqrt(abs(r0.w));
    r9.xyw = r7.www * r3.xyz;
    r0.w = ps;
    ps = rsqrt(abs(r5.w));
    r3.xyz = r0.www * r4.xyz;
    r5.w = ps;
    ps = r8.x;
    r4.xyz = r5.www * r1.xyz;
    ps = r0.x * ps;
    r0.w = dot(r10.xyz, r10.xyz);
    r0.x = ps;
    ps = r8.y;
    r1.xy = r14.xy * r13.xz;
    ps = r0.y * ps;
    r5.yw = r1.xy * r5.xy;
    r0.y = ps;
    ps = rsqrt(abs(r0.w));
    r5.x = r4.z + 0.1;
    r0.w = ps;
    ps = 5.0 * r5.x;
    r6.xyw = r10.yzx * r0.www;
    r5.x = saturate(ps);
    ps = 5e+01 * r5.y;
    r11.x = dot(r3.zxy, r6.wxy);
    r1.x = ps;
    ps = 2e+02 * r5.z;
    r0.w = dot(r6.wxy, r9.wxy);
    r1.y = ps;
    ps = 1e+03 * r5.w;
    r10.xyz = r6.xyw * r0.www;
    r1.z = ps;
    r5.yzw = r1.xyz * r6.zzz + UniformVector_0.xyz;
    r1.yzw = r12.xyz * r8.xyw + r5.yzw;
    ps = 1.0 - r5.x;
    r3 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r5.z = ps;
    r5.xyw = r10.xyz * 2.0 - r9.xyw;
    ps = ModShadowGroupColor.x * r5.z;
    r6.z = saturate(dot(r4.zxy, r5.wxy));
    r9.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r3.xy = r3.xy + 0.5;
    r9.y = ps;
    ps = r8.w;
    r5.xyw = -r9.xyz + 1.0;
    r8.xy = r3.zw * r5.xy + 0.125;
    ps = r0.z * ps;
    r5.xy = abs(r3.xy) * abs(r3.xy);
    r0.z = ps;
    ps = ConstantLighting.x * r6.w;
    r4.xyz = r0.xzy * r5.xxx;
    r1.x = ps;
    ps = log2(r6.z);
    r3.xyz = r0.xzy * r5.yyy;
    r8.w = ps;
    r3.xyz = r3.xyz * UpperSkyColor.xzy + r1.ywz;
    ps = ConstantLighting.y * r6.w;
    r1.zw = r8.xz * r8.yw;
    r1.y = ps;
    r5.xyz = r1.zzz * r7.xyz + ModShadowColor.xyz;
    r3.xyz = r4.xzy * LowerSkyColor.xyz + r3.xzy;
    ps = pow(2.0, r1.w);
    r5.w = float((r5.w >= 0.004));
    r6.z = ps;
    ps = ConstantLighting.z * r6.w;
    r4.xyz = r6.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r6.xyz = r4.xyz * r2.yzx + r3.xzy;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
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
