// ps_cacea1fbb00a978f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 102 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000198 10040700 00000506 00000000 000048A5 001F001F 00000021 00003050 0000F154 0000F256 0000F357 0000F458
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 OpacityOverride : register(c7); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_5 : register(c5); // float
float4 UniformScalar_9 : register(c6); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
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
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3.xy = tex2D(Texture2D_2, r0.xy).xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = 0.5;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xz = saturate(r3.xy - UniformScalar_5.xx);
    r0.w = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r5.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r5.zw = tex2D(Texture2D_0, r0.xy).xy;
    r4.xyz = tex2D(Texture2D_3, r6.xy).xyz;
    r3.xyw = tex2D(Texture2D_1, r0.xy).xyw;
    r3.xy = r3.xy * float2(3e+01, 5.0);
    r0.xyz = r4.yzx * UniformVector_1.yzx;
    ps = UniformVector_0.x + r0.z;
    r0.w = dot(r1.zxy, r1.zxy);
    r4.x = ps;
    ps = UniformVector_0.y + r0.x;
    r7.y = r3.y + r5.w;
    r4.y = ps;
    ps = rsqrt(abs(r0.w));
    r5.xyz = r5.xyz * float3(0.875, 0.875, 5.0);
    r0.x = ps;
    r0.x = r0.x * r1.z + 0.1;
    ps = 5.0 * r0.x;
    r7.x = r5.z + r3.x;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = ps;
    r1.xy = r7.xy * r6.xz + r4.xy;
    ps = OpacityOverride.x;
    r4.xy = r0.ww * ModShadowGroupColor.xy;
    r4.z = saturate(ps);
    r0.z = r7.x * r6.x + r0.z;
    ps = UniformScalar_9.x * r0.z;
    r4.xyz = -r4.zxy + 1.0;
    r0.w = ps;
    ps = r0.w;
    r4.yz = r5.xy * r4.yz;
    ps = r3.w * ps;
    r0.w = float((r4.x >= 0.004));
    r4.x = ps;
    ps = UniformVector_0.z + r0.y;
    r4.xyz = r4.xyz + float3(-0.333, 0.125, 0.125);
    r1.z = ps;
    ps = r4.y * r4.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r4.xxxx)) clip(-1.0);
    r0.x = ps;
    r0.xyz = r0.xxx * r3.xyz + ModShadowColor.xyz;
    ps = -r2.w;
    r0.xyz = r1.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r2.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
