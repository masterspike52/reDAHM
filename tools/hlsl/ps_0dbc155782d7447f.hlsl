// ps_0dbc155782d7447f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 297 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004A4 10041200 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r17 = tex2D(Texture2D_5, r1.xy);
    ps = (-0.5) + r17.w;
    r6.xy = r1.wz * 6.0;
    r6.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r12.x = tex2D(ShadowTexture, r0.xy).x;
    r7.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    ps = r1.w;
    r10.xy = r1.wz * UniformVector_6.xy;
    ps = UniformVector_2.x * ps;
    r0.xy = r1.wz * UniformVector_1.xy;
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.z = r5.w - 4e+02;
    r11.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = -r1.z + 1.0;
    r11.y = ps;
    ps = 1.0 / r5.w;
    r12.yz = r5.xy * ScreenPositionScaleBias.xy;
    r12.w = ps;
    ps = UniformVector_2.y * r6.x;
    r6.w = dot(r4.zxy, r4.zxy);
    r9.y = ps;
    r6.yz = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r6.x = saturate(r7.z * 0.00022222222);
    r6.w = ps;
    ps = r12.x * r12.x;
    r4.xyz = r6.www * r4.xyz;
    r6.w = ps;
    ps = r12.y * r12.w;
    r15.xyw = r6.yxz * float3(0.5, -0.025, 0.5);
    r6.y = ps;
    ps = r12.z * r12.w;
    r9.zw = r4.xy * r15.yy;
    r6.x = ps;
    ps = r11.x;
    r0.zw = r9.xy - 0.5;
    ps = abs(r8.x) * ps;
    r16.xy = float2((r9.xy >= 0.5));
    r10.z = ps;
    ps = r11.y;
    r0.zw = r0.zw - r9.xy;
    ps = abs(r8.y) * ps;
    r0.zw = r0.zw * r16.xy;
    r10.w = ps;
    ps = ScreenPositionScaleBias.w + r6.y;
    r0 = r9.zwxy + r0;
    r6.y = ps;
    ps = ScreenPositionScaleBias.z + r6.x;
    r8.xy = r0.zw + r0.zw;
    r6.z = ps;
    r9.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r15.yz = tex2D(ModShadowAccumTexture, r10.zw).xy;
    r14 = tex2D(Texture2D_1, r8.xy);
    r13.xyz = tex2D(LightAttenuationTexture, r6.yz).xyz;
    r12.xyz = tex2D(Texture2D_6, r10.xy).xyz;
    r0.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r8.xzw = tex2D(Texture2D_2, r1.wz).wxy;
    r11.xyz = tex2D(Texture2D_7, r1.xy).xyz;
    ps = 0.1 - -r2.z;
    r8.y = saturate(r5.w * 0.0001);
    r6.z = ps;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformVector_5.x * UniformVector_5.w;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r18.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r6.y = dot(r2.zxy, r2.zxy);
    r18.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r6.x = dot(r3.zxy, r3.zxy);
    r18.z = ps;
    r5.xyz = r11.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r8.x = r7.w * r8.x - 1.0;
    r10.xyw = r10.xyz * 2.0 - 1.0;
    r11.xyz = r0.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r17.xyz = r18.xyz * r17.xyz;
    r6.y = ps;
    ps = 1.0 - r6.x;
    r3.xyz = r6.yyy * r2.xyz;
    r6.x = saturate(ps);
    r10.w = r10.w * UniformVector_4.z - r11.z;
    ps = log2(r6.x);
    r12.xyz = r17.xyz * r12.xyz;
    r6.y = ps;
    ps = r8.z + r8.z;
    r13.xyz = r6.www * r13.xyz;
    r2.y = ps;
    ps = r8.w + r8.w;
    r2.x = dot(r16.xyy, float3(1.0, 1.0, 1.0));
    r2.z = ps;
    r6.x = (r2.x == 0.0) ? r14.x : r14.y;
    r2 = r2.xyxz + float4(-3.0, -1.0, -2.0, -1.0);
    ps = 5.0 * r6.z;
    r14.xy = r2.yw + r15.xw;
    r2.y = saturate(ps);
    r6.x = (r2.z == 0.0) ? r14.z : r6.x;
    r2.x = (r2.x == 0.0) ? r14.w : r6.x;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r6.xz = -r2.xy + 1.0;
    r6.y = ps;
    ps = 2.5 * r6.x;
    r6.w = max(r2.x, 0.0);
    r12.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r15.x = min(r6.w, 0.3);
    r8.z = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.xyz = r15.yxz * float3(0.875, 3.3333333, 0.875);
    r8.w = ps;
    ps = pow(2.0, r6.y);
    r8.yzw = -r8.wzy + 1.0;
    r6.z = ps;
    r6.xy = r2.yy * r14.xy - r11.xy;
    r6.xy = r10.xy * UniformVector_4.xy + r6.xy;
    r2.xyz = r2.yxz * r8.xzy + float3(1.0, 0.125, 0.125);
    r10.xyz = r12.xyz * r2.xxx - r9.xyz;
    ps = abs(r2.x) * abs(r2.x);
    r0.xyz = r13.xzy * r6.zzz;
    r6.w = ps;
    r7.w = saturate(r12.w * r2.x - 0.5);
    r6.xy = r6.xy * r7.ww + r11.xy;
    r6.z = r10.w * r7.w - 2.0;
    r9.xyz = r10.xyz * r7.www + r9.xyz;
    ps = r6.w * r6.w;
    r1.xyz = r9.xyz * r1.xyz;
    r2.w = ps;
    r6.z = r0.w * 2.0 + r6.z;
    r2.xy = r2.yw * r2.zw;
    r7.xyz = r2.xxx * r7.xyz + ModShadowColor.xyz;
    r6.xyz = r6.zxy * r8.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r8.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r8.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r2.xyz = r2.yyy * r5.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r4.zxy);
    r5.xyz = r6.yzw * r6.xxx;
    r4.xyz = r5.xyz * 2.0 - r4.xyz;
    r6.x = saturate(dot(r3.zxy, r4.zxy));
    ps = log2(r6.x);
    r2.xyz = r2.xyz * r7.www;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r3.zyx));
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
