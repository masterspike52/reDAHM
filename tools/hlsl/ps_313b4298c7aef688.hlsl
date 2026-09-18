// ps_313b4298c7aef688.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 87 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000015C 10040600 00000606 00000000 000058C6 003F003F 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
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
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r0.xw = r0.yx - 0.5;
    r0.y = ps;
    r0.z = dot(r0.xw, UniformVector_2.yx) + 0.5;
    r0.x = dot(r0.xw, UniformVector_1.yx) + 0.5;
    r4.xy = tex2D(Texture2D_0, r0.xz).xw;
    r0.x = r4.y * r1.w - 0.5;
    ps = 1.0 / ModShadowAccumResolution.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    r0.x = ps;
    r0.xy = r0.xy * abs(r6.xy);
    r0.zw = tex2D(ModShadowAccumTexture, r0.xy).xy;
    ps = OpacityOverride.x;
    r0.x = dot(r2.zxy, r2.zxy);
    r0.y = saturate(ps);
    r1.xyz = r4.xxx * r1.xyz + UniformVector_0.xyz;
    ps = rsqrt(abs(r0.x));
    r4.xy = r0.zw * 0.875;
    r0.x = ps;
    r0.x = r0.x * r2.z + 0.1;
    ps = -ModShadowColor.x;
    r0.x = saturate(r0.x * 5.0);
    ps = 1.0 + ps;
    r0.z = -r0.x + 1.0;
    r0.x = ps;
    ps = -ModShadowColor.y;
    r0.zw = r0.zz * ModShadowGroupColor.xy;
    ps = 1.0 + ps;
    r2.xyz = -r0.yzw + 1.0;
    r0.y = ps;
    ps = -ModShadowColor.z;
    r0.w = float((r2.x >= 0.004));
    r2.xy = r4.xy * r2.yz + 0.125;
    ps = 1.0 + ps;
    r1.w = r2.x * r2.y;
    r0.z = ps;
    r0.xyz = r1.www * r0.xyz + ModShadowColor.xyz;
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
