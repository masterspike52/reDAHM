// ps_c47f89b98b30c17b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 561 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 000008C4 10041A00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5 = r0.wwzz * float4(3.0, 0.5, 0.5, 3.0);
    r5.xw = r7.ww * float2(0.16, -0.8) + r5.xw;
    r6.xy = r5.xw * 6.0;
    r9.yzw = tex2D(Texture2D_3, r6.xy).xyw;
    r5.yz = tex2D(Texture2D_6, r5.yz).xy;
    r17 = tex2D(Texture2D_3, r5.xw);
    r12.xy = r0.wz + r0.wz;
    ps = r0.w;
    r5.x = -r0.z + 1.0;
    ps = UniformVector_1.x * ps;
    r6.x = -r7.w + UniformScalar_8.x;
    r14.w = ps;
    ps = r17.z;
    r5.w = float((UniformScalar_7.x >= 1.0));
    r5.w = r6.x * r5.w + r7.w;
    ps = r7.w * ps;
    r5.x = r5.x * UniformVector_1.y;
    r6.y = ps;
    ps = (-0.5) - -r5.x;
    r5.w = -r5.w + r7.z;
    r6.x = ps;
    ps = r6.x;
    r25.x = float((r5.x >= 0.5));
    ps = -r5.x + ps;
    r5.w = max(r5.w, UniformScalar_9.x);
    r6.x = ps;
    ps = 1.0 / UniformScalar_0.x;
    r5.w = min(r5.w, 1.0);
    r6.z = ps;
    ps = r6.x;
    r5.w = saturate(r5.w * r6.z);
    ps = r25.x * ps;
    r6.x = -r5.w + 1.0;
    r5.w = ps;
    ps = r6.y;
    r9.x = r6.x * r7.w;
    ps = r6.x * ps;
    r14.xy = r9.xw * r17.zw;
    r14.z = ps;
    ps = r5.x + r5.w;
    r13.yz = r14.yw + float2(-1.0, -0.5);
    r16.y = ps;
    ps = r5.y + r5.y;
    r6.xyw = float3((r14.xzw >= float3(0.05, 0.05, 0.5)));
    r16.z = ps;
    ps = r5.z + r5.z;
    r6.z = r13.z - r14.w;
    r16.w = ps;
    r16.x = r6.z * r6.w + r14.w;
    r5.xy = r16.xy + r16.xy;
    r5 = tex2D(Texture2D_4, r5.xy).xywz;
    r25.yzw = tex2D(Texture2D_1, r12.xy).xyz;
    ps = 15.0 * r7.w;
    r13.w = UniformScalar_13.x * 0.05;
    r20.x = saturate(ps);
    r10.xy = r17.yx * 2.0 - 1.0;
    ps = r4.w;
    r9.yz = r9.yz + r9.yz;
    r9.x = r25.x * 2.0 + r6.w;
    r6.z = (r9.x == 0.0) ? r5.x : r5.y;
    ps = 0.0001 * ps;
    r11 = r9.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r9.z = saturate(ps);
    r5.x = (r11.y == 0.0) ? r5.w : r6.z;
    ps = r4.w;
    r5.yw = r11.zw * 0.5;
    r10.zw = r17.xy * 2.0 + r5.yw;
    r6.z = (r11.x == 0.0) ? r5.z : r5.x;
    ps = (-4e+02) + ps;
    r5.x = max(r6.z, 0.0);
    r5.z = ps;
    ps = 0.00022222222 * r5.z;
    r5.x = min(r5.x, 0.3);
    r9.y = saturate(ps);
    ps = r17.z;
    r19 = r10 + r5.wyyw;
    r5.y = ps;
    ps = 3.3333333 * r5.x;
    r5.z = r19.y * 0.01;
    r9.x = ps;
    ps = (-0.3) * r5.y;
    r10.xy = -r9.xz + 1.0;
    r13.x = ps;
    r9.x = r20.x * r10.x + r9.x;
    ps = r19.y;
    r5.w = r5.z * r9.x;
    ps = r9.x * ps;
    r11.z = r5.w + r0.x;
    r18.x = ps;
    ps = r9.x;
    r5.x = dot(r3.zxy, r3.zxy);
    ps = r19.x * ps;
    r23.xyw = r13.xyw * r9.xxy;
    r18.y = ps;
    ps = rsqrt(abs(r5.x));
    r1.w = r23.x + r0.y;
    r18.z = ps;
    r5.xyz = r18.yzz * float3(0.025, -0.125, 1.0);
    r11.w = r1.w + r5.x;
    ps = r5.x;
    r9 = r5.zzzy * r3.xyzx;
    ps = r23.x + ps;
    r5.xy = r9.xy * r23.ww;
    r5.z = ps;
    r13 = tex2D(Texture2D_5, r11.zw);
    ps = 0.1 - -r1.z;
    r15 = r5.xzwy + r0.wyxz;
    r5.w = ps;
    r5.x = tex2D(Texture2D_5, r15.zy).w;
    r3.x = -r7.z + 1.0;
    r5.yz = saturate(UniformVector_2.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xy = r5.zy * UniformScalar_4.xx;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = floor(-r7.xy);
    r5.z = ps;
    ps = 1.0 / UniformScalar_4.x;
    r12.zw = r5.yz * abs(r8.xy);
    r5.y = ps;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r15.yz = r4.xy * ScreenPositionScaleBias.xy;
    r3.w = ps;
    ps = (-0.5) + r5.x;
    r7.xy = -r7.xy * r5.yy;
    r5.z = ps;
    ps = r13.w;
    r3.yz = r7.xy + UniformScalar_5.xx;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r8 = r3.xxyz - r7.xyxy;
    r5.y = ps;
    ps = 1.0 / r8.z;
    r20.yzw = saturate(r5.wyz * float3(5.0, 3.3333333, 3.3333333));
    r5.x = ps;
    ps = 1.0 / r8.w;
    r7 = -r20.yxzw + 1.0;
    r5.y = ps;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r11.xy = saturate(r8.yx * r5.yx);
    r8.x = ps;
    r3.x = r11.y * r7.z + r20.z;
    ps = r6.z;
    r5.yz = r19.zw - 2.0;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r3.yz = r5.yz + r17.xy;
    r5.z = ps;
    ps = 1.0 - r6.x;
    r10.xzw = r3.xyz + r17.zxy;
    r5.x = ps;
    ps = 1.0 - r6.y;
    r5.w = float((r10.x >= 0.5));
    r5.y = ps;
    r6.xy = (-abs(r8.xx) >= 0.0) ? 1.0 : r5.xw;
    r17.zw = (-abs(r3.ww) >= 0.0) ? r5.yw : r6.xy;
    ps = r15.x;
    r5.x = -r15.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r17.x = r5.x * UniformVector_1.y;
    r17.y = ps;
    r6.xyz = r17.xzy - 0.5;
    r5.xy = float2((r17.xy >= 0.5));
    ps = r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r3.y = ps;
    ps = r9.w;
    r23.z = dot(r5.yxx, float3(1.0, 1.0, 1.0));
    ps = r0.w + ps;
    r6.xy = r6.xz - r17.xy;
    r3.x = ps;
    r0.xz = r6.yx * r5.yx + r17.yx;
    ps = r15.x + r15.x;
    r22.xyz = r23.yzz + float3(1.0, -3.0, -2.0);
    r5.x = ps;
    ps = r15.w + r15.w;
    r6.x = abs(r22.x) * abs(r22.x);
    r5.y = ps;
    ps = 1.0 / r4.w;
    r15.x = r6.x * r6.x;
    r15.w = ps;
    ps = r0.x + r0.x;
    r6.xyz = r15.yzx * r15.wwx;
    r4.x = ps;
    ps = r0.z + r0.z;
    r0.xy = r6.xy + ScreenPositionScaleBias.wz;
    r4.y = ps;
    r0.xyz = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r8.yzw = tex2D(Texture2D_9, r5.xy).xyz;
    r19 = tex2D(Texture2D_4, r4.xy).xzwy;
    r21.xy = tex2D(ModShadowAccumTexture, r12.zw).xy;
    r4.xyz = tex2D(Texture2D_8, r3.xy).xyz;
    r12 = tex2D(Texture2D_2, r12.xy);
    r26.xyz = tex2D(Texture2D_7, r11.zw).xyz;
    r6.xyw = tex2D(Texture2D_0, r5.xy).xyz;
    ps = UniformVector_6.x * UniformVector_6.w;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r3.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r1.w = dot(r1.zxy, r1.zxy);
    r3.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r3.z = ps;
    r24.xyz = r6.xyw * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r0.w = r13.w * UniformScalar_10.x;
    r5.y = saturate(ps);
    ps = r13.w;
    r11.yzw = r26.xyz + r26.xyz;
    r5.x = ps;
    ps = rsqrt(abs(r1.w));
    r3.xyz = r3.xyz * r13.xyz;
    r1.w = ps;
    ps = 1.0 - r5.x;
    r2.xyz = r1.www * r1.xyz;
    r5.x = ps;
    r1.xyz = r5.xxx * UniformVector_5.xzy + r0.www;
    ps = log2(r5.y);
    r3.xyz = r3.xyz * r13.www;
    r5.x = ps;
    r13.xyz = r3.xyz * UniformScalar_11.xxx + r1.xzy;
    r1.xyz = r25.yzw * 2.0 - 1.0;
    r1.xyz = r1.xyz - r24.xyz;
    r4.w = r1.z * r12.w - 2.0;
    r1.xyz = r1.zxy * r12.www + r24.zxy;
    ps = r7.x;
    r3.xyz = r3.xyz - r4.xyz;
    r5.y = ps;
    ps = ModShadowGroupColor.x * r5.y;
    r21.zw = r16.zw - 1.0;
    r16.x = ps;
    ps = ModShadowGroupColor.y * r7.x;
    r21 = r21 * float4(0.875, 0.875, 0.036, 0.036);
    r16.y = ps;
    r16.zw = r11.xx * r7.zw + r20.zw;
    r16 = -r16 + 1.0;
    r16.xy = r21.xy * r16.xy;
    ps = 2.5 * r5.z;
    r24 = r10.zwzw * r16.zzww;
    r1.w = ps;
    r10.zw = (-abs(r8.xx) >= 0.0) ? 0.0 : r24.zw;
    r0.w = (abs(r8.x) > 0.0) ? r5.w : 1.0;
    r8.x = (abs(r3.w) > 0.0) ? r0.w : r5.w;
    r10.zw = (-abs(r3.ww) >= 0.0) ? r24.xy : r10.zw;
    r0.w = (r23.z == 0.0) ? r19.x : r19.w;
    r19.x = saturate(r1.w * r22.x - 0.5);
    r0.w = (r22.z == 0.0) ? r19.y : r0.w;
    r11.x = (r22.y == 0.0) ? r19.z : r0.w;
    r11 = r11 - 1.0;
    ps = r11.x;
    r13.xyz = r6.zzz * r13.xzy;
    r19.yz = r11.yz * UniformVector_4.xy - r21.zw;
    r19.w = r11.w * UniformVector_4.z - 1.0;
    ps = r7.y * ps;
    r11 = r20.zzzz * r19;
    r16.w = ps;
    ps = -r19.x;
    r13.xyz = r13.xzy * r5.zzz;
    ps = r11.x + ps;
    r7.xy = r21.zw + r11.yz;
    r6.z = ps;
    r3.w = r20.x * r6.z + r19.x;
    ps = r11.w;
    r7.xy = r7.xy + r18.xy;
    ps = r17.w * ps;
    r10.zw = r7.xy + r10.zw;
    r16.z = ps;
    r7 = r16.wxzy + float4(2.25, 0.125, 1.0, 0.125);
    ps = r7.x;
    r11 = r3 * r8.xxxx;
    r10.zw = r10.zw * r17.ww - r1.yz;
    ps = r16.w + ps;
    r6.z = r7.y * r7.w;
    r0.w = ps;
    r6.xyz = r6.zzz * r15.xyz + ModShadowColor.xyz;
    r7.xy = r10.zw * r3.ww + r1.yz;
    ps = r0.w;
    r1.yz = r11.ww * r13.yz;
    ps = -r14.y + ps;
    r11.xyz = r11.xyz + r4.xyz;
    r13.w = saturate(ps);
    ps = r7.z;
    r8 = r13.xwww * r8;
    ps = -r1.x + ps;
    r4.xyz = -r8.yzw + r12.xyz;
    r11.w = ps;
    r4.xyz = r4.xyz * r12.www + r8.yzw;
    r11.xyz = r5.zzz * r11.xyz - r4.xyz;
    r4 = r11 * r3.wwww + r4;
    r7.z = r6.w * 2.0 + r4.w;
    r7.xyw = r7.xyz * r10.yyy;
    ps = -UniformVector_0.x;
    r7.z = r7.w + 1.0;
    r5.yzw = (r10.yyy > 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r7.yzw = (r10.yyy >= 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.y = dot(r7.wyz, r7.wyz);
    r7.x = ps;
    ps = rsqrt(abs(r5.y));
    r1.x = r8.x * r3.w;
    r5.y = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r7.yzw * r5.yyy;
    ps = 1.0 + ps;
    r5.y = dot(r3.zxy, r9.zxy);
    r7.y = ps;
    ps = -UniformVector_0.z;
    r5.yzw = r3.xyz * r5.yyy;
    r5.yzw = r5.yzw * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r5.y = saturate(dot(r2.zxy, r5.wyz));
    r7.z = ps;
    ps = log2(r5.y);
    r7.xyz = r4.xyz * r7.xyz;
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.y = r5.y * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.w = saturate(dot(r3.zyx, r2.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r1.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r7.xy * r6.ww + r5.yz;
    r5.w = r7.z * r6.w + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r0.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
