// ps_f523112e53e20c81.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 243 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003CC 10040F00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c16); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_2, r1.xy);
    ps = (-0.5) + r15.w;
    r6.xy = r1.xy * UniformScalar_0.xx;
    r6.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r11.xyz = tex2D(Texture2D_0, r6.xy).xyw;
    ps = r1.z;
    r7.yw = r1.wz * UniformVector_4.xy;
    r7.x = saturate(ps);
    ps = r5.w;
    r12.xy = r1.xy * UniformScalar_7.xx;
    ps = 0.0001 * ps;
    r6.y = -UniformScalar_5.x + 1.0;
    r6.w = saturate(ps);
    ps = UniformScalar_6.x;
    r9.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = -UniformScalar_5.x + ps;
    r6.x = r2.z + 0.1;
    r6.z = ps;
    r13.xy = r11.xy * 2.0 - 1.0;
    ps = 1.0 / r6.z;
    r6.y = r6.y - r7.x;
    r6.z = ps;
    ps = 5.0 * r6.x;
    r14.w = saturate(r6.y * r6.z);
    r14.z = saturate(ps);
    ps = 1.0 / r5.w;
    r7.xz = -r14.zw + 1.0;
    r13.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.yz = r7.xx * ModShadowGroupColor.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xyz = -r6.ywz + 1.0;
    r0.w = ps;
    ps = UniformScalar_1.x * r6.y;
    r0.zw = r0.zw * abs(r8.xy);
    r9.x = ps;
    r5.xy = r9.yz * r13.ww + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r10.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r12.w = tex2D(ShadowTexture, r0.xy).x;
    r12.z = tex2D(Texture2D_4, r12.xy).x;
    r14.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r8.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r0.xyz = tex2D(Texture2D_5, r7.yw).xyz;
    r1.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r7.y = dot(r4.zxy, r4.zxy);
    r7.w = float((UniformScalar_10.x >= 1.0));
    r6.w = dot(r2.zxy, r2.zxy);
    r13.z = r1.z * 2.0 - 1.0;
    r12.xy = r1.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r0.w = float((UniformScalar_10.x > 1.0));
    r6.w = ps;
    r0.xyz = (-abs(r0.www) >= 0.0) ? r0.xyz : 1.0;
    r5.xyz = (-abs(r7.www) >= 0.0) ? 1.0 : r0.xyz;
    r0.xyz = r6.www * r2.xyz;
    r1.yzw = r14.www * r15.xyz;
    r8.xyz = r8.xyz * r15.xyz - r1.yzw;
    r13.xy = r9.xx * r13.xy + r12.xy;
    r13.xyz = r13.xyz * UniformVector_2.xyz;
    ps = rsqrt(abs(r7.y));
    r6.w = dot(r13.zxy, r13.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r6.w));
    r2.xyz = r7.yyy * r4.xyz;
    r6.w = ps;
    r13.xyz = r13.xyz * r6.www;
    r6.w = dot(r13.zxy, r2.zxy);
    r4.xyz = r13.xzy * r6.www;
    r2.xyz = r4.xyz * 2.0 - r2.xzy;
    r6.w = saturate(dot(r0.zxy, r2.yxz));
    ps = log2(r6.w);
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r14.z = ps;
    ps = UniformVector_3.x * UniformVector_3.w;
    r7.xyw = r14.xyz * float3(0.875, 0.875, 15.0);
    r2.x = ps;
    ps = UniformVector_3.y * UniformVector_3.w;
    r12.xy = r7.xy * r6.xz;
    r2.y = ps;
    ps = UniformVector_3.z * UniformVector_3.w;
    r12.xyz = r12.xyz + float3(0.125, 0.125, 0.5);
    r2.z = ps;
    ps = r7.z;
    r6.w = saturate(dot(r13.zxy, r0.zxy));
    ps = r12.z * ps;
    r0.xy = r12.xw * r12.yw;
    r11.w = ps;
    r7.xyz = r0.xxx * r4.xyz + ModShadowColor.xyz;
    ps = -UniformVector_0.x;
    r4.xy = r11.zw + float2(-1.0, -0.5);
    ps = 1.0 + ps;
    r0.xyz = r0.yyy * r10.xyz;
    r1.x = ps;
    r6.x = r4.x * r6.y + 1.0;
    ps = -UniformVector_0.y;
    r6.y = saturate(r4.y * 5.0000005);
    r1.yzw = r6.yyy * r8.xyz + r1.yzw;
    r6.x = (r9.x > 0.0) ? r6.x : 1.0;
    r6.x = (r9.x >= 0.0) ? r6.x : 1.0;
    ps = 1.0 + ps;
    r2.xyz = r2.xyz * r1.yzw;
    r1.y = ps;
    ps = -UniformVector_0.z;
    r2.xyz = r2.xyz * r5.xyz;
    ps = 1.0 + ps;
    r2.xyz = r2.xyz * r6.xxx;
    r1.z = ps;
    r1.xyz = r2.xyz * r1.xyz;
    ps = pow(2.0, r7.w);
    r3.xyz = -r2.xyz + r3.xyz;
    r6.x = ps;
    r2.xyz = r3.xyz * UniformScalar_11.xxx + r2.xyz;
    r2.xyz = r2.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r6.xyz = r6.xzy * r7.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
