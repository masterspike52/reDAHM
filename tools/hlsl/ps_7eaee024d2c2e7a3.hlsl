// ps_7eaee024d2c2e7a3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000618 10041400 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D ShadowTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_2.x * r1.w;
    r0.zw = r1.xy * UniformVector_3.xy;
    r6.z = ps;
    r11 = tex2D(Texture2D_8, r0.zw);
    ps = 0.1 - -r2.z;
    r7.xw = r1.wz * 6.0;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = r5.w - 4e+02;
    r12.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.y = dot(r4.zxy, r4.zxy);
    r12.y = ps;
    ps = rsqrt(abs(r7.y));
    r6.w = r11.w - 0.5;
    r2.w = ps;
    ps = 5.0 * r6.y;
    r7.yz = r1.wz * UniformVector_1.xy;
    r10.x = saturate(ps);
    ps = 0.00022222222 * r6.x;
    r9.xyz = r2.www * r4.xyz;
    r10.z = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r6.y = r10.z * (-0.025);
    r6.x = ps;
    r7.yz = r9.xy * r6.yy + r7.yz;
    ps = 1.0 - r1.z;
    r10.y = r7.z * r6.x;
    r20.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r20.xw = -r10.yx + 1.0;
    r20.z = ps;
    ps = r12.x;
    r4.xyw = r20.zxy * UniformVector_2.xyy;
    ps = abs(r8.x) * ps;
    r10.xy = r4.yw - 0.5;
    r6.y = ps;
    ps = r4.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    ps = r7.y * ps;
    r17.xy = float2((r4.yw >= 0.5));
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r10.xy = r10.xy - r4.yw;
    r10.z = ps;
    ps = (-0.5) + r6.z;
    r17.zw = float2((r6.xz >= 0.5));
    r10.w = ps;
    ps = r12.y;
    r10.zw = r10.zw - r6.xz;
    r4.xz = r10.zw * r17.zw + r6.xz;
    r4.yw = r10.xy * r17.xy + r4.yw;
    ps = abs(r8.y) * ps;
    r12 = r4 + r4;
    r6.w = ps;
    r15 = tex2D(Texture2D_1, r12.zw);
    r16.y = tex2D(Texture2D_4, r0.zw).x;
    r8.xy = tex2D(ModShadowAccumTexture, r6.yw).xy;
    r10.yzw = tex2D(Texture2D_3, r0.zw).xyz;
    r6.xyz = tex2D(Texture2D_2, r7.xw).xyw;
    r19.xyz = tex2D(Texture2D_2, r1.wz).xyw;
    r10.x = UniformScalar_4.x * UniformScalar_3.x;
    ps = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r13.xy = r1.wz * UniformVector_5.xy;
    r7.x = ps;
    ps = 1.0 / r5.w;
    r0.zw = r5.xy * ScreenPositionScaleBias.xy;
    r6.w = ps;
    r4.xy = r0.zw * r6.ww + ScreenPositionScaleBias.wz;
    r8.zw = r6.xy * 2.0 - 1.0;
    ps = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r14.xyz = r10.wyz + float3(-2.0, 0.0, 0.0);
    r6.w = ps;
    r6.w = (-abs(r6.w) >= 0.0) ? 1.0 : (-1.0);
    r16.x = (-abs(r7.x) >= 0.0) ? (-1.0) : r6.w;
    ps = r19.x + r19.x;
    r6.xyw = r14.yxz + r10.ywz;
    r18.z = ps;
    ps = (-1.0) + r6.x;
    r14 = r8.xzwy * float4(0.875, 0.5, 0.5, 0.875);
    r10.y = ps;
    ps = (-1.0) + r6.w;
    r16.zw = r20.ww * ModShadowGroupColor.xy;
    r10.z = ps;
    ps = 0.0 + r6.y;
    r8.xyw = -r16.zwy + 1.0;
    r10.w = ps;
    ps = r19.y + r19.y;
    r10 = r10.xywz * r16.xxyy;
    r18.w = ps;
    ps = r6.z;
    r18.xy = r14.xw * r8.xy;
    ps = r19.z * ps;
    r18 = r18 + float4(0.125, 0.125, -1.0, -1.0);
    r7.x = ps;
    r0.zw = r17.xy * 2.0 + r17.zw;
    r6.x = (r0.w == 0.0) ? r15.x : r15.y;
    ps = (-1.0) - -r7.x;
    r17 = r0.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r14.x = ps;
    r6.x = (r17.z == 0.0) ? r15.z : r6.x;
    r6.z = (r17.w == 0.0) ? r15.w : r6.x;
    ps = floor(r10.x);
    r6.x = max(r6.z, 0.0);
    r6.w = ps;
    ps = 1.0 / UniformScalar_1.x;
    r6.x = min(r6.x, 0.3);
    r14.w = ps;
    ps = 3.3333333 * r6.x;
    r14.yz = r18.zw + r14.yz;
    r6.y = ps;
    ps = r1.y;
    r15 = r6.yyyw * r14;
    ps = UniformScalar_8.x + ps;
    r6.x = r15.w + r1.x;
    r6.y = ps;
    r8.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r4.z = tex2D(ShadowTexture, r0.xy).x;
    r4.xyw = tex2D(Texture2D_6, r7.yz).xyz;
    r12 = tex2D(Texture2D_1, r12.xy);
    r13.xyz = tex2D(Texture2D_7, r13.xy).xyz;
    r19 = tex2D(Texture2D_5, r6.xy);
    r0.xyw = tex2D(Texture2D_0, r7.yz).xyz;
    r6.x = saturate(r5.w * 0.0001);
    ps = -ModShadowColor.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r14.xyz = UniformVector_4.xyz * 2e+01;
    r7.y = ps;
    ps = -ModShadowColor.y;
    r1.w = float((UniformScalar_11.x >= 1.0));
    ps = 1.0 + ps;
    r2.w = dot(r2.zxy, r2.zxy);
    r7.z = ps;
    ps = -ModShadowColor.z;
    r5.x = float((UniformScalar_11.x > 1.0));
    ps = 1.0 + ps;
    r6.w = dot(r3.zxy, r3.zxy);
    r7.w = ps;
    ps = 1.0 - r6.w;
    r5.yzw = r19.xyz * r19.www;
    r6.y = saturate(ps);
    r13.xyz = (-abs(r5.xxx) >= 0.0) ? r13.xyz : 1.0;
    ps = rsqrt(abs(r2.w));
    r19.xyz = r11.xyz * UniformScalar_12.xxx;
    r6.w = ps;
    ps = r0.x + r0.x;
    r3.xyz = r6.www * r2.xyz;
    r5.x = ps;
    r13.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r13.xyz;
    ps = log2(r6.y);
    r2.xyz = r14.xyz * r5.yzw;
    r6.y = ps;
    ps = r0.y + r0.y;
    r14.xyz = r2.xyz * r16.yyy;
    r5.y = ps;
    r2.xyz = r19.xyz * r13.xyz + UniformScalar_13.xxx;
    r6.w = (r0.z == 0.0) ? r12.x : r12.y;
    ps = r0.w + r0.w;
    r0.z = r18.x * r18.y;
    r5.z = ps;
    r0.xyz = r0.zzz * r7.yzw + ModShadowColor.xyz;
    r6.w = (r17.y == 0.0) ? r12.z : r6.w;
    r5.w = (r17.x == 0.0) ? r12.w : r6.w;
    ps = 1.0 - r6.x;
    r12 = r5 + float4(-1.0, -1.0, -1.0, 0.25);
    r7.y = ps;
    ps = 1.0 - r6.z;
    r6.w = r12.w + r5.w;
    r7.z = ps;
    ps = 2.5 * r7.z;
    r6.z = saturate(r6.w - r7.x);
    r7.w = ps;
    ps = r15.z;
    r2.xyz = r2.xyz * r8.www;
    r6.x = r10.y * r16.y + r15.y;
    ps = r10.w + ps;
    r7.x = r15.x + 1.0;
    r6.w = ps;
    ps = r7.x * r7.z;
    r5.xyz = r6.zzz * r4.xyw;
    r6.z = ps;
    ps = r7.w * r7.x;
    r4.xy = -r12.xy + r6.xw;
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r6.z = float((r6.z > 0.9));
    r4.w = saturate(ps);
    r6.xzw = r14.xyz * r6.zzz - r5.xyz;
    r11.xyz = r13.xyz * r11.xyz + r6.xzw;
    ps = -r12.z;
    r6.xzw = r4.xzy * r4.wzw;
    ps = r10.z + ps;
    r10.xy = r12.xy + r6.xw;
    r6.x = ps;
    ps = 1.0 + r6.x;
    r8.xyz = r6.zzz * r8.xyz;
    r11.w = ps;
    r5.xyz = r11.xyz * r4.www + r5.xyz;
    r6.x = r11.w * r4.w - 2.0;
    r10.z = r0.w * 2.0 + r6.x;
    r10.xyw = r10.xyz * r7.yyy;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r10.z = r10.w + 1.0;
    r0.w = ps;
    r6.xyz = (r7.yyy > 0.0) ? r10.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r0.w);
    r6.x = dot(r6.wyz, r6.wyz);
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r7.xyz = r8.xzy * r7.xxx;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r9.zxy);
    r8.xyz = r6.yzw * r6.xxx;
    r8.xyz = r8.xyz * 2.0 - r9.xyz;
    r6.x = saturate(dot(r3.zxy, r8.zxy));
    ps = log2(r6.x);
    r1.xyz = r5.xyz * r1.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r2.xyz = r2.xyz * r4.www;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r3.zyx));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r0.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
