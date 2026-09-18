// ps_1e374183f69db812.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 129 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000204 10040B00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_2 : register(s2);
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
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = ps;
    ps = 1.0 / r4.w;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r7.xy = r5.zw * abs(r7.xy);
    r6.xy = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    r2.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_2, r0.xy).zxy;
    r4.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r6.xyz = tex2D(Texture2D_3, r0.xy).zxy;
    r0.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    ps = UniformScalar_0.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = ps;
    ps = 0.0001;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r7.y = ps;
    ps = max(r7.x, r7.y);
    r0.w = dot(r3.zxy, r3.zxy);
    r9.x = ps;
    ps = r1.z;
    r6.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r7.xy = r0.xy * 0.875;
    r5.w = ps;
    ps = UniformVector_3.x * r6.y;
    r0.xyz = r4.xzy * LightColor.xzy;
    r2.x = ps;
    r2.yzw = r2.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r5.w = saturate(r5.w * 5.0);
    r6.w = ps;
    ps = 1.0 - r5.w;
    r4.xyz = r6.www * r1.xyz;
    r6.w = ps;
    ps = rsqrt(abs(r0.w));
    r5.w = dot(r2.wyz, r2.wyz);
    r0.w = ps;
    ps = rsqrt(abs(r5.w));
    r3.xyz = r0.www * r3.xyz;
    r5.w = ps;
    r1.xy = -r6.ww * ModShadowGroupColor.xy + 1.0;
    r9.yz = r7.xy * r1.xy + 0.125;
    ps = UniformVector_3.y * r6.z;
    r7.xyz = r2.yzw * r5.www;
    r2.y = ps;
    ps = UniformVector_2.x * r5.y;
    r5.w = dot(r7.zxy, r3.zxy);
    r1.x = ps;
    ps = UniformVector_2.y * r5.z;
    r11.xyz = r7.xzy * r5.www;
    r1.y = ps;
    r3.xyz = r11.xyz * 2.0 - r3.xzy;
    ps = UniformVector_2.z * r5.x;
    r5.w = saturate(dot(r4.zxy, r3.yxz));
    r1.z = ps;
    ps = log2(r5.w);
    r1.xyz = r1.xyz * r10.xyz;
    r9.w = ps;
    ps = UniformVector_3.z * r6.x;
    r3.xy = r9.xy * r9.wz;
    r2.z = ps;
    r5.xyz = r3.yyy * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r3.x);
    r5.w = saturate(dot(r7.zxy, r4.zxy));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
