// ps_e158605568abe40a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10040E00 0000080A 00000000 00007D08 003F00FF 00000001 0000F053 0000F154 0000F255 0000F356 00007457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c9); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
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
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.w = dot(r5.zxy, r5.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r11.xyz = UniformVector_1.xyz * 0.3333333;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r6.xz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r9.xyz = AmbientColorAndSkyFactor.xyz * UniformVector_1.xyz;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = saturate(ps);
    ps = 1.0 - r6.y;
    r4.w = dot(r4.zxy, r4.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r4.w));
    r13.xyz = r8.xyz * UniformVector_1.xyz;
    r6.y = ps;
    ps = 0.875 * r6.x;
    r4.xyw = r6.yyy * r4.xyz;
    r4.z = ps;
    r4.w = r4.w * 2.0 - r4.w;
    ps = rsqrt(abs(r7.w));
    r12 = -r4.xxyy * float4(-0.70710677, 0.70710677, 0.8164966, -0.4082483);
    r4.y = ps;
    ps = r12.x + r12.w;
    r10.xyz = r11.xyz * r0.xyz;
    r4.x = ps;
    ps = r12.y + r12.w;
    r14.xyz = r4.yyw * float3(-0.5, 0.5, 0.57735026);
    r4.y = ps;
    ps = 0.875 * r6.z;
    r12.xy = saturate(r4.yx + r14.zz);
    r4.w = ps;
    ps = log2(r12.y);
    r6.x = saturate(r12.z + r14.z);
    r12.y = ps;
    ps = log2(r6.x);
    r4.xy = r14.xy * r5.zz;
    r12.z = ps;
    ps = log2(r12.x);
    r4 = r4.xzwy + float4(0.5, 0.125, 0.125, 0.5);
    r12.w = ps;
    ps = r4.y * r4.z;
    r5.xyz = r11.xyz * r1.xyz;
    r6.x = ps;
    ps = abs(r4.x) * abs(r4.x);
    r11.xyz = r11.xyz * r2.xyz;
    r12.x = ps;
    ps = abs(r4.w) * abs(r4.w);
    r4.xyz = r12.yzw * 16.0;
    r12.y = ps;
    r7.xyz = r6.xxx * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r4.x);
    r6.xy = r13.yx * r12.yy;
    r4.x = ps;
    ps = pow(2.0, r4.y);
    r13 = r13.xzyz * r12.xxxy;
    r4.y = ps;
    ps = pow(2.0, r4.z);
    r12.z = r13.w * UpperSkyColor.z;
    r4.z = ps;
    ps = UpperSkyColor.x * r6.y;
    r6.w = float((r6.w >= 0.004));
    r12.x = ps;
    ps = UpperSkyColor.y * r6.x;
    r4.xyz = r4.zxy * 0.21952;
    r12.y = ps;
    r6.xyz = r13.xzy * LowerSkyColor.xyz + r12.xyz;
    r6.xyz = r4.xxx * r2.xyz + r6.xyz;
    r6.xyz = r11.xzy * r8.xzy + r6.xzy;
    r6.xyz = r5.xyz * r8.xyz + r6.xzy;
    r6.xyz = r4.zzz * r0.xyz + r6.xyz;
    r6.xyz = r10.xyz * r8.xyz + r6.xyz;
    r6.xyz = r4.yyy * r1.xzy + r6.xzy;
    r6.xyz = r9.xyz * r8.xyz + r6.xzy;
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
