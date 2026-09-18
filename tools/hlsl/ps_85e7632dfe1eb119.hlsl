// ps_85e7632dfe1eb119.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 171 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002AC 10040A00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c6); // float4
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c8); // float2
float4 SpotDirection : register(c7); // float3
float4 UniformScalar_0 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_3 : register(c4); // float4
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

    r1.w = dot(r1.zxy, r1.zxy);
    r5.x = 1.0 / r4.w;
    r6.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = 1.0 / ModShadowAccumResolution.y;
    r5.z = r1.z + 0.1;
    r5.x = 1.0 / ModShadowAccumResolution.x;
    r5.xy = r5.xy * abs(r7.xy);
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r4.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r9.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r6.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).yx;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = dot(r3.zxy, r3.zxy);
    ps = 5.0 * r5.z;
    r5.w = dot(r2.zxy, r2.zxy);
    r9.z = saturate(ps);
    ps = 1.0 - r5.w;
    r6.x = dot(r10.xzy, float3(1.0, 1.0, 1.0));
    r5.z = saturate(ps);
    r0.yzw = r9.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r9.xyw = r0.wyz * float3(0.7, 1.0, 1.0);
    r1.w = ps;
    ps = rsqrt(abs(r0.x));
    r10.xyz = r1.www * r1.xyz;
    r0.x = ps;
    ps = rsqrt(abs(r5.w));
    r1.yzw = r0.xxx * r3.xyz;
    r5.w = ps;
    ps = log2(r5.z);
    r3.xyz = r5.www * -SpotDirection.xyz;
    r5.z = ps;
    ps = 0.875 * r5.y;
    r5.w = dot(r9.xyw, r9.xyw);
    r9.x = ps;
    ps = 0.875 * r5.x;
    r5.y = dot(r3.zxy, r2.zxy);
    r9.y = ps;
    ps = log2(abs(r6.x));
    r5.x = dot(r1.wyz, r0.wyz);
    r0.x = ps;
    ps = rsqrt(abs(r5.w));
    r0 = r0.wyxz * float4(0.7, 1.0, 0.1, 1.0);
    r5.w = ps;
    ps = r5.x;
    r3.xyz = r0.ywx * r5.www;
    r5.x = ps;
    ps = 0.0;
    r1.x = saturate(dot(r3.zxy, r10.zxy));
    r5.w = ps;
    ps = max(r5.x, r5.w);
    r6.x = dot(r3.zxy, r1.wyz);
    r9.w = ps;
    ps = UniformScalar_0.x * r6.y;
    r5.xw = -r9.zw + float2(1.0, 0.45);
    r0.x = ps;
    ps = UniformScalar_0.x * r6.z;
    r2.yz = r5.xx * ModShadowGroupColor.xy;
    r0.y = ps;
    ps = pow(2.0, r0.z);
    r3.xyz = r3.xzy * r6.xxx;
    r2.x = ps;
    r1.yzw = r3.xyz * 2.0 - r1.ywz;
    ps = UniformScalar_0.x * r6.w;
    r2.xyz = -r2.xyz + 1.0;
    r0.w = ps;
    ps = -SpotAngles.x - -r5.y;
    r0.z = saturate(dot(r10.zxy, r1.zyw));
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r3.xyz = r0.xyw * r2.xxx;
    r0.x = saturate(ps);
    ps = r0.z * r0.z;
    r1.yzw = r2.xxx * r6.yzw;
    r0.y = ps;
    r6.xy = r9.xy * r2.yz + 0.125;
    ps = r6.x * r6.y;
    r2.xyz = r1.yzw * UniformVector_3.www;
    r5.y = ps;
    r6.xyz = r5.yyy * r8.xyz + ModShadowColor.xyz;
    r2.xyz = r2.xyz * UniformVector_3.xyz - r1.yzw;
    ps = LightColorAndFalloffExponent.w * r5.z;
    r0.xy = r0.xy * r0.xz;
    r6.w = ps;
    ps = 4.0 * r5.w;
    r0.yzw = r3.xyz * r0.yyy;
    r5.x = saturate(ps);
    r5.xyz = r5.xxx * r2.xyz + r1.yzw;
    ps = pow(2.0, r6.w);
    r5.yzw = r5.xyz * r7.xyz;
    r5.x = ps;
    r5.yz = r5.yz * r1.xx + r0.yz;
    r5.w = r5.w * r1.x + r0.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r4.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r0.xxx;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
