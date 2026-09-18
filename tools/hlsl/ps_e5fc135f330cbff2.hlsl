// ps_e5fc135f330cbff2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 153 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000264 10040C00 00000606 00000000 00005CC6 003F003F 00000001 0000F053 0000F154 0000F255 0000F356 00007457 0000F558
//   interpolator: r0 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
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
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r9.w = dot(r5.zxy, r5.zxy);
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.xyz = r0.yxy * float3(0.21952, 0.3333333, 0.3333333);
    r7.y = ps;
    r6.xy = r7.xy * abs(r6.xy);
    r8.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r6.zw = r2.xy * 0.3333333;
    r6.y = saturate(ps);
    ps = -UniformVector_0.x;
    r7.xyw = r1.xyy * float3(0.3333333, 0.3333333, 0.21952);
    ps = 1.0 + ps;
    r4.w = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r4.w));
    r8.w = -r6.y + 1.0;
    r4.w = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r4.www * r4.xyz;
    ps = 1.0 + ps;
    r11 = -r4.xxyy * float4(-0.70710677, 0.70710677, -0.4082483, 0.8164966);
    r6.y = ps;
    r4.z = r4.z * 2.0 - r4.z;
    r4.w = saturate(r4.z * 0.57735026 + r11.w);
    ps = log2(r4.w);
    r4.xy = r11.xy + r11.zz;
    r4.w = ps;
    r4.xy = saturate(r4.zz * 0.57735026 + r4.xy);
    ps = log2(r4.x);
    r11.zw = r8.xy * 0.875;
    r4.z = ps;
    ps = log2(r4.y);
    r4.xz = r4.wz * 16.0;
    r8.z = ps;
    ps = pow(2.0, r4.z);
    r6.zw = r6.zw * r6.xy;
    r8.x = ps;
    ps = pow(2.0, r4.x);
    r4.zw = r7.xy * r6.xy;
    r8.y = ps;
    ps = rsqrt(abs(r9.w));
    r7.xyz = r8.xyz * float3(0.21952, 0.21952, 16.0);
    r4.y = ps;
    ps = pow(2.0, r7.z);
    r10.x = r10.x * r8.y;
    r4.x = ps;
    r12.xyz = r4.xyy * float3(0.21952, -0.5, 0.5);
    r11.xy = r12.yz * r5.zz;
    r2.xyz = r12.xxx * r2.zxy;
    ps = UniformVector_0.z + r2.x;
    r5 = r11.yxzw + float4(0.5, 0.5, 0.125, 0.125);
    r11.z = ps;
    ps = r5.z * r5.w;
    r11.xy = r10.yz * r6.xy;
    r2.w = ps;
    ps = abs(r5.y) * abs(r5.y);
    r10.yz = r7.yy * r0.xz;
    r4.x = ps;
    ps = abs(r5.x) * abs(r5.x);
    r5.yzw = r11.zxy + r10.zyx;
    r4.y = ps;
    r0.xyz = r2.www * r9.xyz + ModShadowColor.xyz;
    ps = r5.z;
    r0.w = float((r8.w >= 0.004));
    ps = r4.z + ps;
    r2.w = r5.w + r4.w;
    r5.x = ps;
    r2.w = r7.w * r8.x + r2.w;
    ps = r2.w;
    r4 = r4.xxyy * r6.xyxy;
    r1.zw = r7.xx * r1.zx + r5.yx;
    ps = r6.w + ps;
    r1.x = r1.w + r6.z;
    r1.y = ps;
    r1.xy = r1.xy + r2.yz;
    r1.xy = r4.xy * LowerSkyColor.xy + r1.xy;
    r1.xy = r4.zw * UpperSkyColor.xy + r1.xy;
    r1.xy = r6.xy * AmbientColorAndSkyFactor.xy + r1.xy;
    r1.xy = r1.xy + UniformVector_0.xy;
    ps = -r3.w;
    r0.xyz = r1.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r3.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
