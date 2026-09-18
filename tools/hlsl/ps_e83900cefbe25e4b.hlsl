// ps_e83900cefbe25e4b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 117 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001D4 10040900 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.zw = r0.xy * 0.43 + UniformVector_1.xy;
    r5.xy = r0.xy * 0.59 + UniformVector_3.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3 = r0.xyxy * float4(1.32, 1.32, 0.75, 0.75);
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.xy = r3.xy + UniformVector_2.xy;
    r5.w = ps;
    r6.xy = r5.zw * abs(r7.xy);
    r3.xyz = tex2D(Texture2D_0, r3.zw).xyz;
    r8.xyz = tex2D(Texture2D_1, r5.xy).xyz;
    r5.xyz = tex2D(Texture2D_2, r0.wz).yzx;
    r4 = tex2D(Texture2D_1, r4.xy);
    r8.w = tex2D(Texture2D_1, r6.zw).w;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = OpacityOverride.x;
    r6.z = saturate(r4.w + r8.w);
    r7.z = saturate(ps);
    ps = UniformVector_0.x + r5.z;
    r5.w = dot(r1.zxy, r1.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r5.w));
    r9 = r4 + r8;
    r5.w = ps;
    r5.w = r5.w * r1.z + 0.1;
    ps = UniformVector_0.y + r5.x;
    r4.xyz = r9.www * r9.xyz;
    r0.y = ps;
    ps = 5.0 * r5.w;
    r1.xyz = r9.xyz + r4.www;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r1.xyz = saturate(r1.xyz + r8.www);
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r4.xyz = max(r4.xyz, 0.0);
    r7.x = ps;
    r1.xyz = r1.xyz * UniformVector_4.xyz - r3.xyz;
    ps = ModShadowGroupColor.y * r5.z;
    r4.xyz = min(r4.xyz, 0.3);
    r7.y = ps;
    r4.xyz = r4.xyz * UniformVector_4.xyz + r1.xyz;
    ps = UniformVector_0.z + r5.y;
    r1.xyz = -r7.xyz + 1.0;
    r0.z = ps;
    r5.xyz = r4.xyz * r6.zzz + r0.xyz;
    ps = 0.875 * r6.x;
    r0.xyz = r5.xyz + r3.xyz;
    r5.x = ps;
    ps = 0.875 * r6.y;
    r5.w = float((r1.z >= 0.004));
    r5.y = ps;
    r6.xy = r5.xy * r1.xy + 0.125;
    ps = r6.x * r6.y;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    r5.xyz = r6.xxx * r5.xyz + ModShadowColor.xyz;
    ps = -r2.w;
    r5.xyz = r0.xyz * r5.xyz;
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
