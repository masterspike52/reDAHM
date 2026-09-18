// ps_14f2fe24283f6413.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 168 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002A0 10040C00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c9); // float3
float4 ModShadowAccumResolution : register(c12); // float2
float4 ModShadowColor : register(c10); // float3
float4 ModShadowGroupColor : register(c11); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c4); // float
float4 UniformScalar_1 : register(c5); // float
float4 UniformScalar_2 : register(c6); // float
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_7 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
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

    r1.w = dot(r3.zxy, r3.zxy);
    r5.x = 1.0 / r4.w;
    r6.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = 1.0 / ModShadowAccumResolution.y;
    r5.z = r1.z + 0.1;
    r5.x = 1.0 / ModShadowAccumResolution.x;
    r5.xy = r5.xy * abs(r7.xy);
    r7.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r8.x = max(UniformScalar_7.x, 0.0001);
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = float((UniformScalar_0.x >= UniformScalar_1.x));
    r5.w = float((UniformScalar_0.x > UniformScalar_1.x));
    r0.w = dot(r1.zxy, r1.zxy);
    r8.y = 0.875 * r5.x;
    r0.xyz = r0.xyz * r2.www;
    r8.z = 0.875 * r5.y;
    r12.xyz = r12.xyz * 2.0 - 1.0;
    r2.xyz = r11.xyz * 2.0 - 1.0;
    r11.xyz = r10.xyz * r4.xyz;
    r5.x = rsqrt(abs(r0.w));
    r4.xyz = r5.xxx * r1.xyz;
    r5.x = rsqrt(abs(r1.w));
    r1.xyz = r5.xxx * r3.xyz;
    r5.x = saturate(5.0 * r5.z);
    r3.xyz = r12.xyz - r2.xyz;
    r5.x = 1.0 - r5.x;
    r5.yzw = (-abs(r5.www) >= 0.0) ? r10.xyz : r11.xyz;
    r5.yzw = (-abs(r6.www) >= 0.0) ? r10.xyz : r5.yzw;
    r2.xyz = r3.xyz * UniformScalar_0.xxx + r2.xyz;
    r3.xy = -r5.xx * ModShadowGroupColor.xy + 1.0;
    r8.yz = r8.yz * r3.xy + 0.125;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r5.x));
    r5.yzw = r5.yzw - r6.xyz;
    r5.x = ps;
    r5.yzw = r5.yzw * UniformScalar_0.xxx + r6.xyz;
    r6.yzw = r5.yzw * UniformScalar_2.xxx + UniformScalar_3.xxx;
    r3.xyz = r2.xyz * r5.xxx;
    r5.x = dot(r3.zxy, r1.zxy);
    r2.xyz = r3.xzy * r5.xxx;
    r1.xyz = r2.xyz * 2.0 - r1.xzy;
    r5.x = saturate(dot(r4.zxy, r1.yxz));
    ps = log2(r5.x);
    r1.xyz = r5.yzw * r9.xyz;
    r8.w = ps;
    r2.xy = r8.xy * r8.wz;
    r5.xyz = r2.yyy * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r2.x);
    r5.w = saturate(dot(r3.zxy, r4.zxy));
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w + r6.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
