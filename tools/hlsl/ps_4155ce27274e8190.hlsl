// ps_4155ce27274e8190.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10040700 00000506 00000000 000050A5 001F001F 00000001 0000F053 0000F154 0000F256 0000F357 0000F458
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = dot(r1.zxy, r1.zxy);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.z = dot(r3.zxy, r3.zxy);
    r6.z = ps;
    r5.xy = r6.xz * abs(r5.xy);
    r6.zw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r6.x = r0.z * 0.21952;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    ps = rsqrt(abs(r6.y));
    r7.xy = r6.zw * 0.875;
    r0.z = ps;
    ps = rsqrt(abs(r7.z));
    r6.yzw = r0.zzz * r1.xyz;
    r0.z = ps;
    ps = OpacityOverride.x;
    r1.xyz = r0.zzz * r3.xyz;
    r1.w = saturate(ps);
    r3.x = r1.z * 2.0 - r1.z;
    ps = -r1.x;
    r0.z = r6.w + 0.1;
    r3.y = ps;
    ps = -r1.y;
    r0.z = saturate(r0.z * 5.0);
    r3.z = ps;
    ps = 1.0 - r0.z;
    r0.w = dot(r4.zxy, r4.zxy);
    r1.x = ps;
    ps = rsqrt(abs(r0.w));
    r0.z = saturate(dot(r6.yzw, r3.yzx));
    r0.w = ps;
    ps = log2(r0.z);
    r1.xz = r1.xx * ModShadowGroupColor.xy;
    r0.z = ps;
    ps = 15.0 * r0.z;
    r3.xy = -UniformVector_0.xy + 1.0;
    r1.y = ps;
    ps = (-0.5) * r0.w;
    r6.yzw = -r1.xzw + 1.0;
    r1.z = ps;
    ps = 0.5 * r0.w;
    r7.xy = r7.xy * r6.yz;
    r1.w = ps;
    r7.zw = r1.zw * r4.zz;
    ps = pow(2.0, r1.y);
    r1.x = float((r6.w >= 0.004));
    r0.w = ps;
    ps = 0.21952 * r0.w;
    r4 = r7.zwxy + float4(0.5, 0.5, 0.125, 0.125);
    r3.w = ps;
    ps = r4.z * r4.w;
    r4.xy = abs(r4.xy) * abs(r4.xy);
    r1.y = ps;
    r1.yzw = r1.yyy * r5.xyz + ModShadowColor.xyz;
    ps = r6.x;
    r5 = r4.xxyy * r3.xyxy;
    ps = r0.w * ps;
    r4.xy = r5.xy * LowerSkyColor.xy;
    r3.z = ps;
    r4.y = dot(r3.yw, r0.yy) + r4.y;
    r4.x = dot(r3.xw, r0.xx) + r4.x;
    r0.xy = r5.zw * UpperSkyColor.xy + r4.xy;
    r3.xy = r3.xy * AmbientColorAndSkyFactor.xy + r0.xy;
    r0.xyz = r3.xyz + UniformVector_0.xyz;
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
