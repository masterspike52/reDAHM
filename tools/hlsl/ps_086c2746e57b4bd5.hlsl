// ps_086c2746e57b4bd5.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10040800 0000070A 00000000 000060E7 001F007F 00000001 00003050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c4); // float4
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c6); // float2
float4 SpotDirection : register(c5); // float3
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D ShadowTexture : register(s1);
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
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r5.xy = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.w = -UniformVector_0.x + 1.0;
    r5.z = ps;
    r5.zw = r5.zw * abs(r7.xy);
    r7.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r6.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r5.w = tex2D(ShadowTexture, r0.xy).x;
    ps = r1.z;
    r5.z = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.z));
    r0.y = r5.w * r5.w;
    r5.w = ps;
    ps = rsqrt(abs(r5.x));
    r7.w = saturate(r5.w * r1.z);
    r6.w = ps;
    ps = 1.0 - r5.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = saturate(ps);
    ps = 5.0 * r5.y;
    r0.x = dot(r3.zxy, r3.zxy);
    r5.z = saturate(ps);
    ps = rsqrt(abs(r0.x));
    r6.xyz = r0.yyy * r6.xyz;
    r5.y = ps;
    ps = log2(r5.x);
    r5.z = -r5.z + 1.0;
    r5.x = ps;
    r8.yz = -r5.zz * ModShadowGroupColor.xy + 1.0;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.xyz = r5.yyy * r3.zxy;
    r5.z = ps;
    ps = -r0.y;
    r3.xyz = r6.www * -SpotDirection.xyz;
    r0.y = ps;
    r0.x = r0.x * 2.0 - r0.x;
    ps = -r0.z;
    r5.y = dot(r3.zxy, r2.zxy);
    r0.z = ps;
    ps = -SpotAngles.x - -r5.y;
    r1.xyz = r5.www * r1.zxy;
    r5.x = ps;
    ps = pow(2.0, r5.z);
    r5.y = saturate(dot(r1.yzx, r0.yzx));
    r8.x = ps;
    ps = log2(r5.y);
    r1.z = r6.x * r8.x;
    r5.y = ps;
    ps = SpotAngles.y * r5.x;
    r5.y = r5.y * 15.0;
    r0.x = saturate(ps);
    ps = pow(2.0, r5.y);
    r0.y = r0.x * r0.x;
    r7.x = ps;
    r7.xyz = r7.xyz * float3(0.21952, 0.875, 0.875);
    r5 = r7 * r8;
    ps = r5.w;
    r1.xy = r5.yz + 0.125;
    ps = r7.x + ps;
    r6.yz = r6.yz * r5.xx;
    r1.w = ps;
    r6.xw = r1.zx * r1.wy;
    r5.xyz = r6.www * r4.xyz + ModShadowColor.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.yzw = r6.yzx * r0.yyx;
    r6.x = r6.w * r0.x;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
