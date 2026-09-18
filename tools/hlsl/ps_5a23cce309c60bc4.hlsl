// ps_5a23cce309c60bc4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 558 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000008B8 10041900 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
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
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_11 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
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
    float4 color1 : COLOR1; // r7
    float4 color2 : COLOR2; // r8
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
    float4 r7 = In.color1;
    float4 r8 = In.color2;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = -r1.z + 1.0;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10 = r1.wwzz * float4(0.5, 3.0, 0.5, 3.0);
    r7.z = ps;
    r11.yz = r8.ww * float2(0.16, -0.8) + r10.yw;
    ps = UniformVector_1.y * r6.x;
    r7.x = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r7.x));
    r6.xw = r7.yz * abs(r9.xy);
    r11.x = ps;
    ps = UniformVector_1.x * r1.w;
    r13.x = float((UniformScalar_7.x >= 1.0));
    r6.y = ps;
    ps = (-0.5) + r6.y;
    r16 = r11.xxyz * float4(-0.125, 1.0, 6.0, 6.0);
    r7.x = ps;
    ps = (-0.5) + r6.z;
    r13.yw = float2((r6.yz >= 0.5));
    r7.y = ps;
    r14.zw = r7.xy - r6.yz;
    ps = r1.z;
    r14.y = -r8.w + UniformScalar_8.x;
    r10.y = ps;
    r6.yz = r14.zw * r13.yw + r6.yz;
    r6.yz = r6.yz + r6.yz;
    r15 = tex2D(Texture2D_4, r6.yz).xzwy;
    r17.yzw = tex2D(Texture2D_3, r16.zw).xyw;
    r7.yw = tex2D(ModShadowAccumTexture, r6.xw).xy;
    r12 = tex2D(Texture2D_3, r11.yz);
    ps = r5.w;
    r13.z = UniformScalar_13.x * 0.05;
    ps = 0.0001 * ps;
    r20.z = saturate(r8.w * 15.0);
    r9.x = saturate(ps);
    ps = r2.z;
    r6.y = r5.w - 4e+02;
    ps = 0.1 + ps;
    r14.x = r12.z * (-0.3);
    r6.x = ps;
    r11.xy = r12.yx * 2.0 - 1.0;
    ps = r12.z;
    r9.zw = r17.yz + r17.yz;
    ps = r8.w * ps;
    r9.y = dot(r13.yww, float3(1.0, 1.0, 1.0));
    r7.z = ps;
    r6.z = (r9.y == 0.0) ? r15.x : r15.w;
    r6.w = r14.y * r13.x + r8.w;
    ps = 5.0 * r6.x;
    r18 = r9.yyzw + float4(-3.0, -2.0, -1.0, -1.0);
    r15.x = saturate(ps);
    r6.z = (r18.y == 0.0) ? r15.y : r6.z;
    ps = 0.00022222222 * r6.y;
    r6.w = -r6.w + r8.z;
    r15.y = saturate(ps);
    ps = r6.w;
    r0.zw = r18.zw * 0.5;
    r6.x = ps;
    r11.zw = r12.xy * 2.0 + r0.zw;
    r7.x = (r18.x == 0.0) ? r15.z : r6.z;
    ps = UniformScalar_9.x;
    r6.y = max(r7.x, 0.0);
    r6.z = ps;
    ps = max(r6.x, r6.z);
    r11 = r11.xzwy + r0.wzwz;
    r6.x = ps;
    ps = 1.0 / UniformScalar_0.x;
    r6.xy = min(r6.xy, float2(1.0, 0.3));
    r6.z = ps;
    ps = 1.0 / r5.w;
    r15.z = saturate(r6.x * r6.z);
    r15.w = ps;
    ps = r11.w;
    r6.xz = -r15.zx + 1.0;
    r6.w = ps;
    ps = r7.z;
    r17.x = r6.x * r8.w;
    ps = r6.x * ps;
    r8.xy = r17.wx * r12.wz;
    r8.w = ps;
    ps = 3.3333333 * r6.y;
    r9.zw = float2((r8.yw >= 0.05));
    r9.y = ps;
    ps = 0.01 * r6.w;
    r22.xzw = -r9.zwy + 1.0;
    r6.y = ps;
    r9.w = r20.z * r22.w + r9.y;
    ps = 0.875 * r7.y;
    r13.w = r6.y * r9.w;
    r14.z = ps;
    ps = 0.875 * r7.w;
    r17.x = r13.w + r1.x;
    r14.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r13.xy = r5.xy * ScreenPositionScaleBias.xy;
    r9.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r4 = r16.yyyx * r4.xyzx;
    r9.z = ps;
    ps = (-1.0) - -r8.x;
    r6.xyw = r13.xzy * r15.wyw;
    r14.y = ps;
    ps = r9.w;
    r13.xy = r4.xy * r6.yy;
    ps = r11.x * ps;
    r9.xyz = -r9.xyz + 1.0;
    r6.z = ps;
    ps = 0.025 * r6.z;
    r21 = r14.zwxy * r9.yzww;
    r5.w = ps;
    r13.z = r5.w + r21.z;
    r14 = r13.xzwy + r1.wyxz;
    ps = r14.x;
    r7.y = -r14.w + 1.0;
    r6.y = ps;
    ps = UniformVector_1.x * r6.y;
    r7.z = r7.y * UniformVector_1.y;
    r7.y = ps;
    r0.zw = r7.zy - 0.5;
    ps = r21.z;
    r13.zw = float2((r7.yz >= 0.5));
    ps = r1.y + ps;
    r0.zw = r0.zw - r7.zy;
    r5.x = ps;
    r5.yz = r0.wz * r13.zw + r7.yz;
    r17.yzw = r5.xyz + r5.wyz;
    r25.x = tex2D(Texture2D_5, r14.zy).w;
    r5 = tex2D(Texture2D_5, r17.xy);
    r0.zw = tex2D(Texture2D_6, r10.xz).xy;
    r7.w = tex2D(ShadowTexture, r0.xy).x;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r10.w = float((UniformScalar_1.x > 0.0));
    r0.x = ps;
    ps = r1.w + r1.w;
    r10.xz = saturate(UniformVector_2.xy);
    r7.y = ps;
    ps = r1.z + r1.z;
    r10.xz = r10.zx * UniformScalar_4.xx;
    r7.z = ps;
    ps = 1.0 / UniformScalar_4.x;
    r10.xz = floor(-r10.xz);
    r0.y = ps;
    ps = -r8.z;
    r10.xz = -r10.xz * r0.yy;
    ps = 1.0 + ps;
    r15.yz = r10.xz + UniformScalar_5.xx;
    r15.x = ps;
    ps = r7.w * r7.w;
    r15 = r15.xxyz - r10.xzxz;
    r20.w = ps;
    ps = 1.0 / r15.z;
    r24.x = r5.w - 0.5;
    r13.x = ps;
    ps = 1.0 / r15.w;
    r10.x = r4.w + r1.w;
    r13.y = ps;
    ps = r0.z + r0.z;
    r1.xw = saturate(r15.xy * r13.xy);
    r13.x = ps;
    ps = r0.w + r0.w;
    r0.yz = r11.zy - 2.0;
    r13.y = ps;
    ps = r0.z;
    r25.y = dot(r13.zww, float3(1.0, 1.0, 1.0));
    ps = r12.x + ps;
    r24.yzw = r25.xyy + float3(-0.5, -3.0, -2.0);
    r0.z = ps;
    ps = r0.y;
    r20.xy = saturate(r24.xy * 3.3333333);
    ps = r12.y + ps;
    r23.xyz = -r20.xyz + 1.0;
    r0.w = ps;
    r0.y = r1.x * r23.x + r20.x;
    ps = ScreenPositionScaleBias.w + r6.x;
    r18.xyw = r0.zwy + r12.xyz;
    r0.y = ps;
    ps = ScreenPositionScaleBias.z + r6.w;
    r22.y = float((r18.w >= 0.5));
    r0.z = ps;
    r6.xy = (-abs(r10.ww) >= 0.0) ? 1.0 : r22.xy;
    r13.zw = (-abs(r0.xx) >= 0.0) ? r22.zy : r6.xy;
    ps = r14.x + r14.x;
    r12.xyw = r13.xyz + float3(-1.0, -1.0, -0.5);
    r6.x = ps;
    ps = r14.w + r14.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r12.wwww)) clip(-1.0);
    r6.y = ps;
    r11.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r16.xyz = tex2D(Texture2D_1, r7.yz).xyz;
    r19.yzw = tex2D(LightAttenuationTexture, r0.yz).xyz;
    r14 = tex2D(Texture2D_2, r7.yz).xywz;
    r0.yzw = tex2D(Texture2D_9, r6.xy).xyz;
    r15 = tex2D(Texture2D_4, r17.zw);
    r17.xyz = tex2D(Texture2D_7, r17.xy).xyz;
    r1.xyz = tex2D(Texture2D_0, r6.xy).xzy;
    r10.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r6.x = dot(r3.zxy, r3.zxy);
    ps = 1.0 - r6.x;
    r6.w = r5.w * UniformScalar_10.x;
    r6.y = saturate(ps);
    ps = r5.w;
    r7.yzw = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r10.xyz = r10.xyz * r5.xyz;
    r6.x = ps;
    r17.xyz = r17.xyz * 2.0 - 1.0;
    r18.w = r17.z * UniformVector_4.z - 1.0;
    r3.xyz = r6.xxx * UniformVector_5.xzy + r6.www;
    ps = log2(r6.y);
    r10.xyz = r10.xyz * r5.www;
    r6.x = ps;
    r5.xyz = r10.xyz * UniformScalar_11.xxx + r3.xzy;
    r21.xyz = r21.xyw + float3(0.125, 0.125, 1.0);
    ps = abs(r21.z) * abs(r21.z);
    r2.w = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    ps = r1.x + r1.x;
    r21.w = r6.y * r6.y;
    r3.x = ps;
    ps = r1.z + r1.z;
    r6.yw = r21.xw * r21.yw;
    r3.y = ps;
    r7.yzw = r6.yyy * r7.yzw + ModShadowColor.xyz;
    ps = 1.0 - r7.x;
    r5.xyz = r6.www * r5.xzy;
    r12.z = ps;
    ps = r1.y + r1.y;
    r5.xyz = r5.xzy * r12.zzz;
    r3.z = ps;
    r6.y = (r25.y == 0.0) ? r15.x : r15.y;
    r6.y = (r24.w == 0.0) ? r15.z : r6.y;
    r3.w = (r24.z == 0.0) ? r15.w : r6.y;
    r15 = r3 - 1.0;
    r6.yw = r1.ww * r23.xy + r20.xy;
    r7.x = dot(r15.ww, r23.zz) + 2.25;
    ps = r7.x;
    r6.yw = -r6.yw + 1.0;
    ps = -r8.x + ps;
    r3 = r18.xyxy * r6.yyww;
    r5.w = saturate(ps);
    r7.x = (abs(r10.w) > 0.0) ? r22.y : 1.0;
    r6.yw = (-abs(r10.ww) >= 0.0) ? 0.0 : r3.zw;
    r6.yw = (-abs(r0.xx) >= 0.0) ? r3.xy : r6.yw;
    r0.x = (abs(r0.x) > 0.0) ? r7.x : r22.y;
    r3 = r5.wwwx * r0.yzwx;
    r8.xyz = -r3.xyz + r14.xyw;
    r3.xyz = r8.xyz * r14.zzz + r3.xyz;
    r1.xzw = r12.zxy * float3(2.5, 0.036, 0.036);
    r18.x = saturate(r1.x * r21.z - 0.5);
    r18.yz = r17.xy * UniformVector_4.xy - r1.zw;
    r17 = r20.xxxx * r18;
    r19.x = -r18.x + r17.x;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r8 = r20.zwww * r19;
    r7.x = ps;
    ps = rsqrt(abs(r2.w));
    r10.w = r18.x + r8.x;
    r6.x = ps;
    ps = pow(2.0, r7.x);
    r1.x = r3.w * r10.w;
    r7.x = ps;
    r16.xyz = r16.xyz + r16.xyz;
    r2.xyz = r6.xxx * r2.xyz;
    ps = r11.w;
    r10.xyz = r10.xyz - r11.xyz;
    ps = r9.w * ps;
    r18.xy = r1.zw + r17.yz;
    r6.x = ps;
    ps = r17.w;
    r6.xz = r18.xy + r6.xz;
    ps = r13.w * ps;
    r14.xy = r6.xz + r6.yw;
    r16.w = ps;
    r6 = r16 + float4(-1.0, -1.0, -1.0, 1.0);
    r16.xyz = r6.xyz - r15.xyz;
    r3.w = r16.z * r14.z - 2.0;
    r6.xyz = r16.xyz * r14.zzz + r15.xyz;
    ps = r6.w;
    r0 = r10 * r0.xxxx;
    r13.xy = r14.xy * r13.ww - r6.xy;
    r6.xy = r13.xy * r10.ww + r6.xy;
    ps = -r6.z + ps;
    r11.xyz = r0.xyz + r11.xyz;
    r11.w = ps;
    r11.xyz = r12.zzz * r11.xyz - r3.xyz;
    r3 = r11 * r10.wwww + r3;
    r6.z = r1.y * 2.0 + r3.w;
    r6.xyz = r6.zxy * r9.xxx;
    ps = 1.0 + r6.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r9.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r9.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r1.yz = r0.ww * r5.yz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r4.zxy);
    r5.xyz = r6.yzw * r6.xxx;
    r4.xyz = r5.xyz * 2.0 - r4.xyz;
    r6.x = saturate(dot(r2.zxy, r4.zxy));
    ps = log2(r6.x);
    r0.xyz = r3.xyz * r0.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r8.xyz = r8.ywz * r7.xxx;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wyz, r2.zxy));
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r8.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r7.ywz;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
