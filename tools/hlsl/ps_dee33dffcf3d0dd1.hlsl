// ps_dee33dffcf3d0dd1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040900 0000070A 00000000 000070E7 001F007F 00000001 0000F053 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
    r8.yzw = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xyz = UniformVector_0.xyz + float3(32.0, 2e+01, 0.5);
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r7.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.x = dot(r4.zxy, r4.zxy);
    r5.y = dot(r1.zxy, r1.zxy);
    r9.xyz = AmbientColorAndSkyFactor.xyz * float3(32.0, 2e+01, 0.5);
    r6.xyz = r9.xyz * r8.yzw + r6.xyz;
    ps = rsqrt(abs(r5.y));
    r6.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r6.w));
    r5.yzw = r5.yyy * r1.zxy;
    r6.w = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r6.www * r3.zxy;
    r7.z = ps;
    r1.x = r1.x * 2.0 - r1.x;
    ps = -r1.y;
    r3 = r7.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r1.y = ps;
    ps = -r1.z;
    r3.zw = r3.zw * r4.zz;
    r1.z = ps;
    ps = 0.1 - -r5.y;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r5.w = saturate(dot(r5.zwy, r1.yzx));
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r5.x = ps;
    ps = OpacityOverride.x;
    r5.xy = r5.xx * ModShadowGroupColor.xy;
    r5.z = saturate(ps);
    ps = log2(r5.w);
    r5.xyz = -r5.xyz + 1.0;
    r8.x = ps;
    r1 = r8 * float4(15.0, 32.0, 2e+01, 0.5);
    r3.xy = r3.xy * r5.xy;
    r5.w = float((r5.z >= 0.004));
    r3 = r3.zxyw + float4(0.5, 0.125, 0.125, 0.5);
    ps = r3.y * r3.z;
    r3.xw = abs(r3.xw) * abs(r3.xw);
    r5.x = ps;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r3.xyz = r1.ywz * r3.xxx;
    ps = pow(2.0, r1.x);
    r4.xyz = r1.ywz * r3.www;
    r6.w = ps;
    r6.xyz = r4.xzy * UpperSkyColor.xyz + r6.xyz;
    r6.xyz = r3.xyz * LowerSkyColor.xzy + r6.xzy;
    r6.xyz = r6.www * r0.xyz + r6.xzy;
    r6.xyz = r1.ywz * r0.xzy + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xzy * r5.xyz;
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
