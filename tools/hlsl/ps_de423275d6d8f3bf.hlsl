// ps_de423275d6d8f3bf.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 414 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000678 10041A00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c16); // float2
float4 SpotDirection : register(c15); // float3
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
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

    r11 = tex2D(Texture2D_7, r0.xy);
    r12.xy = r0.wz * UniformVector_7.xy;
    r6.xw = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) - -r4.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = r1.z + 0.1;
    r12.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.w = dot(r3.zxy, r3.zxy);
    r12.w = ps;
    ps = 1.0 / r4.w;
    r6.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r6.yz = r6.yz * r5.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r1.w));
    r5.w = r11.w - 0.5;
    r1.w = ps;
    ps = rsqrt(abs(r5.x));
    r8.xyz = r1.www * r3.xyz;
    r1.w = ps;
    ps = 0.00022222222 * r5.y;
    r3.yzw = r1.www * -SpotDirection.xyz;
    r3.x = saturate(ps);
    ps = 5.0 * r5.z;
    r5.y = dot(r3.wyz, r2.zxy);
    r3.y = saturate(ps);
    ps = (-0.025) * r3.x;
    r5.z = r0.w * UniformVector_2.x;
    r1.w = ps;
    r9.xy = r8.xy * r1.ww + r6.xw;
    ps = -SpotAngles.x - -r5.y;
    r10.y = -r0.z + 1.0;
    r5.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r9.z = saturate(r5.y * SpotAngles.y);
    r9.w = ps;
    r6.xw = r9.yz * r9.wz;
    ps = 1.0 / UniformVector_1.x;
    r10.x = -r6.x + 1.0;
    r10.z = ps;
    ps = r12.z;
    r10.xyw = r10.zxy * UniformVector_2.xyy;
    ps = abs(r7.x) * ps;
    r13.xy = r10.yw - 0.5;
    r3.z = ps;
    ps = r10.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    ps = r9.x * ps;
    r20.xy = float2((r10.yw >= 0.5));
    r5.y = ps;
    ps = (-0.5) + r5.y;
    r13.xy = r13.xy - r10.yw;
    r13.z = ps;
    ps = (-0.5) + r5.z;
    r20.zw = float2((r5.yz >= 0.5));
    r13.w = ps;
    ps = r12.w;
    r13.zw = r13.zw - r5.yz;
    r10.xz = r13.zw * r20.zw + r5.yz;
    r10.yw = r13.xy * r20.xy + r10.yw;
    ps = abs(r7.y) * ps;
    r13 = r10 + r10;
    r3.w = ps;
    r16.xyz = tex2D(Texture2D_6, r9.xy).xyz;
    r10 = tex2D(Texture2D_1, r13.zw).xzwy;
    r19 = tex2D(Texture2D_1, r13.xy);
    r17.xy = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r24 = tex2D(Texture2D_4, r0.xy);
    r26.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r15 = tex2D(Texture2D_5, r0.xy);
    r23.xyz = tex2D(Texture2D_8, r12.xy).xyz;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r5.yz = r0.wz * 6.0;
    r3.z = ps;
    r13.xyw = tex2D(Texture2D_2, r5.yz).xyw;
    r21.xyw = tex2D(LightAttenuationTexture, r6.yz).xyz;
    r9.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    r12.xyw = tex2D(Texture2D_2, r0.wz).wyx;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r0.x = saturate(r4.w * 0.0001);
    r3.w = ps;
    ps = -ModShadowColor.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r22.xyz = UniformVector_6.xzy * 2e+01;
    r14.x = ps;
    ps = -ModShadowColor.y;
    r25.xyz = UniformVector_5.xzy * 2e+01;
    ps = 1.0 + ps;
    r6.y = float((UniformScalar_8.x >= 1.0));
    r14.y = ps;
    ps = -ModShadowColor.z;
    r5.y = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r5.z = float((UniformScalar_8.x > 1.0));
    r14.z = ps;
    ps = r12.w + r12.w;
    r18.xyz = r9.xyw + r9.xyw;
    r21.z = ps;
    ps = r12.y + r12.y;
    r2.xyz = r21.xyw * r2.www;
    r21.w = ps;
    r17.zw = r13.xy * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r21.xy = r11.yz * UniformScalar_9.xx;
    r5.w = saturate(ps);
    r23.xyz = (-abs(r5.zzz) >= 0.0) ? r23.xyz : 1.0;
    ps = rsqrt(abs(r5.y));
    r15.xyz = r15.xzy * r15.www;
    r6.z = ps;
    r5.xyz = r26.zxy * 2.0 - 1.0;
    ps = UniformVector_4.x * r5.y;
    r24.xyz = r24.xzy * r24.www;
    r0.y = ps;
    ps = UniformVector_4.y * r5.z;
    r4.xyz = r6.zzz * r1.xyz;
    r0.z = ps;
    ps = UniformVector_4.z * r5.x;
    r1.yzw = r25.xyz * r24.xyz;
    r0.w = ps;
    r6.xyz = (-abs(r6.yyy) >= 0.0) ? 1.0 : r23.yxz;
    ps = log2(r5.w);
    r15.xyz = r22.xyz * r15.xyz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.zw = r21.xy * r6.xz;
    r1.x = ps;
    r22.xyz = (abs(r3.www) > 0.0) ? r1.ywz : r15.xzy;
    r1.yzw = (-abs(r3.www) >= 0.0) ? r15.yxz : r1.zyw;
    ps = UniformScalar_9.x * r6.y;
    r17 = r17 * float4(0.875, 0.875, 0.5, 0.5);
    r5.y = ps;
    r1.yzw = (-abs(r3.zzz) >= 0.0) ? r15.yxz : r1.yzw;
    r13.xyz = (abs(r3.zzz) > 0.0) ? r22.xyz : r15.xzy;
    ps = r5.y;
    r5.x = dot(r13.zxy, float3(0.11, 0.3, 0.59));
    ps = r11.x * ps;
    r12.w = saturate(dot(r1.wyz, float3(0.59, 0.11, 0.3)));
    r5.y = ps;
    r15.xy = -r0.yz * r12.ww + r0.yz;
    ps = pow(2.0, r1.x);
    r5.x = r5.x - r13.x;
    r1.x = ps;
    ps = UniformScalar_10.x + r5.y;
    r2.xyz = r2.xzy * r1.xxx;
    r22.x = ps;
    ps = UniformScalar_10.x + r5.z;
    r3.z = saturate(r5.x + r13.x);
    r22.y = ps;
    ps = UniformScalar_10.x + r5.w;
    r1.xy = -r3.yz + 1.0;
    r22.z = ps;
    ps = r13.w;
    r9.xyz = r22.xyz * r1.yyy;
    r5.xy = -r1.xx * ModShadowGroupColor.xy + 1.0;
    ps = r12.x * ps;
    r21.xy = r17.xy * r5.xy;
    r5.z = ps;
    ps = (-1.0) - -r5.z;
    r3 = r21 + float4(0.125, 0.125, -1.0, -1.0);
    r12.x = ps;
    r12.yz = r20.xy * 2.0 + r20.zw;
    ps = r0.w;
    r5.y = r3.x * r3.y;
    r5.x = ps;
    r1.xyz = r5.yyy * r14.xyz + ModShadowColor.xyz;
    r5.y = (r12.y == 0.0) ? r19.x : r19.y;
    r5.w = (r12.z == 0.0) ? r10.x : r10.w;
    ps = 1.0 - r5.x;
    r14 = r12.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r10.x = ps;
    r5.x = (r14.z == 0.0) ? r10.y : r5.w;
    r5.y = (r14.y == 0.0) ? r19.z : r5.y;
    r18.w = (r14.x == 0.0) ? r19.w : r5.y;
    r5.x = (r14.w == 0.0) ? r10.z : r5.x;
    ps = 1.0 - r0.x;
    r5.y = max(r5.x, 0.0);
    r10.z = ps;
    ps = 1.0 - r5.x;
    r5.y = min(r5.y, 0.3);
    r5.w = ps;
    ps = 2.5 * r5.w;
    r14 = r18 + float4(-1.0, -1.0, -1.0, 0.25);
    r5.x = ps;
    ps = 3.3333333 * r5.y;
    r1.w = r14.w + r18.w;
    r10.y = ps;
    ps = r1.w;
    r12.yz = r3.zw + r17.zw;
    ps = -r5.z + ps;
    r12 = r10.xyyy * r12.wxyz;
    r5.y = saturate(ps);
    ps = r0.w;
    r3.xyz = r5.yyy * r16.xyz;
    ps = r12.x + ps;
    r5.y = r12.y + 1.0;
    r0.z = ps;
    ps = r5.y * r5.w;
    r0.xy = r15.xy + r12.zw;
    r5.z = ps;
    ps = r5.x * r5.y;
    r12.xyz = -r14.xyz + r0.xyz;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r5.z = float((r5.z > 0.9));
    r0.x = saturate(ps);
    r5.xy = r12.xy * r0.xx + r14.xy;
    r0.yzw = r5.zzz * r13.xyz - r3.xyz;
    r5.z = r12.z * r0.x - 2.0;
    r5.z = r9.w * 2.0 + r5.z;
    r0.yzw = r6.yxz * r11.xyz + r0.yzw;
    r3.xyz = r0.yzw * r0.xxx + r3.xyz;
    r5.xyz = r5.zxy * r10.zzz;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r10.zzz > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r10.zzz >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r0.xyz = r9.xyz * r0.xxx;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r9.xyz = r5.yzw * r5.xxx;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r4.zxy, r8.zxy));
    ps = log2(r5.x);
    r6.xyz = r3.xyz * r7.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r4.zyx));
    r5.x = ps;
    r5.xyz = r0.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r2.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.www;
    r5.xyz = r5.xzy * r1.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
