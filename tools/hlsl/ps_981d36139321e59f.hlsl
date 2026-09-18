// ps_981d36139321e59f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 123 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001EC 10040900 0000060A 00000000 000058C6 000F003F 00000001 00007054 0000F155 00007256 0000F357 0000F4A0 0000F5A2
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
    r4.x = dot(r2.zxy, r2.zxy);
    r4.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.yz = r4.yy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r4.yw = r4.yz * r3.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.z = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    r5.xy = r5.xy * abs(r6.xy);
    r6.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r7.xyz = tex2D(LightAttenuationTexture, r4.yw).xyz;
    ps = rsqrt(abs(r4.z));
    r4.y = dot(r0.zxy, r0.zxy);
    r2.w = ps;
    ps = rsqrt(abs(r4.y));
    r5.w = saturate(-r4.z + 1.0);
    r4.z = ps;
    ps = rsqrt(abs(r4.x));
    r4.w = saturate(r4.z * r0.z);
    r4.y = ps;
    ps = r0.z;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r3.yzw = -UniformVector_0.xyz + 1.0;
    r4.x = ps;
    ps = 5.0 * r4.x;
    r8.xyz = r7.xyz * r1.www;
    r4.x = saturate(ps);
    ps = 1.0 - r4.x;
    r7.xyz = r4.zzz * r0.zxy;
    r0.x = ps;
    ps = log2(r5.w);
    r4.xyz = r4.yyy * r2.xyz;
    r5.w = ps;
    r0.zw = -r0.xx * ModShadowGroupColor.xy + 1.0;
    ps = -r4.x;
    r9.xyz = r2.www * -SpotDirection.xyz;
    r2.y = ps;
    r2.x = r4.z * 2.0 - r4.z;
    ps = -r4.y;
    r4.x = r5.w * LightColorAndFalloffExponent.w;
    r2.z = ps;
    ps = pow(2.0, r4.x);
    r4.y = dot(r9.zxy, r1.zxy);
    r4.x = ps;
    ps = -SpotAngles.x - -r4.y;
    r1.xyz = r8.xyz * r4.xxx;
    r4.x = ps;
    ps = SpotAngles.y * r4.x;
    r4.y = saturate(dot(r7.yzx, r2.yzx));
    r0.x = saturate(ps);
    ps = log2(r4.y);
    r0.y = r0.x * r0.x;
    r6.x = ps;
    r4.xyz = r6.yxz * float3(0.875, 15.0, 0.875);
    r4.xz = r4.xz * r0.zw + 0.125;
    ps = pow(2.0, r4.y);
    r4.x = r4.x * r4.z;
    r3.x = ps;
    r4.xyz = r4.xxx * r5.xyz + ModShadowColor.xyz;
    ps = r4.w;
    r5 = r3.xxzw * float4(0.3, 0.6, 0.5, 0.1);
    ps = r3.y * ps;
    r2.yz = r5.zw * r4.ww;
    r2.x = ps;
    r5.xyz = r2.xyz + r5.xyx;
    r5.xyz = r1.xyz * r5.xyz;
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
