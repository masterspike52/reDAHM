// ps_f15f08f467b4dfa8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 297 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004A4 10041000 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r15.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r9.x = ps;
    r8.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    r6.xy = r0.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = r4.w - 4e+02;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r9.zw = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r9.y = saturate(r5.z * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r8.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r3.xyz = r9.zwy * float3(0.5, 0.5, -0.025);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r9.zw = r8.xy * r3.zz;
    r9.y = ps;
    r5.xz = r9.xy - 0.5;
    r10.xw = float2((r9.xy >= 0.5));
    ps = r5.y;
    r5.xz = r5.xz - r9.xy;
    ps = abs(r7.x) * ps;
    r6.zw = r5.xz * r10.xw;
    r5.z = ps;
    ps = r5.w;
    r9 = r9.zwxy + r6;
    ps = abs(r7.y) * ps;
    r5.xy = r9.zw + r9.zw;
    r5.w = ps;
    r10.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r14 = tex2D(Texture2D_1, r5.xy);
    r7.xyz = tex2D(Texture2D_2, r0.wz).wxy;
    r6.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r5.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    r3.zw = r0.wz * UniformVector_6.xy;
    r11.xyz = r5.xyw * 2.0 - 1.0;
    r6.xyz = r6.xyz * 2.0 - 1.0;
    ps = r7.y + r7.y;
    r12.zw = r4.xy * ScreenPositionScaleBias.xy;
    r13.y = ps;
    ps = r7.z + r7.z;
    r13.x = dot(r10.xww, float3(1.0, 1.0, 1.0));
    r13.z = ps;
    r5.z = (r13.x == 0.0) ? r14.x : r14.y;
    r13 = r13.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    ps = r13.z;
    r6.xyw = r6.xyz * UniformVector_4.xyz;
    r5.z = (r13.y == 0.0) ? r14.z : r5.z;
    r7.z = (r13.x == 0.0) ? r14.w : r5.z;
    ps = r3.x + ps;
    r5.z = max(r7.z, 0.0);
    r3.x = ps;
    ps = r13.w;
    r10.x = min(r5.z, 0.3);
    ps = r3.y + ps;
    r14.xyz = r10.yxz * float3(0.875, 3.3333333, 0.875);
    r3.y = ps;
    r3.xy = r14.yy * r3.xy + r6.xy;
    ps = 1.0 / r4.w;
    r12.xy = r3.xy - r11.xy;
    r5.z = ps;
    r3.xy = r12.zw * r5.zz + ScreenPositionScaleBias.wz;
    r10.xyz = tex2D(Texture2D_4, r9.xy).xyz;
    r13.xyz = tex2D(Texture2D_6, r3.zw).xyz;
    r16.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r0.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    ps = r4.w;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r7.y = saturate(ps);
    ps = UniformVector_5.x * UniformVector_5.w;
    r5.z = dot(r1.zxy, r1.zxy);
    r3.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r0.w = dot(r2.zxy, r2.zxy);
    r3.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r5.x = r1.z + 0.1;
    r3.z = ps;
    r4.xyz = r0.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r7.x = r8.w * r7.x - 1.0;
    ps = 5.0 * r5.x;
    r0.xyz = r16.xyz * r2.www;
    r7.w = saturate(ps);
    ps = rsqrt(abs(r5.z));
    r0.w = saturate(-r0.w + 1.0);
    r5.z = ps;
    ps = log2(r0.w);
    r2.xyz = r3.xyz * r15.xyz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r3.xyz = r5.zzz * r1.xyz;
    r5.z = ps;
    ps = -r11.z;
    r13.xyz = r2.xyz * r13.xyz;
    ps = r6.w + ps;
    r5.xy = -r7.zw + 1.0;
    r1.w = ps;
    ps = 2.5 * r5.x;
    r7.zw = r5.yy * ModShadowGroupColor.xy;
    r13.w = ps;
    ps = pow(2.0, r5.z);
    r7.yzw = -r7.wzy + 1.0;
    r5.z = ps;
    r2.yzw = r14.yxz * r7.xzy + float3(1.0, 0.125, 0.125);
    r1.xyz = r13.xyz * r2.yyy - r10.xyz;
    ps = abs(r2.y) * abs(r2.y);
    r0.xyz = r0.xzy * r5.zzz;
    r0.w = ps;
    r6.w = saturate(r13.w * r2.y - 0.5);
    r5.xy = r12.xy * r6.ww + r11.xy;
    r5.z = r1.w * r6.w - 2.0;
    r1.xyz = r1.xyz * r6.www + r10.xyz;
    ps = r0.w * r0.w;
    r1.xyz = r1.xyz * r9.xyz;
    r2.x = ps;
    r5.z = r5.w * 2.0 + r5.z;
    r2.xy = r2.xz * r2.xw;
    r6.xyz = r2.yyy * r6.xyz + ModShadowColor.xyz;
    r5.xyz = r5.zxy * r7.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r7.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r7.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r2.xyz = r2.xxx * r4.xyz;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r4.xyz = r5.yzw * r5.xxx;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r4.zxy));
    ps = log2(r5.x);
    r2.xyz = r2.xyz * r6.www;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r3.zyx));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r0.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
