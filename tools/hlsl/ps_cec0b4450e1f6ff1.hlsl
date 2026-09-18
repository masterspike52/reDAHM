// ps_cec0b4450e1f6ff1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10040800 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
sampler2D ModShadowAccumTexture : register(s2);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xw = r0.xy * 0.2 + UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xy = r0.yx - 0.5;
    r6.z = ps;
    r6.yz = r6.yz * abs(r7.xy);
    r6.yz = tex2D(ModShadowAccumTexture, r6.yz).xy;
    r6.w = tex2D(Texture2D_0, r6.xw).x;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.w = dot(r1.zxy, r1.zxy);
    r7.y = dot(r8.xy, UniformVector_3.yx) + 0.5;
    r7.x = dot(r8.xy, UniformVector_2.yx) + 0.5;
    ps = rsqrt(abs(r5.w));
    r8.z = r6.w * 0.25;
    r5.w = ps;
    ps = rsqrt(abs(r6.x));
    r8.xy = r6.yz * 0.875;
    r6.w = ps;
    r5.w = r5.w * r1.z + 0.1;
    ps = 5.0 * r5.w;
    r6.x = saturate(ps);
    ps = OpacityOverride.x;
    r6.y = -r6.x + 1.0;
    r6.x = saturate(ps);
    ps = r6.w;
    r6.yz = r6.yy * ModShadowGroupColor.xy;
    ps = r3.x * ps;
    r6.xyz = -r6.xyz + 1.0;
    r7.z = ps;
    ps = r6.w;
    r8.xy = r8.xy * r6.yz;
    ps = r3.y * ps;
    r1.xyz = r8.xyz + float3(0.125, 0.125, -0.005);
    r7.w = ps;
    r0.xy = r7.zw * r1.zz + r0.xy;
    r0.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.w = tex2D(Texture2D_1, r7.xy).x;
    r5 = r0.zxyw * r5.zxyx;
    r6.w = r5.w * r0.x;
    r6.w = min(r6.w, 1.0);
    ps = r5.y;
    r6.w = r6.w - 0.5;
    r5.y = ps;
    ps = UniformVector_0.x + r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r6.y = ps;
    ps = UniformVector_0.y + r5.z;
    r6.x = float((r6.x >= 0.004));
    r6.z = ps;
    ps = UniformVector_0.z + r5.x;
    r0.x = r1.x * r1.y;
    r6.w = ps;
    r5.xyz = r0.xxx * r4.xyz + ModShadowColor.xyz;
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
