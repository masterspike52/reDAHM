// ps_e8564775aa0f080e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 459 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000072C 10041600 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c16); // float4
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c18); // float2
float4 SpotDirection : register(c17); // float3
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_6 : register(c9); // float
float4 UniformScalar_7 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
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
sampler2D Texture2D_9 : register(s10);
sampler2D ShadowTexture : register(s11);
sampler2D ModShadowAccumTexture : register(s12);

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
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 - r1.z;
    r11.w = ps;
    ps = UniformScalar_13.x;
    r0.w = r5.w - 4e+02;
    ps = 0.05 * ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r9.x = ps;
    ps = 1.0 / r5.w;
    r6.zw = r5.xy * ScreenPositionScaleBias.xy;
    r6.y = ps;
    r6.yz = r6.zw * r6.yy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.x));
    r6.w = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r6.w));
    r9.z = saturate(r0.w * 0.00022222222);
    r6.w = ps;
    ps = r6.w;
    r12 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    ps = r4.x * ps;
    r10.yzw = r0.zzz * -SpotDirection.xyz;
    r10.x = ps;
    ps = r6.w;
    r0.z = dot(r10.wyz, r3.zxy);
    ps = r4.y * ps;
    r0.z = r0.z - SpotAngles.x;
    r10.y = ps;
    ps = r6.w;
    r9.y = saturate(r0.z * SpotAngles.y);
    ps = r4.z * ps;
    r0.zw = r9.xy * r9.zy;
    r10.z = ps;
    r11.xy = r10.xy * r0.zz + r1.wz;
    ps = r1.w;
    r11.z = -r11.y + 1.0;
    ps = UniformVector_1.x * ps;
    r3.xyz = r11.xzw * UniformVector_1.xyy;
    r3.w = ps;
    r4 = r3 - 0.5;
    r18 = float4((r3 >= 0.5));
    r4 = r4 - r3;
    r3 = r4 * r18 + r3;
    r13 = r3.wxyz + r3.wxyz;
    r9 = tex2D(Texture2D_9, r1.xy);
    r16 = tex2D(Texture2D_4, r12.xy);
    r17 = tex2D(Texture2D_3, r13.xw);
    r3.xyz = tex2D(LightAttenuationTexture, r6.yz).xyz;
    r15.y = tex2D(ShadowTexture, r0.xy).x;
    r4 = tex2D(Texture2D_6, r1.xy);
    r14 = tex2D(Texture2D_7, r1.xy).xzyw;
    r15.xzw = tex2D(Texture2D_5, r1.xy).xyz;
    r12.yzw = tex2D(Texture2D_4, r12.zw).xyw;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r0.x = float((UniformScalar_5.x > 0.0));
    r6.w = ps;
    ps = r5.w;
    r6.y = r2.z + 0.1;
    r5.xyz = r15.xzw * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r6.z = saturate(r6.y * 5.0);
    r6.y = saturate(ps);
    ps = 1.0 - r6.x;
    r15.xzw = UniformVector_5.xzy * 2e+01;
    r6.x = saturate(ps);
    ps = r14.x * r14.w;
    r19.xyz = UniformVector_4.xzy * 2e+01;
    r14.x = ps;
    ps = r14.y * r14.w;
    r4.xyz = r4.xzy * r4.www;
    r14.y = ps;
    ps = r14.z * r14.w;
    r4.xyz = r19.xyz * r4.xyz;
    r14.z = ps;
    ps = log2(r6.x);
    r14.xyz = r15.xzw * r14.xyz;
    r6.x = ps;
    r15.xzw = (abs(r0.xxx) > 0.0) ? r4.xzy : r14.xzy;
    r4.xyz = (-abs(r0.xxx) >= 0.0) ? r14.yxz : r4.yxz;
    r4.yzw = (-abs(r6.www) >= 0.0) ? r14.yxz : r4.xyz;
    r14.xyz = (abs(r6.www) > 0.0) ? r15.xzw : r14.xzy;
    ps = -r7.w;
    r6.w = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    ps = UniformScalar_9.x + ps;
    r6.w = r6.w - r14.x;
    r3.w = ps;
    ps = r7.w;
    r4.x = saturate(r6.w + r14.x);
    ps = 15.0 * ps;
    r0.y = float((UniformScalar_8.x >= 1.0));
    r20.w = saturate(ps);
    ps = LightColorAndFalloffExponent.w * r6.x;
    r20.xyz = r5.xyz * UniformVector_3.xyz;
    r6.x = ps;
    ps = 1.0 - r6.z;
    r15.xw = -r20.zw + 1.0;
    r6.z = ps;
    ps = 1.0 - r6.y;
    r15.z = saturate(dot(r4.wyz, float3(0.59, 0.11, 0.3)));
    r6.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r5.xy = r15.yx * r15.yz;
    r4.y = ps;
    ps = pow(2.0, r6.x);
    r3.xyz = r5.xxx * r3.xyz;
    r0.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r3 = r3.xzyw * r0.xxxy;
    r0.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r3.w + r7.w;
    r0.y = ps;
    ps = -r6.x;
    r8.xy = r0.xy * abs(r8.xy);
    ps = r7.z + ps;
    r22.x = dot(r18.xyy, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r6.x;
    r22.y = dot(r18.wzz, float3(1.0, 1.0, 1.0));
    r4.z = ps;
    r6.x = (r22.y == 0.0) ? r17.x : r17.y;
    ps = UniformScalar_10.x;
    r21 = r22.xyyx + float4(-3.0, -2.0, -3.0, -2.0);
    r4.w = ps;
    r6.x = (r21.y == 0.0) ? r17.z : r6.x;
    r0.x = (r21.z == 0.0) ? r17.w : r6.x;
    ps = max(r4.z, r4.w);
    r6.y = max(r0.x, 0.0);
    r6.x = ps;
    ps = 1.0 / UniformScalar_11.x;
    r6.xy = min(r6.xy, float2(1.0, 0.3));
    r0.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r4.w = saturate(r6.x * r0.y);
    r4.z = ps;
    ps = 3.3333333 * r6.y;
    r4 = -r4.wxyz + 1.0;
    r18.y = ps;
    r12.x = r4.x * r7.w;
    ps = r1.w + r1.w;
    r6.xy = r12.wx * r16.wz;
    r7.y = ps;
    ps = r1.z + r1.z;
    r0.y = float((r6.y >= 0.05));
    r7.z = ps;
    ps = r12.y + r12.y;
    r7.xw = -r0.xy + 1.0;
    r1.x = ps;
    r6.z = (UniformScalar_9.x > 0.0) ? r7.w : 1.0;
    r6.z = (UniformScalar_9.x >= 0.0) ? r6.z : r7.w;
    ps = r12.z + r12.z;
    r1.z = r6.z * r9.w;
    r1.y = ps;
    ps = r11.x + r11.x;
    r5.xzw = r1.zxy + float3(-0.5, -1.0, -1.0);
    r0.x = ps;
    ps = r11.y + r11.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r0.y = ps;
    r8.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r12 = tex2D(Texture2D_2, r7.yz);
    r11.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    r13 = tex2D(Texture2D_3, r13.yz);
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r18.xzw = tex2D(Texture2D_1, r7.yz).xyz;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = dot(r2.zxy, r2.zxy);
    r17.xyz = r9.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r19.xyz = r18.xzw * 2.0 - 1.0;
    r18.zw = r16.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r16.xyz = r0.xyz + r0.xyz;
    r6.z = ps;
    r2.xyz = r6.zzz * r2.xyz;
    r8.zw = -r20.xy * r15.zz + r20.xy;
    r6.z = (r22.x == 0.0) ? r13.x : r13.y;
    r6.z = (r21.w == 0.0) ? r13.z : r6.z;
    r18.x = (r21.x == 0.0) ? r13.w : r6.z;
    ps = r20.z;
    r7.yz = -r18.xy + 1.0;
    r6.z = dot(r20.ww, r7.yy) + r18.x;
    ps = r5.y + ps;
    r16.w = r6.z + r18.x;
    r13.z = ps;
    ps = r20.w;
    r16 = r16 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = r7.z * ps;
    r6.z = saturate(r16.w - r6.x);
    r13.w = ps;
    ps = (-1.0) - -r6.x;
    r11.xyw = r6.zzz * r11.xyz;
    r17.w = ps;
    ps = -r11.w;
    r19.xzw = r19.zxy - r16.zxy;
    ps = r12.z + ps;
    r6.xy = -r11.xy + r12.xy;
    r19.y = ps;
    r5.xy = r6.xy * r12.ww + r11.xy;
    ps = 2.5 * r7.x;
    r12 = r19.zwxy * r12.wwww;
    r7.z = ps;
    ps = r11.w;
    r11.xyz = r17.xyz * r4.yyy;
    ps = r12.w + ps;
    r13.xy = r5.zw * 0.5;
    r5.z = ps;
    ps = r12.z;
    r17.xyz = r18.zyw + r13.xwy;
    r6.x = ps;
    r13.xy = r17.xy * r17.yz + r8.zw;
    r7.y = r17.w * r17.y + 1.0;
    ps = r7.y * r7.x;
    r12.xyz = r16.xyz + r12.xyz;
    r6.y = ps;
    ps = r7.z * r7.y;
    r13.xyz = -r12.xyz + r13.xyz;
    r6.z = ps;
    ps = (-2.0) + r6.x;
    r6.yz = r6.yz * r15.ww;
    r12.w = ps;
    ps = (-0.5) + r6.z;
    r6.x = float((r6.y >= 0.9));
    r6.z = saturate(ps);
    r9.xyz = r6.xxx * r14.xyz + r9.xyz;
    r7.xyz = r13.xyz * r6.zzz + r12.xyw;
    r7.w = r0.z * 2.0 + r7.z;
    r9.xyz = r9.xyz - r5.xyz;
    r9.xyz = r9.xyz * r6.zzz + r5.xyz;
    r7.xyw = r7.xyw * r6.www;
    ps = -UniformVector_0.x;
    r7.z = r7.w + 1.0;
    r7.xyz = (r6.www > 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r5.xyz = (r6.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r6.x = dot(r5.zxy, r5.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r7.xyz = r11.xyz * r6.zzz;
    r6.x = ps;
    ps = -UniformVector_0.y;
    r5.xyz = r5.xyz * r6.xxx;
    ps = 1.0 + ps;
    r6.x = dot(r5.zxy, r10.zxy);
    r6.z = ps;
    ps = -UniformVector_0.z;
    r11.xyz = r5.xyz * r6.xxx;
    r10.xyz = r11.xyz * 2.0 - r10.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r2.zxy, r10.zxy));
    r6.w = ps;
    ps = log2(r6.x);
    r0.xyz = r9.xyz * r6.yzw;
    r8.z = ps;
    r6.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r6.z);
    r6.w = saturate(dot(r5.zyx, r2.zyx));
    r6.z = ps;
    r6.xy = r6.xy * r4.zw + 0.125;
    ps = r6.x * r6.y;
    r7.xyz = r7.xyz * r6.zzz;
    r6.x = ps;
    r6.xyz = r6.xxx * r1.xyz + ModShadowColor.xyz;
    r7.xy = r0.xy * r6.ww + r7.xy;
    r7.z = r0.z * r6.w + r7.z;
    r7.xyz = r3.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r7.xzy * r0.www;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
