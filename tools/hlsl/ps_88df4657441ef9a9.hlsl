// ps_88df4657441ef9a9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 171 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002AC 10040A00 00000406 00000000 00003484 000F000F 00000001 00003050 0000F156 00007257 0000F358
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
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = ps;
    r0.zw = r0.zw * abs(r4.xy);
    r4.xyw = tex2D(LightMapTextures_1, r0.xy).yzx;
    r0.zw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r5.xyz = tex2D(LightMapTextures_0, r0.xy).zxy;
    r1.xyz = tex2D(LightMapTextures_2, r0.xy).zxy;
    ps = OpacityOverride.x;
    r5.w = dot(r3.zxy, r3.zxy);
    r0.x = saturate(ps);
    ps = LightMapScale[2].z * r1.x;
    r6.xy = -UniformVector_0.xy + 1.0;
    r10.y = ps;
    ps = LightMapScale[0].z * r5.x;
    r0.y = dot(r2.zxy, r2.zxy);
    r10.x = ps;
    ps = rsqrt(abs(r0.y));
    r9 = r5.yzyz * float4(0.3333333, 0.3333333, 1.0, 1.0);
    r0.y = ps;
    ps = 0.3333333 * r4.x;
    r8.xyz = r0.yyy * r2.xyz;
    r5.x = ps;
    ps = 1.0 * r4.y;
    r2 = -r8.xyxy * float4(-0.70710677, 0.8164966, 0.70710677, -0.4082483);
    r5.y = ps;
    r0.y = r8.z * 2.0 - r8.z;
    r2.y = saturate(r0.y * 0.57735026 + r2.y);
    ps = log2(r2.y);
    r2.xz = r2.xz + r2.ww;
    r2.y = ps;
    r2.xz = saturate(r0.yy * 0.57735026 + r2.xz);
    ps = log2(r2.x);
    r8 = r1.yzyz * float4(0.3333333, 0.3333333, 1.0, 1.0);
    r2.x = ps;
    ps = log2(r2.z);
    r10.zw = r5.yx * LightMapScale[1].zy;
    r2.z = ps;
    ps = 1.0 - r0.x;
    r2.xyz = r2.xyz * 16.0;
    r0.x = ps;
    ps = pow(2.0, r2.z);
    r8 = r8 * LightMapScale[2].xyxy;
    r6.z = ps;
    ps = pow(2.0, r2.y);
    r9 = r9 * LightMapScale[0].xyxy;
    r6.w = ps;
    ps = pow(2.0, r2.x);
    r5.x = float((r0.x >= 0.004));
    r2.x = ps;
    ps = r10.z;
    r9 = r9 * r6.xyww;
    ps = r2.x * ps;
    r2.yzw = r10.xyw * r6.wzy;
    r4.z = ps;
    r0.xy = r9.zw * 0.21952 + r9.xy;
    r4 = r4.zwwx * float4(0.21952, 0.3333333, 1.0, 1.0);
    r4.yzw = r4.zwy * LightMapScale[1].xyx;
    ps = r4.w;
    r9 = r8 * r6.xyzz;
    ps = r6.x * ps;
    r5.yz = r4.yz * r2.xx;
    r2.x = ps;
    ps = rsqrt(abs(r5.w));
    r0.xy = r0.xy + r2.xw;
    r5.w = ps;
    r8 = r5.wwyz * float4(-0.5, 0.5, 0.21952, 0.21952);
    r8.xy = r8.xy * r3.zz;
    ps = 0.875 * r0.z;
    r0.xy = r0.xy + r8.zw;
    r8.z = ps;
    ps = 0.875 * r0.w;
    r0.xy = r0.xy + r9.xy;
    r8.w = ps;
    r3.xy = r9.zw * 0.21952 + r0.xy;
    ps = 0.21952 * r2.z;
    r0 = r8 + float4(0.5, 0.5, 0.125, 0.125);
    r3.z = ps;
    ps = r0.z * r0.w;
    r5.yz = abs(r0.xy) * abs(r0.xy);
    r0.x = ps;
    r0.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    ps = 0.21952 * r2.y;
    r7 = r5.yyzz * r6.xyxy;
    r3.w = ps;
    r2.xy = r7.xy * LowerSkyColor.xy + r3.xy;
    r2.xy = r7.zw * UpperSkyColor.xy + r2.xy;
    r3.xy = r6.xy * AmbientColorAndSkyFactor.xy + r2.xy;
    r2.xyw = r3.xyz + UniformVector_0.xyz;
    r0.w = r2.w + r3.w;
    r2.z = r0.w + r4.x;
    ps = -r1.w;
    r0.xyz = r2.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xyz - r0.xyz;
    r2.w = ps;
    oC0.w = r2.w * r5.x + r1.w;
    r0.xyz = r2.xyz * r5.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
