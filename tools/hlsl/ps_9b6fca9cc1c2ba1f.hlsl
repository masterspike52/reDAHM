// ps_9b6fca9cc1c2ba1f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 171 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002AC 10040B00 0000060A 00000000 000054C6 000F003F 00000001 00003050 0000F156 00007257 0000F358 0000F4A0 0000F5A2
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
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r4.x = ps;
    r4.xy = r4.xy * abs(r6.xy);
    r6.xyw = tex2D(LightMapTextures_1, r0.xy).yzx;
    r4.xz = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r1.xyz = tex2D(LightMapTextures_0, r0.xy).zxy;
    r5.xyz = tex2D(LightMapTextures_2, r0.xy).zxy;
    ps = OpacityOverride.x;
    r8.w = dot(r3.zxy, r3.zxy);
    r4.y = saturate(ps);
    ps = LightMapScale[2].z * r5.x;
    r7.xy = -UniformVector_0.xy + 1.0;
    r9.y = ps;
    ps = LightMapScale[0].z * r1.x;
    r4.w = dot(r2.zxy, r2.zxy);
    r9.x = ps;
    ps = rsqrt(abs(r4.w));
    r10 = r1.yzyz * float4(0.3333333, 0.3333333, 1.0, 1.0);
    r4.w = ps;
    ps = 0.3333333 * r6.x;
    r11.xyz = r4.www * r2.xyz;
    r2.x = ps;
    ps = 1.0 * r6.y;
    r0 = -r11.xxyy * float4(-0.70710677, 0.70710677, -0.4082483, 0.8164966);
    r2.y = ps;
    r4.w = r11.z * 2.0 - r11.z;
    r5.w = saturate(r4.w * 0.57735026 + r0.w);
    ps = log2(r5.w);
    r0.xz = r0.xy + r0.zz;
    r0.y = ps;
    r0.xz = saturate(r4.ww * 0.57735026 + r0.xz);
    ps = log2(r0.x);
    r5 = r5.yzyz * float4(0.3333333, 0.3333333, 1.0, 1.0);
    r0.x = ps;
    ps = log2(r0.z);
    r9.zw = r2.yx * LightMapScale[1].zy;
    r0.z = ps;
    ps = 1.0 - r4.y;
    r0.xyz = r0.xyz * 16.0;
    r4.y = ps;
    ps = pow(2.0, r0.z);
    r2 = r5 * LightMapScale[2].xyxy;
    r7.z = ps;
    ps = pow(2.0, r0.y);
    r5 = r10 * LightMapScale[0].xyxy;
    r7.w = ps;
    ps = pow(2.0, r0.x);
    r4.w = float((r4.y >= 0.004));
    r4.y = ps;
    ps = r9.z;
    r0 = r5 * r7.xyww;
    ps = r4.y * ps;
    r5.yzw = r9.xyw * r7.wzy;
    r6.z = ps;
    r9.xy = r0.zw * 0.21952 + r0.xy;
    r0 = r6.zwwx * float4(0.21952, 0.3333333, 1.0, 1.0);
    r0.yzw = r0.zwy * LightMapScale[1].xyx;
    ps = r0.w;
    r2 = r2 * r7.xyzz;
    ps = r7.x * ps;
    r6.xy = r0.yz * r4.yy;
    r5.x = ps;
    ps = rsqrt(abs(r8.w));
    r9.xy = r9.xy + r5.xw;
    r6.z = ps;
    r6 = r6.xyzz * float4(0.21952, 0.21952, -0.5, 0.5);
    r3.xy = r6.zw * r3.zz;
    ps = 0.875 * r4.x;
    r6.xy = r9.xy + r6.xy;
    r3.z = ps;
    ps = 0.875 * r4.z;
    r2.xy = r6.xy + r2.xy;
    r3.w = ps;
    r2.xy = r2.zw * 0.21952 + r2.xy;
    ps = 0.21952 * r5.z;
    r3 = r3 + float4(0.5, 0.5, 0.125, 0.125);
    r2.z = ps;
    ps = r3.z * r3.w;
    r3.xy = abs(r3.xy) * abs(r3.xy);
    r4.x = ps;
    r4.xyz = r4.xxx * r8.xyz + ModShadowColor.xyz;
    ps = 0.21952 * r5.y;
    r3 = r3.xxyy * r7.xyxy;
    r2.w = ps;
    r5.xy = r3.xy * LowerSkyColor.xy + r2.xy;
    r5.xy = r3.zw * UpperSkyColor.xy + r5.xy;
    r2.xy = r7.xy * AmbientColorAndSkyFactor.xy + r5.xy;
    r5.xyw = r2.xyz + UniformVector_0.xyz;
    r5.z = r5.w + r2.w;
    r5.z = r5.z + r0.x;
    ps = -r1.w;
    r4.xyz = r5.xyz * r4.xyz;
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
