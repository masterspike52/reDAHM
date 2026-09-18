// ps_b5fb17d65574cb9f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 177 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002C4 10040C00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c9); // float
float4 UniformScalar_11 : register(c10); // float
float4 UniformScalar_7 : register(c6); // float
float4 UniformScalar_8 : register(c7); // float
float4 UniformScalar_9 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_4 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color1;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_2, r0.xy);
    ps = (-0.5) + r12.w;
    r6.z = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r6.y = tex2D(Texture2D_1, r0.xy).x;
    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = r4.w;
    r5.w = r1.z + 0.1;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r5.w = saturate(r5.w * 5.0);
    r6.x = saturate(ps);
    ps = rsqrt(abs(r6.z));
    r5.w = -r5.w + 1.0;
    r6.z = ps;
    ps = UniformVector_2.x * r5.y;
    r7.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = UniformVector_2.y * r5.z;
    r10.xyz = r6.zzz * r1.xyz;
    r5.z = ps;
    ps = UniformVector_2.z * r5.x;
    r6.zw = r5.ww * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = (-1.0) - -r5.x;
    r9.xyz = -r6.xzw + 1.0;
    r5.w = ps;
    r5.xyz = r5.wyz * r9.xxx;
    ps = 1.0 + r5.x;
    r1.xyz = UniformVector_4.xyz * UniformVector_4.www;
    r5.w = ps;
    r5.xyz = (r9.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r6.xzw = (r9.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.x));
    r5.x = dot(r6.wxz, r6.wxz);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r5.yzw = r5.yyy * r3.xyz;
    r5.x = ps;
    r11.xyz = r6.xzw * r5.xxx;
    ps = 1.0 / r4.w;
    r5.x = dot(r11.zxy, r5.wyz);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xyz = r11.xyz * r5.xxx;
    r5.x = ps;
    r5.yzw = r7.xyz * 2.0 - r5.yzw;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = saturate(dot(r10.zxy, r5.wyz));
    r5.z = ps;
    ps = log2(r5.y);
    r7.z = r6.y * UniformScalar_8.x;
    r5.y = ps;
    ps = UniformScalar_7.x * r5.y;
    r7.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    ps = pow(2.0, r5.w);
    r5.xz = r5.xz * abs(r8.xy);
    r6.y = ps;
    r7.xyw = r7.xyz * r6.xxy;
    r6.xy = r7.xy + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r5.zw = tex2D(ModShadowAccumTexture, r5.xz).xy;
    ps = -ModShadowColor.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r4.x = float((UniformScalar_9.x >= 1.0));
    r3.x = ps;
    ps = -ModShadowColor.y;
    r0.w = float((UniformScalar_9.x > 1.0));
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r3.y = ps;
    ps = 1.0 - r5.x;
    r2.xyz = r1.xyz * r12.xyz;
    r5.x = saturate(ps);
    r1.xyz = r2.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = log2(r5.x);
    r0.xyz = r2.xyz * r0.xyz;
    r5.x = ps;
    ps = -ModShadowColor.z;
    r6.w = saturate(dot(r11.zxy, r10.zxy));
    ps = 1.0 + ps;
    r7.xyz = r5.yzw * float3(15.0, 0.875, 0.875);
    r3.z = ps;
    r4.yz = r7.yz * r9.yz + 0.125;
    r4.w = (r0.w > 0.0) ? 0.0 : r7.w;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r7.yz = r4.xy * r4.wz;
    r5.w = ps;
    r5.xyz = r7.zzz * r3.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r7.x);
    r7.yzw = r1.xyz + r7.yyy;
    r7.x = ps;
    ps = pow(2.0, r5.w);
    r7.xyz = r7.yzw * r7.xxx;
    r5.w = ps;
    r7.xy = r0.xy * r6.ww + r7.xy;
    r7.z = r0.z * r6.w + r7.z;
    r7.xyz = r7.xyz * r5.www;
    r6.xyz = r7.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
