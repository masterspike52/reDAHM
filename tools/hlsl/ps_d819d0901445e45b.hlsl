// ps_d819d0901445e45b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 159 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000027C 10040B00 0000060A 00000000 000054C6 000F003F 00000001 00003050 0000F156 00007257 0000F358 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LightMapScale[3] : register(c8); // float3[3]
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c11); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D LightMapTextures_0 : register(s0);
sampler2D LightMapTextures_1 : register(s1);
sampler2D LightMapTextures_2 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord6 : TEXCOORD6; // r1
    float4 texcoord7 : TEXCOORD7; // r2
    float4 texcoord8 : TEXCOORD8; // r3
    float4 color0 : COLOR0; // r4
    float4 color2 : COLOR2; // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord6;
    float4 r2 = In.texcoord7;
    float4 r3 = In.texcoord8;
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r4.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r4.x = ps;
    r4.xy = r4.xy * abs(r6.xy);
    r6.xzw = tex2D(LightMapTextures_1, r0.xy).xyz;
    r5.xyz = tex2D(LightMapTextures_0, r0.xy).xyz;
    r7.xyz = tex2D(LightMapTextures_2, r0.xy).xyz;
    r4.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    ps = -UniformVector_0.y;
    r0.z = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r4.z = saturate(OpacityOverride.x);
    r6.y = ps;
    ps = 1.0 - r4.z;
    r0.w = dot(r2.zxy, r2.zxy);
    r4.w = ps;
    ps = 0.875 * r4.x;
    r11 = r7.yxyz * float4(0.3333333, 1.0, 1.0, 1.0);
    r0.x = ps;
    ps = 0.875 * r4.y;
    r5 = r5.yzxy * float4(0.3333333, 1.0, 1.0, 1.0);
    r0.y = ps;
    ps = r5.z;
    r7 = r6.zxzw * float4(0.3333333, 1.0, 1.0, 1.0);
    r4.y = ps;
    ps = rsqrt(abs(r0.w));
    r7 = r7.ywzx * LightMapScale[1].xzyy;
    r4.x = ps;
    ps = LightMapScale[0].x * r4.y;
    r2.xyz = r4.xxx * r2.xyz;
    r8.x = ps;
    r4.y = r2.z * 2.0 - r2.z;
    ps = rsqrt(abs(r0.z));
    r10 = -r2.xxyy * float4(0.70710677, -0.70710677, -0.4082483, 0.8164966);
    r4.z = ps;
    ps = r10.x + r10.z;
    r2 = r11.ywzx * LightMapScale[2].xzyy;
    r4.x = ps;
    ps = r10.y + r10.z;
    r6.xzw = r4.yzz * float3(0.57735026, -0.5, 0.5);
    r4.y = ps;
    ps = LightMapScale[0].z * r5.y;
    r4.xz = saturate(r4.xy + r6.xx);
    r8.y = ps;
    ps = log2(r4.x);
    r4.y = saturate(r10.w + r6.x);
    r4.x = ps;
    ps = log2(r4.y);
    r0.zw = r6.zw * r3.zz;
    r4.y = ps;
    ps = log2(r4.z);
    r3 = r0 + float4(0.125, 0.125, 0.5, 0.5);
    r4.z = ps;
    ps = r3.x * r3.y;
    r4.xyz = r4.xzy * 16.0;
    r0.x = ps;
    r0.xyz = r0.xxx * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r4.x);
    r4.w = float((r4.w >= 0.004));
    r6.x = ps;
    ps = pow(2.0, r4.y);
    r3.xy = abs(r3.zw) * abs(r3.zw);
    r6.z = ps;
    ps = pow(2.0, r4.z);
    r4.xy = r3.xy * r6.yy;
    r6.w = ps;
    ps = LightMapScale[0].y * r5.x;
    r2 = r2 * r6.xxxy;
    r8.z = ps;
    ps = LightMapScale[0].y * r5.w;
    r7 = r7 * r6.zzzy;
    r8.w = ps;
    r8 = r8.xywz * r6.wwwy;
    r4.z = r8.z * 0.21952 + r8.w;
    ps = r4.z;
    r5.xyz = r2.xzy * 0.21952;
    ps = r7.w + ps;
    r3.xy = r5.xz + UniformVector_0.xz;
    r3.z = ps;
    r3.xy = r8.xy * 0.21952 + r3.xy;
    r5.xzw = r7.xyz * 0.21952 + r3.xyz;
    r4.z = r5.w + r2.w;
    r4.z = r4.z + r5.y;
    r4.x = r4.x * LowerSkyColor.y + r4.z;
    r4.x = r4.y * UpperSkyColor.y + r4.x;
    r4.x = r6.y * AmbientColorAndSkyFactor.y + r4.x;
    ps = UniformVector_0.y + r4.x;
    r5.y = ps;
    ps = -r1.w;
    r4.xyz = r5.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r5.xyz = r4.xyz - r4.xyz;
    r5.w = ps;
    oC0.w = r5.w * r4.w + r1.w;
    r4.xyz = r5.xyz * r4.www + r4.xyz;
    oC0.xyz = r4.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
