// ps_e6500f3469bb9ef3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 354 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000588 10041400 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
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
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10.x = tex2D(ShadowTexture, r0.xy).x;
    ps = r5.w;
    r6.y = r2.z + 0.1;
    ps = (-4e+02) + ps;
    r7.xy = r1.wz * UniformVector_1.xy;
    r6.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r6.xy = saturate(r6.xy * float2(0.00022222222, 5.0));
    r10.w = ps;
    ps = (-0.025) * r6.x;
    r7.z = dot(r4.zxy, r4.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r7.z));
    r6.z = -r6.y + 1.0;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r9.xyz = r6.xxx * r4.xyz;
    r17.y = ps;
    r10.yz = r9.xy * r6.ww + r7.xy;
    ps = ModShadowGroupColor.y * r6.z;
    r17.xw = r10.zx * r10.wx;
    r17.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r16.yzw = -r17.xyz + 1.0;
    r16.x = ps;
    ps = UniformVector_2.x * r1.w;
    r6.yz = r16.yx * UniformVector_2.yx;
    r3.x = ps;
    r6.x = r6.z * r10.y;
    r0 = tex2D(Texture2D_1, r6.xy);
    r4.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    ps = trunc(UniformScalar_1.x);
    r14.xy = r1.wz * 6.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = -r1.z + 1.0;
    r7.z = ps;
    ps = UniformVector_2.y * r6.z;
    r7.xy = r1.wz * UniformVector_6.xy;
    r3.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.zw = r4.xy + r4.xy;
    r7.w = ps;
    r6.z = (r6.x == 0.0) ? r0.x : r0.y;
    ps = (-3.0) + r6.x;
    r12.zw = r5.xy * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = (-2.0) + r6.x;
    r7.zw = r7.zw * abs(r8.xy);
    r6.x = ps;
    r6.x = (r6.x == 0.0) ? r0.z : r6.z;
    r19 = r3.zwxy + float4(-1.0, -1.0, -0.5, -0.5);
    r6.x = (r6.y == 0.0) ? r0.w : r6.x;
    ps = 0.25 + r6.x;
    r11.xy = float2((r3.xy >= 0.5));
    r6.y = ps;
    ps = 1.0 / r5.w;
    r12.xy = r19.zw - r3.xy;
    r11.z = ps;
    r0.xy = r12.zw * r11.zz + ScreenPositionScaleBias.wz;
    r6.zw = r12.xy * r11.xy + r3.xy;
    r3.xyw = r6.zwy + r6.zwx;
    r15.xyz = tex2D(Texture2D_5, r10.yz).xyz;
    r13.xyw = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r8 = tex2D(Texture2D_1, r3.xy);
    r20.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r12 = tex2D(Texture2D_4, r1.xy);
    r7.xyz = tex2D(Texture2D_7, r7.xy).xyz;
    r0.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r6.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r4.xyz = tex2D(Texture2D_2, r14.xy).xyw;
    r1.xyw = tex2D(Texture2D_0, r10.yz).xyz;
    r14.xyz = UniformVector_5.xzy * 2e+01;
    r6.w = float((UniformScalar_4.x >= 1.0));
    r7.w = float((UniformScalar_4.x > 1.0));
    r10.xyz = r1.xyw * 2.0 - 1.0;
    r20.zw = r4.xy * 2.0 - 1.0;
    r0.xyz = r0.xyz * 2.0 - 1.0;
    r7.xyz = (-abs(r7.www) >= 0.0) ? r7.xyz : 1.0;
    r12.xyz = r12.xyz * r12.www;
    r1.xyz = r14.xzy * r12.xyz;
    r7.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r7.yxz;
    r12.xyz = r7.yxz * r6.xyz + r1.xyz;
    ps = UniformScalar_5.x * r7.y;
    r6.w = dot(r2.zxy, r2.zxy);
    r7.w = ps;
    ps = rsqrt(abs(r6.w));
    r18.x = r7.w * r6.x;
    r6.w = ps;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformScalar_5.x * r6.z;
    r0.xzw = r0.zxy * UniformVector_4.zxy;
    r18.y = ps;
    ps = UniformScalar_5.x * r6.y;
    r3.xyz = r6.www * r2.xyz;
    r18.z = ps;
    r18.yz = r18.zy * r7.xz;
    ps = r5.w;
    r6 = r20.zwxy * float4(0.5, 0.5, 0.875, 0.875);
    ps = 0.0001 * ps;
    r7.x = dot(r1.zxy, float3(0.11, 0.3, 0.59));
    r0.y = saturate(ps);
    ps = r7.x;
    r7.zw = r19.xy + r6.xy;
    ps = -r1.x + ps;
    r13.z = dot(r11.xyy, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    r6.y = (r13.z == 0.0) ? r8.x : r8.y;
    ps = r4.z;
    r7.x = saturate(r7.x + r1.x);
    r11.xy = -r0.zw * r7.xx + r0.zw;
    ps = r4.w * ps;
    r4.xyz = r18.xyz + UniformScalar_6.xxx;
    r6.x = ps;
    ps = 1.0 - r7.x;
    r2.xyz = r17.www * r13.xyw;
    r7.y = ps;
    ps = r3.w;
    r4.xyz = r4.xyz * r7.yyy;
    ps = -r6.x + ps;
    r13.xy = r6.zw * r16.zw;
    r6.z = saturate(ps);
    r5.xyz = r6.zzz * r15.xyz;
    ps = (-1.0) - -r6.x;
    r13 = r13.xyzz + float4(0.125, 0.125, -3.0, -2.0);
    r7.y = ps;
    r6.x = (r13.w == 0.0) ? r8.z : r6.y;
    ps = r0.y;
    r6.y = r13.x * r13.y;
    r6.z = ps;
    r1.xyz = r6.yyy * r14.xyz + ModShadowColor.xyz;
    r6.x = (r13.z == 0.0) ? r8.w : r6.x;
    ps = 1.0 - r6.z;
    r6.y = max(r6.x, 0.0);
    r8.z = ps;
    ps = 1.0 - r6.x;
    r6.z = min(r6.y, 0.3);
    r6.y = ps;
    ps = 1.0 - r0.x;
    r8.yw = r6.zy * float2(3.3333333, 2.5);
    r8.x = ps;
    r6 = r8.yyyx * r7.yzwx;
    r6.w = r0.x + r6.w;
    ps = r6.x;
    r7.xyz = r12.xyz - r5.xyz;
    r6.x = ps;
    ps = 1.0 + r6.x;
    r6.yz = r11.xy + r6.yz;
    r6.x = ps;
    r7.w = saturate(r8.w * r6.x - 0.5);
    r5.xyz = r7.xyz * r7.www + r5.xyz;
    r6.xyz = -r10.xyz + r6.yzw;
    r6.xy = r6.xy * r7.ww + r10.xy;
    r6.z = r6.z * r7.w - 2.0;
    r6.z = r1.w * 2.0 + r6.z;
    r6.xyz = r6.zxy * r8.zzz;
    ps = 1.0 + r6.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r8.zzz > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r8.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r0.xyz = r4.xyz * r7.www;
    r6.x = ps;
    r4.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r4.zxy, r9.zxy);
    r6.xyz = r4.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r9.xyz;
    r6.x = saturate(dot(r3.zxy, r6.zxy));
    ps = log2(r6.x);
    r7.xyz = r5.xyz * r7.xyz;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r4.zyx, r3.zyx));
    r6.x = ps;
    r6.xyz = r0.xyz * r6.xxx;
    r6.xy = r7.xy * r6.ww + r6.xy;
    r6.z = r7.z * r6.w + r6.z;
    r6.xyz = r2.xzy * r6.xzy;
    r6.xyz = r6.xyz * LightColor.xzy;
    r6.xyz = r6.xzy * r1.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
