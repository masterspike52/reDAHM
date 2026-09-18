// ps_4424fabf8fcb9147.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 315 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004EC 10041100 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
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
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13 = tex2D(Texture2D_6, r1.xy).wxyz;
    ps = (-0.5) + r13.x;
    r6.xy = r1.wz * 6.0;
    r6.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r9.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    ps = r1.w;
    r6.yz = r1.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r10.xy = r1.wz * UniformVector_1.xy;
    r12.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = r5.w - 4e+02;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r7.z = ps;
    r11.yz = r9.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r11.x = saturate(r6.w * 0.00022222222);
    r6.x = ps;
    ps = -r1.z;
    r9.xyz = r6.xxx * r4.xyz;
    ps = 1.0 + ps;
    r11.xyz = r11.yzx * float3(0.5, 0.5, -0.025);
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r12.zw = r9.xy * r11.zz;
    r12.y = ps;
    r6.xw = r12.xy - 0.5;
    r14.xw = float2((r12.xy >= 0.5));
    ps = r7.y;
    r6.xw = r6.xw - r12.xy;
    ps = abs(r8.x) * ps;
    r10.zw = r6.xw * r14.xw;
    r7.x = ps;
    ps = r7.z;
    r12 = r12.zwxy + r10;
    ps = abs(r8.y) * ps;
    r6.xw = r12.zw + r12.zw;
    r7.y = ps;
    r14.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r16 = tex2D(Texture2D_1, r6.xw);
    r10.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    r8.xyw = tex2D(Texture2D_3, r6.yz).xyw;
    r7.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r4.xyz = tex2D(Texture2D_0, r12.xy).xyz;
    r4.xyw = r4.xyz * 2.0 - 1.0;
    r7.yzw = r7.xyz * 2.0 - 1.0;
    r15.zw = r8.xy * 2.0 - 1.0;
    ps = 0.0001 * r5.w;
    r6.x = r2.z + 0.1;
    r6.z = saturate(ps);
    ps = 5.0 * r6.x;
    r17.yz = r10.xy + r10.xy;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r0.zw = r1.wz * UniformVector_6.xy;
    r6.w = ps;
    ps = 1.0 - r6.z;
    r17.x = dot(r14.xww, float3(1.0, 1.0, 1.0));
    r6.y = ps;
    r6.x = (r17.x == 0.0) ? r16.x : r16.y;
    ps = UniformScalar_1.x * r6.y;
    r1 = r17.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r14.w = ps;
    ps = r1.z;
    r11.zw = r5.xy * ScreenPositionScaleBias.xy;
    r6.x = (r1.y == 0.0) ? r16.z : r6.x;
    r7.x = (r1.x == 0.0) ? r16.w : r6.x;
    ps = r11.x + ps;
    r6.x = max(r7.x, 0.0);
    r15.x = ps;
    ps = r1.w;
    r14.x = min(r6.x, 0.3);
    ps = r11.y + ps;
    r14.xyz = r14.xyz * float3(3.3333333, 0.875, 0.875);
    r15.y = ps;
    r1 = r14.xxww * r15;
    r6.xz = r7.yz + r1.zw;
    r6.xz = r6.xz * UniformVector_4.xy + r1.xy;
    ps = 1.0 / r5.w;
    r11.xy = r6.xz - r4.xy;
    r6.x = ps;
    r6.xz = r11.zw * r6.xx + ScreenPositionScaleBias.wz;
    r10.xyz = tex2D(LightAttenuationTexture, r6.xz).xyz;
    r13.x = tex2D(ShadowTexture, r0.xy).x;
    r5.xyz = tex2D(Texture2D_5, r12.xy).xyz;
    r12.xyz = tex2D(Texture2D_7, r0.zw).xyz;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    ps = UniformVector_5.x * UniformVector_5.w;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r6.x = dot(r3.zxy, r3.zxy);
    r0.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r0.w = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    r7.y = r9.w * r10.w - 1.0;
    ps = rsqrt(abs(r0.w));
    r6.z = r8.w - 1.0;
    r7.z = ps;
    ps = 1.0 - r6.x;
    r13.yzw = r0.xyz * r13.yzw;
    r6.x = saturate(ps);
    r8.w = r7.w * UniformVector_4.z - r4.w;
    ps = log2(r6.x);
    r3.xyz = r7.zzz * r2.xyz;
    r6.x = ps;
    r7.zw = r6.ww * ModShadowGroupColor.xy;
    ps = r6.z;
    r7.xzw = -r7.xwz + 1.0;
    ps = r6.y * ps;
    r0.yzw = r14.xzy * r7.yzw;
    r0.x = ps;
    ps = 2.5 * r7.x;
    r0 = r0 + float4(1.0, 1.0, 0.125, 0.125);
    r12.w = ps;
    ps = abs(r0.y) * abs(r0.y);
    r7.xyz = r13.yzw * r12.xyz;
    r13.y = ps;
    ps = r0.w * r0.z;
    r12.xyz = r7.xyz * r0.xxx;
    r6.z = ps;
    r7.xyz = r6.zzz * r8.xyz + ModShadowColor.xyz;
    r2.xyz = r12.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r8.xyz = r12.xyz * r0.yyy - r5.xyz;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r0.xw = r13.xy * r13.xy;
    r6.x = ps;
    r6.z = saturate(r12.w * r0.y - 0.5);
    r4.xy = r11.xy * r6.zz + r4.xy;
    ps = pow(2.0, r6.x);
    r0.xyz = r0.xxx * r10.xyz;
    r6.x = ps;
    r5.xyz = r8.xyz * r6.zzz + r5.xyz;
    r6.w = r8.w * r6.z - 2.0;
    r4.z = r4.z * 2.0 + r6.w;
    ps = r0.w * r0.w;
    r4.xyw = r4.xyz * r6.yyy;
    r6.w = ps;
    ps = r6.w;
    r4.z = r4.w + 1.0;
    r4.xyz = (r6.yyy > 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    r4.xyz = (r6.yyy >= 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    ps = r2.x * ps;
    r6.y = dot(r4.zxy, r4.zxy);
    r2.x = ps;
    ps = rsqrt(abs(r6.y));
    r1.xyz = r5.xyz * r1.xyz;
    r6.y = ps;
    ps = r6.w;
    r4.xyz = r4.xyz * r6.yyy;
    ps = r2.y * ps;
    r6.y = dot(r4.zxy, r9.zxy);
    r2.y = ps;
    ps = r6.w;
    r5.xyz = r4.xyz * r6.yyy;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    ps = r2.z * ps;
    r6.y = saturate(dot(r3.zxy, r5.zxy));
    r2.z = ps;
    ps = log2(r6.y);
    r2.xyz = r2.xyz * r6.zzz;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r0.xyz = r0.xzy * r6.xxx;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r4.zyx, r3.zyx));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r7.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
