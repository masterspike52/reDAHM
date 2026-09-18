// ps_7d6dd39b9a93266a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10040900 0000070A 00000000 000070E7 001F007F 00000001 0000F053 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D ModShadowAccumTexture : register(s0);

struct PS_INPUT
{
    float4 texcoord3 : TEXCOORD3; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord3;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = dot(r1.zxy, r1.zxy);
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r5.zw = r5.zw * abs(r7.xy);
    r5.zw = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r7.xyz = AmbientColorAndSkyFactor.xyz * 0.21952;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = rsqrt(abs(r5.y));
    r6.yz = r5.zw * 0.875;
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r5.yzw = r5.yyy * r1.xyz;
    r5.x = ps;
    ps = 0.1 - -r5.w;
    r1.xyw = r5.xxx * r3.xzy;
    r5.x = ps;
    ps = -r1.x;
    r6.w = dot(r4.zxy, r4.zxy);
    r3.y = ps;
    r3.x = r1.y * 2.0 - r1.y;
    ps = -r1.w;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r3.z = ps;
    ps = 5.0 * r5.x;
    r5.z = saturate(dot(r5.yzw, r3.yzx));
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r6.x = r0.z * 0.21952;
    r5.x = ps;
    ps = OpacityOverride.x;
    r5.xy = r5.xx * ModShadowGroupColor.xy;
    r5.w = saturate(ps);
    ps = log2(r5.z);
    r5.xyw = -r5.xyw + 1.0;
    r1.w = ps;
    ps = rsqrt(abs(r6.w));
    r3 = r1 * float4(0.21952, 0.21952, 0.21952, 15.0);
    r6.w = ps;
    ps = pow(2.0, r3.w);
    r9.xy = r6.yz * r5.xy;
    r6.z = ps;
    r5.xyz = r6.zww * float3(0.21952, -0.5, 0.5);
    ps = r6.x;
    r9.zw = r5.yz * r4.zz;
    ps = r6.z * ps;
    r6.xy = r5.xx * r0.xy;
    r6.z = ps;
    r6.xyz = r3.xyz * r0.xyz + r6.xyz;
    r0 = r9.zxyw + float4(0.5, 0.125, 0.125, 0.5);
    ps = r0.y * r0.z;
    r0.xw = abs(r0.wx) * abs(r0.wx);
    r5.z = ps;
    r5.xyz = r5.zzz * r8.xyz + ModShadowColor.xyz;
    ps = UniformVector_0.x;
    r0.xyz = r3.yzx * r0.xxx;
    ps = 9e+01 + ps;
    r3.xyz = r3.yzx * r0.www;
    r6.w = ps;
    r6.xyz = r3.zxy * LowerSkyColor.xyz + r6.xyz;
    r6.xyz = r0.zxy * UpperSkyColor.xyz + r6.xyz;
    r6.xyz = r7.xyz * r1.xyz + r6.xyz;
    ps = r6.w;
    r5.w = float((r5.w >= 0.004));
    ps = r6.x + ps;
    r6.yz = r6.yz + UniformVector_0.yz;
    r6.x = ps;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
