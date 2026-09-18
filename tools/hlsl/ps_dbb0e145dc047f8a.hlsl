// ps_dbb0e145dc047f8a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 126 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001F8 10040900 0000060A 00000000 000058C6 000F003F 00000001 00007054 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
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
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord4 : TEXCOORD4; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 color0 : COLOR0; // r4
    float4 color2 : COLOR2; // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord4;
    float4 r1 = In.texcoord5;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r3.w;
    r4.w = dot(r0.zxy, r0.zxy);
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.xy = r4.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r4.xy = r4.xy * r3.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r6.xy);
    r7.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r6.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r5.xy = -UniformVector_0.xy + 1.0;
    r4.y = dot(r2.zxy, r2.zxy);
    ps = r0.z;
    r4.x = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r6.xyz = r6.xyz * r1.www;
    r4.z = ps;
    ps = rsqrt(abs(r4.w));
    r4.z = saturate(r4.z * 5.0);
    r5.w = ps;
    ps = 1.0 - r4.x;
    r4.w = saturate(r5.w * r0.z);
    r5.z = saturate(ps);
    ps = rsqrt(abs(r4.y));
    r8.xyz = r5.www * r0.zxy;
    r4.y = ps;
    ps = rsqrt(abs(r4.x));
    r0.xyz = r4.yyy * r2.zxy;
    r4.y = ps;
    ps = log2(r5.z);
    r4.z = -r4.z + 1.0;
    r4.x = ps;
    r2.yz = -r4.zz * ModShadowGroupColor.xy + 1.0;
    ps = -r0.y;
    r9.xyz = r4.yyy * -SpotDirection.xyz;
    r0.y = ps;
    r0.x = r0.x * 2.0 - r0.x;
    ps = -r0.z;
    r4.y = dot(r9.zxy, r1.zxy);
    r0.z = ps;
    ps = -SpotAngles.x - -r4.y;
    r4.z = saturate(dot(r8.yzx, r0.yzx));
    r4.y = ps;
    ps = log2(r4.z);
    r0.x = saturate(r4.y * SpotAngles.y);
    r4.y = ps;
    ps = LightColorAndFalloffExponent.w * r4.x;
    r4.y = r4.y * 15.0;
    r5.z = ps;
    ps = pow(2.0, r4.y);
    r0.y = r0.x * r0.x;
    r7.x = ps;
    ps = pow(2.0, r5.z);
    r4.xyz = r7.xyz * float3(0.21952, 0.875, 0.875);
    r2.x = ps;
    r5.xy = r4.ww * r5.xy + r4.xx;
    r4.xyz = r4.yxz * r2.yxz;
    r5.z = r6.z * r4.y;
    ps = 0.125 + r4.x;
    r0.zw = r6.xy * r2.xx;
    r4.w = ps;
    ps = 0.125 + r4.z;
    r5.xy = r0.zw * r5.xy;
    r4.x = ps;
    r4.x = r4.w * r4.x;
    r4.xyz = r4.xxx * r3.xyz + ModShadowColor.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.yzw = r5.yzx * r0.yyx;
    r5.x = r5.w * r0.x;
    r4.xyz = r5.xzy * r4.xzy;
    oC0.xyz = r4.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
