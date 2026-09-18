// ps_e57ed7a31c489fbb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 231 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000039C 10040E00 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c13); // float2
float4 SpotDirection : register(c12); // float3
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_21 : register(c7); // float
float4 UniformScalar_22 : register(c8); // float
float4 UniformScalar_23 : register(c9); // float
float4 UniformScalar_24 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_8 : register(c5); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.zw = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xy = UniformVector_2.xz * UniformVector_2.xz;
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    r14.xyw = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r11.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r13.xyw = tex2D(Texture2D_4, r0.xy).xyz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).zxy;
    r7.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = UniformScalar_22.x;
    r9.z = max(UniformScalar_24.x, 0.0001);
    ps = -UniformScalar_21.x + ps;
    r5.x = r1.z + 0.1;
    r14.z = ps;
    ps = 0.875 * r6.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r13.z = ps;
    r0.xzw = r7.wxy * 2.0 - 1.0;
    ps = r4.x + r4.x;
    r5.w = dot(r2.zxy, r2.zxy);
    r6.w = ps;
    ps = 1.0 - r5.w;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r0.y = saturate(ps);
    ps = 4.0 * r4.y;
    r3.w = dot(r3.zxy, r3.zxy);
    r6.x = ps;
    ps = 4.0 * r4.z;
    r1.w = dot(r1.zxy, r1.zxy);
    r6.z = ps;
    ps = 5.0 * r5.x;
    r13.xyw = r13.xyw + r13.xyw;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r5.w));
    r5.z = dot(r12.zxy, float3(1.0, 1.0, 1.0));
    r5.w = ps;
    ps = 1.0 - r5.x;
    r11.xyz = r11.xyz * UniformVector_8.xyz;
    r5.y = ps;
    ps = log2(r0.y);
    r4.xyz = r5.www * -SpotDirection.xyz;
    r5.x = ps;
    r12.zw = -r5.yy * ModShadowGroupColor.xy + 1.0;
    ps = 1.0 - r5.z;
    r6.xzw = r6.zxw + float3(-2.0, -2.0, -1.0);
    r0.y = ps;
    ps = UniformScalar_23.x * r0.y;
    r5.y = dot(r4.zxy, r2.zxy);
    r5.w = ps;
    ps = r6.x;
    r7.xyz = r14.xyw * r2.www;
    ps = -r0.w + ps;
    r14.xy = r6.zw - r0.zx;
    r2.w = ps;
    ps = rsqrt(abs(r1.w));
    r6.xzw = r14.xyz * UniformScalar_0.xxx;
    r5.z = ps;
    ps = UniformScalar_21.x + r6.w;
    r4.xyz = r5.zzz * r1.xyz;
    r0.x = ps;
    ps = (-2.0) + r6.z;
    r12.x = r0.z + r6.x;
    r5.z = ps;
    r11.w = r7.w * 2.0 + r5.z;
    ps = rsqrt(abs(r3.w));
    r1 = r11 * r0.yyyy;
    r5.z = ps;
    ps = r1.w;
    r11.xyz = r5.zzz * r3.xyz;
    r5.z = ps;
    r2.xyz = r1.xyz * r13.xyw - r1.xyz;
    r12.y = r2.w * UniformScalar_0.x + r0.w;
    r2.xyz = r2.xyz * UniformScalar_0.xxx + r1.xyz;
    r3.xyz = r2.xyz * r0.xxx + r5.www;
    ps = 1.0 + r5.z;
    r0.xw = r12.xy * r0.yy;
    r0.z = ps;
    ps = 0.875 * r6.y;
    r1.yz = r9.xy * r0.yz;
    r13.w = ps;
    ps = -SpotAngles.x - -r5.y;
    r6 = r0.xzyw * UniformVector_2.xzyy;
    r5.z = ps;
    ps = r6.z;
    r1.x = r1.y * r12.x;
    ps = r12.y * ps;
    r13.xy = r1.xz * r0.yz;
    r5.y = ps;
    r5.w = r5.y * r6.w + r13.y;
    r9.xy = r13.zw * r12.zw + 0.125;
    r5.w = r13.x * r12.x + r5.w;
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
    r0.xy = r9.xz * r9.yw;
    r5.xyz = r0.xxx * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r0.y);
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
