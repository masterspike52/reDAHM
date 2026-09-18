// ps_bf7b346844786e4d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10040A00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r8.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r5.y = dot(r1.zxy, r1.zxy);
    r6.w = ps;
    ps = r1.z;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.z = ps;
    ps = 1.0 - r5.x;
    r2.zw = r8.xy * 0.875;
    r7.w = saturate(ps);
    r0.xyz = r0.xyz * 2.0 - 1.0;
    ps = 5.0 * r5.z;
    r8.xyz = r4.zzz * UniformVector_3.xyz;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r5.w));
    r10.xyz = -r7.xyz + r10.xyz;
    r5.z = ps;
    r7.xyz = r10.xyz * UniformScalar_0.xxx + r7.xyz;
    ps = rsqrt(abs(r5.y));
    r3.xyz = r5.zzz * r3.xyz;
    r5.y = ps;
    ps = 1.0 - r5.x;
    r1.yzw = r5.yyy * r1.xyz;
    r0.w = ps;
    r5.yzw = r4.yyy * UniformVector_2.xyz + r8.xyz;
    ps = log2(r7.w);
    r5.x = dot(r0.zxy, r0.zxy);
    r7.w = ps;
    ps = rsqrt(abs(r5.x));
    r7.w = r7.w * LightColorAndFalloffExponent.w;
    r5.x = ps;
    r5.yzw = r4.xxx * UniformVector_1.xyz + r5.yzw;
    r2.xy = -r0.ww * ModShadowGroupColor.xy + 1.0;
    r2.xy = r2.zw * r2.xy + 0.125;
    r5.yzw = (-abs(r6.www) >= 0.0) ? 1.0 : r5.yzw;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r0.xyz = r0.xyz * r5.xxx;
    r0.w = ps;
    ps = -ModShadowColor.x;
    r6.w = saturate(dot(r0.zxy, r1.wyz));
    ps = 1.0 + ps;
    r5.x = dot(r0.zxy, r3.zxy);
    r1.x = ps;
    r5.yzw = (-abs(r0.www) >= 0.0) ? 1.0 : r5.yzw;
    ps = UniformScalar_5.x * r5.y;
    r4.xyz = r0.xzy * r5.xxx;
    r8.x = ps;
    ps = UniformScalar_5.x * r5.z;
    r0.xyz = r7.xyz * r5.yzw;
    r8.y = ps;
    ps = UniformScalar_5.x * r5.w;
    r0.xyz = r0.xyz * r9.xyz;
    r8.z = ps;
    ps = -ModShadowColor.y;
    r7.xyz = r8.xyz * r7.xyz;
    r5.xyz = r4.xyz * 2.0 - r3.xzy;
    ps = 1.0 + ps;
    r2.w = saturate(dot(r1.wyz, r5.yxz));
    r1.y = ps;
    ps = -ModShadowColor.z;
    r2.z = r2.w * r2.w;
    ps = 1.0 + ps;
    r5.xw = r2.xz * r2.yw;
    r1.z = ps;
    r5.xyz = r5.xxx * r1.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r7.w);
    r7.xyz = r7.xyz * r5.www;
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
