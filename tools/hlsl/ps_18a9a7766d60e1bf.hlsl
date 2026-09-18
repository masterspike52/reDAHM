// ps_18a9a7766d60e1bf.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 147 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000024C 10040A00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c9); // float4
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_1 : register(c6); // float
float4 UniformScalar_2 : register(c7); // float
float4 UniformScalar_8 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = ps;
    ps = 1.0 / r4.w;
    r5.zw = UniformVector_1.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r5.yy * ScreenPositionScaleBias.xy;
    r5.y = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r5.zw).xyz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r5.z = tex2D(Texture2D_2, r0.xy).x;
    ps = r1.z;
    r0.x = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.w = ps;
    ps = 1.0 - r5.z;
    r0.y = dot(r2.zxy, r2.zxy);
    r10.w = ps;
    r9.xyz = r8.xyz * r4.xyz - r8.xyz;
    ps = rsqrt(abs(r6.w));
    r0.y = saturate(-r0.y + 1.0);
    r1.w = ps;
    ps = rsqrt(abs(r0.x));
    r6.w = saturate(r1.w * r1.z);
    r0.z = ps;
    ps = 0.875 * r5.x;
    r7.z = max(UniformScalar_8.x, 0.0001);
    r7.x = ps;
    ps = 0.875 * r5.y;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r7.y = ps;
    ps = 5.0 * r5.w;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r10.xyz = r10.xyz * r5.zzz;
    r0.x = ps;
    r9.xyz = r9.xyz * UniformScalar_0.xxx + r8.xyz;
    ps = log2(r0.y);
    r5.yzw = r0.zzz * r3.zxy;
    r5.x = ps;
    r0.yzw = r9.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    ps = -r5.z;
    r8.xyz = r1.www * r1.zxy;
    r5.z = ps;
    r5.y = r5.y * 2.0 - r5.y;
    r3.zw = -r0.xx * ModShadowGroupColor.xy + 1.0;
    ps = -r5.w;
    r1 = r10 * r9.xyzz;
    r5.w = ps;
    r3.xy = r10.ww * r9.xy + r1.xy;
    r7.xy = r7.xy * r3.zw + 0.125;
    r5.y = saturate(dot(r8.yzx, r5.zwy));
    ps = log2(r5.y);
    r3.z = r1.z + r1.w;
    r7.w = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r1.xw = r7.xz * r7.yw;
    r5.w = ps;
    r5.xyz = r1.xxx * r4.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.w);
    r1.xyz = r3.xyz * r2.xyz;
    r0.x = ps;
    ps = pow(2.0, r5.w);
    r0.xyz = r0.yzw * r0.xxx;
    r5.w = ps;
    r0.xy = r1.xy * r6.ww + r0.xy;
    r0.z = r1.z * r6.w + r0.z;
    r0.xyz = r0.xyz * r5.www;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
