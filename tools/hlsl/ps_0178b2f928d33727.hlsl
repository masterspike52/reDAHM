// ps_0178b2f928d33727.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 576 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 00000900 10041A00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c21); // float2
float4 SpotDirection : register(c20); // float3
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
sampler2D ModShadowAccumTexture : register(s10);

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

    r5.x = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r5.x));
    r5.y = r0.z;
    r5.x = ps;
    r5.xz = r5.xx * float2(-0.125, 1.0);
    r9 = r5.zzzx * r3.xyzx;
    r5.x = r9.w + r0.w;
    r3.x = tex2D(Texture2D_7, r5.xy).z;
    ps = -r6.w;
    r5.yz = r0.wz * 3.0;
    ps = UniformScalar_8.x + ps;
    r5.x = float((UniformScalar_7.x >= 1.0));
    r5.w = ps;
    ps = r0.w + r0.w;
    r5.x = r5.w * r5.x;
    r12.x = ps;
    r3.yzw = r6.www * float3(0.16, -0.8, 1.0) + r5.yzx;
    ps = r0.z + r0.z;
    r10.xyw = r3.yzx * float3(6.0, 6.0, 0.5);
    r12.y = ps;
    r19.yzw = tex2D(Texture2D_1, r12.xy).xyz;
    r16.yzw = tex2D(Texture2D_3, r10.xy).xyw;
    r14 = tex2D(Texture2D_3, r3.yz);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = -r0.z + 1.0;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.w = r5.x * UniformVector_1.y;
    r5.w = ps;
    r19.x = float((r12.w >= 0.5));
    ps = r0.w;
    r5.x = -r3.w + r6.z;
    ps = UniformVector_1.x * ps;
    r5.x = max(r5.x, UniformScalar_9.x);
    r15.w = ps;
    ps = 1.0 / UniformScalar_1.x;
    r5.x = min(r5.x, 1.0);
    r5.y = ps;
    ps = r14.z;
    r5.x = saturate(r5.x * r5.y);
    ps = r6.w * ps;
    r5.x = -r5.x + 1.0;
    r5.y = ps;
    ps = r5.y;
    r16.x = r5.x * r6.w;
    ps = r5.x * ps;
    r15.xy = r16.xw * r14.zw;
    r15.z = ps;
    r13.yz = r15.yw + float2(-1.0, -0.5);
    r3.yzw = float3((r15.xzw >= float3(0.05, 0.05, 0.5)));
    r12.z = r19.x * 2.0 + r3.w;
    ps = r5.z;
    r5.x = r13.z - r15.w;
    r5.x = r5.x * r3.w + r15.w;
    ps = abs(r7.x) * ps;
    r8.xyz = r12.zzw + float3(-3.0, -2.0, -0.5);
    r11.x = ps;
    ps = r5.w;
    r5.y = r8.z - r12.w;
    r5.y = r5.y * r19.x + r12.w;
    ps = abs(r7.y) * ps;
    r5.xy = r5.xy + r5.xy;
    r11.y = ps;
    r5 = tex2D(Texture2D_4, r5.xy).xwyz;
    r11.xy = tex2D(ModShadowAccumTexture, r11.xy).xy;
    ps = UniformScalar_14.x;
    r2.w = saturate(r6.w * 15.0);
    r7.xy = r14.yx * 2.0 - 1.0;
    r11.zw = r16.yz * 2.0 - 1.0;
    ps = 0.05 * ps;
    r11 = r11.zxyw * float4(0.5, 0.875, 0.875, 0.5);
    r13.w = ps;
    r7.zw = r14.xy * 2.0 + r11.xw;
    ps = r4.w;
    r17 = r7.xzwy + r11.wxwx;
    r1.w = (r12.z == 0.0) ? r5.x : r5.z;
    r5.x = (r8.y == 0.0) ? r5.w : r1.w;
    r7.w = (r8.x == 0.0) ? r5.y : r5.x;
    ps = (-4e+02) + ps;
    r5.y = max(r7.w, 0.0);
    r5.x = ps;
    ps = 0.00022222222 * r5.x;
    r5.y = min(r5.y, 0.3);
    r16.y = saturate(ps);
    ps = r17.w;
    r3.x = r5.y * 3.3333333;
    r5.x = ps;
    ps = 0.01 * r5.x;
    r23.xzw = -r3.yzx + 1.0;
    r5.x = ps;
    r16.z = r2.w * r23.w + r3.x;
    ps = r14.z;
    r8.w = r5.x * r16.z;
    r5.y = ps;
    ps = (-0.3) * r5.y;
    r3.x = r16.z * r17.x;
    r13.x = ps;
    ps = 0.025 * r3.x;
    r24.xyw = r13.xyw * r16.zzy;
    r5.x = ps;
    ps = r8.w;
    r8.z = r5.x + r24.x;
    ps = r0.x + ps;
    r5.y = r24.x + r0.y;
    r20.x = ps;
    ps = r5.y;
    r8.xy = r9.xy * r24.ww;
    ps = r5.x + ps;
    r8 = r8.xzwy + r0.wyxz;
    r20.y = ps;
    r13.y = tex2D(Texture2D_5, r8.zy).w;
    r26 = tex2D(Texture2D_5, r20.xy);
    r3.y = -r6.z + 1.0;
    ps = r1.z;
    r5.zw = saturate(UniformVector_3.yz);
    ps = 0.1 + ps;
    r13.x = -r14.w + 1.0;
    r5.y = ps;
    ps = r26.w;
    r22.xyz = UniformVector_7.xyz * UniformVector_7.www;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r6.xy = r5.wz * UniformScalar_5.xx;
    r5.z = ps;
    ps = r26.w;
    r5.w = dot(r2.zxy, r2.zxy);
    r5.x = ps;
    ps = 1.0 - r5.x;
    r6.z = r26.w * UniformScalar_11.x;
    r5.x = ps;
    r21.xyz = r5.xxx * UniformVector_6.xzy + r6.zzz;
    ps = rsqrt(abs(r5.w));
    r6.yz = floor(-r6.xy);
    r6.x = ps;
    ps = 1.0 / UniformScalar_5.x;
    r0.xyz = r6.xxx * -SpotDirection.xyz;
    r6.x = ps;
    ps = 5.0 * r5.y;
    r6.yz = -r6.yz * r6.xx;
    r13.z = saturate(ps);
    ps = 3.3333333 * r5.z;
    r5.y = dot(r0.zxy, r2.zxy);
    r13.w = saturate(ps);
    ps = UniformScalar_6.x + r6.y;
    r18.yz = r4.xy * ScreenPositionScaleBias.xy;
    r3.z = ps;
    ps = UniformScalar_6.x + r6.z;
    r0.xyz = -r13.xyz + 1.0;
    r3.w = ps;
    ps = (UniformScalar_0.x >= 0.0) ? 1.0 : 0.0;
    r25 = r3.yyzw - r6.yzyz;
    r0.w = ps;
    ps = 1.0 / r25.z;
    r6.yz = r17.yz - 2.0;
    r6.x = ps;
    ps = 1.0 / r25.w;
    r6.yz = r6.yz + r14.xy;
    r6.w = ps;
    ps = (UniformScalar_0.x > 0.0) ? 1.0 : 0.0;
    r6.xw = saturate(r25.xy * r6.xw);
    r1.w = ps;
    r2.x = r6.w * r0.y + r13.y;
    r6.xw = r6.xw * r5.xx + r26.ww;
    ps = ModShadowGroupColor.x * r0.z;
    r3.yzw = r6.xyz + r14.zxy;
    r7.x = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r23.y = float((r3.y >= 0.5));
    r7.y = ps;
    r5.x = (abs(r1.w) > 0.0) ? r23.y : 1.0;
    r11.x = (abs(r0.w) > 0.0) ? r5.x : r23.y;
    ps = 1.0 - r5.w;
    r7.z = saturate(r4.w * 0.0001);
    r16.x = saturate(ps);
    r7 = -r7.wxyz + 1.0;
    ps = 2.5 * r7.x;
    r18.x = ps;
    ps = 1.0 / r4.w;
    r14.zw = r11.yz * r7.yz;
    r5.x = ps;
    r4.xy = r18.yz * r5.xx + ScreenPositionScaleBias.wz;
    r5.xz = (-abs(r1.ww) >= 0.0) ? 1.0 : r23.xy;
    r14.xy = (-abs(r0.ww) >= 0.0) ? r23.zy : r5.xz;
    r25.xyz = r14.xzw + float3(-0.5, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r25.xxxx)) clip(-1.0);
    ps = r8.x;
    r5.x = -r8.w + 1.0;
    r5.z = ps;
    ps = UniformVector_1.x * r5.z;
    r6.x = r5.x * UniformVector_1.y;
    r6.y = ps;
    ps = (-0.5) + r6.y;
    r11.zw = float2((r6.xy >= 0.5));
    r5.x = ps;
    ps = (-0.5) + r6.x;
    r24.z = dot(r11.wzz, float3(1.0, 1.0, 1.0));
    r5.w = ps;
    r5.x = r5.x - r6.y;
    r5.z = r5.x * r11.w + r6.y;
    ps = -SpotAngles.x - -r5.y;
    r23.xyz = r24.yzz + float3(1.0, -3.0, -2.0);
    r5.x = ps;
    r22.w = saturate(r18.x * r23.x - 0.5);
    ps = SpotAngles.y * r5.x;
    r2.y = abs(r23.x) * abs(r23.x);
    r2.z = saturate(ps);
    r2.yz = r2.yz * r2.yz;
    ps = r2.y * r2.y;
    r18 = r22 * r26;
    r2.y = ps;
    ps = -r22.w;
    r26.xyz = r18.xyz * r26.www;
    ps = r18.w + ps;
    r18.xyz = r26.xyz - r10.www;
    r21.w = ps;
    r21.xyz = r26.xyz * UniformScalar_12.xxx + r21.xzy;
    ps = r8.x + r8.x;
    r21 = r2.yyyw * r21.xzyw;
    r5.x = ps;
    ps = r5.w;
    r4.w = r22.w + r21.w;
    ps = -r6.x + ps;
    r11.y = r4.w * r11.x;
    r18.w = ps;
    r5.w = r18.w * r11.z + r6.x;
    ps = r8.w + r8.w;
    r5.zw = r5.zw + r5.zw;
    r5.y = ps;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r8.xyz = tex2D(Texture2D_8, r5.xy).xyz;
    r12 = tex2D(Texture2D_2, r12.xy);
    r22 = tex2D(Texture2D_4, r5.zw);
    r20.xyz = tex2D(Texture2D_6, r20.xy).xyz;
    r10.xyz = tex2D(Texture2D_0, r5.xy).xyz;
    r8.w = dot(r1.zxy, r1.zxy);
    ps = log2(r16.x);
    r5.yzw = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    r17.xyz = r19.yzw * 2.0 - 1.0;
    ps = 1.0 - r6.w;
    r19.yzw = r10.xyz + r10.xyz;
    r16.x = ps;
    ps = abs(r7.x) * abs(r7.x);
    r20.yzw = r20.xyz + r20.xyz;
    r6.w = ps;
    ps = r17.w;
    r6.x = r25.y * r25.z;
    r6.xyz = r6.xxx * r5.yzw + ModShadowColor.xyz;
    r5.y = (r24.z == 0.0) ? r22.x : r22.y;
    r5.y = (r23.z == 0.0) ? r22.z : r5.y;
    r20.x = (r23.y == 0.0) ? r22.w : r5.y;
    ps = r16.z * ps;
    r20 = r20 - 1.0;
    r3.y = ps;
    ps = rsqrt(abs(r8.w));
    r5.yzw = r20.wyz * UniformVector_5.zxy;
    r8.w = ps;
    ps = 1.0 - r2.x;
    r7.xyz = r8.www * r1.xyz;
    r16.y = ps;
    ps = 1.0 - r2.w;
    r10.xy = r5.zw * r13.ww;
    r16.z = ps;
    ps = r20.x;
    r1.xyz = r21.xzy * r6.www;
    ps = r16.z * ps;
    r20 = r3.zwzw * r16.xxyy;
    r19.x = ps;
    ps = (-1.0) - -r5.y;
    r16 = r19 + float4(2.25, -1.0, -1.0, -1.0);
    r5.w = ps;
    r5.yz = (-abs(r1.ww) >= 0.0) ? 0.0 : r20.zw;
    r3.zw = (-abs(r0.ww) >= 0.0) ? r20.xy : r5.yz;
    ps = r16.x;
    r17.xyz = r17.xyz - r16.yzw;
    ps = r19.x + ps;
    r1.yzw = r1.yzx * r11.yyx;
    r5.y = ps;
    r8.w = r17.z * r12.w - 2.0;
    r11.xyz = r18.xyz * r11.xxx + r10.www;
    r2.xyw = r17.xyz * r12.www + r16.yzw;
    ps = r13.w;
    r0.w = saturate(r5.y - r15.y);
    r5.y = dot(r3.yz, r14.yy) + r10.x;
    r5.z = dot(r3.xw, r14.yy) + r10.y;
    r0.x = r0.x * r0.w + r13.x;
    ps = r5.w * ps;
    r3.xyz = r0.xxx * r8.xyz;
    r5.w = ps;
    r5.yzw = -r2.wxy + r5.wyz;
    r0.xy = r5.zw * r4.ww + r2.xy;
    ps = 1.0 + r5.y;
    r8.xyz = -r3.xyz + r12.xyz;
    r3.w = ps;
    r8.xyz = r8.xyz * r12.www + r3.xyz;
    r3.xyz = r6.www * r11.xyz - r8.xyz;
    r8 = r3 * r4.wwww + r8;
    r0.z = r10.z * 2.0 + r8.w;
    r0.xyw = r0.xyz * r7.www;
    ps = -UniformVector_0.x;
    r0.z = r0.w + 1.0;
    r5.yzw = (r7.www > 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.yzw = (r7.www >= 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.y = dot(r0.wyz, r0.wyz);
    r0.x = ps;
    ps = rsqrt(abs(r5.y));
    r1.x = r1.w * r4.w;
    r5.y = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r0.yzw * r5.yyy;
    ps = 1.0 + ps;
    r5.y = dot(r3.zxy, r9.zxy);
    r0.y = ps;
    ps = -UniformVector_0.z;
    r5.yzw = r3.xyz * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r5.y = saturate(dot(r7.zxy, r5.wyz));
    r0.z = ps;
    ps = log2(r5.y);
    r0.xyz = r8.xyz * r0.xyz;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = r5.y * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.w = saturate(dot(r3.zyx, r7.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r1.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r0.xy * r6.ww + r5.yz;
    r5.w = r0.z * r6.w + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r4.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r2.zzz;
    r5.xyz = r5.xzy * r6.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
