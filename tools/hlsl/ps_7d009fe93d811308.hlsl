// ps_7d009fe93d811308.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000264 10040D00 0000080A 00000000 00007D08 003F00FF 00000001 0000F053 0000F154 0000F255 0000F356 00007457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
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
    r6.x = dot(r5.zxy, r5.zxy);
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.xyz = r0.yxy * float3(0.21952, 0.3333333, 0.3333333);
    r6.z = ps;
    r6.yz = r6.yz * abs(r8.xy);
    r8.zw = tex2D(ModShadowAccumTexture, r6.yz).xy;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r7.xy = r2.xy * 0.3333333;
    r6.z = saturate(ps);
    ps = -UniformVector_0.x;
    r10.xyz = r1.xyy * float3(0.3333333, 0.3333333, 0.21952);
    ps = 1.0 + ps;
    r6.y = dot(r4.zxy, r4.zxy);
    r8.x = ps;
    ps = rsqrt(abs(r6.y));
    r6.w = -r6.z + 1.0;
    r6.y = ps;
    ps = -UniformVector_0.y;
    r9.xyz = r6.yyy * r4.xyz;
    ps = 1.0 + ps;
    r4 = -r9.xxyy * float4(-0.70710677, 0.70710677, -0.4082483, 0.8164966);
    r8.y = ps;
    r6.y = r9.z * 2.0 - r9.z;
    r6.z = saturate(r6.y * 0.57735026 + r4.w);
    ps = log2(r6.z);
    r7.zw = r4.xy + r4.zz;
    r6.z = ps;
    r7.zw = saturate(r6.yy * 0.57735026 + r7.zw);
    ps = log2(r7.z);
    r13.zw = r8.zw * 0.875;
    r6.y = ps;
    ps = log2(r7.w);
    r6.yz = r6.yz * 16.0;
    r9.z = ps;
    ps = pow(2.0, r6.y);
    r4.xy = r7.xy * r8.xy;
    r9.x = ps;
    ps = pow(2.0, r6.z);
    r4.zw = r10.xy * r8.xy;
    r9.y = ps;
    ps = rsqrt(abs(r6.x));
    r7.xyw = r9.yzx * float3(0.21952, 16.0, 0.21952);
    r6.y = ps;
    ps = pow(2.0, r7.y);
    r12.x = r12.x * r9.y;
    r6.x = ps;
    r6.xyz = r6.xyy * float3(0.21952, -0.5, 0.5);
    r13.xy = r6.yz * r5.zz;
    r6.xyz = r6.xxx * r2.zxy;
    ps = UniformVector_0.z + r6.x;
    r2 = r13 + float4(0.5, 0.5, 0.125, 0.125);
    r5.z = ps;
    ps = r2.z * r2.w;
    r5.xy = r12.yz * r8.xy;
    r7.z = ps;
    ps = abs(r2.x) * abs(r2.x);
    r12.yz = r7.xx * r0.xz;
    r2.x = ps;
    ps = abs(r2.y) * abs(r2.y);
    r0.yzw = r5.zxy + r12.zyx;
    r2.y = ps;
    r7.xyz = r7.zzz * r11.xyz + ModShadowColor.xyz;
    ps = r0.z;
    r6.w = float((r6.w >= 0.004));
    ps = r4.z + ps;
    r2.z = r0.w + r4.w;
    r0.x = ps;
    r4.z = r10.z * r9.x + r2.z;
    ps = r4.z;
    r2 = r2.xxyy * r8.xyxy;
    r0.zw = r7.ww * r1.zx + r0.yx;
    ps = r4.y + ps;
    r0.x = r0.w + r4.x;
    r0.y = ps;
    r6.xy = r0.xy + r6.yz;
    r6.xy = r2.xy * LowerSkyColor.xy + r6.xy;
    r6.xy = r2.zw * UpperSkyColor.xy + r6.xy;
    r6.xy = r8.xy * AmbientColorAndSkyFactor.xy + r6.xy;
    r0.xy = r6.xy + UniformVector_0.xy;
    ps = -r3.w;
    r6.xyz = r0.xyz * r7.xyz;
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
