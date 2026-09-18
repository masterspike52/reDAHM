// ps_315391b5094777f3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 129 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000204 10040B00 0000080A 00000000 00007D08 003F00FF 00000001 0000F053 0000F154 0000F255 0000F356 00007457 0000F558 0000F6A0 0000F7A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r6.zw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = -UniformVector_0.y;
    r9.xy = r0.yy * float2(0.3333333, 0.21952);
    ps = 1.0 + ps;
    r9.zw = r1.yy * float2(0.21952, 0.3333333);
    r8.w = ps;
    ps = r2.y;
    r6.y = dot(r5.zxy, r5.zxy);
    ps = 0.3333333 * ps;
    r6.x = dot(r4.zxy, r4.zxy);
    r10.x = ps;
    ps = rsqrt(abs(r6.x));
    r11.xy = r6.zw * 0.875;
    r6.x = ps;
    ps = OpacityOverride.x;
    r7.xyz = r6.xxx * r4.xyz;
    r6.x = saturate(ps);
    r6.z = r7.z * 2.0 - r7.z;
    ps = rsqrt(abs(r6.y));
    r4 = -r7.xyxy * float4(0.70710677, 0.8164966, -0.70710677, -0.4082483);
    r6.y = ps;
    ps = r4.x + r4.w;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r8.x = ps;
    ps = r4.z + r4.w;
    r6.yzw = r6.yyz * float3(-0.5, 0.5, 0.57735026);
    r8.y = ps;
    ps = 1.0 - r6.x;
    r4.xz = saturate(r8.xy + r6.ww);
    r7.w = ps;
    ps = log2(r4.x);
    r6.x = saturate(r4.y + r6.w);
    r4.x = ps;
    ps = log2(r6.x);
    r11.zw = r6.yz * r5.zz;
    r4.y = ps;
    ps = log2(r4.z);
    r6 = r11.zwyx + float4(0.5, 0.5, 0.125, 0.125);
    r4.z = ps;
    ps = r6.w * r6.z;
    r4.xyz = r4.xyz * 16.0;
    r4.w = ps;
    r7.xyz = r4.www * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r4.x);
    r6.w = float((r7.w >= 0.004));
    r8.x = ps;
    ps = pow(2.0, r4.y);
    r10.yz = abs(r6.xy) * abs(r6.xy);
    r8.y = ps;
    ps = pow(2.0, r4.z);
    r6.xyz = r10.yxz * r8.www;
    r8.z = ps;
    ps = LowerSkyColor.y * r6.x;
    r7.w = dot(r9.zwxy, r8.zwwy);
    r4.z = ps;
    ps = r7.w;
    r5.xyz = r8.xyz * 0.21952;
    ps = r6.y + ps;
    r4.xy = r5.zz * r1.xz;
    r7.w = ps;
    r1.xy = r5.xx * r2.xz + UniformVector_0.xz;
    r0.xy = r5.yy * r0.xz + r1.xy;
    r0.z = r5.x * r2.y + r7.w;
    r0.xzw = r0.xyz + r4.xyz;
    r6.x = r6.z * UpperSkyColor.y + r0.w;
    r6.x = r8.w * AmbientColorAndSkyFactor.y + r6.x;
    ps = UniformVector_0.y + r6.x;
    r0.y = ps;
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
