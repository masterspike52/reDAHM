// ps_b14e3b067046a599.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10040700 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
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
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.yz = r0.xy * 2.0 + UniformVector_1.xy;
    r6.xy = r0.xy * 0.5 + UniformVector_2.xy;
    r0.x = dot(r1.zxy, r1.zxy);
    r5.x = 1.0 / r4.w;
    r5.xw = r5.xx * ScreenPositionScaleBias.xy;
    r6.w = 1.0 / ModShadowAccumResolution.y;
    r0.yz = r5.xw * r4.xy + ScreenPositionScaleBias.wz;
    r5.x = r1.z + 0.1;
    r6.z = 1.0 / ModShadowAccumResolution.x;
    r6.zw = r6.zw * abs(r7.xy);
    r4.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r6.yzw = tex2D(Texture2D_0, r6.xy).xyz;
    r0.yzw = tex2D(LightAttenuationTexture, r0.yz).xyz;
    r5.yzw = tex2D(Texture2D_0, r5.yz).xyz;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.yzw = r5.yzw * 4.0 - 4.0;
    r2.xyz = r0.yzw * LightColor.xyz;
    r0.x = rsqrt(abs(r0.x));
    r1.xyz = r0.xxx * r1.xyz;
    r5.x = saturate(5.0 * r5.x);
    r7.xyz = r6.yzw * 4.0 + r5.yzw;
    ps = 1.0 - r5.x;
    r5.yzw = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    r0.xy = -r5.xx * ModShadowGroupColor.xy + 1.0;
    ps = rsqrt(abs(r6.x));
    r5.x = dot(r7.zxy, r7.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r6.xxx * r3.xyz;
    r5.x = ps;
    r3.xyz = r7.xyz * r5.xxx;
    r5.x = dot(r3.zxy, r6.zxy);
    r7.xyz = r3.xzy * r5.xxx;
    r6.xyz = r7.xyz * 2.0 - r6.xzy;
    r5.x = saturate(dot(r1.zxy, r6.yxz));
    ps = log2(r5.x);
    r6.xyz = r5.yzw * UniformVector_3.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.yzw = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    ps = pow(2.0, r6.w);
    r5.x = saturate(dot(r3.zxy, r1.zxy));
    r4.x = ps;
    r1.xyz = r4.xyz * float3(0.21952, 0.875, 0.875);
    r6.xyz = r6.xyz * r5.xxx + r1.xxx;
    r0.xy = r1.yz * r0.xy + 0.125;
    ps = r0.x * r0.y;
    r6.xyz = r2.xyz * r6.xyz;
    r5.x = ps;
    r5.xyz = r5.xxx * r5.yzw + ModShadowColor.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
