// ps_563abbdb7990a502.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 10040A00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c7); // float4
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_7 : register(c4); // float
float4 UniformScalar_8 : register(c5); // float
float4 UniformScalar_9 : register(c6); // float
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r7.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.x = tex2D(Texture2D_1, r0.xy).x;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = UniformScalar_9.x;
    r0.yzw = -UniformVector_0.xyz + 1.0;
    r5.y = ps;
    ps = 0.0001;
    r6.y = dot(r1.zxy, r1.zxy);
    r5.w = ps;
    ps = r1.z;
    r6.z = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.z = ps;
    ps = 1.0 - r5.x;
    r2.xy = r10.xy * 0.875;
    r1.w = saturate(ps);
    r10.xyz = r9.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r6.x = -r6.x + 1.0;
    r5.x = ps;
    ps = rsqrt(abs(r6.y));
    r9.xyz = r5.xxx * r3.xyz;
    r5.x = ps;
    ps = 5.0 * r5.z;
    r3.xyz = r5.xxx * r1.xyz;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r6.yzw = r6.xxx * r7.yzx;
    r0.x = ps;
    ps = log2(r1.w);
    r5.z = dot(r10.zxy, r10.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.z));
    r0.yzw = r6.wyz * r0.yzw;
    r5.z = ps;
    r1.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r2.yz = r2.xy * r1.xy + 0.125;
    ps = max(r5.y, r5.w);
    r1.xzw = r10.xyz * r5.zzz;
    r2.x = ps;
    ps = r6.x;
    r0.x = saturate(dot(r1.wxz, r3.zxy));
    r5.y = ps;
    ps = UniformScalar_7.x * r5.y;
    r5.z = dot(r1.wxz, r9.zxy);
    r1.y = ps;
    ps = UniformScalar_7.x * r6.y;
    r5.yzw = r1.xwz * r5.zzz;
    r1.z = ps;
    r5.yzw = r5.yzw * 2.0 - r9.xzy;
    ps = UniformScalar_7.x * r6.z;
    r5.y = saturate(dot(r3.zxy, r5.zyw));
    r1.w = ps;
    ps = log2(r5.y);
    r1.x = r1.y * r7.x;
    r2.w = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.xy = r2.xy * r2.wz;
    r5.w = ps;
    r5.xyz = r6.yyy * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.x);
    r6.yzw = r1.xwz + UniformScalar_8.xxx;
    r6.x = ps;
    ps = pow(2.0, r5.w);
    r6.xyz = r6.ywz * r6.xxx;
    r5.w = ps;
    r6.xy = r0.yz * r0.xx + r6.xy;
    r6.z = r0.w * r0.x + r6.z;
    r6.xyz = r6.xyz * r5.www;
    r6.xyz = r6.xyz * r4.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
