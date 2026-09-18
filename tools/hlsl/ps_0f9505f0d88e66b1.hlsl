// ps_0f9505f0d88e66b1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 159 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000027C 10040A00 00000406 00000000 00003484 000F000F 00000001 00003050 0000F156 00007257 0000F358
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD8 (flags 0xF)
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
    float2 vPos : VPOS;   // r4 (pixel parameters)
    float vFace : VFACE;  // r4
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
    float4 r4 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xzw = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    r0.zw = r0.zw * abs(r4.xy);
    r7.xyz = tex2D(LightMapTextures_1, r0.xy).xyz;
    r4.xyz = tex2D(LightMapTextures_0, r0.xy).xyz;
    r6.xyz = tex2D(LightMapTextures_2, r0.xy).xyz;
    r0.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    ps = -UniformVector_0.y;
    r2.w = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r0.z = saturate(OpacityOverride.x);
    r5.y = ps;
    ps = 1.0 - r0.z;
    r8.x = dot(r2.zxy, r2.zxy);
    r0.w = ps;
    ps = 0.875 * r0.x;
    r6 = r6.yxyz * float4(0.3333333, 1.0, 1.0, 1.0);
    r9.x = ps;
    ps = 0.875 * r0.y;
    r4 = r4.yzxy * float4(0.3333333, 1.0, 1.0, 1.0);
    r9.y = ps;
    ps = r4.z;
    r7 = r7.yxyz * float4(0.3333333, 1.0, 1.0, 1.0);
    r0.y = ps;
    ps = rsqrt(abs(r8.x));
    r7 = r7.ywzx * LightMapScale[1].xzyy;
    r0.x = ps;
    ps = LightMapScale[0].x * r0.y;
    r2.xyz = r0.xxx * r2.xyz;
    r8.x = ps;
    r0.y = r2.z * 2.0 - r2.z;
    ps = rsqrt(abs(r2.w));
    r10 = -r2.xxyy * float4(0.70710677, -0.70710677, -0.4082483, 0.8164966);
    r0.z = ps;
    ps = r10.x + r10.z;
    r6 = r6.ywzx * LightMapScale[2].xzyy;
    r0.x = ps;
    ps = r10.y + r10.z;
    r2.xyz = r0.yzz * float3(0.57735026, -0.5, 0.5);
    r0.y = ps;
    ps = LightMapScale[0].z * r4.y;
    r0.xz = saturate(r0.xy + r2.xx);
    r8.y = ps;
    ps = log2(r0.x);
    r0.y = saturate(r10.w + r2.x);
    r0.x = ps;
    ps = log2(r0.y);
    r9.zw = r2.yz * r3.zz;
    r0.y = ps;
    ps = log2(r0.z);
    r3 = r9 + float4(0.125, 0.125, 0.5, 0.5);
    r0.z = ps;
    ps = r3.x * r3.y;
    r0.xyz = r0.xzy * 16.0;
    r2.x = ps;
    r2.xyz = r2.xxx * r5.xzw + ModShadowColor.xyz;
    ps = pow(2.0, r0.x);
    r0.w = float((r0.w >= 0.004));
    r5.x = ps;
    ps = pow(2.0, r0.y);
    r3.xy = abs(r3.zw) * abs(r3.zw);
    r5.z = ps;
    ps = pow(2.0, r0.z);
    r0.xy = r3.xy * r5.yy;
    r5.w = ps;
    ps = LightMapScale[0].y * r4.x;
    r6 = r6 * r5.xxxy;
    r8.z = ps;
    ps = LightMapScale[0].y * r4.w;
    r7 = r7 * r5.zzzy;
    r8.w = ps;
    r8 = r8.xywz * r5.wwwy;
    r0.z = r8.z * 0.21952 + r8.w;
    ps = r0.z;
    r3.xyz = r6.xzy * 0.21952;
    ps = r7.w + ps;
    r4.xy = r3.xz + UniformVector_0.xz;
    r4.z = ps;
    r4.xy = r8.xy * 0.21952 + r4.xy;
    r3.xzw = r7.xyz * 0.21952 + r4.xyz;
    r0.z = r3.w + r6.w;
    r0.z = r0.z + r3.y;
    r0.x = r0.x * LowerSkyColor.y + r0.z;
    r0.x = r0.y * UpperSkyColor.y + r0.x;
    r0.x = r5.y * AmbientColorAndSkyFactor.y + r0.x;
    ps = UniformVector_0.y + r0.x;
    r3.y = ps;
    ps = -r1.w;
    r0.xyz = r3.xyz * r2.xyz;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xyz - r0.xyz;
    r2.w = ps;
    oC0.w = r2.w * r0.w + r1.w;
    r0.xyz = r2.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
