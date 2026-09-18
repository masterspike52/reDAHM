// ps_415de1718c78e0dd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 189 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002F4 10040F00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c13); // float4
float4 ConstantLighting : register(c14); // float3
float4 LowerSkyColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 OpacityOverride : register(c10); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_3 : register(c7); // float4
float4 UniformVector_4 : register(c8); // float4
float4 UniformVector_5 : register(c9); // float4
float4 UpperSkyColor : register(c11); // float3
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
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.xy + UniformVector_2.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = UniformVector_3.yx - 0.5;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xz = r6.xy + r0.yx;
    r5.w = ps;
    r5.zw = r5.zw * abs(r7.xy);
    r6.y = dot(r6.xz, UniformVector_5.yx) + 0.5;
    r6.x = dot(r6.xz, UniformVector_4.yx) + 0.5;
    r8.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r11.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r5.xyz = tex2D(Texture2D_2, r5.xy).xzy;
    r12.xyz = tex2D(Texture2D_2, r6.xy).xyz;
    r10.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_1, r0.xy).zxy;
    r0.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r1.zxy, r1.zxy);
    r0.w = dot(r4.zxy, r4.zxy);
    r7.w = dot(r3.zxy, r3.zxy);
    r13.xyz = -UniformVector_0.xyz + 1.0;
    ps = OpacityOverride.x;
    r14.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r10.z = saturate(ps);
    ps = UniformVector_0.x + r6.y;
    r7.xyz = r13.xyz * r0.xyz;
    r15.x = ps;
    ps = UniformVector_0.y + r6.z;
    r5.w = dot(r10.wxy, r10.wxy);
    r15.y = ps;
    ps = UniformVector_0.z + r6.x;
    r0.xyz = r5.zxy * r12.yxz;
    r15.z = ps;
    ps = rsqrt(abs(r7.w));
    r11.xw = r0.yz * r12.xz;
    r7.w = ps;
    ps = rsqrt(abs(r0.w));
    r12.xyz = r7.www * r3.xyz;
    r0.w = ps;
    ps = rsqrt(abs(r6.w));
    r3.xyz = r0.www * r4.xyz;
    r6.w = ps;
    ps = r0.x * r0.x;
    r0.yzw = r6.www * r1.xzy;
    r5.z = ps;
    ps = rsqrt(abs(r5.w));
    r5.xy = r11.wx * r5.yx;
    r5.w = ps;
    ps = 0.1 - -r0.z;
    r1.xyz = r5.www * r10.wxy;
    r0.x = ps;
    ps = 5.0 * r0.x;
    r1.xyz = r1.xyz * TwoSidedSign.xxx;
    r6.w = saturate(ps);
    ps = UniformVector_1.x * r5.y;
    r11.x = dot(r3.zxy, r1.xyz);
    r3.x = ps;
    ps = UniformVector_1.y * r5.z;
    r5.w = dot(r1.xyz, r12.zxy);
    r3.y = ps;
    ps = UniformVector_1.z * r5.x;
    r5.z = -r6.w + 1.0;
    r3.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r5.xyw = r1.yzx * r5.www;
    r10.x = ps;
    r6.xyz = r3.xyz * r6.yzx + r15.xyz;
    r3.xyz = r14.xyz * r13.xyz + r6.xyz;
    r4.xyz = r5.xyw * 2.0 - r12.xyz;
    ps = ModShadowGroupColor.y * r5.z;
    r6 = r11.xxyz * float4(0.5, -0.5, 0.875, 0.875);
    r10.y = ps;
    ps = r6.y;
    r1.xyz = r1.xxx * ConstantLighting.xyz;
    r5.x = ps;
    ps = 0.5 + r5.x;
    r0.x = saturate(dot(r0.zyw, r4.zxy));
    r0.y = ps;
    ps = 0.5 + r6.x;
    r5.xyw = -r10.xyz + 1.0;
    r0.z = ps;
    r5.yz = r6.zw * r5.xy + 0.125;
    ps = log2(r0.x);
    r6.xy = abs(r0.yz) * abs(r0.yz);
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.w = float((r5.w >= 0.004));
    r6.w = ps;
    ps = r5.y * r5.z;
    r0.xyz = r7.xzy * r6.xxx;
    r5.x = ps;
    r5.xyz = r5.xxx * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r6.xyz = r7.xzy * r6.yyy;
    r6.w = ps;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r3.xzy;
    r6.xyz = r0.xzy * LowerSkyColor.xyz + r6.xzy;
    r0.xyz = r6.www * ConstantLighting.xzy;
    r6.xyz = r0.xyz * r8.xzy + r6.xzy;
    r6.xyz = r1.xyz * r7.xyz + r6.xzy;
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
