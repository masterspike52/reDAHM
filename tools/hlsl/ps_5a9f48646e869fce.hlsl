// ps_5a9f48646e869fce.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 177 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002C4 10040D00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 ConstantLighting : register(c8); // float3
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
sampler2D ModShadowAccumTexture : register(s3);

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

    r5.y = tex2D(Texture2D_0, r0.xy).w;
    r5.x = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r5.x));
    r13.w = r5.y * 0.03;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.w = dot(r1.zxy, r1.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r5.w));
    r5.xyz = r5.xxx * r3.xyz;
    r5.w = ps;
    r13.xyz = r5.www * r1.xyz;
    r6.xz = r13.wz + float2(-0.015, 0.1);
    r0.xw = r5.xy * r6.xx + r0.xy;
    r1.xyz = tex2D(Texture2D_0, r0.xw).xyz;
    r1.xyz = r1.zxy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r1.xyz, r1.xyz);
    r6.w = ps;
    ps = rsqrt(abs(r5.w));
    r0.yz = r6.yw * abs(r7.xy);
    r5.w = ps;
    r6.xyw = r1.yzx * r5.www;
    r5.w = dot(r6.wxy, r5.zxy);
    r1.xyz = r6.xyw * r5.www;
    r12.xyz = r1.xyz * 2.0 - r5.xyz;
    r5 = xe_cube(r12.xyz);
    ps = 1.0 / abs(r5.z);
    r1.z = r5.w;
    r1.x = ps;
    r1.xy = r5.yx * r1.xx + 1.5;
    r8.yzw = texCUBE(TextureCube_0, xe_cube_dir(r1.xyz)).xyz;
    r0.yz = tex2D(ModShadowAccumTexture, r0.yz).xy;
    r5.xyz = tex2D(Texture2D_1, r0.xw).zxy;
    r10.yzw = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r7.z = saturate(ps);
    ps = AmbientColorAndSkyFactor.x * r5.y;
    r5.w = dot(r4.zxy, r4.zxy);
    r3.x = ps;
    ps = rsqrt(abs(r5.w));
    r9.xyz = r1.xyz * r5.yzx;
    r5.w = ps;
    ps = AmbientColorAndSkyFactor.y * r5.z;
    r4.xyz = r5.www * r4.xyz;
    r3.y = ps;
    ps = AmbientColorAndSkyFactor.z * r5.x;
    r5.z = saturate(r6.z * 5.0);
    r3.z = ps;
    ps = 1.0 - r5.z;
    r0.x = dot(r4.zxy, r6.wxy);
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r11 = r0.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r7.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r0.xz = r11.xy + 0.5;
    r7.y = ps;
    ps = abs(r0.x) * abs(r0.x);
    r5.w = saturate(dot(r13.zxy, r12.zxy));
    r6.z = ps;
    ps = abs(r0.z) * abs(r0.z);
    r0.xyw = -r7.xyz + 1.0;
    r0.z = ps;
    ps = ConstantLighting.x * r6.w;
    r4.xyz = r9.xzy * r0.zzz;
    r10.x = ps;
    ps = log2(r5.w);
    r7.xyz = r9.xzy * r6.zzz;
    r8.x = ps;
    r11.xy = r11.zw * r0.xy + 0.125;
    ps = r11.x * r11.y;
    r8 = r8.xywz * float4(15.0, 4e+01, 4e+01, 4e+01);
    r5.w = ps;
    r0.xyz = r5.www * r10.yzw + ModShadowColor.xyz;
    ps = pow(2.0, r8.x);
    r5.w = float((r0.w >= 0.004));
    r6.z = ps;
    ps = ConstantLighting.y * r6.w;
    r11.xyz = r6.zzz * ConstantLighting.xyz;
    r10.y = ps;
    ps = r11.z;
    r10.zw = r8.yw * r5.yy;
    ps = r8.z * ps;
    r8.xy = r11.xy * r10.zw;
    r6.z = ps;
    ps = ConstantLighting.z * r6.w;
    r8.z = r6.z * r5.y;
    r10.z = ps;
    r5.xyz = r10.xyz * r9.xyz + r8.xyz;
    r5.xyz = r7.xzy * LowerSkyColor.xyz + r5.xyz;
    r5.xyz = r4.xzy * UpperSkyColor.xyz + r5.xyz;
    r5.xyz = r3.xyz * r1.xyz + r5.xyz;
    r5.xyz = r5.xyz + UniformVector_0.xyz;
    ps = -r2.w;
    r5.xyz = r5.xyz * r0.xyz;
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
