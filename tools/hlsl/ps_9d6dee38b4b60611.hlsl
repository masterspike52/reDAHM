// ps_9d6dee38b4b60611.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 420 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000690 10041700 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c15); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformScalar_9 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
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
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6 = r1.wzxy * float4(6.0, 6.0, 3.0, 3.0);
    r12.xyz = tex2D(Texture2D_6, r6.zw).xyz;
    r15.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    ps = UniformVector_1.x * r1.w;
    r0.zw = r1.wz * 4.0;
    r11.x = ps;
    r2.w = tex2D(Texture2D_3, r0.zw).z;
    r9.xyz = tex2D(Texture2D_3, r6.xy).xyw;
    r14 = tex2D(Texture2D_3, r1.wz).zwxy;
    ps = 1.0 / r5.w;
    r11.w = -r7.w + UniformScalar_8.x;
    r4.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r2.z + 0.1;
    r0.w = ps;
    ps = rsqrt(abs(r6.y));
    r13.xy = r0.zw * abs(r8.xy);
    r6.y = ps;
    ps = r5.w;
    r18.xyz = UniformVector_2.xyz * UniformVector_2.www;
    ps = (-4e+02) + ps;
    r0.zw = r1.xy * UniformScalar_0.xx;
    r6.z = ps;
    ps = 0.00022222222 * r6.z;
    r10.xy = r1.wz * UniformVector_3.xy;
    r23.x = saturate(ps);
    ps = 5.0 * r6.x;
    r6.z = float((UniformScalar_7.x >= 1.0));
    r17.w = saturate(ps);
    ps = r9.z;
    r11.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = r14.y * ps;
    r16.yzw = r15.xzy + r15.xzy;
    r17.y = ps;
    r8.yz = r11.yz * r4.ww + ScreenPositionScaleBias.wz;
    r6.x = r11.w * r6.z + r7.w;
    ps = r2.w;
    r6.x = -r6.x + r7.z;
    ps = r7.w * ps;
    r6.x = max(r6.x, UniformScalar_9.x);
    r18.w = ps;
    ps = 1.0 / UniformScalar_10.x;
    r6.z = min(r6.x, 1.0);
    r6.x = ps;
    ps = r6.y;
    r6.x = saturate(r6.z * r6.x);
    ps = r4.x * ps;
    r12.w = -r6.x + 1.0;
    r15.x = ps;
    ps = r6.y;
    r12 = r18 * r12;
    ps = r4.y * ps;
    r17.z = float((r12.w >= 0.05));
    r15.y = ps;
    ps = r6.y;
    r23.yzw = -r17.wyz + 1.0;
    r6.x = (UniformScalar_8.x > 0.0) ? r23.w : 1.0;
    r16.x = (UniformScalar_8.x >= 0.0) ? r6.x : r23.w;
    ps = r4.z * ps;
    r8.xw = r23.xz * float2(-0.125, 0.2);
    r15.z = ps;
    r6.xy = r15.yx * r8.xx + r1.zw;
    ps = 1.0 - r1.z;
    r16 = r16.xywz + float4(-0.5, -1.0, -1.0, -1.0);
    r6.w = ps;
    ps = 1.0 - r6.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r16.xxxx)) clip(-1.0);
    r6.z = ps;
    r11.yzw = r6.wyz * UniformVector_1.yxy;
    r1 = r11.wzxy - 0.5;
    r22 = float4((r11.wzxy >= 0.5));
    ps = 2.5 * r6.y;
    r4 = r1 - r11.wzxy;
    r1.x = ps;
    r4 = r4.yxzw * r22.yxzw + r11.zwxy;
    ps = 2.5 * r6.x;
    r4 = r4 + r4;
    r1.y = ps;
    r8.xyz = tex2D(LightAttenuationTexture, r8.yz).xyz;
    r10.z = tex2D(ShadowTexture, r0.xy).x;
    r11.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r13.xy = tex2D(ModShadowAccumTexture, r13.xy).xy;
    r20 = tex2D(Texture2D_2, r4.xy);
    r21 = tex2D(Texture2D_2, r4.zw);
    r6.yzw = tex2D(Texture2D_7, r10.xy).xyz;
    r10.xyw = tex2D(Texture2D_1, r1.xy).zxy;
    r1.xzw = tex2D(Texture2D_0, r0.zw).xyw;
    ps = r7.w;
    r0.w = saturate(r5.w * 0.0001);
    ps = 1e+01 * ps;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r7.y = saturate(ps);
    r13.zw = r1.xz * 2.0 - 1.0;
    ps = r10.x + r10.x;
    r0.x = float((UniformScalar_4.x >= 1.0));
    r17.x = ps;
    ps = 4.0 * r9.x;
    r0.y = float((UniformScalar_4.x > 1.0));
    r10.x = ps;
    r19.x = r14.z * 4.0 - 4.0;
    ps = r14.w + r14.w;
    r6.x = dot(r3.zxy, r3.zxy);
    r7.x = ps;
    ps = 1.0 - r6.x;
    r7.zw = r10.yw * 4.0;
    r6.x = saturate(ps);
    r6.yzw = (-abs(r0.yyy) >= 0.0) ? r6.yzw : 1.0;
    r5.xyz = (-abs(r0.xxx) >= 0.0) ? 1.0 : r6.yzw;
    ps = log2(r6.x);
    r18.x = r17.y - 1.0;
    r6.x = ps;
    ps = 1.0 * r9.y;
    r0.xz = r23.yy * ModShadowGroupColor.xy;
    r10.y = ps;
    ps = (-2.0) + r7.x;
    r3.x = dot(r22.yxx, float3(1.0, 1.0, 1.0));
    r0.y = ps;
    ps = (-2.0) + r7.z;
    r3.y = dot(r22.zww, float3(1.0, 1.0, 1.0));
    r6.w = ps;
    r1.y = (r3.y == 0.0) ? r21.x : r21.y;
    r6.z = (r3.x == 0.0) ? r20.x : r20.y;
    ps = (-2.0) + r7.w;
    r3 = r3.xyyx + float4(-3.0, -2.0, -3.0, -2.0);
    r6.y = ps;
    r6.z = (r3.w == 0.0) ? r20.z : r6.z;
    r1.y = (r3.y == 0.0) ? r21.z : r1.y;
    r19.w = (r3.z == 0.0) ? r21.w : r1.y;
    r3.x = (r3.x == 0.0) ? r20.w : r6.z;
    ps = r0.y;
    r6.z = max(r19.w, 0.0);
    ps = r9.y + ps;
    r6.z = min(r6.z, 0.3);
    r19.y = ps;
    ps = 1.0 - r0.x;
    r19.z = r6.z * 3.3333333;
    r0.x = ps;
    ps = 1.0 - r0.z;
    r3.yz = -r19.wz + 1.0;
    r0.y = ps;
    ps = 1.0 - r0.w;
    r10.w = r7.y * r3.z;
    r0.w = ps;
    ps = UniformScalar_1.x * r0.w;
    r18.yzw = r19.xzy + r10.xwy;
    r0.z = ps;
    ps = 1.0 - r3.x;
    r17.yzw = r18.xyz * r18.zzw;
    r6.z = ps;
    ps = r16.y;
    r1.y = dot(r2.zxy, r2.zxy);
    r9.y = r17.w * 2.0 + r16.z;
    ps = r17.z + ps;
    r14.zw = r17.xy + float2(-1.0, 1.0);
    r9.x = ps;
    ps = rsqrt(abs(r1.y));
    r3.w = r14.w * r3.y;
    r1.y = ps;
    ps = -r6.w;
    r10.xyw = r1.yyy * r2.xyz;
    r6.w = r3.w * r14.x - r3.w;
    ps = r9.x + ps;
    r3.yz = r7.yy * r6.zw;
    r2.y = ps;
    ps = -r6.y;
    r14.xy = r3.yw + r3.xz;
    ps = r9.y + ps;
    r6.yz = r14.yz * float2(2.5, 0.5);
    r2.z = ps;
    ps = (-0.5) + r6.y;
    r2.x = r16.w - r6.z;
    r7.y = saturate(ps);
    r1.y = r2.x * r7.y + r6.z;
    r6.yz = r2.yz * r7.yy - 2.0;
    r6.zw = r0.zz * r13.zw + r6.yz;
    ps = r1.w;
    r3.xyz = r12.xyz * r5.xyz;
    r6.y = ps;
    ps = (-1.0) + r6.y;
    r6.zw = r6.zw + r7.zw;
    r6.y = ps;
    ps = (-1.0) + r1.y;
    r2.xy = r6.zw * r0.ww;
    r6.z = ps;
    r2.zw = r6.zy * r0.ww + 1.0;
    r2 = (r0.zwww > 0.0) ? r2.wxyz : float4(1.0, 0.0, 0.0, 1.0);
    r2 = (r0.zwww >= 0.0) ? r2 : float4(1.0, 0.0, 0.0, 1.0);
    r6.y = dot(r2.wyz, r2.wyz);
    r5.xyz = r3.xyz * r2.xxx;
    r3.xyz = r5.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    ps = rsqrt(abs(r6.y));
    r9.x = abs(r14.w) * abs(r14.w);
    r6.y = ps;
    r12.xyz = r2.yzw * r6.yyy;
    r6.y = dot(r12.zxy, r15.zxy);
    ps = -ModShadowColor.x;
    r6.yzw = r12.xyz * r6.yyy;
    r6.yzw = r6.yzw * 2.0 - r15.xyz;
    ps = 1.0 + ps;
    r6.z = saturate(dot(r10.wxy, r6.wyz));
    r6.y = ps;
    ps = log2(r6.z);
    r7.x = r14.x + r14.x;
    r13.z = ps;
    ps = -ModShadowColor.y;
    r2.xyz = r13.xyz * float3(0.875, 0.875, 15.0);
    ps = 1.0 + ps;
    r7.zw = r2.xy * r0.xy;
    r6.z = ps;
    ps = -ModShadowColor.z;
    r9.yzw = r7.xzw + float3(-0.75, 0.125, 0.125);
    ps = 1.0 + ps;
    r7.x = saturate(r9.y + r8.w);
    r6.w = ps;
    ps = r9.x * r9.x;
    r7.w = saturate(dot(r12.zyx, r10.wyx));
    r10.x = ps;
    ps = r9.z * r9.w;
    r0.xyz = r7.xxx * r11.xyz;
    r10.y = ps;
    r6.yzw = r10.yyy * r6.yzw + ModShadowColor.xyz;
    ps = r10.x * r10.x;
    r0.xyz = r0.xyz * r1.www;
    r7.z = ps;
    ps = r10.z * r10.z;
    r1.xyz = r5.xyz - r0.xyz;
    r7.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r3.xyz = r7.zzz * r3.xyz;
    r6.x = ps;
    r1.xyz = r1.xyz * r7.yyy + r0.xyz;
    ps = pow(2.0, r6.x);
    r0.xyz = r7.xxx * r8.xyz;
    r6.x = ps;
    r0.xyz = r0.xzy * r6.xxx;
    r1.xyz = r1.xyz * r4.xyz;
    ps = pow(2.0, r2.z);
    r7.xyz = r3.xyz * r7.yyy;
    r6.x = ps;
    r7.xyz = r7.xyz * r6.xxx;
    r7.xy = r1.xy * r7.ww + r7.xy;
    r7.z = r1.z * r7.w + r7.z;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.ywz;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
