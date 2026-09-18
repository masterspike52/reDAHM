// ps_0d7fc161faac75aa.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 189 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002F4 10040F00 0000080A 00000000 00007908 001F00FF 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c8); // float4
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 color2 : COLOR2; // r7
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

    ps = 1.0 / r4.w;
    r5.z = ps;
    ps = ScreenPositionScaleBias.x * r5.z;
    r7.xy = r0.xy + UniformVector_1.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r9.xyz = -UniformVector_0.xzy + 1.0;
    r5.y = ps;
    ps = ScreenPositionScaleBias.y * r5.z;
    r5.xy = r5.xy * abs(r8.xy);
    r6.y = ps;
    r5.zw = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r6.yzw = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r4.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r11.xyw = tex2D(Texture2D_3, r7.xy).xzy;
    r14.x = tex2D(Texture2D_2, r0.xy).w;
    r10.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r14.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r8.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r7.z = tex2D(Texture2D_4, r0.xy).w;
    r5.xz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = r1.z;
    r7.x = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r5.y = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = 1.0 - r5.y;
    r7.y = dot(r3.zxy, r3.zxy);
    r5.w = saturate(ps);
    ps = 0.875 * r5.x;
    r15.xyz = r7.zzz * float3(0.2, 3.0, 0.5);
    r8.z = ps;
    r2.xyw = r8.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r7.y));
    r0.xyz = r14.zyw * UniformScalar_8.xxx;
    r5.y = ps;
    r8.xy = r10.yz * UniformScalar_11.xx + r0.xz;
    ps = rsqrt(abs(r7.x));
    r7.yzw = r5.yyy * r3.xyz;
    r5.y = ps;
    ps = 0.875 * r5.z;
    r1.xyz = r5.yyy * r1.xyz;
    r8.w = ps;
    ps = 5.0 * r6.x;
    r5.z = dot(r2.wxy, r2.wxy);
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r13.xy = r14.xw * 0.5;
    r5.y = ps;
    ps = log2(r5.w);
    r3.xyz = r15.xzy * r11.xyw;
    r5.x = ps;
    ps = r13.y;
    r15 = r14.xyxz * float4(0.2, 0.2, 3.0, 3.0);
    ps = r11.y * ps;
    r13.z = r13.x * r3.y;
    r2.z = ps;
    ps = rsqrt(abs(r5.z));
    r13.xy = r15.xz * r3.xz;
    r5.w = ps;
    r5.yz = -r5.yy * ModShadowGroupColor.xy + 1.0;
    r5.yz = r8.zw * r5.yz + 0.125;
    ps = r15.y;
    r3.xyz = r2.xyw * r5.www;
    ps = r11.x * ps;
    r7.x = saturate(dot(r3.zxy, r1.zxy));
    r2.x = ps;
    ps = r15.w;
    r6.x = dot(r3.zxy, r7.wyz);
    r11.xyz = r14.xxx * r11.xwy + r13.xyz;
    ps = r11.w * ps;
    r5.y = r5.y * r5.z;
    r2.y = ps;
    r5.yzw = r5.yyy * r12.xyz + ModShadowColor.xyz;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r2.xyw = r11.xyz + r2.xyz;
    r5.x = ps;
    ps = r2.y;
    r3.xyz = r3.xzy * r6.xxx;
    r7.yzw = r3.xyz * 2.0 - r7.ywz;
    r2.xyz = r10.xyz * UniformScalar_11.xxx + r2.xyw;
    ps = r8.x + ps;
    r6.x = r2.w + r8.y;
    r0.w = ps;
    ps = r6.x;
    r0.xyz = r2.xyz + r0.yxz;
    ps = r4.z + ps;
    r7.y = saturate(dot(r1.zxy, r7.zyw));
    r6.x = ps;
    ps = r7.y * r7.y;
    r2 = r0 + r4.xyzy;
    r1.w = ps;
    ps = r6.x;
    r0.xyz = r2.xyz * UniformScalar_15.xxx;
    ps = r9.y * ps;
    r1.xy = r2.xw * r9.xz;
    r1.z = ps;
    ps = pow(2.0, r5.x);
    r7 = r1 * r7.xxxy;
    r5.x = ps;
    r7.xy = r0.xy * r7.ww + r7.xy;
    r7.z = r0.z * r7.w + r7.z;
    r7.xyz = r7.xyz * r5.xxx;
    r6.xyz = r7.xyz * r6.yzw;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.ywz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
