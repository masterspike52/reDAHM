// ps_ab51a834b6103f27.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 162 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000288 10040B00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c7); // float4
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c9); // float2
float4 SpotDirection : register(c8); // float3
float4 UniformScalar_7 : register(c4); // float
float4 UniformScalar_8 : register(c5); // float
float4 UniformScalar_9 : register(c6); // float
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_3 : register(s3);
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r6.xx * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = r2.z + 0.1;
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r7.xy = r7.xy * r5.xy + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r9.z = tex2D(ShadowTexture, r0.xy).x;
    r0.xyw = tex2D(Texture2D_3, r1.xy).yzx;
    r7.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.w = tex2D(Texture2D_1, r1.xy).x;
    ps = -ModShadowColor.x;
    r5.y = max(UniformScalar_9.x, 0.0001);
    ps = 1.0 + ps;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = -ModShadowColor.y;
    r1.w = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r7.x = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = 1.0 - r7.x;
    r1.x = dot(r4.zxy, r4.zxy);
    r0.z = saturate(ps);
    r7.yzw = r7.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r1.x));
    r6.z = saturate(r6.z * 5.0);
    r1.x = ps;
    ps = rsqrt(abs(r1.w));
    r1.xyz = r1.xxx * r4.xyz;
    r1.w = ps;
    ps = 1.0 - r6.w;
    r4.xyz = r1.www * r2.xyz;
    r2.x = ps;
    ps = rsqrt(abs(r7.x));
    r6.w = dot(r7.wyz, r7.wyz);
    r7.x = ps;
    ps = 0.875 * r6.x;
    r10.xyz = r7.xxx * -SpotDirection.xyz;
    r9.x = ps;
    ps = log2(r0.z);
    r2.yzw = r2.xxx * r0.wxy;
    r6.x = ps;
    ps = 0.875 * r6.y;
    r0.xyz = r2.yzw * r11.xyz;
    r9.y = ps;
    ps = 1.0 - r6.z;
    r6.y = dot(r10.zxy, r3.zxy);
    r6.z = ps;
    r3.xy = -r6.zz * ModShadowGroupColor.xy + 1.0;
    r9.xy = r9.xy * r3.xy + 0.125;
    ps = rsqrt(abs(r6.w));
    r2.yzw = r2.xzw * UniformScalar_7.xxx;
    r6.z = ps;
    ps = -ModShadowColor.z;
    r7.xyz = r7.yzw * r6.zzz;
    ps = 1.0 + ps;
    r7.w = saturate(dot(r7.zxy, r4.zxy));
    r5.w = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r2.x = r2.y * r0.w;
    r6.z = ps;
    ps = r9.x * r9.y;
    r6.w = dot(r7.zxy, r1.zxy);
    r6.x = ps;
    ps = r9.z * r9.z;
    r3.xyz = r7.xzy * r6.www;
    r6.w = ps;
    r7.xyz = r6.xxx * r5.xzw + ModShadowColor.xyz;
    ps = -SpotAngles.x - -r6.y;
    r2.xyz = r2.xwz + UniformScalar_8.xxx;
    r6.x = ps;
    r1.xyz = r3.xyz * 2.0 - r1.xzy;
    ps = SpotAngles.y * r6.x;
    r6.y = saturate(dot(r4.zxy, r1.yxz));
    r5.x = saturate(ps);
    ps = log2(r6.y);
    r1.xyz = r6.www * r8.xyz;
    r5.z = ps;
    ps = pow(2.0, r6.z);
    r6.xy = r5.xy * r5.xz;
    r6.z = ps;
    ps = pow(2.0, r6.y);
    r1.xyz = r1.xzy * r6.zzz;
    r6.z = ps;
    r6.yzw = r2.xzy * r6.zzz;
    r0.xy = r0.xy * r7.ww + r6.yz;
    r0.z = r0.z * r7.w + r6.w;
    r0.xyz = r1.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r0.xzy * r6.xxx;
    r6.xyz = r6.xzy * r7.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
