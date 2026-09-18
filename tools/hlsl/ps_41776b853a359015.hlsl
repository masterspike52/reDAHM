// ps_41776b853a359015.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 75 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000012C 10040700 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
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
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = dot(r1.zxy, r1.zxy);
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = ps;
    r5.yz = r5.yz * abs(r7.xy);
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.yw = tex2D(ModShadowAccumTexture, r5.yz).xy;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r0.xyz + UniformVector_0.xyz;
    r5.x = ps;
    r6.yzw = r0.xyz * 0.1 + r6.xyz;
    r5.x = r5.x * r1.z + 0.1;
    ps = 5.0 * r5.x;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r5.x = ps;
    ps = OpacityOverride.x;
    r0.xy = r5.xx * ModShadowGroupColor.xy;
    r0.z = saturate(ps);
    ps = 0.875 * r5.y;
    r0.xyz = -r0.xyz + 1.0;
    r5.x = ps;
    ps = 0.875 * r5.w;
    r6.x = float((r0.z >= 0.004));
    r5.z = ps;
    r5.xy = r5.xz * r0.xy + 0.125;
    ps = r5.x * r5.y;
    r5.x = ps;
    r5.xyz = r5.xxx * r3.xyz + ModShadowColor.xyz;
    ps = -r2.w;
    r5.xyz = r6.yzw * r5.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.x + r2.w;
    r5.xyz = r0.xyz * r6.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
