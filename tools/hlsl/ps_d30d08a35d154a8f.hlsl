// ps_d30d08a35d154a8f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10040B00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
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
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = ps;
    ps = 1.0 / r4.w;
    r6.xy = UniformVector_2.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r0.ww * ScreenPositionScaleBias.xy;
    r0.w = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r4.xy = r6.zw * r4.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r10.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r8.xyw = tex2D(Texture2D_2, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_4, r6.xy).xyz;
    r11.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r4.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0.y = tex2D(Texture2D_3, r0.xy).x;
    ps = -UniformVector_0.x;
    r8.z = max(UniformScalar_9.x, 0.0001);
    ps = 1.0 + ps;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = -UniformVector_0.y;
    r3.w = float((UniformScalar_1.x >= UniformScalar_0.x));
    ps = 1.0 + ps;
    r6.w = float((UniformScalar_1.x > UniformScalar_0.x));
    r6.y = ps;
    ps = -UniformVector_0.z;
    r7.w = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r0.w = r1.z + 0.1;
    r6.z = ps;
    ps = 1.0 - r0.y;
    r0.x = dot(r2.zxy, r2.zxy);
    r9.w = ps;
    ps = 1.0 - r0.x;
    r0.z = dot(r1.zxy, r1.zxy);
    r5.w = saturate(ps);
    ps = 0.875 * r4.x;
    r2.xyz = r11.xyz * UniformVector_1.xyz;
    r4.z = ps;
    ps = 0.875 * r4.y;
    r9.xyz = r9.xyz * r0.yyy;
    r4.w = ps;
    ps = rsqrt(abs(r0.z));
    r0.x = saturate(r0.w * 5.0);
    r4.x = ps;
    ps = 1.0 - r0.x;
    r0.yzw = r10.xyz * r8.xyw;
    r2.w = ps;
    ps = rsqrt(abs(r7.w));
    r1.w = saturate(r4.x * r1.z);
    r0.x = ps;
    r8.xyw = (-abs(r6.www) >= 0.0) ? r10.xyz : r0.yzw;
    ps = log2(r5.w);
    r0.yzw = r0.xxx * r3.zxy;
    r0.x = ps;
    ps = -r0.z;
    r1.xyz = r4.xxx * r1.zxy;
    r0.z = ps;
    r0.y = r0.y * 2.0 - r0.y;
    r3.xyz = (-abs(r3.www) >= 0.0) ? r10.xyz : r8.xyw;
    r4.xy = -r2.ww * ModShadowGroupColor.xy + 1.0;
    r8.xy = r4.zw * r4.xy + 0.125;
    ps = -r0.w;
    r3.xyz = -r2.xyz + r3.xyz;
    r0.w = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r1.x = saturate(dot(r1.yzx, r0.zwy));
    r0.w = ps;
    r0.xyz = r3.xyz * UniformScalar_1.xxx + r2.xyz;
    r3.xyz = r0.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = log2(r1.x);
    r2 = r9 * r0.xyzz;
    r8.w = ps;
    r2.xy = r9.ww * r0.xy + r2.xy;
    ps = r2.z + r2.w;
    r1.xy = r8.xz * r8.yw;
    r2.z = ps;
    r0.xyz = r1.xxx * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.y);
    r2.xyz = r2.xyz * r6.xyz;
    r1.x = ps;
    ps = pow(2.0, r0.w);
    r1.xyz = r3.xyz * r1.xxx;
    r0.w = ps;
    r1.xy = r2.xy * r1.ww + r1.xy;
    r1.z = r2.z * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.www;
    r1.xyz = r1.xyz * r5.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
