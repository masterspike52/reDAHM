// ps_c1c13b2536307f10.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 186 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002E8 10040D00 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LightMapScale : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
samplerCUBE TextureCube_0 : register(s2);
sampler2D LightMapTexture : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.y = tex2D(Texture2D_0, r1.xy).w;
    r6.x = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r6.x));
    r13.w = r6.y * 0.03;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r6.xxx * r4.xyz;
    r6.w = ps;
    r13.xyz = r6.www * r2.xyz;
    r7.xw = r13.wz + float2(-0.015, 0.1);
    r7.xy = r6.xy * r7.xx + r1.xy;
    r1.xyz = tex2D(Texture2D_0, r7.xy).xyz;
    r1.xyz = r1.zxy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r1.xyz, r1.xyz);
    r0.w = ps;
    ps = rsqrt(abs(r6.w));
    r0.zw = r0.zw * abs(r8.xy);
    r6.w = ps;
    r4.xyw = r1.xyz * r6.www;
    r6.w = dot(r4.xyw, r6.zxy);
    r1.xyz = r4.ywx * r6.www;
    r11.xyz = r1.xyz * 2.0 - r6.xyz;
    r6 = xe_cube(r11.xyz);
    ps = 1.0 / abs(r6.z);
    r1.z = r6.w;
    r7.z = ps;
    r1.xy = r6.yx * r7.zz + 1.5;
    r12.yzw = texCUBE(TextureCube_0, xe_cube_dir(r1.xyz)).xyz;
    r2.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r6.yzw = tex2D(LightMapTexture, r0.xy).xyz;
    r7.xyz = tex2D(Texture2D_1, r7.xy).zxy;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = dot(r5.zxy, r5.zxy);
    r1.yzw = r6.yzw * LightMapScale.xyz;
    ps = rsqrt(abs(r6.x));
    r8.xyz = r0.xyz * r7.yzx;
    r6.x = ps;
    ps = OpacityOverride.x;
    r6.yzw = r6.xxx * r5.xyz;
    r4.z = saturate(ps);
    ps = 5.0 * r7.w;
    r9.xyz = r1.ywz * r4.xxx;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r2.x = dot(r6.wyz, r4.xyw);
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r5 = r2.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r4.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.xy = r5.xy + 0.5;
    r4.y = ps;
    ps = abs(r2.x) * abs(r2.x);
    r6.z = saturate(dot(r13.zxy, r11.zxy));
    r7.w = ps;
    ps = abs(r2.y) * abs(r2.y);
    r6.xyw = -r4.xyz + 1.0;
    r0.w = ps;
    ps = AmbientColorAndSkyFactor.x * r7.y;
    r2.xyz = r8.xzy * r0.www;
    r1.x = ps;
    ps = log2(r6.z);
    r4.xyz = r8.xzy * r7.www;
    r12.x = ps;
    r11.xy = r5.zw * r6.xy + 0.125;
    ps = r11.x * r11.y;
    r5 = r12.xywz * float4(15.0, 4e+01, 4e+01, 4e+01);
    r6.z = ps;
    r6.xyz = r6.zzz * r10.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r5.x);
    r6.w = float((r6.w >= 0.004));
    r7.w = ps;
    ps = AmbientColorAndSkyFactor.y * r7.z;
    r10.xyz = r1.yzw * r7.www;
    r1.y = ps;
    ps = r10.z;
    r1.zw = r5.yw * r7.yy;
    ps = r5.z * ps;
    r5.xy = r10.xy * r1.zw;
    r7.w = ps;
    ps = AmbientColorAndSkyFactor.z * r7.x;
    r5.z = r7.w * r7.y;
    r1.z = ps;
    r7.xyz = r9.xzy * r8.xyz + r5.xyz;
    r7.xyz = r4.xzy * LowerSkyColor.xyz + r7.xyz;
    r7.xyz = r2.xzy * UpperSkyColor.xyz + r7.xyz;
    r7.xyz = r1.xyz * r0.xyz + r7.xyz;
    r7.xyz = r7.xyz + UniformVector_0.xyz;
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
