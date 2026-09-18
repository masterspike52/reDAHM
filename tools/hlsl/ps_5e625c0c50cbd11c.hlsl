// ps_5e625c0c50cbd11c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 177 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002C4 10040A00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_2, r0.xy).wxyz;
    ps = 1.0 / r4.w;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r5.xy = r5.yz * r5.xx + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r9.x - 0.5;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.yzw = UniformVector_4.xyz * UniformVector_4.www;
    r5.z = ps;
    r5.zw = r5.zw * abs(r8.xy);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r6.zw = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r7.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r6.y = tex2D(Texture2D_1, r0.xy).x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    ps = r4.w;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.0001 * ps;
    r9.x = float((UniformScalar_9.x >= 1.0));
    r10.x = saturate(ps);
    ps = r1.z;
    r0.w = float((UniformScalar_9.x > 1.0));
    ps = 0.1 + ps;
    r6.x = dot(r2.zxy, r2.zxy);
    r5.w = ps;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    ps = 5.0 * r5.w;
    r7.w = dot(r1.zxy, r1.zxy);
    r5.w = saturate(ps);
    ps = rsqrt(abs(r7.w));
    r9.yzw = r10.yzw * r9.yzw;
    r1.w = ps;
    r4.xyz = r9.yzw * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = 1.0 - r5.w;
    r7.w = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    ps = UniformVector_2.x * r5.y;
    r7.xyz = r7.xyz * r2.www;
    r5.y = ps;
    ps = rsqrt(abs(r7.w));
    r2.xyz = r1.www * r1.xyz;
    r7.w = ps;
    ps = UniformVector_2.y * r5.z;
    r3.xyz = r7.www * r3.xyz;
    r5.z = ps;
    ps = UniformVector_2.z * r5.x;
    r10.yz = r5.ww * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = (-1.0) - -r5.x;
    r1.xyz = -r10.xyz + 1.0;
    r5.w = ps;
    r10.xyw = r5.yzw * r1.xxx;
    ps = 1.0 - r6.x;
    r10.z = r10.w + 1.0;
    r5.x = saturate(ps);
    r5.yzw = (r1.xxx > 0.0) ? r10.xyz : float3(0.0, 0.0, 1.0);
    r10.xyz = (r1.xxx >= 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    ps = log2(r5.x);
    r5.y = dot(r10.zxy, r10.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.y));
    r5.x = r5.x * LightColorAndFalloffExponent.w;
    r5.y = ps;
    r5.yzw = r10.xyz * r5.yyy;
    r6.x = dot(r5.wyz, r3.zxy);
    ps = UniformScalar_8.x * r6.y;
    r10.xyz = r5.yzw * r6.xxx;
    r7.w = ps;
    r3.xyz = r10.xyz * 2.0 - r3.xyz;
    ps = pow(2.0, r5.x);
    r6.x = saturate(dot(r2.zxy, r3.zxy));
    r5.x = ps;
    ps = log2(r6.x);
    r0.xyz = r9.yzw * r0.xyz;
    r6.y = ps;
    ps = UniformScalar_7.x * r6.y;
    r5.w = saturate(dot(r5.wyz, r2.zxy));
    r5.y = ps;
    ps = pow(2.0, r5.y);
    r6.xyz = r6.yzw * float3(15.0, 0.875, 0.875);
    r5.y = ps;
    r9.yz = r6.yz * r1.yz + 0.125;
    r7 = r7.xzyw * r5.xxxy;
    r9.w = (r0.w > 0.0) ? 0.0 : r7.w;
    r6.yz = r9.xy * r9.wz;
    r5.xyz = r6.zzz * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.x);
    r6.yzw = r4.xyz + r6.yyy;
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r0.xy * r5.ww + r6.xy;
    r6.z = r0.z * r5.w + r6.z;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
