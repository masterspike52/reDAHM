// ps_fcfc0469c24dfe72.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10040D00 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 ConstantLighting : register(c9); // float3
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
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
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_0, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r12.w - 0.5;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r10.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = OpacityOverride.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r11.z = saturate(ps);
    ps = ConstantLighting.z;
    r13.xyz = ConstantLighting.xyz * TwoSidedSign.xxx;
    ps = 0.21952 * ps;
    r5.x = dot(r1.zxy, r1.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r5.x));
    r5.y = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r5.y));
    r5.x = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.x));
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.y = ps;
    ps = TwoSidedSign.x * r5.y;
    r0.xyz = r12.xyz + UniformVector_0.xyz;
    r5.x = ps;
    ps = (-0.5) * r5.z;
    r7.xyz = r9.xyz * r12.xyz;
    r11.y = ps;
    ps = 0.5 * r5.z;
    r6.xyz = r6.xxx * r1.xzy;
    r11.w = ps;
    ps = 0.1 - -r6.y;
    r3 = r5.yyyx * r3.zxyz;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r11.x = r3.w + r3.w;
    r5.x = saturate(ps);
    ps = -r3.y;
    r1.xyz = r11.xyw * TwoSidedSign.xxx;
    r3.y = ps;
    ps = -r3.z;
    r3.x = -r3.x + r1.x;
    r3.z = ps;
    ps = 1.0 - r5.x;
    r5.y = saturate(dot(r6.xzy, r3.yzx));
    r5.x = ps;
    ps = log2(r5.y);
    r11.xy = r5.xx * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r3.xyz = r13.xyz * r12.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r6.xyw = -r11.zxy + 1.0;
    r10.x = ps;
    ps = r5.w;
    r1.zw = r1.yz * r4.zz;
    ps = r10.x * ps;
    r5.xyz = r10.yzx * float3(0.875, 0.875, 0.21952);
    r6.z = ps;
    ps = ConstantLighting.x * r5.z;
    r5.w = float((r6.x >= 0.004));
    r6.x = ps;
    ps = ConstantLighting.y * r5.z;
    r1.xy = r5.xy * r6.yw;
    r6.y = ps;
    r6.xyz = r3.xyz * r9.xyz + r6.xyz;
    r1 = r1.zxyw + float4(0.5, 0.125, 0.125, 0.5);
    ps = r1.y * r1.z;
    r1.xw = abs(r1.wx) * abs(r1.wx);
    r5.x = ps;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    r1.xyz = r7.xzy * r1.xxx;
    r3.xyz = r7.xzy * r1.www;
    r6.xyz = r3.xzy * LowerSkyColor.xyz + r6.xyz;
    r6.xyz = r1.xzy * UpperSkyColor.xyz + r6.xyz;
    r6.xyz = r7.xyz * AmbientColorAndSkyFactor.xyz + r6.xyz;
    r6.xyz = r0.xyz + r6.xyz;
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
