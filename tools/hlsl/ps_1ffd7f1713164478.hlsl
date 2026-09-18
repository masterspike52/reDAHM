// ps_1ffd7f1713164478.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 171 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002AC 10040C00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c8); // float4
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c10); // float2
float4 SpotDirection : register(c9); // float3
float4 TwoSidedSign : register(c3); // float
float4 UniformVector_0 : register(c4); // float4
float4 UniformVector_1 : register(c5); // float4
float4 UniformVector_2 : register(c6); // float4
float4 UniformVector_3 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ShadowTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.xy = r1.xy + UniformVector_2.xy;
    r6.z = ps;
    ps = ScreenPositionScaleBias.x * r6.z;
    r10.xy = r1.xy + UniformVector_1.xy;
    r10.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xzw = -UniformVector_0.xyz + 1.0;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = ps;
    ps = ScreenPositionScaleBias.y * r6.z;
    r0.zw = r0.zw * abs(r8.xy);
    r10.w = ps;
    r6.zw = r10.zw * r5.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r7.y = tex2D(ShadowTexture, r0.xy).x;
    r8.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r12.xyz = tex2D(Texture2D_0, r10.xy).xyz;
    r10.xyz = tex2D(Texture2D_0, r6.xy).xyz;
    r1.yzw = tex2D(Texture2D_1, r1.xy).xyz;
    ps = r2.z;
    r6.y = dot(r4.zxy, r4.zxy);
    ps = 0.1 + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r1.x = ps;
    ps = 1.0 - r6.x;
    r0.w = dot(r2.zxy, r2.zxy);
    r6.w = saturate(ps);
    ps = rsqrt(abs(r6.x));
    r11.xyz = r1.yzw * UniformVector_3.xyz;
    r6.z = ps;
    r10.xyz = r10.xyz * 2.0 - 2.0;
    ps = rsqrt(abs(r0.w));
    r6.x = saturate(r1.x * 5.0);
    r0.w = ps;
    ps = rsqrt(abs(r6.y));
    r1.xyz = r0.www * r2.xyz;
    r6.y = ps;
    r2.xyz = r12.xyz * 2.0 + r10.xyz;
    ps = 1.0 - r6.x;
    r10.yzw = r6.zzz * -SpotDirection.xyz;
    r6.z = ps;
    ps = log2(r6.w);
    r0.xyz = r11.xyz * r0.xyz;
    r6.x = ps;
    r6.zw = -r6.zz * ModShadowGroupColor.xy + 1.0;
    ps = r6.y;
    r0.xyz = r0.xyz * r7.xzw;
    ps = r4.x * ps;
    r7.z = dot(r2.zxy, r2.zxy);
    r10.x = ps;
    ps = rsqrt(abs(r7.z));
    r7.x = dot(r10.wyz, r3.zxy);
    r7.z = ps;
    ps = r6.y;
    r2.xyz = r2.xyz * r7.zzz;
    ps = r4.y * ps;
    r7.z = dot(r2.zxy, r2.zxy);
    r10.y = ps;
    ps = rsqrt(abs(r7.z));
    r7.x = r7.x - SpotAngles.x;
    r7.z = ps;
    ps = r6.y;
    r2.xyz = r2.xyz * r7.zzz;
    ps = r4.z * ps;
    r2.xyz = r2.xyz * TwoSidedSign.xxx;
    r10.z = ps;
    r6.y = dot(r2.zxy, r10.zxy);
    r3.xyz = r2.xzy * r6.yyy;
    r3.xyz = r3.xyz * 2.0 - r10.xzy;
    r6.y = saturate(dot(r1.zxy, r3.yxz));
    ps = log2(r6.y);
    r7.x = saturate(r7.x * SpotAngles.y);
    r6.y = ps;
    ps = 15.0 * r6.y;
    r7.z = ps;
    ps = pow(2.0, r7.z);
    r6.y = saturate(dot(r2.zxy, r1.zxy));
    r8.x = ps;
    r1.xyz = r8.xyz * float3(0.1, 0.875, 0.875);
    r0.xyz = r0.xyz * r6.yyy + r1.xxx;
    r7.zw = r1.yz * r6.zw + 0.125;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r7.xyz = r7.zxy * r7.wxy;
    r6.w = ps;
    r6.xyz = r7.xxx * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r1.xyz = r7.zzz * r5.xyz;
    r6.w = ps;
    r1.xyz = r1.xyz * r6.www;
    r0.xyz = r1.xyz * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r0.xyz * r7.yyy;
    r6.xyz = r7.xyz * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
