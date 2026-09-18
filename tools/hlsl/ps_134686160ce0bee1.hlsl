// ps_134686160ce0bee1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040900 00000506 00000000 000050A5 001F001F 00000001 0000F053 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
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
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = dot(r1.zxy, r1.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    ps = 0.21952 * r0.z;
    r5.xy = r6.xy * abs(r5.xy);
    r5.w = ps;
    r7.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.xyz = AmbientColorAndSkyFactor.xyz * 0.21952;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    ps = rsqrt(abs(r7.x));
    r9.xy = r7.yz * 0.875;
    r7.x = ps;
    ps = rsqrt(abs(r6.w));
    r7.xyz = r7.xxx * r1.xyz;
    r1.x = ps;
    ps = OpacityOverride.x;
    r1.xzw = r1.xxx * r3.xyz;
    r1.y = saturate(ps);
    r3.x = r1.w * 2.0 - r1.w;
    ps = -r1.x;
    r3.z = r7.z + 0.1;
    r3.y = ps;
    ps = -r1.z;
    r1.x = saturate(r3.z * 5.0);
    r3.z = ps;
    ps = 1.0 - r1.x;
    r1.z = dot(r4.zxy, r4.zxy);
    r1.x = ps;
    ps = rsqrt(abs(r1.z));
    r1.w = saturate(dot(r7.xyz, r3.yzx));
    r7.z = ps;
    ps = log2(r1.w);
    r1.xz = r1.xx * ModShadowGroupColor.xy;
    r7.y = ps;
    ps = 1.0 - r1.x;
    r3.yzw = -UniformVector_0.xyz + 1.0;
    r7.x = ps;
    ps = 1.0 - r1.z;
    r8.xyz = r7.yzz * float3(15.0, -0.5, 0.5);
    r7.y = ps;
    ps = 1.0 - r1.y;
    r4.xy = r8.yz * r4.zz;
    r7.z = ps;
    ps = pow(2.0, r8.x);
    r4.zw = r9.xy * r7.xy;
    r3.x = ps;
    r4 = r4.yzwx + float4(0.5, 0.125, 0.125, 0.5);
    ps = r4.y * r4.z;
    r1.x = float((r7.z >= 0.004));
    r1.y = ps;
    ps = abs(r4.w) * abs(r4.w);
    r8 = r3 * 0.21952;
    r4.w = ps;
    ps = abs(r4.x) * abs(r4.x);
    r7.xy = r8.xx * r0.xy;
    r4.x = ps;
    r1.yzw = r1.yyy * r6.xyz + ModShadowColor.xyz;
    ps = r5.w;
    r4.xyz = r8.ywz * r4.xxx;
    ps = r3.x * ps;
    r6.xyz = r8.ywz * r4.www;
    r7.z = ps;
    r0.xyz = r8.yzw * r0.xyz + r7.xyz;
    r0.xyz = r6.xzy * LowerSkyColor.xyz + r0.xyz;
    r0.xyz = r4.xzy * UpperSkyColor.xyz + r0.xyz;
    r0.xyz = r5.xyz * r3.yzw + r0.xyz;
    r0.xyz = r0.xyz + UniformVector_0.xyz;
    ps = -r2.w;
    r0.xyz = r0.xyz * r1.yzw;
    ps = OpacityOverride.x + ps;
    r3.xyz = r0.xyz - r0.xyz;
    r3.w = ps;
    oC0.w = r3.w * r1.x + r2.w;
    r0.xyz = r3.xyz * r1.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
