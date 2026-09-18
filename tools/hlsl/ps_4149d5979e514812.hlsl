// ps_4149d5979e514812.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 540 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000870 10041B00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c19); // float4
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
    float4 r27 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = -r7.w;
    r0.z = dot(r4.zxy, r4.zxy);
    ps = UniformScalar_8.x + ps;
    r6.x = -r1.z + 1.0;
    r6.w = ps;
    ps = UniformVector_1.y * r6.x;
    r0.w = float((UniformScalar_7.x >= 1.0));
    r6.z = ps;
    ps = (UniformScalar_0.x >= 0.0) ? 1.0 : 0.0;
    r6.y = r1.w * UniformVector_1.x;
    r13.z = ps;
    ps = r6.w;
    r9.yz = r1.wz * 3.0;
    ps = r0.w * ps;
    r6.xw = float2((r6.yz >= 0.5));
    r9.x = ps;
    r17.yzw = r7.www * float3(0.16, -0.8, 1.0) + r9.yzx;
    r9.xy = r6.yz - 0.5;
    ps = rsqrt(abs(r0.z));
    r10.xy = r9.xy - r6.yz;
    r17.x = ps;
    ps = r1.z;
    r9 = r17.yxzx * float4(6.0, -0.125, 6.0, 1.0);
    r0.w = ps;
    r6.yz = r10.xy * r6.xw + r6.yz;
    ps = r6.y + r6.y;
    r16 = r9.wwwy * r4.xyzx;
    r6.y = ps;
    ps = r6.z + r6.z;
    r0.z = r16.w + r1.w;
    r6.z = ps;
    r9.y = tex2D(Texture2D_7, r0.zw).z;
    r12 = tex2D(Texture2D_4, r6.yz);
    r15.yzw = tex2D(Texture2D_3, r9.xz).xyw;
    r14 = tex2D(Texture2D_3, r17.yz).wxyz;
    ps = r1.w + r1.w;
    r11.w = UniformScalar_14.x * 0.05;
    r9.z = ps;
    ps = r5.w;
    r23.x = saturate(r7.w * 15.0);
    ps = 0.0001 * ps;
    r6.y = r5.w - 4e+02;
    r4.x = saturate(ps);
    ps = r2.z;
    r11.y = r14.w * (-0.3);
    r10.xy = r14.zy * 2.0 - 1.0;
    ps = 0.1 + ps;
    r4.zw = r15.yz + r15.yz;
    r6.z = ps;
    ps = -r17.w;
    r4.y = dot(r6.xww, float3(1.0, 1.0, 1.0));
    r6.x = (r4.y == 0.0) ? r12.x : r12.y;
    ps = r7.z + ps;
    r17 = r4.yyzw + float4(-3.0, -2.0, -1.0, -1.0);
    r6.w = ps;
    r6.x = (r17.y == 0.0) ? r12.z : r6.x;
    ps = r6.w;
    r9.xw = r17.zw * 0.5;
    r4.y = ps;
    r10.zw = r14.yz * 2.0 + r9.xw;
    r6.x = (r17.x == 0.0) ? r12.w : r6.x;
    ps = UniformScalar_9.x;
    r0.z = max(r6.x, 0.0);
    r4.z = ps;
    ps = max(r4.y, r4.z);
    r10 = r10.zxwy + r9.xwwx;
    r0.w = ps;
    ps = 1.0 / UniformScalar_1.x;
    r9.xw = min(r0.zw, float2(0.3, 1.0));
    r6.w = ps;
    ps = 0.00022222222 * r6.y;
    r18.x = saturate(r9.w * r6.w);
    r4.z = saturate(ps);
    ps = r10.w;
    r18.yw = r9.xy * float2(3.3333333, 0.5);
    r6.y = ps;
    ps = 0.01 * r6.y;
    r26.zw = -r18.xy + 1.0;
    r6.w = ps;
    r4.y = r23.x * r26.w + r18.y;
    ps = r26.z;
    r12.w = r6.w * r4.y;
    ps = r7.w * ps;
    r11.x = r12.w + r1.x;
    r15.x = ps;
    ps = 5.0 * r6.z;
    r9.xy = r15.xw * r14.wx;
    r4.w = saturate(ps);
    ps = r4.y;
    r11.z = r9.y - 1.0;
    ps = r10.y * ps;
    r24.yzw = r11.yzw * r4.yyz;
    r0.w = ps;
    ps = 0.025 * r0.w;
    r15.x = r24.y + r1.y;
    r15.w = ps;
    ps = r15.w;
    r25.xy = r5.xy * ScreenPositionScaleBias.xy;
    ps = r24.y + ps;
    r12.xy = r16.xy * r24.ww;
    r12.z = ps;
    ps = r1.z + r1.z;
    r12 = r12.xzwy + r1.wyxz;
    r9.w = ps;
    ps = r12.x + r12.x;
    r6.y = r12.x * UniformVector_1.x;
    r1.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = -r12.w + 1.0;
    r1.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = r6.z * UniformVector_1.y;
    r1.z = ps;
    ps = (-0.5) + r6.z;
    r1.zw = r1.yz * abs(r8.xy);
    r8.x = ps;
    ps = (-0.5) + r6.y;
    r13.yw = float2((r6.yz >= 0.5));
    r8.y = ps;
    ps = 1.0 / r5.w;
    r25.zw = r8.xy - r6.zy;
    r13.x = ps;
    r15.yz = r25.zw * r13.wy + r6.zy;
    ps = r12.w + r12.w;
    r11.yzw = r15.xzy + r15.wzy;
    r1.y = ps;
    r15.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r21.xyz = tex2D(Texture2D_8, r1.xy).xyz;
    r20 = tex2D(Texture2D_2, r9.zw);
    r23.y = tex2D(Texture2D_5, r12.zy).w;
    r8 = tex2D(Texture2D_4, r11.zw);
    r26.x = tex2D(ShadowTexture, r0.xy).x;
    r1.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r12.xyz = tex2D(Texture2D_1, r9.zw).xyz;
    r5.xyz = tex2D(Texture2D_6, r11.xy).xyz;
    r11 = tex2D(Texture2D_5, r11.xy);
    ps = (UniformScalar_0.x > 0.0) ? 1.0 : 0.0;
    r0.x = -r7.z + 1.0;
    r5.w = ps;
    ps = UniformVector_3.y;
    r10.y = -r11.w + 1.0;
    r6.z = saturate(ps);
    ps = UniformVector_3.z;
    r26.y = r14.w * r7.w;
    r6.y = saturate(ps);
    r7.xyz = r5.zxy * 2.0 - 1.0;
    ps = UniformScalar_5.x * r6.y;
    r6.w = r11.w - 0.5;
    r0.y = ps;
    ps = UniformScalar_5.x * r6.z;
    r6.y = -r14.x + 1.0;
    r0.z = ps;
    ps = 1.0 - r6.y;
    r19.xyz = UniformVector_7.xyz * UniformVector_7.www;
    r5.x = ps;
    ps = 3.3333333 * r6.w;
    r22.yzw = r12.xyz + r12.xyz;
    r7.w = saturate(ps);
    ps = 1.0 / UniformScalar_5.x;
    r0.yz = floor(-r0.yz);
    r6.z = ps;
    ps = UniformVector_5.x * r7.y;
    r17.yzw = r1.xyz + r1.xyz;
    r7.y = ps;
    ps = UniformVector_5.y * r7.z;
    r6.zw = -r0.yz * r6.zz;
    r7.z = ps;
    ps = UniformVector_5.z * r7.x;
    r0.yz = r6.zw + UniformScalar_6.xx;
    r7.x = ps;
    ps = (-1.0) - -r7.x;
    r27 = r0.xxyz - r6.zwzw;
    r6.w = ps;
    ps = 1.0 / r27.z;
    r12.zw = r7.yz * r7.ww;
    r6.z = ps;
    ps = 1.0 / r27.w;
    r18.z = r7.w * r6.w;
    r6.w = ps;
    ps = 1.0 - r6.x;
    r5.yz = saturate(r27.xy * r6.zw);
    r7.x = ps;
    ps = 2.5 * r7.x;
    r10.xz = r10.xz - 2.0;
    r1.w = ps;
    ps = r10.w;
    r9.zw = r26.yx * r26.zx;
    ps = r4.y * ps;
    r0.xy = float2((r9.xz >= 0.05));
    r0.z = ps;
    ps = r4.w;
    r24.x = dot(r13.yww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r6.w = (r24.x == 0.0) ? r8.x : r8.y;
    r12.xy = r25.xy * r13.xx + ScreenPositionScaleBias.wz;
    ps = 1.0 - r6.x;
    r7.yzw = r24.xxz + float3(-3.0, -2.0, 1.0);
    r6.z = ps;
    r19.w = saturate(r1.w * r7.w - 0.5);
    r6.x = (r7.z == 0.0) ? r8.z : r6.w;
    r17.x = (r7.y == 0.0) ? r8.w : r6.x;
    ps = 1.0 - r4.x;
    r1.yw = abs(r7.wx) * abs(r7.wx);
    r1.x = ps;
    ps = r1.y * r1.y;
    r8 = r19 * r11;
    r23.z = ps;
    ps = -r19.w;
    r6.xw = r10.xz + r14.yz;
    ps = r8.w + ps;
    r4 = r17.yzwx - 1.0;
    r23.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r10.xw = -r23.yx + 1.0;
    r7.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r22.x = r4.w * r10.w;
    r7.y = ps;
    ps = 1.0 - r0.x;
    r17 = r22 + float4(2.25, -1.0, -1.0, -1.0);
    r13.x = ps;
    ps = r17.x;
    r8.yzw = r8.xyz * r11.www;
    ps = r22.x + ps;
    r17.xyz = r17.yzw - r4.xyz;
    r6.z = ps;
    r4.w = r17.z * r20.w - 2.0;
    r17.xyz = r17.xyz * r20.www + r4.xyz;
    ps = 1.0 - r0.y;
    r10.z = saturate(r6.z - r9.y);
    r13.w = ps;
    ps = r23.z * r23.z;
    r22 = r5.xzyz * r10.zxyy;
    r2.w = ps;
    ps = r23.x * r23.w;
    r7.w = r22.y + r23.y;
    r7.z = ps;
    ps = r6.y;
    r5.xyz = r8.yzw - r18.www;
    ps = r22.x + ps;
    r6.yz = r22.wz + r11.ww;
    r0.x = ps;
    ps = 1.0 - r6.y;
    r4.xyz = r0.xxx * r21.xyz;
    r14.x = ps;
    ps = 1.0 - r7.x;
    r6.xyz = r6.zxw + r14.wyz;
    r14.z = ps;
    ps = 1.0 - r7.y;
    r21.xyz = -r4.xyz + r20.xyz;
    r14.w = ps;
    r4.xyz = r21.xyz * r20.www + r4.xyz;
    ps = 1.0 - r7.w;
    r13.y = float((r6.x >= 0.5));
    r14.y = ps;
    ps = r19.w;
    r6 = r6.yzyz * r14.yyxx;
    r7.x = (abs(r5.w) > 0.0) ? r13.y : 1.0;
    r8.x = (abs(r13.z) > 0.0) ? r7.x : r13.y;
    r6.xy = (-abs(r5.ww) >= 0.0) ? 0.0 : r6.xy;
    r7.xy = (-abs(r5.ww) >= 0.0) ? 1.0 : r13.xy;
    r13.xy = (-abs(r13.zz) >= 0.0) ? r13.wy : r7.xy;
    r0.xy = (-abs(r13.zz) >= 0.0) ? r6.zw : r6.xy;
    r6.xyz = r5.xyz * r8.xxx + r18.www;
    r5.xyz = r1.www * r6.xyz - r4.xyz;
    r18.x = dot(r0.zx, r13.yy) + r12.z;
    r18.y = dot(r0.wy, r13.yy) + r12.w;
    ps = r7.z + ps;
    r6.xyz = -r17.zxy + r18.zxy;
    r0.w = ps;
    r7.xy = r6.yz * r0.ww + r17.xy;
    ps = 1.0 + r6.x;
    r6.w = dot(r2.zxy, r2.zxy);
    r5.w = ps;
    r5 = r5 * r0.wwww + r4;
    r7.z = r1.z * 2.0 + r5.w;
    r7.xyz = r7.zxy * r1.xxx;
    ps = 1.0 + r7.x;
    r6.x = dot(r3.zxy, r3.zxy);
    r7.w = ps;
    r7.xyz = (r1.xxx > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r1.xxx >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r6.w));
    r6.y = dot(r7.zxy, r7.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r3.xyz = r6.zzz * r2.xyz;
    r6.y = ps;
    r4.xyz = r7.xyz * r6.yyy;
    r6.y = dot(r4.zxy, r16.zxy);
    r6.yzw = r4.xyz * r6.yyy;
    r6.yzw = r6.yzw * 2.0 - r16.xyz;
    r7.x = saturate(dot(r3.zxy, r6.wyz));
    ps = log2(r7.x);
    r6.yzw = -ModShadowColor.xyz + 1.0;
    r15.x = ps;
    r7.xyw = r15.xzy * float3(15.0, 0.875, 0.875);
    r13.zw = r7.wy * r14.zw;
    r7.yzw = r13.xzw + float3(-0.5, 0.125, 0.125);
    ps = r7.z * r7.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.yyyy)) clip(-1.0);
    r7.w = ps;
    r0.xyz = tex2D(LightAttenuationTexture, r12.xy).xyz;
    ps = 1.0 - r6.x;
    r7.z = r11.w * UniformScalar_11.x;
    r6.x = saturate(ps);
    r2.xyz = r10.yyy * UniformVector_6.xzy + r7.zzz;
    ps = log2(r6.x);
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    r0.xyz = r9.www * r0.xyz;
    r2.xyz = r8.yzw * UniformScalar_12.xxx + r2.xzy;
    r2.xyz = r2.www * r2.xzy;
    r2.xyz = r2.xzy * r1.www;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r8.y = r0.w * r8.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r2.yzw = r2.yzx * r8.yyx;
    r6.x = ps;
    ps = r2.w;
    r0.xyz = r0.xzy * r6.xxx;
    ps = r0.w * ps;
    r1.xyz = r5.xyz * r1.xyz;
    r2.x = ps;
    ps = pow(2.0, r7.x);
    r6.x = saturate(dot(r4.zyx, r3.zyx));
    r7.x = ps;
    r7.xyz = r2.xyz * r7.xxx;
    r7.xy = r1.xy * r6.xx + r7.xy;
    r7.z = r1.z * r6.x + r7.z;
    r6.xyz = r7.www * r6.yzw + ModShadowColor.xyz;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
