// ps_0860570f8183999a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 294 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000498 10040F00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c11); // float3
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
sampler2D ShadowTexture : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
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

    r13 = tex2D(Texture2D_5, r1.xy);
    ps = (-0.5) + r13.w;
    r6.xy = r1.wz * 6.0;
    r6.z = ps;
    ps = UniformVector_2.x * r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r3.x = ps;
    r9.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    r7.xy = r1.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = r5.w - 4e+02;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.w = ps;
    r3.zw = r9.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r3.y = saturate(r6.z * 0.00022222222);
    r6.x = ps;
    ps = -r1.z;
    r9.xyz = r6.xxx * r4.xyz;
    ps = 1.0 + ps;
    r10.xyw = r3.yzw * float3(-0.025, 0.5, 0.5);
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r3.zw = r9.xy * r10.xx;
    r3.y = ps;
    r6.xz = r3.xy - 0.5;
    r0.zw = float2((r3.xy >= 0.5));
    ps = r6.y;
    r6.xz = r6.xz - r3.xy;
    ps = abs(r8.x) * ps;
    r7.zw = r6.xz * r0.zw;
    r6.z = ps;
    ps = r6.w;
    r7 = r3 + r7.zwxy;
    ps = abs(r8.y) * ps;
    r6.xy = r7.xy + r7.xy;
    r6.w = ps;
    r8.yw = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r15 = tex2D(Texture2D_1, r6.xy);
    r4.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    r6.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r3.xyw = tex2D(Texture2D_0, r7.zw).xyz;
    r7.xy = r1.wz * UniformVector_6.xy;
    r11.xyz = r3.xyw * 2.0 - 1.0;
    r6.xyz = r6.xyz * 2.0 - 1.0;
    ps = r4.x + r4.x;
    r12.zw = r5.xy * ScreenPositionScaleBias.xy;
    r14.y = ps;
    ps = r4.y + r4.y;
    r14.x = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r14.z = ps;
    r6.w = (r14.x == 0.0) ? r15.x : r15.y;
    r14 = r14.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    ps = r14.z;
    r6.xyz = r6.xyz * UniformVector_4.xyz;
    r6.w = (r14.y == 0.0) ? r15.z : r6.w;
    r8.z = (r14.x == 0.0) ? r15.w : r6.w;
    ps = r10.y + ps;
    r6.w = max(r8.z, 0.0);
    r0.z = ps;
    ps = r14.w;
    r8.x = min(r6.w, 0.3);
    ps = r10.w + ps;
    r10.xyz = r8.yxw * float3(0.875, 3.3333333, 0.875);
    r0.w = ps;
    r0.zw = r10.yy * r0.zw + r6.xy;
    ps = 1.0 / r5.w;
    r12.xy = r0.zw - r11.xy;
    r6.w = ps;
    r0.zw = r12.zw * r6.ww + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r0.y = tex2D(ShadowTexture, r0.xy).x;
    r0.xzw = tex2D(Texture2D_4, r7.zw).xyz;
    r4.xyz = tex2D(Texture2D_6, r7.xy).xyz;
    r15.xyz = tex2D(Texture2D_7, r1.xy).xyz;
    r8.y = saturate(r5.w * 0.0001);
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = dot(r2.zxy, r2.zxy);
    ps = r2.z;
    r14.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r5.xyz = r15.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = 0.1 + ps;
    r13.xyz = r14.xyz * r13.xyz;
    r7.w = ps;
    r8.x = r9.w * r4.w - 1.0;
    ps = rsqrt(abs(r6.w));
    r8.w = saturate(r7.w * 5.0);
    r6.w = ps;
    ps = -r11.z;
    r6.xy = -r8.zw + 1.0;
    ps = r6.z + ps;
    r8.zw = r6.yy * ModShadowGroupColor.xy;
    r4.w = ps;
    ps = 2.5 * r6.x;
    r8.yzw = -r8.wzy + 1.0;
    r13.w = ps;
    r10.xyz = r10.yxz * r8.xzy + float3(1.0, 0.125, 0.125);
    ps = abs(r10.x) * abs(r10.x);
    r13.xyz = r13.xyz * r4.xyz;
    r10.w = ps;
    r4.xyz = r13.xyz * r10.xxx - r0.xzw;
    r7.w = saturate(r13.w * r10.x - 0.5);
    r6.xy = r12.xy * r7.ww + r11.xy;
    r6.z = r4.w * r7.w - 2.0;
    r4.xyz = r4.xyz * r7.www + r0.xzw;
    r0.xz = r10.wy * r10.wz;
    r7.xyz = r0.zzz * r7.xyz + ModShadowColor.xyz;
    r6.z = r3.w * 2.0 + r6.z;
    r0.xw = r0.yx * r0.yx;
    r0.xyz = r0.xxx * r3.xyz;
    r6.xyz = r6.zxy * r8.www;
    ps = 1.0 + r6.x;
    r3.xyz = r6.www * r2.xyz;
    r6.w = ps;
    r6.xyz = (r8.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r8.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r2.xyz = r0.www * r5.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r9.zxy);
    r5.xyz = r6.yzw * r6.xxx;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    r6.x = saturate(dot(r3.zxy, r5.zxy));
    ps = log2(r6.x);
    r2.xyz = r2.xyz * r7.www;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r1.xyz = r4.xyz * r1.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r3.zyx));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r6.xyz = r6.xzy * r7.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
