// ps_a51d51da1d696915.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10040900 00000506 00000000 000050A5 001F001F 00000001 0000F053 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
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
    r7.x = dot(r3.zxy, r3.zxy);
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r7.z = ps;
    ps = 0.21952 * r0.z;
    r5.xy = r7.yz * abs(r5.xy);
    r5.w = ps;
    r9.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.xyz = AmbientColorAndSkyFactor.xyz * UniformVector_1.xyz;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r7.x));
    r0.w = dot(r1.zxy, r1.zxy);
    r7.x = ps;
    ps = rsqrt(abs(r0.w));
    r7.xyz = r7.xxx * r3.xyz;
    r0.w = ps;
    ps = -r7.x;
    r3.xyz = r0.www * r1.xyz;
    r1.z = ps;
    r1.y = r7.z * 2.0 - r7.z;
    ps = -r7.y;
    r0.w = r3.z + 0.1;
    r1.w = ps;
    ps = 5.0 * r0.w;
    r7.xyz = r6.xyz * UniformVector_1.xyz;
    r1.x = saturate(ps);
    ps = 1.0 - r1.x;
    r1.y = saturate(dot(r3.xyz, r1.zwy));
    r1.x = ps;
    ps = log2(r1.y);
    r3.xy = r1.xx * ModShadowGroupColor.xy;
    r9.x = ps;
    ps = OpacityOverride.x;
    r1.xyz = r9.yxz * float3(0.875, 15.0, 0.875);
    r3.z = saturate(ps);
    r3.xzw = -r3.zxy + 1.0;
    ps = rsqrt(abs(r6.w));
    r3.zw = r1.xz * r3.zw;
    r9.y = ps;
    ps = pow(2.0, r1.y);
    r1.x = float((r3.x >= 0.004));
    r9.x = ps;
    r1.yzw = r9.xyy * float3(0.21952, -0.5, 0.5);
    ps = r5.w;
    r3.xy = r1.zw * r4.zz;
    ps = r9.x * ps;
    r1.yz = r1.yy * r0.xy;
    r1.w = ps;
    r1.yzw = r7.xyz * r0.xyz + r1.yzw;
    r0 = r3 + float4(0.5, 0.5, 0.125, 0.125);
    ps = r0.z * r0.w;
    r3.xw = abs(r0.yx) * abs(r0.yx);
    r0.x = ps;
    r0.xyz = r0.xxx * r8.xyz + ModShadowColor.xyz;
    r3.xyz = r7.xzy * r3.xxx;
    r4.xyz = r7.xzy * r3.www;
    r1.yzw = r4.xzy * LowerSkyColor.xyz + r1.yzw;
    r1.yzw = r3.xzy * UpperSkyColor.xyz + r1.yzw;
    r1.yzw = r5.xyz * r6.xyz + r1.yzw;
    r1.yzw = r1.yzw + UniformVector_0.xyz;
    ps = -r2.w;
    r0.xyz = r1.yzw * r0.xyz;
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
