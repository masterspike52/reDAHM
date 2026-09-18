// ps_0256ab4eb58390db.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10040A00 00000806 00000000 00007108 00FF00FF 00000001 00003050 00003151 0000F252 0000F353 0000F454 0000F556 0000F657 0000F758
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r7 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 ConstantLighting : register(c8); // float3
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord4 : TEXCOORD4; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
    float4 texcoord8 : TEXCOORD8; // r7
    float2 vPos : VPOS;   // r8 (pixel parameters)
    float vFace : VFACE;  // r8
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord3;
    float4 r4 = In.texcoord4;
    float4 r5 = In.texcoord6;
    float4 r6 = In.texcoord7;
    float4 r7 = In.texcoord8;
    float4 r8 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r1.xy = r0.xy * 2e+01;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.y = dot(r4.zxy, r4.zxy);
    r0.x = ps;
    r0.xz = r0.xz * abs(r8.xy);
    r10.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r2.xy = tex2D(ModShadowAccumTexture, r0.xz).xy;
    r3.w = ConstantLighting.z * 0.21952;
    r1.yzw = -ModShadowColor.xyz + 1.0;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = dot(r7.zxy, r7.zxy);
    r0.x = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r0.y));
    r2.zw = r2.xy * 0.875;
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r4.xyz = r0.yyy * r4.xyz;
    r0.x = ps;
    ps = OpacityOverride.x;
    r3.xyz = r0.xxx * r6.zxy;
    r0.z = saturate(ps);
    r3.x = r3.x * 2.0 - r3.x;
    ps = -r3.y;
    r0.x = r4.z + 0.1;
    r3.y = ps;
    ps = -r3.z;
    r0.x = saturate(r0.x * 5.0);
    r3.z = ps;
    ps = 1.0 - r0.x;
    r9.xyz = r10.yzw * ConstantLighting.xyz;
    r0.x = ps;
    ps = rsqrt(abs(r0.w));
    r0.y = saturate(dot(r4.xyz, r3.yzx));
    r2.y = ps;
    ps = log2(r0.y);
    r0.xw = r0.xx * ModShadowGroupColor.xy;
    r2.x = ps;
    ps = 1.0 - r0.x;
    r3.xyz = r8.xyz * r10.yzw;
    r6.x = ps;
    ps = 1.0 - r0.w;
    r4.xyz = r2.xyy * float3(15.0, -0.5, 0.5);
    r6.y = ps;
    ps = 1.0 - r0.z;
    r2.xy = r4.yz * r7.zz;
    r6.z = ps;
    r2.zw = r2.zw * r6.xy;
    ps = pow(2.0, r4.x);
    r1.x = float((r6.z >= 0.004));
    r10.x = ps;
    ps = r3.w;
    r0 = r10 * float4(0.21952, 0.5, 0.5, 0.5);
    ps = r10.x * ps;
    r2 = r2 + float4(0.5, 0.5, 0.125, 0.125);
    r7.z = ps;
    ps = r2.z * r2.w;
    r4.xw = abs(r2.yx) * abs(r2.yx);
    r2.w = ps;
    ps = r0.x;
    r2.xyz = r0.yzw + UniformVector_0.xyz;
    r0.y = ps;
    r1.yzw = r2.www * r1.yzw + ModShadowColor.xyz;
    ps = ConstantLighting.x * r0.y;
    r4.xyz = r3.xzy * r4.xxx;
    r7.x = ps;
    ps = ConstantLighting.y * r0.x;
    r6.xyz = r3.xzy * r4.www;
    r7.y = ps;
    r0.xyz = r9.xyz * r8.xyz + r7.xyz;
    r0.xyz = r6.xzy * LowerSkyColor.xyz + r0.xyz;
    r0.xyz = r4.xzy * UpperSkyColor.xyz + r0.xyz;
    r0.xyz = r3.xyz * AmbientColorAndSkyFactor.xyz + r0.xyz;
    r0.xyz = r2.xyz + r0.xyz;
    ps = -r5.w;
    r0.xyz = r0.xyz * r1.yzw;
    ps = OpacityOverride.x + ps;
    r2.xyz = r0.xyz - r0.xyz;
    r2.w = ps;
    oC0.w = r2.w * r1.x + r5.w;
    r0.xyz = r2.xyz * r1.xxx + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
