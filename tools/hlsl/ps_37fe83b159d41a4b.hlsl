// ps_37fe83b159d41a4b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10040D00 0000080A 00000000 00007D08 003F00FF 00000001 0000F053 0000F154 0000F255 0000F356 00007457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c8); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D ModShadowAccumTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord3 : TEXCOORD3; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
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
    float4 r0 = In.texcoord3;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
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
    r6.zw = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r8.xyz = AmbientColorAndSkyFactor.xyz * 0.21952;
    r9.xyz = r0.xyz * 0.07317333;
    r10.xyz = r1.xyz * 0.07317333;
    r11.xyz = r2.xyz * 0.07317333;
    ps = rsqrt(abs(r6.y));
    r13.zw = r6.zw * 0.875;
    r6.y = ps;
    ps = OpacityOverride.x;
    r7.xyz = r6.yyy * r4.xyz;
    r6.y = saturate(ps);
    r6.w = r7.z * 2.0 - r7.z;
    ps = rsqrt(abs(r6.x));
    r12 = -r7.xxyy * float4(-0.70710677, 0.70710677, -0.4082483, 0.8164966);
    r6.z = ps;
    ps = r12.x + r12.z;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = r12.y + r12.z;
    r4.xyz = r6.zzw * float3(-0.5, 0.5, 0.57735026);
    r6.z = ps;
    ps = 1.0 - r6.y;
    r6.xw = saturate(r6.xz + r4.zz);
    r6.z = ps;
    ps = log2(r6.x);
    r6.y = saturate(r12.w + r4.z);
    r12.y = ps;
    ps = log2(r6.y);
    r13.xy = r4.xy * r5.zz;
    r12.z = ps;
    ps = log2(r6.w);
    r5 = r13.xzwy + float4(0.5, 0.125, 0.125, 0.5);
    r12.w = ps;
    ps = r5.y * r5.z;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = abs(r5.x) * abs(r5.x);
    r13.xyz = r4.xyz * 0.21952;
    r12.x = ps;
    ps = abs(r5.w) * abs(r5.w);
    r5.xyz = r12.zyw * 16.0;
    r12.y = ps;
    r7.xyz = r6.xxx * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r5.x);
    r6.xy = r13.yx * r12.yy;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r13 = r13.xzyz * r12.xxxy;
    r5.y = ps;
    ps = pow(2.0, r5.z);
    r12.z = r13.w * UpperSkyColor.z;
    r5.z = ps;
    ps = UpperSkyColor.x * r6.y;
    r6.w = float((r6.z >= 0.004));
    r12.x = ps;
    ps = UpperSkyColor.y * r6.x;
    r5.xyz = r5.zxy * 0.21952;
    r12.y = ps;
    r6.xyz = r13.xzy * LowerSkyColor.xyz + r12.xyz;
    r6.xyz = r5.xxx * r2.xyz + r6.xyz;
    r6.xyz = r11.xzy * r4.xzy + r6.xzy;
    r6.xyz = r10.xyz * r4.xyz + r6.xzy;
    r6.xyz = r5.yyy * r0.xyz + r6.xyz;
    r6.xyz = r9.xyz * r4.xyz + r6.xyz;
    r6.xyz = r5.zzz * r1.xzy + r6.xzy;
    r6.xyz = r8.xyz * r4.xyz + r6.xzy;
    r6.xyz = r6.xyz + UniformVector_0.xyz;
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
