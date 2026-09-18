// ps_78f685120d89b456.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 570 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 000008E8 10041A00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

    ps = r0.w + r0.w;
    r5.yz = r0.wz * 3.0;
    r14.x = ps;
    ps = -r6.w;
    r5.x = float((UniformScalar_7.x >= 1.0));
    ps = UniformScalar_8.x + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r1.w = ps;
    ps = rsqrt(abs(r5.w));
    r5.x = r1.w * r5.x;
    r12.x = ps;
    r12.yzw = r6.www * float3(1.0, 0.16, -0.8) + r5.xyz;
    ps = r0.z + r0.z;
    r10 = r12.xzxw * float4(1.0, 6.0, -0.125, 6.0);
    r14.y = ps;
    r20.yzw = tex2D(Texture2D_1, r14.xy).xyz;
    r13.yzw = tex2D(Texture2D_3, r10.yw).xyw;
    r8 = tex2D(Texture2D_3, r12.zw);
    ps = -r0.z;
    r5.y = r8.z * r6.w;
    ps = 1.0 + ps;
    r11.x = dot(r8.xxxx, float4(1.0, 1.0, 1.0, 1.0));
    r5.x = ps;
    ps = UniformVector_1.y * r5.x;
    r9.zw = r13.yz + r13.yz;
    r15.y = ps;
    ps = r8.x + r8.x;
    r11.z = dot(r8.yyyy, float4(1.0, 1.0, 1.0, 1.0));
    r9.x = ps;
    ps = r8.y + r8.y;
    r20.x = float((r15.y >= 0.5));
    r9.y = ps;
    ps = -r12.y;
    r9 = r9.yxzw - 1.0;
    ps = r6.z + ps;
    r15.zw = r9.zw * 0.5;
    r5.x = ps;
    ps = r0.z;
    r5.x = max(r5.x, UniformScalar_9.x);
    r11.y = ps;
    ps = 1.0 / UniformScalar_1.x;
    r5.x = min(r5.x, 1.0);
    r5.z = ps;
    ps = r10.x;
    r5.x = saturate(r5.x * r5.z);
    ps = r3.x * ps;
    r5.x = -r5.x + 1.0;
    r12.x = ps;
    ps = r5.y;
    r13.x = r5.x * r6.w;
    ps = r5.x * ps;
    r18.xy = r13.xw * r8.zw;
    r18.z = ps;
    ps = UniformVector_1.x * r0.w;
    r22.xyz = UniformVector_7.xyz * UniformVector_7.www;
    r18.w = ps;
    ps = r10.x;
    r5.zw = r18.yw + float2(-1.0, -0.5);
    ps = r3.y * ps;
    r23.yzw = float3((r18.xzw >= float3(0.05, 0.05, 0.5)));
    r12.y = ps;
    r15.x = r20.x * 2.0 + r23.w;
    ps = r10.x;
    r5.x = r5.w - r18.w;
    r16.x = r5.x * r23.w + r18.w;
    ps = r3.z * ps;
    r10.xyw = r15.xxy + float3(-3.0, -2.0, -0.5);
    r12.z = ps;
    ps = r10.z;
    r5.x = r10.w - r15.y;
    ps = r3.x * ps;
    r11.w = r5.x * r20.x;
    r12.w = ps;
    ps = r12.w;
    r16.yzw = r15.yzw + r11.wxz;
    ps = r0.w + ps;
    r5.xy = r16.xy + r16.xy;
    r11.x = ps;
    r10.w = tex2D(Texture2D_7, r11.xy).z;
    r3 = tex2D(Texture2D_4, r5.xy);
    ps = r4.w;
    r5.x = r1.z + 0.1;
    ps = 0.0001 * ps;
    r17.x = saturate(r5.x * 5.0);
    r17.y = saturate(ps);
    ps = r8.z;
    r17.z = -r8.w + 1.0;
    r5.y = ps;
    r5.x = (r15.x == 0.0) ? r3.x : r3.y;
    r5.x = (r10.y == 0.0) ? r3.z : r5.x;
    r26.x = (r10.x == 0.0) ? r3.w : r5.x;
    ps = (-0.3) * r5.y;
    r1.w = max(r26.x, 0.0);
    r5.x = ps;
    ps = r9.y;
    r5.y = min(r1.w, 0.3);
    ps = r15.z + ps;
    r17.w = r5.y * 3.3333333;
    r10.x = ps;
    ps = 15.0 * r6.w;
    r19.x = -r6.z + 1.0;
    r23.x = saturate(ps);
    ps = r9.x;
    r13 = -r17.wzxy + 1.0;
    r10.y = r23.x * r13.x + r17.w;
    ps = r15.w + ps;
    r9.zw = r5.xz * r10.yy;
    r10.z = ps;
    ps = r9.z;
    r3.xy = r10.yx * r10.zy;
    ps = r0.y + ps;
    r8.xy = r10.wx * float2(0.5, 0.01);
    r5.x = ps;
    ps = 0.025 * r3.x;
    r19.w = r8.y * r10.y;
    r5.w = ps;
    r10.w = r5.x + r5.w;
    r10.z = r19.w + r0.x;
    r11 = tex2D(Texture2D_5, r10.zw).xwyz;
    r3.z = UniformScalar_14.x * 0.05;
    ps = r4.w;
    r6.xy = saturate(UniformVector_3.yz);
    ps = (-4e+02) + ps;
    r5.z = r11.y - 0.5;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r6.yx * UniformScalar_5.xx;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = floor(-r6.xy);
    r6.w = ps;
    ps = 1.0 / UniformScalar_5.x;
    r10.xy = r6.zw * abs(r7.xy);
    r5.x = ps;
    ps = r11.y;
    r6.xy = -r6.xy * r5.xx;
    r5.x = ps;
    ps = 0.00022222222 * r5.y;
    r19.yz = r6.xy + UniformScalar_6.xx;
    r1.w = saturate(ps);
    ps = 3.3333333 * r5.z;
    r6 = r19.xxyz - r6.xyxy;
    r7.z = saturate(ps);
    ps = 1.0 / r6.z;
    r5.z = r3.z * r1.w;
    r5.y = ps;
    ps = 1.0 / r6.w;
    r19.xy = r12.xy * r5.zz;
    r5.z = ps;
    ps = 1.0 - r5.x;
    r6.xy = saturate(r6.xy * r5.yz);
    r3.w = ps;
    r6.xz = r6.yx * r3.ww + r11.yy;
    r5.x = r6.z + r8.z;
    ps = (UniformScalar_0.x >= 0.0) ? 1.0 : 0.0;
    r21.y = float((r5.x >= 0.5));
    r1.w = ps;
    ps = (UniformScalar_0.x > 0.0) ? 1.0 : 0.0;
    r21.xzw = -r23.yzx + 1.0;
    r3.z = ps;
    r5.xy = (-abs(r3.zz) >= 0.0) ? 1.0 : r21.xy;
    r9.xy = (-abs(r1.ww) >= 0.0) ? r21.zy : r5.xy;
    r15.zw = r16.zw + r15.zw;
    ps = r5.w;
    r16.zw = r9.xw + float2(-0.5, 1.0);
    ps = r9.z + ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r16.zzzz)) clip(-1.0);
    r19.z = ps;
    r0 = r19.xzwy + r0.wyxz;
    ps = r0.x;
    r5.x = -r0.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r15.x = r5.x * UniformVector_1.y;
    r15.y = ps;
    r25 = r15.zwxy + float4(-2.0, -2.0, -0.5, -0.5);
    r24.xy = float2((r15.xy >= 0.5));
    ps = r0.x + r0.x;
    r5.xy = r25.zw - r15.xy;
    r5.z = ps;
    r5.xy = r5.xy * r24.xy + r15.xy;
    ps = r0.w + r0.w;
    r5.xy = r5.yx + r5.yx;
    r5.w = ps;
    r8.yzw = tex2D(Texture2D_8, r5.zw).xyz;
    r15 = tex2D(Texture2D_2, r14.xy);
    r14.xyz = tex2D(Texture2D_0, r5.zw).xyz;
    r19 = tex2D(Texture2D_4, r5.xy);
    r7.xyw = tex2D(Texture2D_6, r10.zw).xyz;
    r5.zw = tex2D(ModShadowAccumTexture, r10.xy).xy;
    r5.x = tex2D(Texture2D_5, r0.zy).w;
    ps = 1.0 - r5.x;
    r6.w = r11.y * UniformScalar_11.x;
    r5.y = ps;
    r10.xyz = r3.www * UniformVector_6.zyx + r6.www;
    r20.xyz = r20.yzw * 2.0 - 1.0;
    r6.y = r6.y * r5.y + r5.x;
    r5.x = (abs(r3.z) > 0.0) ? r21.y : 1.0;
    r0.w = (abs(r1.w) > 0.0) ? r5.x : r21.y;
    r26.yz = r13.zz * ModShadowGroupColor.xy;
    ps = 0.875 * r5.z;
    r0.xyz = -r26.xyz + 1.0;
    r3.w = ps;
    ps = 0.875 * r5.w;
    r5.x = abs(r16.w) * abs(r16.w);
    r6.w = ps;
    ps = 2.5 * r0.x;
    r16.x = r5.x * r5.x;
    r16.y = ps;
    ps = r7.x + r7.x;
    r5.xw = r16.yx * r16.wx;
    r5.y = ps;
    ps = r7.y + r7.y;
    r22.w = saturate(r5.x - 0.5);
    r5.z = ps;
    ps = 1.0 - r6.x;
    r16 = r22.xywz * r11.xzyw;
    r11.x = ps;
    ps = 1.0 - r6.y;
    r16.xyw = r16.xyw * r11.yyy;
    r11.y = ps;
    ps = r3.w;
    r11 = r25.xyxy * r11.xxyy;
    ps = r0.y * ps;
    r6.x = dot(r24.yxx, float3(1.0, 1.0, 1.0));
    r6.y = ps;
    ps = r6.w;
    r6.z = -r22.w + r16.z;
    r6.w = r23.x * r6.z + r22.w;
    r5.x = (r6.x == 0.0) ? r19.x : r19.y;
    r10.xyz = r16.wxy * UniformScalar_12.xxx + r10.xzy;
    r3.zw = (-abs(r3.zz) >= 0.0) ? 0.0 : r11.zw;
    r3.zw = (-abs(r1.ww) >= 0.0) ? r11.xy : r3.zw;
    ps = r0.z * ps;
    r11.xyz = r5.www * r10.xzy;
    r6.z = ps;
    ps = r7.w + r7.w;
    r10 = r6.xxyz + float4(-3.0, -2.0, 0.125, 0.125);
    r5.w = ps;
    r5.x = (r10.y == 0.0) ? r19.z : r5.x;
    r5.x = (r10.x == 0.0) ? r19.w : r5.x;
    r5 = r5.yzwx - 1.0;
    r5.xyz = r5.zxy * UniformVector_5.zxy;
    ps = (-1.0) - -r5.x;
    r6.x = dot(r1.zxy, r1.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r16.z = r7.z * r6.y;
    r6.x = ps;
    r7.xyw = -UniformVector_0.xyz + 1.0;
    ps = abs(r0.x) * abs(r0.x);
    r19.yzw = r14.xyz + r14.xyz;
    r0.x = ps;
    ps = r11.z;
    r6.xyz = r6.xxx * r1.xyz;
    ps = r0.x * ps;
    r1.xyz = r16.xyw - r8.xxx;
    r1.w = ps;
    ps = r5.w;
    r1 = r1 * r0.wwww;
    ps = r21.w * ps;
    r5.xy = r5.yz * r7.zz;
    r19.x = ps;
    r16.x = dot(r3.yz, r9.yy) + r5.x;
    r16.y = dot(r3.xw, r9.yy) + r5.y;
    r5 = r19 + float4(2.25, -1.0, -1.0, -1.0);
    ps = r5.x;
    r9.xyz = r8.xxx + r1.xyz;
    ps = r19.x + ps;
    r3.xyz = r20.xyz - r5.yzw;
    r5.x = ps;
    r8.x = r3.z * r15.w - 2.0;
    r1.xyz = r3.xyz * r15.www + r5.yzw;
    r5.x = saturate(r5.x - r18.y);
    r5.w = r13.y * r5.x + r17.z;
    r5.xyz = -r1.zxy + r16.zxy;
    r3.xy = r5.yz * r6.ww + r1.xy;
    r8.yzw = r5.www * r8.yzw;
    ps = 1.0 + r5.x;
    r16.xyz = -r8.yzw + r15.xyz;
    r9.w = ps;
    r8.yzw = r16.xyz * r15.www + r8.yzw;
    r9.xyz = r0.xxx * r9.xyz - r8.yzw;
    r0.yz = r9.wz * r6.ww + r8.xw;
    r3.z = r14.z * 2.0 + r0.y;
    r5.xyz = r3.zxy * r13.www;
    ps = 1.0 + r5.x;
    r3.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r5.xyz = (r13.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r13.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r3.x = r1.w * r6.w;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r12.zxy);
    r1.xyz = r5.yzw * r5.xxx;
    r1.xyz = r1.xyz * 2.0 - r12.xyz;
    r5.x = saturate(dot(r6.zxy, r1.zxy));
    ps = log2(r5.x);
    r3.y = r0.z * r7.w;
    r5.x = ps;
    ps = 1.0 / r4.w;
    r5.x = r5.x * 15.0;
    r1.z = ps;
    ps = pow(2.0, r5.x);
    r1.x = saturate(dot(r5.wzy, r6.zyx));
    r1.y = ps;
    r5.xy = r3.zw * r1.zz + ScreenPositionScaleBias.wz;
    r6.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r5.x = dot(r2.zxy, r2.zxy);
    ps = 1.0 - r5.x;
    r7.z = r6.w * r0.w;
    r5.x = saturate(ps);
    ps = log2(r5.x);
    r5.yzw = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = r10.z * r10.w;
    r0.zw = r11.xy * r0.xx;
    r0.x = ps;
    r5.yzw = r0.xxx * r5.yzw + ModShadowColor.xyz;
    r0.xy = r9.xy * r6.ww + r8.yz;
    r0 = r0.wxyz * r7.zxyz;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0 = r0.ywzx * r1.xyxy;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r0.z = r0.z + r0.w;
    r5.x = ps;
    r0.xy = r3.xy * r1.yx + r0.xy;
    r0.xyz = r0.xzy * r5.xxx;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.ywz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
