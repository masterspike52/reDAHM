// ps_48e33e44876eaeaa.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 570 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 000008E8 10041C00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
    float4 r26 = 0.0;
    float4 r27 = 0.0;
    float4 r28 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_1.x * r0.w;
    r5 = r0.wzwz * float4(3.0, 3.0, 0.5, 0.5);
    r14.w = ps;
    r5.xy = r7.ww * float2(0.16, -0.8) + r5.xy;
    r6.xy = r5.xy * 6.0;
    r15.yzw = tex2D(Texture2D_3, r6.xy).xyw;
    r13.yz = tex2D(Texture2D_6, r5.zw).xy;
    r12 = tex2D(Texture2D_3, r5.xy);
    ps = -r7.w;
    r6.x = UniformScalar_13.x * 0.05;
    ps = UniformScalar_8.x + ps;
    r5.y = -r0.z + 1.0;
    r6.w = ps;
    ps = r4.w;
    r6.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = (-4e+02) + ps;
    r5.w = float((UniformScalar_7.x >= 1.0));
    r5.x = ps;
    ps = 0.00022222222 * r5.x;
    r13.x = r5.y * UniformVector_1.y;
    r5.y = saturate(ps);
    ps = 1.0 / r4.w;
    r5.x = r13.x - 0.5;
    r5.z = ps;
    ps = r5.x;
    r27.x = float((r13.x >= 0.5));
    ps = -r13.x + ps;
    r6 = r6.wxyz * r5.wyzz;
    r5.y = ps;
    ps = r5.y;
    r5.x = r6.x + r7.w;
    ps = r27.x * ps;
    r5.x = -r5.x + r7.z;
    r13.w = ps;
    ps = r0.w + r0.w;
    r5.x = max(r5.x, UniformScalar_9.x);
    r10.x = ps;
    ps = 1.0 / UniformScalar_0.x;
    r5.x = min(r5.x, 1.0);
    r5.y = ps;
    ps = r12.z;
    r5.x = saturate(r5.x * r5.y);
    ps = r7.w * ps;
    r5.x = -r5.x + 1.0;
    r5.y = ps;
    ps = r5.y;
    r15.x = r5.x * r7.w;
    ps = r5.x * ps;
    r14.xy = r15.xw * r12.zw;
    r14.z = ps;
    ps = r13.x + r13.w;
    r9.yz = r14.yw + float2(-1.0, -0.5);
    r26.y = ps;
    ps = r13.y + r13.y;
    r11.xyz = float3((r14.xzw >= float3(0.05, 0.05, 0.5)));
    r26.z = ps;
    ps = r13.z + r13.z;
    r5.x = r9.z - r14.w;
    r26.w = ps;
    r26.x = r5.x * r11.z + r14.w;
    ps = r0.z + r0.z;
    r5.xy = r26.xy + r26.xy;
    r10.y = ps;
    r5 = tex2D(Texture2D_4, r5.xy);
    r27.yzw = tex2D(Texture2D_1, r10.xy).xyz;
    r13.xy = r12.yx * 2.0 - 1.0;
    r15.yz = r15.yz + r15.yz;
    r15.x = r27.x * 2.0 + r11.z;
    r1.w = (r15.x == 0.0) ? r5.x : r5.y;
    r15 = r15.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r5.x = (r15.y == 0.0) ? r5.z : r1.w;
    r5.yz = r15.zw * 0.5;
    r13.zw = r12.xy * 2.0 + r5.yz;
    r19.w = (r15.x == 0.0) ? r5.w : r5.x;
    ps = r7.w;
    r5.x = max(r19.w, 0.0);
    ps = 15.0 * ps;
    r5.x = min(r5.x, 0.3);
    r6.x = saturate(ps);
    ps = r12.z;
    r13 = r13.xzwy + r5.zyzy;
    r5.y = ps;
    ps = 3.3333333 * r5.x;
    r5.z = r13.w * 0.01;
    r11.w = ps;
    ps = (-0.3) * r5.y;
    r25.xzw = -r11.xyw + 1.0;
    r9.x = ps;
    r5.x = r6.x * r25.w + r11.w;
    ps = r13.w;
    r11.w = r5.z * r5.x;
    ps = r5.x * ps;
    r5.z = r11.w + r0.x;
    r20.x = ps;
    ps = r5.x;
    r5.y = dot(r3.zxy, r3.zxy);
    ps = r13.x * ps;
    r15.zw = r9.xy * r5.xx;
    r20.y = ps;
    ps = rsqrt(abs(r5.y));
    r5.x = r15.z + r0.y;
    r20.z = ps;
    r11.xyz = r20.yzz * float3(0.025, -0.125, 1.0);
    r5.w = r5.x + r11.x;
    ps = r11.x;
    r9 = r11.zzzy * r3.xyzx;
    ps = r15.z + ps;
    r11.xy = r9.xy * r6.yy;
    r11.z = ps;
    r28 = tex2D(Texture2D_5, r5.zw);
    ps = 0.1 - -r1.z;
    r11 = r11.xzwy + r0.wyxz;
    r3.z = ps;
    r1.w = tex2D(Texture2D_5, r11.zy).w;
    ps = -r7.z;
    r5.xy = saturate(UniformVector_2.xy);
    ps = 1.0 + ps;
    r3.y = r1.w - 0.5;
    r16.x = ps;
    ps = r28.w;
    r7.xy = r5.yx * UniformScalar_4.xx;
    r5.x = ps;
    ps = 1.0 / UniformScalar_4.x;
    r7.xy = floor(-r7.xy);
    r5.y = ps;
    ps = (-0.5) + r5.x;
    r7.xy = -r7.xy * r5.yy;
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r16.yz = r7.xy + UniformScalar_5.xx;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7 = r16.xxyz - r7.xyxy;
    r5.y = ps;
    ps = 1.0 / r7.z;
    r8.xy = r5.xy * abs(r8.xy);
    r5.x = ps;
    ps = 1.0 / r7.w;
    r19.xyz = saturate(r3.xyz * float3(3.3333333, 3.3333333, 5.0));
    r5.y = ps;
    r7.xy = saturate(r7.xy * r5.xy);
    ps = r0.z;
    r3 = -r19.zxyw + 1.0;
    r8.w = ps;
    r13.x = r7.x * r3.y + r19.x;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r5.xy = r13.yz - 2.0;
    r7.z = ps;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r13.yz = r5.xy + r12.xy;
    r1.w = ps;
    ps = r3.w;
    r24.xyz = r13.xyz + r12.zxy;
    r5.x = ps;
    ps = 2.5 * r5.x;
    r25.y = float((r24.x >= 0.5));
    r23.z = ps;
    r5.xy = (-abs(r1.ww) >= 0.0) ? 1.0 : r25.xy;
    r15.xy = (-abs(r7.zz) >= 0.0) ? r25.zy : r5.xy;
    ps = r9.w;
    r10.zw = r6.zw + ScreenPositionScaleBias.wz;
    ps = r0.w + ps;
    r21.zw = r15.xw + float2(-0.5, 1.0);
    r8.z = ps;
    ps = r11.x;
    r5.x = -r11.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r5.x = r5.x * UniformVector_1.y;
    r5.y = ps;
    ps = (-0.5) + r5.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r21.zzzz)) clip(-1.0);
    r6.y = ps;
    ps = (-0.5) + r5.y;
    r21.xy = float2((r5.xy >= 0.5));
    r6.z = ps;
    ps = r11.x + r11.x;
    r23.xy = r6.yz - r5.xy;
    r6.y = ps;
    r5.xy = r23.yx * r21.yx + r5.yx;
    ps = r11.w + r11.w;
    r5.xy = r5.xy + r5.xy;
    r6.z = ps;
    r0.xyz = tex2D(LightAttenuationTexture, r10.zw).xyz;
    r13.xyz = tex2D(Texture2D_9, r6.yz).xyz;
    r12 = tex2D(Texture2D_2, r10.xy);
    r11.xyz = tex2D(Texture2D_8, r8.zw).xyz;
    r17 = tex2D(Texture2D_4, r5.xy).xzwy;
    r18.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r10.xyz = tex2D(Texture2D_0, r6.yz).xyz;
    r6.yzw = tex2D(Texture2D_7, r5.zw).xyz;
    ps = 0.0001 * r4.w;
    r7.x = saturate(ps);
    ps = 1.0 - r6.x;
    r5.y = dot(r2.zxy, r2.zxy);
    r5.w = ps;
    ps = 1.0 - r5.y;
    r22.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = saturate(ps);
    ps = r28.w;
    r7.w = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = 1.0 - r5.x;
    r0.w = r28.w * UniformScalar_10.x;
    r5.x = ps;
    ps = r6.y + r6.y;
    r4.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r16.y = ps;
    ps = rsqrt(abs(r5.y));
    r8.xyz = r4.xyz * r28.xyz;
    r5.y = ps;
    ps = r6.z + r6.z;
    r28.xyz = r5.yyy * -SpotDirection.xyz;
    r16.z = ps;
    r4.xyz = r5.xxx * UniformVector_5.xzy + r0.www;
    ps = log2(r5.z);
    r8.xyz = r8.xyz * r28.www;
    r5.z = ps;
    r4.xyz = r8.xyz * UniformScalar_11.xxx + r4.xzy;
    ps = r6.w + r6.w;
    r5.y = dot(r28.zxy, r2.zxy);
    r16.w = ps;
    r6.yzw = r27.yzw * 2.0 - 1.0;
    ps = r10.x + r10.x;
    r18.zw = r26.zw - 1.0;
    r2.y = ps;
    ps = rsqrt(abs(r7.w));
    r18 = r18 * float4(0.875, 0.875, 0.036, 0.036);
    r5.x = ps;
    r7.yw = r7.yy * r3.yz + r19.xy;
    r2.xz = -r3.xx * ModShadowGroupColor.xy + 1.0;
    ps = r18.x;
    r3.xyz = r5.xxx * r1.xyz;
    ps = r2.x * ps;
    r7.xyw = -r7.ywx + 1.0;
    r1.y = ps;
    ps = r18.y;
    r24 = r24.yzyz * r7.xxyy;
    r1.xz = (-abs(r1.ww) >= 0.0) ? 0.0 : r24.zw;
    r5.x = (abs(r1.w) > 0.0) ? r25.y : 1.0;
    r13.w = (abs(r7.z) > 0.0) ? r5.x : r25.y;
    r18.xy = (-abs(r7.zz) >= 0.0) ? r24.xy : r1.xz;
    ps = r2.z * ps;
    r1.x = dot(r21.yxx, float3(1.0, 1.0, 1.0));
    r1.z = ps;
    r5.x = (r1.x == 0.0) ? r17.x : r17.w;
    r17.x = saturate(r23.z * r21.w - 0.5);
    ps = r10.y + r10.y;
    r1 = r1.xxyz + float4(-3.0, -2.0, 0.125, 0.125);
    r2.z = ps;
    r5.x = (r1.y == 0.0) ? r17.y : r5.x;
    ps = r10.z + r10.z;
    r7.z = r1.z * r1.w;
    r2.w = ps;
    r7.xyz = r7.zzz * r22.xyz + ModShadowColor.xyz;
    r2.x = (r1.x == 0.0) ? r17.z : r5.x;
    ps = -SpotAngles.x - -r5.y;
    r1 = r2 - 1.0;
    r5.x = ps;
    ps = r1.x;
    r8.xyz = r8.xyz - r11.xyz;
    ps = r5.w * ps;
    r6.yzw = r6.yzw - r1.yzw;
    r16.x = ps;
    r4.w = r6.w * r12.w - 2.0;
    r2.xyz = r6.wyz * r12.www + r1.wyz;
    ps = SpotAngles.y * r5.x;
    r1 = r16.yzwx + float4(-1.0, -1.0, -1.0, 2.25);
    r6.w = saturate(ps);
    r17.yz = r1.xy * UniformVector_4.xy - r18.zw;
    r17.w = r1.z * UniformVector_4.z - 1.0;
    ps = abs(r21.w) * abs(r21.w);
    r19 = r19.xxxx * r17;
    r6.y = ps;
    ps = -r17.x;
    r5.xy = r18.zw + r19.yz;
    r0.w = r19.w * r15.y + 1.0;
    ps = r19.x + ps;
    r18.zw = r5.xy + r20.xy;
    r6.z = ps;
    r5.xyw = r6.wxy * r6.wzy;
    r6.xy = r18.zw + r18.xy;
    ps = r5.w * r5.w;
    r8.w = r17.x + r5.y;
    r6.z = ps;
    r6.xy = r6.xy * r15.yy - r2.yz;
    r6.xy = r6.xy * r8.ww + r2.yz;
    r1.xyz = r6.zzz * r4.xzy;
    ps = r1.w;
    r15 = r8 * r13.wwww;
    ps = r16.x + ps;
    r1.yzw = r1.xzy * r3.www;
    r6.z = ps;
    ps = r6.z;
    r2.yz = r15.ww * r1.zw;
    ps = -r14.y + ps;
    r11.xyz = r15.xyz + r11.xyz;
    r1.x = saturate(ps);
    ps = r0.w;
    r1 = r1.xyxx * r13.xwyz;
    ps = -r2.x + ps;
    r4.xyz = -r1.xzw + r12.xyz;
    r11.w = ps;
    r4.xyz = r4.xyz * r12.www + r1.xzw;
    r11.xyz = r3.www * r11.xyz - r4.xyz;
    r4 = r11 * r8.wwww + r4;
    r6.z = r10.z * 2.0 + r4.w;
    r6.xyw = r6.xyz * r7.www;
    ps = -UniformVector_0.x;
    r6.z = r6.w + 1.0;
    r6.xyz = (r7.www > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r6.x = dot(r6.wyz, r6.wyz);
    r1.x = ps;
    ps = rsqrt(abs(r6.x));
    r2.x = r1.y * r8.w;
    r6.x = ps;
    ps = -UniformVector_0.y;
    r6.yzw = r6.yzw * r6.xxx;
    ps = 1.0 + ps;
    r6.x = dot(r6.wyz, r9.zxy);
    r1.y = ps;
    ps = -UniformVector_0.z;
    r8.xyz = r6.yzw * r6.xxx;
    r8.xyz = r8.xyz * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r3.zxy, r8.zxy));
    r1.z = ps;
    ps = log2(r6.x);
    r1.xyz = r4.xyz * r1.xyz;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.z;
    r6.x = r6.x * 15.0;
    r5.z = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r3.zyx));
    r6.x = ps;
    ps = pow(2.0, r5.z);
    r6.xyz = r2.xyz * r6.xxx;
    r5.z = ps;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r6.xyz * r5.zzz;
    r6.xyz = r6.xyz * r0.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xxx;
    r5.xyz = r5.xzy * r7.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
