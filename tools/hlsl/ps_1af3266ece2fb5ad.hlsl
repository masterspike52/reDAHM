// ps_1af3266ece2fb5ad.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 177 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002C4 10040D00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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

    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.yz = r0.xy + UniformVector_1.xy;
    r10.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r2.zxy, r2.zxy);
    r10.y = ps;
    r7.xyz = r7.zyx * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r6.x = dot(r4.zxy, r4.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r9.xyz = r6.www * r2.xyz;
    r6.x = ps;
    r4.xyz = r6.xxx * r4.zyx;
    r7.z = saturate(dot(r4.xzy, r7.xzy));
    ps = OpacityOverride.x;
    r6.x = r9.z + 0.1;
    r6.w = saturate(ps);
    ps = r10.x;
    r6.x = saturate(r6.x * 5.0);
    ps = abs(r8.x) * ps;
    r6.xw = -r6.xw + 1.0;
    r2.x = ps;
    ps = r10.y;
    r7.xy = r6.xx * ModShadowGroupColor.xy;
    ps = abs(r8.y) * ps;
    r10.xyz = -r7.xyz + 1.0;
    r2.y = ps;
    r8.xyz = tex2D(Texture2D_2, r10.zz).xyz;
    r7 = tex2D(Texture2D_0, r0.xy);
    r2.xy = tex2D(ModShadowAccumTexture, r2.xy).xy;
    r0.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_4, r6.yz).xyz;
    r0.w = dot(r5.zxy, r5.zxy);
    r4.yz = -r4.zy;
    r4.x = r4.x * 2.0 - r4.x;
    ps = rsqrt(abs(r0.w));
    r6.z = saturate(dot(r9.xyz, r4.yzx));
    r2.w = ps;
    ps = log2(r6.z);
    r0.x = r0.x * r12.x;
    r2.z = ps;
    r13.xyz = r2.zww * float3(15.0, -0.5, 0.5);
    ps = pow(2.0, r13.x);
    r11.xy = r2.xy * 0.875;
    r12.w = ps;
    ps = 0.21952 * r1.z;
    r5.xy = r11.xy * r10.xy;
    r6.y = ps;
    r10.z = r6.y * r12.w;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r4.xyz = r9.xyz * AmbientColorAndSkyFactor.xyz;
    r2.xyz = r8.xyz + r7.xyz;
    r9.xyz = r2.xyz * r9.xyz;
    r6.w = float((r6.w >= 0.004));
    r5.zw = r13.yz * r5.zz;
    ps = r12.y + r12.y;
    r5 = r5 + float4(0.125, 0.125, 0.5, 0.5);
    r11.x = ps;
    ps = r5.x * r5.y;
    r11.yz = r12.zw * float2(1e+02, 0.21952);
    r4.w = ps;
    ps = abs(r5.z) * abs(r5.z);
    r10.xy = r11.zz * r1.xy;
    r0.w = ps;
    ps = abs(r5.w) * abs(r5.w);
    r0.yz = r11.xy * r0.yz;
    r2.w = ps;
    r6.xyz = r4.www * r6.xyz + ModShadowColor.xyz;
    r5.xyz = r9.xzy * r2.www;
    r1.xyz = r9.xyz * r1.xyz + r10.xyz;
    r9.xyz = r9.xzy * r0.www;
    r7.xyz = r9.xzy * LowerSkyColor.xyz + r1.xyz;
    r0.xyz = r0.xyz + UniformVector_0.xyz;
    r0.xyz = r7.www * r8.xzy + r0.xzy;
    r7.xyz = r5.xzy * UpperSkyColor.xyz + r7.xyz;
    r7.xyz = r4.xzy * r2.xzy + r7.xzy;
    r7.xyz = r0.xyz + r7.xyz;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
