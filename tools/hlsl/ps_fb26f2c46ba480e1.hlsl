// ps_fb26f2c46ba480e1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 231 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000039C 10040F00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c12); // float2
float4 SpotDirection : register(c11); // float3
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_21 : register(c6); // float
float4 UniformScalar_22 : register(c7); // float
float4 UniformScalar_23 : register(c8); // float
float4 UniformScalar_24 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r5.z = ps;
    r6.xy = r5.zw * abs(r7.xy);
    r5.xy = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    r14.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r4.yzw = tex2D(Texture2D_2, r0.xy).xyz;
    r7.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r11.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r5.xyz = tex2D(Texture2D_1, r0.xy).zxy;
    r12.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = UniformVector_2.x * UniformVector_2.x;
    r9.x = max(UniformScalar_24.x, 0.0001);
    r6.z = ps;
    ps = UniformVector_2.z * UniformVector_2.z;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    ps = UniformScalar_22.x;
    r3.w = dot(r3.zxy, r3.zxy);
    ps = -UniformScalar_21.x + ps;
    r7.w = r1.z + 0.1;
    r0.z = ps;
    r9.yzw = r12.ywz * 2.0 - 1.0;
    ps = r5.x + r5.x;
    r5.w = dot(r2.zxy, r2.zxy);
    r0.w = ps;
    ps = 1.0 - r5.w;
    r4.x = dot(r1.zxy, r1.zxy);
    r1.w = saturate(ps);
    ps = 4.0 * r5.y;
    r11.xyz = r11.xyz + r11.xyz;
    r0.x = ps;
    ps = 4.0 * r5.z;
    r7.xyz = r7.xyz * r2.www;
    r0.y = ps;
    ps = rsqrt(abs(r4.x));
    r5.x = saturate(r7.w * 5.0);
    r4.x = ps;
    ps = 1.0 - r5.x;
    r5.z = dot(r4.wyz, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r4.xyz = r4.xxx * r1.xyz;
    r5.x = ps;
    ps = log2(r1.w);
    r15.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    r1.zw = -r5.yy * ModShadowGroupColor.xy + 1.0;
    ps = 1.0 - r5.z;
    r13.xyz = r0.yxw + float3(-2.0, -2.0, -1.0);
    r0.w = ps;
    ps = UniformScalar_23.x * r0.w;
    r5.y = dot(r15.zxy, r2.zxy);
    r12.x = ps;
    ps = r13.x;
    r2.xyz = r0.www * r14.xyz;
    ps = -r9.w + ps;
    r0.xy = r13.yz - r9.yz;
    r11.w = ps;
    r11.xyz = r2.xyz * r11.xyz - r2.xyz;
    r1.y = r11.w * UniformScalar_0.x + r9.w;
    r2.xyz = r11.xyz * UniformScalar_0.xxx + r2.xyz;
    ps = rsqrt(abs(r3.w));
    r0.xyz = r0.xyz * UniformScalar_0.xxx;
    r5.z = ps;
    ps = UniformScalar_21.x + r0.z;
    r11.xyz = r5.zzz * r3.xyz;
    r5.w = ps;
    ps = (-2.0) + r0.y;
    r1.x = r9.y + r0.x;
    r5.z = ps;
    ps = r5.z;
    r3.xyz = r2.xyz * r5.www;
    ps = r12.w + ps;
    r0.xz = r1.xy * r0.ww;
    r3.w = ps;
    ps = 0.875 * r6.x;
    r3 = r3 + r12.xxxw;
    r12.z = ps;
    r0.y = r3.w * r0.w + 1.0;
    ps = 0.875 * r6.y;
    r9.zw = r6.zw * r0.wy;
    r12.w = ps;
    ps = -SpotAngles.x - -r5.y;
    r6 = r0.xywz * UniformVector_2.xzyy;
    r5.z = ps;
    ps = r6.z;
    r9.y = r9.z * r1.x;
    ps = r1.y * ps;
    r12.xy = r9.yw * r0.wy;
    r5.y = ps;
    r5.w = r5.y * r6.w + r12.y;
    r9.yz = r12.zw * r1.zw + 0.125;
    r5.w = r12.x * r1.x + r5.w;
    ps = rsqrt(abs(r5.w));
    r5.z = saturate(r5.z * SpotAngles.y);
    r5.w = ps;
    r6.xy = r6.xy * r5.ww;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.zw = r5.yz * r5.wz;
    r5.y = ps;
    ps = pow(2.0, r5.y);
    r5.x = dot(r6.yxz, r6.yxz);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r7.xzy * r5.yyy;
    r5.x = ps;
    r7.xyz = r6.xyz * r5.xxx;
    r5.x = dot(r7.yxz, r11.zxy);
    r5.xyz = r7.xzy * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r11.xyz;
    r5.x = saturate(dot(r4.zxy, r5.zxy));
    ps = log2(r5.x);
    r2.xyz = r2.xyz * r10.xyz;
    r9.w = ps;
    r0.xy = r9.xy * r9.wz;
    r5.xyz = r0.yyy * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.x);
    r5.w = saturate(dot(r7.yxz, r4.zxy));
    r0.x = ps;
    r0.xyz = r3.xyz * r0.xxx;
    r0.xy = r2.xy * r5.ww + r0.xy;
    r0.z = r2.z * r5.w + r0.z;
    r0.xyz = r1.xzy * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r0.xzy * r6.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
