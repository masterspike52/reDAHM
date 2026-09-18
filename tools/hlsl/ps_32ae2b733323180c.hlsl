// ps_32ae2b733323180c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 258 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000408 10041100 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c16); // float4
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c12); // float
float4 UniformScalar_11 : register(c13); // float
float4 UniformScalar_12 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformScalar_7 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ShadowTexture : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_2, r1.xy);
    ps = (-0.5) + r10.w;
    r6.xy = r1.xy * UniformScalar_0.xx;
    r6.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r12.xyz = tex2D(Texture2D_0, r6.xy).xyw;
    ps = r1.z;
    r7.yw = r1.wz * UniformVector_4.xy;
    r7.x = saturate(ps);
    ps = r5.w;
    r13.yz = r1.xy * UniformScalar_7.xx;
    ps = 0.0001 * ps;
    r6.y = -UniformScalar_5.x + 1.0;
    r6.w = saturate(ps);
    ps = UniformScalar_6.x;
    r9.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = -UniformScalar_5.x + ps;
    r6.x = r2.z + 0.1;
    r6.z = ps;
    r15.xy = r12.xy * 2.0 - 1.0;
    ps = 1.0 / r6.z;
    r6.y = r6.y - r7.x;
    r6.z = ps;
    ps = 5.0 * r6.x;
    r14.w = saturate(r6.y * r6.z);
    r14.z = saturate(ps);
    ps = 1.0 / r5.w;
    r7.xz = -r14.zw + 1.0;
    r15.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.yz = r7.xx * ModShadowGroupColor.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xyz = -r6.yzw + 1.0;
    r0.w = ps;
    ps = UniformScalar_1.x * r6.z;
    r0.zw = r0.zw * abs(r8.xy);
    r9.x = ps;
    r8.xy = r9.yz * r15.ww + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r11.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r13.x = tex2D(ShadowTexture, r0.xy).x;
    r13.y = tex2D(Texture2D_4, r13.yz).x;
    r14.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r16.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r0.xyz = tex2D(Texture2D_5, r7.yw).xyz;
    r17.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r8.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = dot(r4.zxy, r4.zxy);
    r0.w = float((UniformScalar_10.x >= 1.0));
    r1.w = float((UniformScalar_10.x > 1.0));
    r6.w = dot(r2.zxy, r2.zxy);
    r7.y = dot(r3.zxy, r3.zxy);
    r15.z = r17.z * 2.0 - 1.0;
    r13.zw = r17.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r7.y = saturate(-r7.y + 1.0);
    r6.w = ps;
    r0.xyz = (-abs(r1.www) >= 0.0) ? r0.xyz : 1.0;
    r3.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r0.xyz;
    r0.yzw = r6.www * r2.xyz;
    r2.xyz = r14.www * r10.xyz;
    r10.xyz = r16.xyz * r10.xyz - r2.xyz;
    r15.xy = r9.xx * r15.xy + r13.zw;
    r16.xyz = r15.xyz * UniformVector_2.xyz;
    ps = rsqrt(abs(r7.w));
    r6.w = dot(r16.zxy, r16.zxy);
    r7.w = ps;
    ps = rsqrt(abs(r6.w));
    r15.xyz = r7.www * r4.xyz;
    r6.w = ps;
    r4.xyz = r16.xyz * r6.www;
    r6.w = dot(r4.zxy, r15.zxy);
    r16.xyz = r4.xzy * r6.www;
    r15.xyz = r16.xyz * 2.0 - r15.xzy;
    ps = log2(r7.y);
    r6.w = saturate(dot(r0.wyz, r15.yxz));
    r7.y = ps;
    ps = log2(r6.w);
    r0.x = r7.y * LightColorAndFalloffExponent.w;
    r14.z = ps;
    r7.xyw = r14.xyz * float3(0.875, 0.875, 15.0);
    r13.zw = r7.xy * r6.xy;
    r13.yzw = r13.yzw + float3(0.5, 0.125, 0.125);
    ps = r7.z;
    r6.w = saturate(dot(r4.zxy, r0.wyz));
    ps = r13.y * ps;
    r0.yz = r13.xz * r13.xw;
    r12.w = ps;
    r7.xyz = r0.zzz * r1.xyz + ModShadowColor.xyz;
    r6.xy = r12.wz + float2(-0.5, -1.0);
    ps = pow(2.0, r0.x);
    r0.yzw = r0.yyy * r11.xyz;
    r0.x = ps;
    r0.xyz = r0.ywz * r0.xxx;
    r6.z = r6.y * r6.z + 1.0;
    ps = 5.0000005 * r6.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = saturate(ps);
    r2.xyz = r6.xxx * r10.xyz + r2.xyz;
    r6.x = (r9.x > 0.0) ? r6.z : 1.0;
    r6.x = (r9.x >= 0.0) ? r6.x : 1.0;
    r2.xyz = r8.xyz * r2.xyz;
    r2.xyz = r2.xyz * r3.xyz;
    r2.xyz = r2.xyz * r6.xxx;
    r1.xyz = r2.xyz * r1.xyz;
    ps = pow(2.0, r7.w);
    r3.xyz = -r2.xyz + r5.xyz;
    r6.x = ps;
    r2.xyz = r3.xyz * UniformScalar_11.xxx + r2.xyz;
    r2.xyz = r2.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r7.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
