// ps_018a9f0e14a96fa2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 198 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000318 10041200 0000070A 00000000 000060E7 001F007F 00000001 00003050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c8); // float4
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c10); // float2
float4 SpotDirection : register(c9); // float3
float4 UniformScalar_11 : register(c6); // float
float4 UniformScalar_15 : register(c7); // float
float4 UniformScalar_8 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
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
    float4 r7 = 0.0;
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
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.z = ps;
    ps = ScreenPositionScaleBias.x * r5.z;
    r0.zw = r0.xy + UniformVector_1.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -UniformVector_0.xzy + 1.0;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = dot(r1.zxy, r1.zxy);
    r6.z = ps;
    ps = ScreenPositionScaleBias.y * r5.z;
    r7.xy = r6.yz * abs(r7.xy);
    r6.y = ps;
    r5.zw = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r15.xyz = tex2D(Texture2D_3, r0.zw).xyz;
    r17.x = tex2D(Texture2D_2, r0.xy).w;
    r13.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r17.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r6.w = tex2D(Texture2D_4, r0.xy).w;
    r0.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r5.zw = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r0.x = dot(r3.zxy, r3.zxy);
    r12.xyz = r0.yzw * 2.0 - 1.0;
    r10.xyz = r6.www * float3(0.2, 3.0, 0.5);
    ps = 1.0 - r5.x;
    r9.xyz = r17.zyw * UniformScalar_8.xxx;
    r0.y = saturate(ps);
    r11.xy = r13.yz * UniformScalar_11.xx + r9.xz;
    ps = rsqrt(abs(r5.x));
    r7.xw = r17.xw * 0.5;
    r6.w = ps;
    ps = log2(r0.y);
    r14.xzw = r10.zxy * r15.zxy;
    r5.x = ps;
    ps = rsqrt(abs(r0.x));
    r16.z = r7.x * r14.x;
    r0.x = ps;
    r18 = r17.xyxz * float4(0.2, 0.2, 3.0, 3.0);
    ps = rsqrt(abs(r5.y));
    r14.xy = r18.yw * r15.xy;
    r5.y = ps;
    ps = r1.z;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r7.xyz = r5.yyy * r1.xyz;
    r5.y = ps;
    ps = 0.875 * r5.z;
    r0.xyz = r0.xxx * r3.xyz;
    r1.z = ps;
    ps = 0.875 * r5.w;
    r3.xyz = r6.www * -SpotDirection.xyz;
    r1.w = ps;
    ps = 5.0 * r5.y;
    r5.z = dot(r12.zxy, r12.zxy);
    r5.y = saturate(ps);
    ps = 1.0 - r5.y;
    r16.xy = r18.xz * r14.zw;
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r5.y = dot(r3.zxy, r2.zxy);
    r5.z = ps;
    r1.xy = -r5.ww * ModShadowGroupColor.xy + 1.0;
    r2.yz = r1.zw * r1.xy + 0.125;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r12.xyz = r12.xyz * r5.zzz;
    r6.w = ps;
    r5.xzw = r17.xxx * r15.xyz + r16.xyz;
    ps = r7.w;
    r0.w = dot(r12.zxy, r0.zxy);
    ps = r15.z * ps;
    r1.xyz = r12.xzy * r0.www;
    r14.z = ps;
    ps = -SpotAngles.x - -r5.y;
    r3.xyz = r5.xzw + r14.xyz;
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r1.w = r3.y + r11.x;
    r2.x = saturate(ps);
    r0.yzw = r1.xyz * 2.0 - r0.xzy;
    r1.xyz = r13.xyz * UniformScalar_11.xxx + r3.xyz;
    ps = r3.z;
    r0.x = saturate(dot(r12.zxy, r7.zxy));
    ps = r11.y + ps;
    r5.xw = r2.yx * r2.zx;
    r2.x = ps;
    r5.xyz = r5.xxx * r10.xyz + ModShadowColor.xyz;
    ps = r2.x;
    r1.xyz = r1.xyz + r9.yxz;
    ps = r4.z + ps;
    r0.y = saturate(dot(r7.zxy, r0.zyw));
    r0.z = ps;
    ps = r0.y * r0.y;
    r3 = r1 + r4.xyzy;
    r2.w = ps;
    ps = r0.z;
    r1.xyz = r3.xyz * UniformScalar_15.xxx;
    ps = r8.y * ps;
    r2.xy = r3.xw * r8.xz;
    r2.z = ps;
    ps = pow(2.0, r6.w);
    r0 = r2 * r0.xxxy;
    r6.w = ps;
    r0.xy = r1.xy * r0.ww + r0.xy;
    r0.z = r1.z * r0.w + r0.z;
    r0.xyz = r0.xyz * r6.www;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
