// ps_5f42850ac89d67de.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 543 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 0000087C 10041A00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_11 : register(c16); // float
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_14 : register(c18); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
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
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 r25 = 0.0;
    float4 r26 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = -r7.w;
    r6.x = float((UniformScalar_7.x >= 1.0));
    ps = UniformScalar_8.x + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r6.w));
    r6.x = r0.z * r6.x;
    r12.x = ps;
    ps = UniformVector_1.x * r1.w;
    r6.yz = r1.wz * 3.0;
    r11.y = ps;
    r12.yzw = r7.www * float3(0.16, -0.8, 1.0) + r6.yzx;
    ps = 15.0 * r7.w;
    r9 = r12.xxyz * float4(-0.125, 1.0, 6.0, 6.0);
    r25.x = saturate(ps);
    r3.yzw = tex2D(Texture2D_3, r9.zw).xyw;
    r6.x = -r1.z + 1.0;
    ps = UniformVector_1.y * r6.x;
    r11.zw = r3.yz + r3.yz;
    r11.x = ps;
    r10 = r11.zwxy + float4(-1.0, -1.0, -0.5, -0.5);
    r0.zw = float2((r11.xy >= 0.5));
    r6.xy = r10.zw - r11.xy;
    r6.xy = r6.yx * r0.wz + r11.yx;
    r6.xy = r6.xy + r6.xy;
    r6 = tex2D(Texture2D_4, r6.xy).xwyz;
    r13 = tex2D(Texture2D_3, r12.yz);
    r11.xy = r13.yx * 2.0 - 1.0;
    ps = -r12.w;
    r10.xy = r10.xy * 0.5;
    ps = r7.z + ps;
    r15.w = dot(r0.wzz, float3(1.0, 1.0, 1.0));
    r0.w = ps;
    r0.z = (r15.w == 0.0) ? r6.x : r6.z;
    r11.zw = r13.xy * 2.0 + r10.xy;
    r0.w = max(r0.w, UniformScalar_9.x);
    ps = 1.0 / UniformScalar_1.x;
    r0.w = min(r0.w, 1.0);
    r2.w = ps;
    r0.w = saturate(r0.w * r2.w);
    ps = r13.z;
    r12 = r11.xzwy + r10.yxyx;
    ps = r7.w * ps;
    r0.w = -r0.w + 1.0;
    r2.w = ps;
    ps = r2.w;
    r3.x = r0.w * r7.w;
    ps = r0.w * ps;
    r15.xy = r3.xw * r13.zw;
    r15.z = ps;
    ps = UniformScalar_14.x;
    r3.yzw = r15.yww + float3(-1.0, -3.0, -2.0);
    r6.x = (r3.w == 0.0) ? r6.w : r0.z;
    r6.x = (r3.z == 0.0) ? r6.y : r6.x;
    ps = 0.05 * ps;
    r6.y = max(r6.x, 0.0);
    r25.z = ps;
    ps = r5.w;
    r6.y = min(r6.y, 0.3);
    ps = (-4e+02) + ps;
    r25.y = r6.y * 3.3333333;
    r6.y = ps;
    ps = 0.00022222222 * r6.y;
    r19.yz = -r25.xy + 1.0;
    r19.x = saturate(ps);
    ps = r12.w;
    r6.yw = r25.xz * r19.zx;
    r6.z = ps;
    ps = 0.01 * r6.z;
    r2.w = r25.y + r6.y;
    r6.z = ps;
    ps = r13.z;
    r10.w = r6.z * r2.w;
    r6.y = ps;
    ps = (-0.3) * r6.y;
    r14.x = r10.w + r1.x;
    r3.x = ps;
    ps = r2.w;
    r9 = r9.yyyx * r4.xyzx;
    ps = r12.x * ps;
    r10.xy = r9.xy * r6.ww;
    r7.x = ps;
    ps = 0.025 * r7.x;
    r18.xy = r3.xy * r2.ww;
    r3.w = ps;
    r10.z = r3.w + r18.x;
    r11 = r10.xzwy + r1.wyxz;
    ps = r11.x;
    r6.z = -r11.w + 1.0;
    r6.y = ps;
    ps = UniformVector_1.x * r6.y;
    r6.z = r6.z * UniformVector_1.y;
    r6.w = ps;
    r0.zw = r6.zw - 0.5;
    ps = r18.x;
    r22.xy = float2((r6.zw >= 0.5));
    ps = r1.y + ps;
    r0.zw = r0.zw - r6.zw;
    r3.z = ps;
    r3.xy = r0.wz * r22.yx + r6.wz;
    r14.yzw = r3.zxy + r3.wxy;
    r23 = tex2D(Texture2D_5, r14.xy);
    r3.x = -r7.z + 1.0;
    r6.yz = saturate(UniformVector_3.yz);
    ps = r1.z;
    r6.yz = r6.zy * UniformScalar_5.xx;
    r16.w = ps;
    ps = 1.0 / UniformScalar_5.x;
    r6.zw = floor(-r6.yz);
    r6.y = ps;
    ps = (UniformScalar_0.x >= 0.0) ? 1.0 : 0.0;
    r6.yz = -r6.zw * r6.yy;
    r7.w = ps;
    ps = UniformScalar_6.x + r6.y;
    r16.z = r9.w + r1.w;
    r3.y = ps;
    ps = UniformScalar_6.x + r6.z;
    r10.yw = r5.xy * ScreenPositionScaleBias.xy;
    r3.z = ps;
    ps = r23.w;
    r4 = r3.xxyz - r6.yzyz;
    r6.y = ps;
    ps = 1.0 / r4.z;
    r7.yz = r12.yz - 2.0;
    r6.z = ps;
    ps = 1.0 / r4.w;
    r3.zw = r7.yz + r13.xy;
    r6.w = ps;
    ps = 1.0 - r6.y;
    r7.yz = saturate(r4.xy * r6.zw);
    r4.z = ps;
    r3.xy = r7.zy * r4.zz + r23.ww;
    ps = r1.w + r1.w;
    r13.xyz = r3.yzw + r13.zxy;
    r0.z = ps;
    ps = (UniformScalar_0.x > 0.0) ? 1.0 : 0.0;
    r26.y = float((r13.x >= 0.5));
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.yz = float2((r15.xz >= 0.05));
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r26.xz = -r6.yz + 1.0;
    r4.y = ps;
    r6.zw = (-abs(r7.yy) >= 0.0) ? 1.0 : r26.xy;
    ps = 1.0 - r6.x;
    r16.xy = r4.xy * abs(r8.xy);
    r6.y = ps;
    r18.zw = (-abs(r7.ww) >= 0.0) ? r26.zy : r6.zw;
    ps = 2.5 * r6.y;
    r6.xz = r18.zy + float2(-0.5, 1.0);
    r10.x = ps;
    ps = 1.0 / r5.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r6.w = ps;
    r8.xy = r10.yw * r6.ww + ScreenPositionScaleBias.wz;
    ps = r1.z + r1.z;
    r4.xy = r11.xw + r11.xw;
    r0.w = ps;
    r12.xyz = tex2D(Texture2D_8, r4.xy).xyz;
    r21 = tex2D(Texture2D_4, r14.zw);
    r8.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r24.x = tex2D(Texture2D_7, r16.zw).z;
    r24.yz = tex2D(ModShadowAccumTexture, r16.xy).xy;
    r20.xyz = tex2D(Texture2D_6, r14.xy).xyz;
    r10.z = tex2D(ShadowTexture, r0.xy).x;
    r16.z = tex2D(Texture2D_5, r11.zy).w;
    r11 = tex2D(Texture2D_2, r0.zw);
    r4.xyw = tex2D(Texture2D_0, r4.xy).xyz;
    r0.xzw = tex2D(Texture2D_1, r0.zw).xyz;
    ps = 0.1 - -r2.z;
    r16.y = saturate(r5.w * 0.0001);
    r0.y = ps;
    r0.xzw = r0.xzw * 2.0 - 1.0;
    r1.xyz = r4.xyw * 2.0 - 1.0;
    ps = r23.w;
    r1.w = r23.w * UniformScalar_11.x;
    r6.x = ps;
    r17.xyz = r4.zzz * UniformVector_6.xzy + r1.www;
    ps = (-0.5) + r6.x;
    r5.xyz = r0.xzw - r1.xyz;
    r0.x = ps;
    r5.w = r5.z * r11.w - 2.0;
    r14.xyz = r5.xyz * r11.www + r1.xyz;
    r16.xw = saturate(r0.yx * float2(5.0, 3.3333333));
    r4.xyz = -r16.zxy + 1.0;
    ps = UniformVector_7.x * UniformVector_7.w;
    r0.yz = r4.yy * ModShadowGroupColor.xy;
    r0.x = ps;
    r0.w = r7.z * r4.x + r16.z;
    ps = 1.0 - r3.x;
    r1.yzw = -r0.wyz + 1.0;
    r1.x = ps;
    ps = UniformVector_7.y * UniformVector_7.w;
    r3 = r13.yzyz * r1.xxyy;
    r0.y = ps;
    r7.z = (abs(r7.y) > 0.0) ? r26.y : 1.0;
    r5.x = (abs(r7.w) > 0.0) ? r7.z : r26.y;
    r7.yz = (-abs(r7.yy) >= 0.0) ? 0.0 : r3.zw;
    r7.zw = (-abs(r7.ww) >= 0.0) ? r3.xy : r7.yz;
    r0.w = saturate(r10.x * r6.z - 0.5);
    ps = UniformVector_7.z * UniformVector_7.w;
    r10.xy = abs(r6.zy) * abs(r6.zy);
    r0.z = ps;
    r3 = r0 * r23;
    ps = -r0.w;
    r6.x = dot(r2.zxy, r2.zxy);
    ps = r3.w + ps;
    r23.xyz = r3.xyz * r23.www;
    r6.y = ps;
    r17.xyz = r23.xyz * UniformScalar_12.xxx + r17.xzy;
    r3.w = r25.x * r6.y + r0.w;
    ps = rsqrt(abs(r6.x));
    r5.y = r3.w * r5.x;
    r6.x = ps;
    r6.yzw = -ModShadowColor.xyz + 1.0;
    r20.xyz = r20.xyz + r20.xyz;
    r3.xyz = r6.xxx * r2.xyz;
    ps = r10.x * r10.x;
    r0.yzw = r24.xyz * float3(0.5, 0.875, 0.875);
    r5.z = ps;
    ps = r10.z * r10.z;
    r1.xy = r0.zw * r1.zw;
    r1.w = ps;
    r13.xyz = r23.xyz - r0.yyy;
    ps = r13.w;
    r1.z = dot(r22.yxx, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r7.y = (r1.z == 0.0) ? r21.x : r21.y;
    ps = 1.0 - r6.x;
    r22 = r1.xyzz + float4(0.125, 0.125, -3.0, -2.0);
    r0.x = ps;
    r6.x = (r22.w == 0.0) ? r21.z : r7.y;
    ps = r12.w;
    r7.y = r22.x * r22.y;
    r1.xyz = r7.yyy * r6.yzw + ModShadowColor.xyz;
    r20.w = (r22.z == 0.0) ? r21.w : r6.x;
    ps = r2.w * ps;
    r6 = r20 - 1.0;
    r7.y = ps;
    ps = r6.w;
    r2.xyz = r6.xyz * UniformVector_5.xyz;
    ps = r19.y * ps;
    r6.xy = r2.xy * r16.ww;
    r2.w = ps;
    r6.x = dot(r7.yz, r18.ww) + r6.x;
    r6.y = dot(r7.xw, r18.ww) + r6.y;
    ps = r5.z * r5.z;
    r6.zw = r2.zw + float2(-1.0, 2.25);
    r7.x = ps;
    ps = r16.w;
    r7.xyz = r7.xxx * r17.xzy;
    ps = r6.z * ps;
    r6.w = r6.w + r2.w;
    r6.z = ps;
    ps = r6.w;
    r7.xyz = r7.xzy * r10.yyy;
    ps = -r15.y + ps;
    r6.xyz = -r14.zxy + r6.zxy;
    r5.z = saturate(ps);
    ps = 1.0 - r0.x;
    r2.yzw = r7.yzx * r5.yyx;
    r13.w = ps;
    r7.xy = r6.yz * r3.ww + r14.xy;
    r0 = r13 * r5.xxxz + r0.yyyx;
    r5.xyz = r0.www * r12.xyz;
    ps = 1.0 + r6.x;
    r12.xyz = -r5.xyz + r11.xyz;
    r6.w = ps;
    r5.xyz = r12.xyz * r11.www + r5.xyz;
    r6.xyz = r10.yyy * r0.xyz - r5.xyz;
    r0 = r6 * r3.wwww + r5;
    r7.z = r4.w * 2.0 + r0.w;
    r6.xyz = r7.zxy * r4.zzz;
    ps = 1.0 + r6.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r4.zzz > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r4.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r2.x = r2.w * r3.w;
    r6.x = ps;
    r4.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r4.zxy, r9.zxy);
    r6.xyz = r4.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r9.xyz;
    r6.x = saturate(dot(r3.zxy, r6.zxy));
    ps = log2(r6.x);
    r0.xyz = r0.xyz * r7.xyz;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r7.xyz = r1.www * r8.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r4.zyx, r3.zyx));
    r6.x = ps;
    r6.xyz = r2.xzy * r6.xxx;
    r6.y = r0.z * r6.w + r6.y;
    r6.xz = r0.xy * r6.ww + r6.xz;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColor.xzy;
    r6.xyz = r6.xzy * r1.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
