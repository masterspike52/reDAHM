// ps_601b80a30fb10d50.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 444 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006F0 10041900 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r15.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    ps = UniformScalar_9.x - r6.w;
    r5.z = dot(r3.zxy, r3.zxy);
    r15.z = ps;
    r5.xy = r15.xy * r5.xx + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r11 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    ps = UniformScalar_13.x;
    r1.w = dot(r2.zxy, r2.zxy);
    ps = 0.05 * ps;
    r5.y = r4.w - 4e+02;
    r9.w = ps;
    ps = 0.00022222222 * r5.y;
    r5.x = saturate(-r1.w + 1.0);
    r5.y = saturate(ps);
    ps = log2(r5.x);
    r9.xyz = r8.xyz * r2.www;
    r5.x = ps;
    ps = rsqrt(abs(r5.z));
    r5.x = r5.x * LightColorAndFalloffExponent.w;
    r5.z = ps;
    ps = pow(2.0, r5.x);
    r10.xyz = r5.zzz * r3.xyz;
    r5.x = ps;
    ps = -r0.z;
    r3 = r9.xzyw * r5.xxxy;
    r14.xy = r10.xy * r3.ww + r0.wz;
    ps = 1.0 + ps;
    r14.z = -r14.y + 1.0;
    r14.w = ps;
    ps = UniformVector_1.x * r0.w;
    r8.xyz = r14.xzw * UniformVector_1.xyy;
    r8.w = ps;
    r5 = r8 - 0.5;
    r13 = float4((r8 >= 0.5));
    r5 = r5 - r8;
    r5 = r5 * r13 + r8;
    r5 = r5.wxyz + r5.wxyz;
    r9 = tex2D(Texture2D_9, r0.xy);
    r8 = tex2D(Texture2D_4, r11.xy).zwxy;
    r12 = tex2D(Texture2D_3, r5.xw);
    r17.yzw = tex2D(Texture2D_4, r11.zw).xyw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r18.x = saturate(r6.w * 15.0);
    r11.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.w = float((UniformScalar_8.x >= 1.0));
    r11.y = ps;
    r10.w = r15.z * r10.w + r6.w;
    ps = -r10.w;
    r11.xy = r11.xy * abs(r7.xy);
    ps = r6.z + ps;
    r18.z = dot(r13.xyy, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    ps = r7.x;
    r18.w = dot(r13.wzz, float3(1.0, 1.0, 1.0));
    r7.x = ps;
    r7.y = (r18.w == 0.0) ? r12.x : r12.y;
    ps = UniformScalar_10.x;
    r16 = r18.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r7.w = ps;
    r7.y = (r16.z == 0.0) ? r12.z : r7.y;
    r7.z = (r16.w == 0.0) ? r12.w : r7.y;
    ps = max(r7.x, r7.w);
    r7.y = max(r7.z, 0.0);
    r7.x = ps;
    ps = 1.0 / UniformScalar_11.x;
    r12.xw = min(r7.xy, float2(1.0, 0.3));
    r7.x = ps;
    r18.y = saturate(r12.x * r7.x);
    r7.xw = -r18.yx + 1.0;
    r17.x = r7.x * r6.w;
    ps = r0.w + r0.w;
    r6.xy = r17.wx * r8.yx;
    r13.x = ps;
    ps = r0.z + r0.z;
    r7.y = float((r6.y >= 0.05));
    r13.y = ps;
    ps = r17.y + r17.y;
    r6.yz = -r7.zy + 1.0;
    r15.x = ps;
    r6.w = (UniformScalar_9.x > 0.0) ? r6.z : 1.0;
    r6.w = (UniformScalar_9.x >= 0.0) ? r6.w : r6.z;
    ps = r17.z + r17.z;
    r15.z = r6.w * r9.w;
    r15.y = ps;
    ps = r14.x + r14.x;
    r12.xyz = r15.xyz + float3(-1.0, -1.0, -0.5);
    r7.y = ps;
    ps = r14.y + r14.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r12.zzzz)) clip(-1.0);
    r7.z = ps;
    r8.xy = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r11 = tex2D(Texture2D_2, r13.xy);
    r17.xyz = tex2D(Texture2D_8, r7.yz).xyz;
    r21 = tex2D(Texture2D_3, r5.yz);
    r5.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r20 = tex2D(Texture2D_6, r0.xy);
    r25 = tex2D(Texture2D_7, r0.xy);
    r13.xyw = tex2D(Texture2D_1, r13.xy).xyz;
    r0.xyw = tex2D(Texture2D_0, r7.yz).xyz;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r23.xyz = UniformVector_5.xzy * 2e+01;
    r0.z = ps;
    ps = r4.w;
    r24.xyz = UniformVector_4.xzy * 2e+01;
    ps = 0.0001 * ps;
    r5.x = r1.z + 0.1;
    r22.w = saturate(ps);
    r15.xyz = r9.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r14.xyz = r0.xyw * 2.0 - 1.0;
    ps = r13.x + r13.x;
    r4.x = dot(r1.zxy, r1.zxy);
    r19.x = ps;
    r16.zw = r8.zw * 2.0 - 1.0;
    ps = r13.y + r13.y;
    r22.xyz = r25.xzy * r25.www;
    r19.y = ps;
    ps = rsqrt(abs(r4.x));
    r20.xyz = r20.xzy * r20.www;
    r4.x = ps;
    r5.yzw = r5.yzw * 2.0 - 1.0;
    ps = 5.0 * r5.x;
    r4.xyz = r4.xxx * r1.xyz;
    r20.w = saturate(ps);
    ps = UniformVector_3.x * r5.y;
    r1.xyz = r24.xyz * r20.xyz;
    r20.x = ps;
    ps = rsqrt(abs(r1.w));
    r22.xyz = r23.xyz * r22.xyz;
    r5.x = ps;
    ps = UniformVector_3.y * r5.z;
    r23.xyz = r5.xxx * -SpotDirection.xyz;
    r20.y = ps;
    ps = UniformVector_3.z * r5.w;
    r5.y = dot(r23.zxy, r2.zxy);
    r20.z = ps;
    r5.xzw = (abs(r0.zzz) > 0.0) ? r1.xzy : r22.xzy;
    r1.xyz = (-abs(r0.zzz) >= 0.0) ? r22.yxz : r1.yxz;
    r1.xyz = (-abs(r6.www) >= 0.0) ? r22.yxz : r1.xyz;
    r13.xyz = (abs(r6.www) > 0.0) ? r5.xzw : r22.xzy;
    ps = r13.w + r13.w;
    r5.zw = -r20.zw + 1.0;
    r19.z = ps;
    ps = -SpotAngles.x - -r5.y;
    r6.w = dot(r13.zxy, float3(0.11, 0.3, 0.59));
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r5.y = saturate(dot(r1.zxy, float3(0.59, 0.11, 0.3)));
    r5.x = saturate(ps);
    r8.zw = -r20.xy * r5.yy + r20.xy;
    ps = ModShadowGroupColor.x * r5.w;
    r6.w = r6.w - r13.x;
    r22.y = ps;
    ps = ModShadowGroupColor.y * r5.w;
    r22.x = saturate(r6.w + r13.x);
    r22.z = ps;
    ps = r5.z * r5.y;
    r1 = -r22.wxyz + 1.0;
    r6.w = ps;
    r0.z = (r18.z == 0.0) ? r21.x : r21.y;
    r0.z = (r16.y == 0.0) ? r21.z : r0.z;
    r16.x = (r16.x == 0.0) ? r21.w : r0.z;
    ps = r5.x * r5.x;
    r16.y = r12.w * 3.3333333;
    r5.w = ps;
    ps = r20.z;
    r5.xy = -r16.xy + 1.0;
    r5.z = dot(r18.xx, r5.xx) + r16.x;
    ps = r6.w + ps;
    r19.w = r5.z + r16.x;
    r12.z = ps;
    ps = r18.x;
    r2 = r19 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = r5.y * ps;
    r5.x = saturate(r2.w - r6.x);
    r5.z = ps;
    ps = (-1.0) - -r6.x;
    r0.xyz = r5.xxx * r17.xyz;
    r15.w = ps;
    ps = -r0.z;
    r2.xzw = r2.zxy - r14.zxy;
    ps = r11.z + ps;
    r5.xy = -r0.xy + r11.xy;
    r2.y = ps;
    r0.xy = r5.xy * r11.ww + r0.xy;
    ps = 2.5 * r6.y;
    r11 = r2.zwxy * r11.wwww;
    r6.w = ps;
    ps = r0.z;
    r2.xyz = r15.xyz * r1.yyy;
    ps = r11.w + ps;
    r5.xy = r12.xy * 0.5;
    r0.z = ps;
    ps = r11.z;
    r15.xyz = r16.zyw + r5.xzy;
    r5.x = ps;
    r12.xy = r15.xy * r15.yz + r8.zw;
    r6.x = r15.w * r15.y + 1.0;
    ps = r6.x * r6.y;
    r11.xyz = r14.xyz + r11.xyz;
    r5.y = ps;
    ps = r6.w * r6.x;
    r12.xyz = -r11.xyz + r12.xyz;
    r5.z = ps;
    ps = (-2.0) + r5.x;
    r5.yz = r5.yz * r7.ww;
    r11.w = ps;
    ps = (-0.5) + r5.z;
    r5.x = float((r5.y >= 0.9));
    r5.y = saturate(ps);
    r9.xyz = r5.xxx * r13.xyz + r9.xyz;
    r6.xyz = r12.xyz * r5.yyy + r11.xyw;
    r6.w = r0.w * 2.0 + r6.z;
    r9.xyz = r9.xyz - r0.xyz;
    r9.xyz = r9.xyz * r5.yyy + r0.xyz;
    r6.xyw = r6.xyw * r1.xxx;
    ps = -UniformVector_0.x;
    r6.z = r6.w + 1.0;
    r6.xyz = (r1.xxx > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r0.yzw = (r1.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.x = dot(r0.wyz, r0.wyz);
    r0.x = ps;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r2.xyz * r5.yyy;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r2.xyz = r0.yzw * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r10.zxy);
    r0.y = ps;
    ps = -UniformVector_0.z;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r10.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r4.zxy, r5.zxy));
    r0.z = ps;
    ps = log2(r5.x);
    r0.xyz = r9.xyz * r0.xyz;
    r8.z = ps;
    r5.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r5.z);
    r6.w = saturate(dot(r2.zyx, r4.zyx));
    r5.z = ps;
    r5.xy = r5.xy * r1.zw + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r7.xyz + ModShadowColor.xyz;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r3.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
