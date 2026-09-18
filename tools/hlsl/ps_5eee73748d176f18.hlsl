// ps_5eee73748d176f18.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 570 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000008E8 10041900 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
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
sampler2D ModShadowAccumTexture : register(s11);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color1;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_1.x * r0.w;
    r6 = r0.wzwz * float4(3.0, 3.0, 0.5, 0.5);
    r5.y = ps;
    r9.xy = tex2D(Texture2D_6, r6.zw).xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = -r0.z + 1.0;
    r5.w = ps;
    r6.yz = r7.ww * float2(0.16, -0.8) + r6.xy;
    ps = UniformVector_1.y * r5.x;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r6.x));
    r5.zw = r5.zw * abs(r8.xy);
    r6.x = ps;
    ps = (-0.5) + r5.y;
    r10 = r6.xxzy * float4(-0.125, 1.0, 6.0, 6.0);
    r8.x = ps;
    ps = (-0.5) + r5.x;
    r14.yz = float2((r5.xy >= 0.5));
    r8.y = ps;
    ps = 1.0 / r4.w;
    r11.zw = r8.xy - r5.yx;
    r14.x = ps;
    r8.xy = r11.xy * r14.xx + ScreenPositionScaleBias.wz;
    r9.zw = r11.wz * r14.yz + r5.xy;
    r17 = r9.xywz + r9.xywz;
    r11 = tex2D(Texture2D_4, r17.zw).wxyz;
    r8.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r13.yzw = tex2D(Texture2D_3, r10.wz).xyw;
    r5.xy = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r15 = tex2D(Texture2D_3, r6.yz);
    r19.z = saturate(r7.w * 15.0);
    r6.z = UniformScalar_13.x * 0.05;
    ps = -r7.w;
    r9.y = r1.z + 0.1;
    ps = UniformScalar_8.x + ps;
    r6.y = r15.z * r7.w;
    r8.w = ps;
    ps = r4.w;
    r6.w = float((UniformScalar_7.x >= 1.0));
    ps = (-4e+02) + ps;
    r5.z = dot(r2.zxy, r2.zxy);
    r9.z = ps;
    r12.xy = r15.yx * 2.0 - 1.0;
    ps = 1.0 - r5.z;
    r8.xyz = r8.xyz * r2.www;
    r5.w = saturate(ps);
    ps = log2(r5.w);
    r4.xz = saturate(r9.yz * float2(5.0, 0.00022222222));
    r5.w = ps;
    ps = r13.y + r13.y;
    r5.w = r5.w * LightColorAndFalloffExponent.w;
    r9.z = ps;
    ps = pow(2.0, r5.w);
    r9.y = dot(r14.zyy, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r5.w = (r9.y == 0.0) ? r11.y : r11.z;
    ps = r13.z + r13.z;
    r8 = r8.xzyw * r6.xxxw;
    r9.w = ps;
    ps = r8.w;
    r14 = r9.yyzw + float4(-3.0, -2.0, -1.0, -1.0);
    r6.x = (r14.y == 0.0) ? r11.w : r5.w;
    ps = r7.w + ps;
    r11.yz = r14.zw * 0.5;
    r5.w = ps;
    r12.zw = r15.xy * 2.0 + r11.yz;
    r4.y = (r14.x == 0.0) ? r11.x : r6.x;
    r5.w = -r5.w + r7.z;
    ps = r15.z;
    r9.y = max(r5.w, UniformScalar_9.x);
    r6.x = ps;
    ps = (-0.3) * r6.x;
    r9.z = max(r4.y, 0.0);
    r11.x = ps;
    ps = 0.875 * r5.x;
    r12 = r12.xzwy + r11.zyzy;
    r11.z = ps;
    ps = 1.0 / UniformScalar_0.x;
    r5.xw = min(r9.yz, float2(1.0, 0.3));
    r6.x = ps;
    ps = 0.875 * r5.y;
    r6.x = saturate(r5.x * r6.x);
    r11.w = ps;
    ps = 0.0001 * r4.w;
    r24.xyz = -ModShadowColor.xyz + 1.0;
    r9.x = saturate(ps);
    ps = r12.w;
    r4.w = -r6.x + 1.0;
    r5.x = ps;
    ps = 0.01 * r5.x;
    r13.x = r4.w * r7.w;
    r5.y = ps;
    ps = 3.3333333 * r5.w;
    r6.yw = r6.yz * r4.wz;
    r9.y = ps;
    ps = r4.y;
    r6.xz = r13.xw * r15.zw;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r9.zw = float2((r6.xy >= 0.05));
    r7.x = ps;
    ps = 1.0 - r4.x;
    r20.xzw = -r9.zwy + 1.0;
    r7.w = ps;
    r9.w = r19.z * r20.w + r9.y;
    ps = ModShadowGroupColor.x * r7.w;
    r10.w = r5.y * r9.w;
    r9.y = ps;
    ps = ModShadowGroupColor.y * r7.w;
    r14.x = r10.w + r0.x;
    r9.z = ps;
    ps = (-1.0) - -r6.z;
    r3 = r10.yyyx * r3.xyzx;
    r11.y = ps;
    ps = r9.w;
    r10.xy = r3.xy * r6.ww;
    ps = r12.x * ps;
    r9.xyz = -r9.xyz + 1.0;
    r6.x = ps;
    ps = 0.025 * r6.x;
    r18 = r11.zwxy * r9.yzww;
    r4.w = ps;
    r10.z = r4.w + r18.z;
    r13 = r10.xzwy + r0.wyxz;
    ps = r13.x;
    r5.x = -r13.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r5.w = r5.x * UniformVector_1.y;
    r5.x = ps;
    r4.xy = r5.wx - 0.5;
    ps = r18.z;
    r10.xz = float2((r5.xw >= 0.5));
    ps = r0.y + ps;
    r4.yz = r4.xy - r5.wx;
    r4.x = ps;
    r4.yz = r4.yz * r10.zx + r5.wx;
    r14.yzw = r4.xzy + r4.wzy;
    r10.y = tex2D(Texture2D_5, r13.zy).w;
    r11 = tex2D(Texture2D_5, r14.xy);
    r5.xy = saturate(UniformVector_2.xy);
    r5.xy = r5.yx * UniformScalar_4.xx;
    ps = rsqrt(abs(r5.z));
    r5.yw = floor(-r5.xy);
    r5.x = ps;
    ps = 1.0 / UniformScalar_4.x;
    r4.xyz = r5.xxx * -SpotDirection.xyz;
    r5.x = ps;
    r5.xz = -r5.yw * r5.xx;
    ps = -r7.z;
    r5.y = dot(r4.zxy, r2.zxy);
    ps = 1.0 + ps;
    r2.yz = r5.xz + UniformScalar_5.xx;
    r2.x = ps;
    ps = -SpotAngles.x - -r5.y;
    r2 = r2.xxyz - r5.xzxz;
    r5.x = ps;
    ps = 1.0 / r2.z;
    r7.z = saturate(r5.x * SpotAngles.y);
    r5.x = ps;
    ps = 1.0 / r2.w;
    r5.y = r3.w + r0.w;
    r5.z = ps;
    r4.xw = saturate(r2.xy * r5.xz);
    ps = r0.z;
    r5.xw = r12.yz - 2.0;
    r5.z = ps;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r16.yz = r5.xw + r15.xy;
    r4.y = ps;
    ps = r11.w;
    r25.xyz = r18.xyw + float3(0.125, 0.125, 1.0);
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r7.y = abs(r25.z) * abs(r25.z);
    r23.x = ps;
    ps = r7.y * r7.y;
    r10.z = dot(r10.xzz, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r7.z * r7.z;
    r23.yzw = r10.yzz + float3(-0.5, -3.0, -2.0);
    r1.w = ps;
    ps = r5.x * r5.x;
    r19.xy = saturate(r23.xy * 3.3333333);
    r19.w = ps;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r2.xyz = -r19.xyz + 1.0;
    r4.z = ps;
    r16.x = r4.x * r2.x + r19.x;
    ps = r0.w + r0.w;
    r12.xyz = r16.xyz + r15.zxy;
    r7.y = ps;
    ps = r0.z + r0.z;
    r20.y = float((r12.x >= 0.5));
    r7.z = ps;
    r5.xw = (-abs(r4.zz) >= 0.0) ? 1.0 : r20.xy;
    r0.xw = (-abs(r4.yy) >= 0.0) ? r20.zy : r5.xw;
    ps = r13.x + r13.x;
    r5.x = r0.x - 0.5;
    r0.y = ps;
    ps = r13.w + r13.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r0.z = ps;
    r13 = tex2D(Texture2D_2, r7.yz);
    r15.xyz = tex2D(Texture2D_8, r5.yz).xyz;
    r5.xzw = tex2D(Texture2D_0, r0.yz).xzy;
    r16.xyz = tex2D(Texture2D_9, r0.yz).xyz;
    r22 = tex2D(Texture2D_4, r14.zw);
    r0.xyz = tex2D(Texture2D_7, r14.xy).xyz;
    r14.xyz = tex2D(Texture2D_1, r7.yz).xyz;
    r14.xyz = r14.xyz * 2.0 - 1.0;
    ps = 1.0 - r11.w;
    r18.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r7.y = ps;
    ps = r11.w;
    r18.xyz = r18.xyz * r11.xyz;
    r5.y = ps;
    ps = UniformScalar_10.x * r5.y;
    r11.xyz = r18.xyz * r11.www;
    r5.y = ps;
    r18.xyz = r7.yyy * UniformVector_5.xzy + r5.yyy;
    r18.xyz = r11.xyz * UniformScalar_11.xxx + r18.xzy;
    ps = r0.x + r0.x;
    r7.yz = r17.xy - 1.0;
    r21.y = ps;
    ps = r0.y + r0.y;
    r17.xyz = r7.yzx * float3(0.036, 0.036, 2.5);
    r21.z = ps;
    r10.x = saturate(r17.z * r25.z - 0.5);
    ps = r0.z + r0.z;
    r5.y = r25.x * r25.y;
    r21.w = ps;
    r0.xyz = r5.yyy * r24.xyz + ModShadowColor.xyz;
    r5.y = (r10.z == 0.0) ? r22.x : r22.y;
    r5.y = (r23.w == 0.0) ? r22.z : r5.y;
    r21.x = (r23.z == 0.0) ? r22.w : r5.y;
    r21 = r21 - 1.0;
    r10.yz = r21.yz * UniformVector_4.xy - r17.xy;
    r10.w = r21.w * UniformVector_4.z - 1.0;
    r2.xy = r4.ww * r2.xy + r19.xy;
    r5.y = dot(r21.xx, r2.zz) + 2.25;
    r4.x = saturate(r5.y - r6.z);
    r6.yz = -r2.xy + 1.0;
    r2 = r19.xxxx * r10;
    ps = -r10.x;
    r5.y = dot(r1.zxy, r1.zxy);
    ps = r2.x + ps;
    r21 = r12.yzyz * r6.yyzz;
    r18.w = ps;
    r6.y = (abs(r4.z) > 0.0) ? r20.y : 1.0;
    r6.zw = (-abs(r4.zz) >= 0.0) ? 0.0 : r21.zw;
    r6.zw = (-abs(r4.yy) >= 0.0) ? r21.xy : r6.zw;
    r16.w = (abs(r4.y) > 0.0) ? r6.y : r20.y;
    r18 = r19.wwwz * r18.xzyw;
    ps = r10.x;
    r4.yzw = r18.xzy * r7.xxx;
    ps = r18.w + ps;
    r10 = r4.xxxy * r16;
    r11.w = ps;
    ps = rsqrt(abs(r5.y));
    r2.x = r10.w * r11.w;
    r5.y = ps;
    r12.xyz = r5.xwz + r5.xwz;
    r1.xyz = r5.yyy * r1.xyz;
    ps = r12.w;
    r11.xyz = r11.xyz - r15.xyz;
    ps = r9.w * ps;
    r17.xy = r17.xy + r2.yz;
    r6.y = ps;
    r6.xy = r17.xy + r6.yx;
    r2.yz = r6.xy + r6.zw;
    r6 = r11 * r16.wwww;
    ps = r2.w;
    r15.xyz = r6.xyz + r15.xyz;
    ps = r0.w * ps;
    r16.xyz = -r10.xyz + r13.xyz;
    r12.w = ps;
    r12 = r12 + float4(-1.0, -1.0, -1.0, 1.0);
    r14.xyz = r14.xyz - r12.xyz;
    r10.xyz = r16.xyz * r13.www + r10.xyz;
    r7.xyz = r7.xxx * r15.xyz - r10.xyz;
    r10.w = r14.z * r13.w - 2.0;
    r5.xyw = r14.xyz * r13.www + r12.xyz;
    r7.w = r12.w - r5.w;
    r2.yz = r2.yz * r0.ww - r5.xy;
    r5.xy = r2.yz * r11.ww + r5.xy;
    r7 = r7 * r11.wwww + r10;
    r5.z = r5.z * 2.0 + r7.w;
    r5.xyz = r5.zxy * r9.xxx;
    ps = 1.0 + r5.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r9.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r9.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r2.yz = r6.ww * r4.zw;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r3.zxy);
    r4.xyz = r5.yzw * r5.xxx;
    r3.xyz = r4.xyz * 2.0 - r3.xyz;
    r5.x = saturate(dot(r1.zxy, r3.zxy));
    ps = log2(r5.x);
    r6.xyz = r7.xyz * r6.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wyz, r1.zxy));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r8.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r1.www;
    r5.xyz = r5.xzy * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
