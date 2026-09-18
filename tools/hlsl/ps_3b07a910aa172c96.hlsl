// ps_3b07a910aa172c96.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 129 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000204 10040A00 00000606 00000000 00005CC6 003F003F 00000001 0000F053 0000F154 0000F255 0000F356 00007457 0000F558
//   interpolator: r0 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.y = ps;
    r3.xy = r3.xy * abs(r6.xy);
    r6.xy = tex2D(ModShadowAccumTexture, r3.xy).xy;
    ps = -UniformVector_0.y;
    r7.xy = r0.yy * float2(0.3333333, 0.21952);
    ps = 1.0 + ps;
    r7.zw = r1.yy * float2(0.21952, 0.3333333);
    r6.w = ps;
    ps = r2.y;
    r3.y = dot(r5.zxy, r5.zxy);
    ps = 0.3333333 * ps;
    r0.y = dot(r4.zxy, r4.zxy);
    r3.x = ps;
    ps = rsqrt(abs(r0.y));
    r8.xy = r6.xy * 0.875;
    r0.y = ps;
    ps = OpacityOverride.x;
    r4.xyz = r0.yyy * r4.xyz;
    r0.y = saturate(ps);
    r6.y = r4.z * 2.0 - r4.z;
    ps = rsqrt(abs(r3.y));
    r10 = -r4.xxyy * float4(0.70710677, -0.70710677, -0.4082483, 0.8164966);
    r6.x = ps;
    ps = r10.x + r10.z;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r3.y = ps;
    ps = r10.y + r10.z;
    r9.xyz = r6.xxy * float3(-0.5, 0.5, 0.57735026);
    r3.z = ps;
    ps = 1.0 - r0.y;
    r6.xz = saturate(r3.yz + r9.zz);
    r3.y = ps;
    ps = log2(r6.x);
    r3.z = saturate(r10.w + r9.z);
    r6.x = ps;
    ps = log2(r3.z);
    r8.zw = r9.xy * r5.zz;
    r6.y = ps;
    ps = log2(r6.z);
    r8 = r8 + float4(0.125, 0.125, 0.5, 0.5);
    r6.z = ps;
    ps = r8.x * r8.y;
    r5.xyz = r6.xyz * 16.0;
    r3.z = ps;
    r4.yzw = r3.zzz * r4.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r5.x);
    r4.x = float((r3.y >= 0.004));
    r6.x = ps;
    ps = pow(2.0, r5.y);
    r3.yz = abs(r8.zw) * abs(r8.zw);
    r6.y = ps;
    ps = pow(2.0, r5.z);
    r3.xyz = r3.yxz * r6.www;
    r6.z = ps;
    ps = LowerSkyColor.y * r3.x;
    r5.x = dot(r7.zwxy, r6.zwwy);
    r5.z = ps;
    ps = r5.x;
    r7.xyz = r6.xyz * 0.21952;
    ps = r3.y + ps;
    r5.xy = r7.zz * r1.xz;
    r1.x = ps;
    r1.yz = r7.xx * r2.xz + UniformVector_0.xz;
    r0.xy = r7.yy * r0.xz + r1.yz;
    r0.z = r7.x * r2.y + r1.x;
    r1.xzw = r0.xyz + r5.xyz;
    r0.x = r3.z * UpperSkyColor.y + r1.w;
    r0.x = r6.w * AmbientColorAndSkyFactor.y + r0.x;
    ps = UniformVector_0.y + r0.x;
    r1.y = ps;
    ps = -r3.w;
    r0.xyz = r1.xyz * r4.yzw;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r4.x + r3.w;
    r0.xyz = r1.xyz * r4.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
