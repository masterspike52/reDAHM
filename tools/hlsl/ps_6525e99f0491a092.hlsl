// ps_6525e99f0491a092.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 111 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001BC 10040800 00000806 00000000 00007108 00FF00FF 00000021 00003050 00003151 0000F252 0000F353 0000F454 0000F556 0000F657 0000F758
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

float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 OpacityOverride : register(c7); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r1.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = dot(r4.zxy, r4.zxy);
    r1.y = ps;
    r1.xw = r1.xy * abs(r8.xy);
    r1.y = tex2D(Texture2D_3, r0.xy).x;
    r1.z = tex2D(Texture2D_2, r0.xy).x;
    r1.xw = tex2D(ModShadowAccumTexture, r1.xw).xy;
    r7.yz = r0.yx * 4.0;
    ps = rsqrt(abs(r0.z));
    r6.xy = r1.xw * 0.875;
    r0.z = ps;
    ps = OpacityOverride.x;
    r7.x = r0.z * r4.z;
    r1.w = saturate(ps);
    ps = r0.x;
    r4.xyz = r7.xyz + float3(0.1, -0.5, -0.5);
    r0.w = dot(r4.yz, UniformVector_2.yx) + 0.5;
    r0.z = dot(r4.yz, UniformVector_1.yx) + 0.5;
    ps = UniformVector_3.x + ps;
    r1.x = saturate(r4.x * 5.0);
    r4.x = ps;
    ps = r1.y;
    r1.x = -r1.x + 1.0;
    ps = r1.z + ps;
    r1.xy = r1.xx * ModShadowGroupColor.xy;
    r1.z = ps;
    ps = r1.z;
    r1.xyw = -r1.xyw + 1.0;
    ps = r3.w * ps;
    r4.yz = r6.xy * r1.xy;
    r4.w = ps;
    ps = r0.y;
    r1.xyz = r4.yzw + float3(0.125, 0.125, -0.2);
    ps = UniformVector_3.y + ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r4.y = ps;
    r0.xyz = tex2D(Texture2D_0, r0.zw).xyz;
    r4.xyz = tex2D(Texture2D_1, r4.xy).xyz;
    r0.yzw = r0.xyz + r0.xyz;
    ps = r1.x * r1.y;
    r4.xyz = r4.xyz + r4.xyz;
    r0.x = ps;
    r0.yzw = r4.xyz * r0.yzw + r3.xyz;
    r1.xyz = r0.yzw * 0.9 + UniformVector_0.xyz;
    r0.w = float((r1.w >= 0.004));
    r0.xyz = r0.xxx * r2.xyz + ModShadowColor.xyz;
    ps = -r5.w;
    r0.xyz = r1.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r5.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
