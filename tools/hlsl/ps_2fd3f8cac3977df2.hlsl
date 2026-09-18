// ps_2fd3f8cac3977df2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 195 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000030C 10040D00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.zw = r0.xy + UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = UniformVector_2.yx - 0.5;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r6.xy + r0.yx;
    r5.y = ps;
    r6.xy = r5.xy * abs(r7.xy);
    r5.y = dot(r6.zw, UniformVector_4.yx) + 0.5;
    r5.x = dot(r6.zw, UniformVector_3.yx) + 0.5;
    r12.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r9.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r13.w = tex2D(Texture2D_2, r5.zw).x;
    r7.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6 = tex2D(Texture2D_1, r0.xy);
    r8.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.x = tex2D(Texture2D_2, r5.xy).x;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = dot(r1.zxy, r1.zxy);
    r5.y = dot(r4.zxy, r4.zxy);
    r5.z = dot(r3.zxy, r3.zxy);
    r13.xyz = -UniformVector_0.yzx + 1.0;
    ps = OpacityOverride.x;
    r0.xyw = r13.xyz * AmbientColorAndSkyFactor.yzx;
    r11.z = saturate(ps);
    r8.xyz = r8.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r7.xyz = r7.yzx + r6.yzx;
    r5.z = ps;
    ps = rsqrt(abs(r5.y));
    r3.xyz = r5.zzz * r3.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r0.z));
    r5.yzw = r5.yyy * r4.xyz;
    r0.z = ps;
    ps = r5.x * r5.x;
    r6.xyz = r0.zzz * r1.zxy;
    r7.w = ps;
    ps = 0.1 - -r6.x;
    r0.z = dot(r8.xyz, r8.xyz);
    r5.x = ps;
    ps = rsqrt(abs(r0.z));
    r4 = r7 * r13;
    r0.z = ps;
    ps = 5.0 * r5.x;
    r8.xyz = r8.xyz * r0.zzz;
    r5.x = saturate(ps);
    ps = r4.w;
    r12.x = dot(r5.wyz, r8.xyz);
    ps = r13.w * ps;
    r5.z = -r5.x + 1.0;
    r9.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r5.x = dot(r8.xyz, r3.zxy);
    r11.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1.xz = r9.xy * 5e+01;
    r11.y = ps;
    ps = r1.x;
    r5.xyz = r8.yzx * r5.xxx;
    r1.xyw = r5.xyz * 2.0 - r3.xyz;
    ps = r6.w * ps;
    r5 = r12.xyxz * float4(-0.5, 0.875, 0.5, 0.875);
    r0.z = ps;
    ps = r5.x;
    r1.z = max(r1.z, 0.0001);
    r5.x = ps;
    ps = 0.5 + r5.x;
    r6.z = saturate(dot(r6.xyz, r1.wxy));
    r3.x = ps;
    ps = 0.5 + r5.z;
    r6.xyw = -r11.xzy + 1.0;
    r3.y = ps;
    r1.xy = r5.yw * r6.xw + 0.125;
    ps = log2(r6.z);
    r6.xw = abs(r3.xy) * abs(r3.xy);
    r1.w = ps;
    ps = r4.x;
    r5.w = float((r6.y >= 0.004));
    ps = r6.w * ps;
    r6.yz = r1.xz * r1.yw;
    r1.x = ps;
    r5.xyz = r6.yyy * r10.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.z);
    r3.xyz = r4.xyz * r6.xxx;
    r8.w = ps;
    ps = r4.y;
    r6.yz = r8.ww * ConstantLighting.yz;
    ps = r6.w * ps;
    r6.xy = r6.yz * r9.zw;
    r1.y = ps;
    ps = r4.z;
    r8 = r8.xxxw * ConstantLighting.yzxx;
    ps = r6.w * ps;
    r6.z = r8.w * r9.y;
    r1.z = ps;
    r6.xyz = r8.xyz * r4.xyz + r6.xyz;
    r6.xyz = r3.xyz * LowerSkyColor.yzx + r6.xyz;
    r6.xyz = r1.xyz * UpperSkyColor.yzx + r6.xyz;
    r0.xyw = r0.xyw * r7.xyz + r6.xyz;
    r6.yzw = r0.xyz + UniformVector_0.yzx;
    r6.x = r6.w + r0.w;
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
