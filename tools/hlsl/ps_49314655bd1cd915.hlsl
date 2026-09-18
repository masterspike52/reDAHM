// ps_49314655bd1cd915.bin
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
    r6.yzw = tex2D(LightMapTextures_1, r0.xy).xyz;
    r5.xyz = tex2D(LightMapTextures_0, r0.xy).xyz;
    r7.xyz = tex2D(LightMapTextures_2, r0.xy).xyz;
    r4.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    ps = -UniformVector_0.x;
    r0.z = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r4.z = saturate(OpacityOverride.x);
    r6.x = ps;
    ps = 1.0 - r4.z;
    r0.w = dot(r2.zxy, r2.zxy);
    r4.w = ps;
    ps = 0.875 * r4.x;
    r11 = r7.xyzx * float4(0.3333333, 1.0, 1.0, 1.0);
    r0.x = ps;
    ps = 0.875 * r4.y;
    r5 = r5.zxxy * float4(1.0, 1.0, 0.3333333, 1.0);
    r0.y = ps;
    ps = r5.z;
    r7 = r6.yyzw * float4(0.3333333, 1.0, 1.0, 1.0);
    r4.y = ps;
    ps = rsqrt(abs(r0.w));
    r7 = r7.yxzw * LightMapScale[1].xxyz;
    r4.x = ps;
    ps = LightMapScale[0].x * r4.y;
    r2.xyz = r4.xxx * r2.xyz;
    r8.x = ps;
    r4.y = r2.z * 2.0 - r2.z;
    ps = rsqrt(abs(r0.z));
    r10 = -r2.xxyy * float4(-0.70710677, 0.70710677, -0.4082483, 0.8164966);
    r4.z = ps;
    ps = r10.x + r10.z;
    r2 = r11 * LightMapScale[2].xyzx;
    r4.x = ps;
    ps = r10.y + r10.z;
    r6.yzw = r4.yzz * float3(0.57735026, -0.5, 0.5);
    r4.y = ps;
    ps = LightMapScale[0].x * r5.y;
    r4.xz = saturate(r4.xy + r6.yy);
    r8.y = ps;
    ps = log2(r4.x);
    r4.y = saturate(r10.w + r6.y);
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
    ps = pow(2.0, r4.y);
    r4.w = float((r4.w >= 0.004));
    r6.y = ps;
    ps = pow(2.0, r4.x);
    r3.xy = abs(r3.zw) * abs(r3.zw);
    r6.z = ps;
    ps = pow(2.0, r4.z);
    r4.xy = r3.xy * r6.xx;
    r6.w = ps;
    ps = LightMapScale[0].y * r5.w;
    r2 = r2.xwzy * r6.xyyy;
    r8.z = ps;
    ps = LightMapScale[0].z * r5.x;
    r7 = r7.xzwy * r6.zzzx;
    r8.w = ps;
    r8 = r8 * r6.xwww;
    r4.z = r8.y * 0.21952 + r8.x;
    ps = r4.z;
    r5.xyz = r2.ywz * 0.21952;
    ps = r7.w + ps;
    r3.yz = r5.yz + UniformVector_0.yz;
    r3.x = ps;
    r3.yz = r8.zw * 0.21952 + r3.yz;
    r5.yzw = r7.yzx * 0.21952 + r3.yzx;
    r4.z = r5.w + r2.x;
    r4.z = r4.z + r5.x;
    r4.x = r4.x * LowerSkyColor.x + r4.z;
    r4.x = r4.y * UpperSkyColor.x + r4.x;
    r4.y = r6.x * AmbientColorAndSkyFactor.x + r4.x;
    ps = UniformVector_0.x + r4.y;
    r5.x = ps;
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
