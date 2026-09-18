// ps_369365ecfabe93e9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 156 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000270 10040D00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
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
    r6.y = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r5.zxy, r5.zxy);
    r6.w = ps;
    r6.zw = r6.zw * abs(r8.xy);
    r8.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r13.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r11.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r7.yzw = -UniformVector_0.xyz + 1.0;
    r0.xyz = r7.yzw * r9.xyz;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = dot(r2.zxy, r2.zxy);
    r11.xyz = r11.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r9.xyz = r9.xyz * AmbientColorAndSkyFactor.xyz;
    r6.y = ps;
    r9.xyz = r9.xyz * r7.yzw + UniformVector_0.xyz;
    ps = rsqrt(abs(r6.x));
    r12.xyz = r6.yyy * r4.xyz;
    r6.x = ps;
    r6.yzw = r6.xxx * r5.xyz;
    ps = rsqrt(abs(r7.x));
    r6.x = dot(r11.xyz, r11.xyz);
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r7.xyz = r7.xxx * r2.zxy;
    r6.x = ps;
    r2.xyz = r11.xyz * r6.xxx;
    ps = OpacityOverride.x;
    r4.xyz = r2.xyz * TwoSidedSign.xxx;
    r11.z = saturate(ps);
    ps = 0.1 - -r7.x;
    r2.xyz = r4.xxx * r1.xyz;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r13.x = dot(r6.wyz, r4.xyz);
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r6.y = dot(r4.xyz, r12.zxy);
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r6.xyw = r4.yzx * r6.yyy;
    r11.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r4 = r13.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r11.y = ps;
    r5.xyz = r6.xyw * 2.0 - r12.xyz;
    r6.xyz = -r11.zxy + 1.0;
    r6.w = float((r6.x >= 0.004));
    r6.x = saturate(dot(r7.xyz, r5.zxy));
    r6.yz = r4.zw * r6.yz + 0.125;
    r7.xy = r4.xy + 0.5;
    r4.xy = abs(r7.xy) * abs(r7.xy);
    ps = log2(r6.x);
    r6.y = r6.y * r6.z;
    r6.x = ps;
    r7.xyz = r6.yyy * r10.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r5.xyz = r0.xzy * r4.yyy;
    r7.w = ps;
    r6.xyz = r5.xyz * UpperSkyColor.xzy + r9.xzy;
    ps = pow(2.0, r7.w);
    r4.xyz = r0.xzy * r4.xxx;
    r7.w = ps;
    r1.xyz = r7.www * r1.xzy;
    r6.xyz = r4.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r1.xyz * r8.xzy + r6.xzy;
    r6.xyz = r2.xyz * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
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
