// ps_e2b4dd96ab5f5057.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10040C00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 UniformScalar_0 : register(c4); // float
float4 UniformScalar_1 : register(c5); // float
float4 UniformScalar_2 : register(c6); // float
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_9 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
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
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.w = float((UniformScalar_0.x >= UniformScalar_1.x));
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r6.yzw = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r7.yzw = tex2D(Texture2D_1, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.xz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r4.z = max(UniformScalar_9.x, 0.0001);
    ps = -UniformVector_0.x;
    r0.w = float((UniformScalar_0.x > UniformScalar_1.x));
    ps = 1.0 + ps;
    r1.w = dot(r3.zxy, r3.zxy);
    r7.x = ps;
    ps = r1.z;
    r3.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r5.y = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = 0.875 * r5.x;
    r12.xyz = r11.zxy + float3(-2.0, 0.0, 0.0);
    r4.x = ps;
    ps = rsqrt(abs(r3.w));
    r0.xyz = r10.xyz * r9.xyz;
    r2.x = ps;
    ps = rsqrt(abs(r1.w));
    r2.xyz = r2.xxx * r1.xyz;
    r1.x = ps;
    ps = 0.875 * r5.z;
    r9.xyz = r1.xxx * r3.xyz;
    r4.y = ps;
    ps = 5.0 * r6.x;
    r1.xyz = r12.yzx + r11.xyz;
    r5.x = saturate(ps);
    r0.xyz = (-abs(r0.www) >= 0.0) ? r10.xyz : r0.xyz;
    r0.xyz = (-abs(r5.www) >= 0.0) ? r10.xyz : r0.xyz;
    ps = 1.0 - r5.x;
    r1.xyz = r1.xyz + float3(-1.0, -1.0, 0.0);
    r5.x = ps;
    r5.xz = -r5.xx * ModShadowGroupColor.xy + 1.0;
    r4.xy = r4.xy * r5.xz + 0.125;
    ps = 1.0 - r5.y;
    r5.xzw = r1.zxy * UniformScalar_0.xxx;
    r0.w = saturate(ps);
    ps = 1.0 + r5.x;
    r0.xyz = r0.xyz - r7.yzw;
    r5.y = ps;
    r1.xyz = r0.xyz * UniformScalar_0.xxx + r7.yzw;
    r0.xyz = r1.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = log2(r0.w);
    r6.x = dot(r5.yzw, r5.yzw);
    r0.w = ps;
    ps = rsqrt(abs(r6.x));
    r0.w = r0.w * LightColorAndFalloffExponent.w;
    r6.x = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r5.zwy * r6.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r3.zxy, r9.zxy);
    r7.y = ps;
    ps = -UniformVector_0.z;
    r5.xyz = r3.xzy * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r9.xzy;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r2.zxy, r5.yxz));
    r7.z = ps;
    ps = log2(r5.x);
    r1.xyz = r1.xyz * r7.xyz;
    r4.w = ps;
    r5.xw = r4.xz * r4.yw;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r5.w);
    r6.x = saturate(dot(r3.zxy, r2.zxy));
    r5.w = ps;
    ps = pow(2.0, r0.w);
    r0.xyz = r0.xyz * r5.www;
    r5.w = ps;
    r0.xy = r1.xy * r6.xx + r0.xy;
    r0.z = r1.z * r6.x + r0.z;
    r0.xyz = r0.xyz * r5.www;
    r6.xyz = r0.xyz * r6.yzw;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
