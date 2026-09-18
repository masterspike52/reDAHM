// ps_94159a32704b7624.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000618 10041800 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_13 : register(c14); // float
float4 UniformScalar_8 : register(c11); // float
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_8, r0.xy);
    ps = -r0.z;
    r5.xw = r0.wz * UniformVector_1.xy;
    ps = 1.0 + ps;
    r19.yzw = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    ps = r4.w;
    r5.z = dot(r3.zxy, r3.zxy);
    ps = (-4e+02) + ps;
    r6.y = r1.z + 0.1;
    r6.x = ps;
    ps = rsqrt(abs(r5.z));
    r20.xw = saturate(r6.yx * float2(5.0, 0.00022222222));
    r5.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r8.xyz = r5.zzz * r3.xyz;
    r5.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r6.x = r20.w * (-0.025);
    r19.x = ps;
    r3.xy = r8.xy * r6.xx + r5.xw;
    r5.x = -r3.y * r19.x + 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyz = r5.xyz * UniformVector_2.yyx;
    r3.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r6.z * r3.x;
    r3.w = ps;
    ps = r0.w;
    r9.xy = r0.wz * 6.0;
    ps = UniformVector_2.x * ps;
    r9.zw = r0.wz * UniformVector_7.xy;
    r5.y = ps;
    ps = r10.w;
    r11.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    ps = (-0.5) + r6.x;
    r7.xy = r3.zw * abs(r7.xy);
    r3.z = ps;
    ps = (-0.5) + r6.y;
    r15.zw = float2((r6.xy >= 0.5));
    r3.w = ps;
    ps = (-0.5) + r5.z;
    r3.zw = r3.zw - r6.xy;
    r5.z = ps;
    r6.yw = r3.zw * r15.zw + r6.xy;
    ps = (-0.5) + r5.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r5.z = ps;
    ps = (-0.5) + r5.y;
    r17.yz = float2((r5.xy >= 0.5));
    r5.w = ps;
    ps = 1.0 / r4.w;
    r11.zw = r5.zw - r5.xy;
    r17.x = ps;
    r3.zw = r11.xy * r17.xx + ScreenPositionScaleBias.wz;
    r6.xz = r11.zw * r17.yz + r5.xy;
    r5 = r6 + r6;
    r12.xyz = tex2D(Texture2D_6, r3.xy).xyz;
    r6 = tex2D(Texture2D_1, r5.zw).wxyz;
    r18 = tex2D(Texture2D_1, r5.xy);
    r16.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r5.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    r21 = tex2D(Texture2D_5, r0.xy);
    r22 = tex2D(Texture2D_4, r0.xy);
    r11.xyz = tex2D(Texture2D_7, r9.zw).xyz;
    r9.xyw = tex2D(Texture2D_2, r9.xy).xyw;
    r24.yzw = tex2D(LightAttenuationTexture, r3.zw).xyz;
    r14.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r3.xyw = tex2D(Texture2D_0, r3.xy).xyz;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r23.xyz = UniformVector_5.xzy * 2e+01;
    r0.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    r1.w = float((UniformScalar_11.x >= 1.0));
    ps = UniformVector_6.x;
    r3.z = dot(r1.zxy, r1.zxy);
    ps = 2e+01 * ps;
    r7.w = float((UniformScalar_11.x > 1.0));
    r24.x = ps;
    ps = UniformVector_6.z;
    r5.x = dot(r2.zxy, r2.zxy);
    r13.xyz = r3.xyw * 2.0 - 1.0;
    ps = 2e+01 * ps;
    r0.xyz = r24.yzw * r2.www;
    r24.y = ps;
    r16.zw = r9.xy * 2.0 - 1.0;
    ps = UniformVector_6.y;
    r2.xyz = r10.xyz * UniformScalar_12.xxx;
    r11.xyz = (-abs(r7.www) >= 0.0) ? r11.xyz : 1.0;
    ps = 2e+01 * ps;
    r22.xyz = r22.xzy * r22.www;
    r24.z = ps;
    ps = rsqrt(abs(r3.z));
    r21.xyz = r21.xzy * r21.www;
    r2.w = ps;
    r5.yzw = r5.yzw * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r3.xyz = r2.www * r1.xyz;
    r5.x = saturate(ps);
    ps = UniformVector_4.x * r5.y;
    r21.xyz = r24.xyz * r21.xyz;
    r5.y = ps;
    ps = UniformVector_4.y * r5.z;
    r22.xyz = r23.xyz * r22.xyz;
    r5.z = ps;
    r11.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r11.xyz;
    r2.xyz = r2.xyz * r11.xyz + UniformScalar_13.xxx;
    ps = log2(r5.x);
    r16 = r16 * float4(0.875, 0.875, 0.5, 0.5);
    r5.x = ps;
    r1.xyz = (-abs(r0.www) >= 0.0) ? r21.yxz : r22.yxz;
    r9.xyz = (abs(r0.www) > 0.0) ? r22.xzy : r21.xzy;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.w = dot(r9.zxy, float3(0.11, 0.3, 0.59));
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r14.w = saturate(dot(r1.zxy, float3(0.59, 0.11, 0.3)));
    r5.x = ps;
    ps = UniformVector_4.z * r5.w;
    r0.xyz = r0.xzy * r5.xxx;
    r5.w = ps;
    r15.xy = -r5.yz * r14.ww + r5.yz;
    ps = r4.w;
    r5.x = r0.w - r9.x;
    ps = 0.0001 * ps;
    r20.y = saturate(r5.x + r9.x);
    r20.z = saturate(ps);
    ps = r14.x + r14.x;
    r1.xyw = -r20.xyz + 1.0;
    r4.z = ps;
    r5.xz = -r1.xx * ModShadowGroupColor.xy + 1.0;
    ps = r14.y + r14.y;
    r4.xy = r16.xy * r5.xz;
    r4.w = ps;
    r15.zw = r15.zw * 2.0 + r17.yz;
    ps = r9.w;
    r4 = r4.xzwy + float4(0.125, -1.0, -1.0, 0.125);
    r0.w = (r15.z == 0.0) ? r18.x : r18.y;
    r5.x = (r15.w == 0.0) ? r6.y : r6.z;
    ps = r14.z * ps;
    r17 = r15.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r5.z = ps;
    r5.x = (r17.z == 0.0) ? r6.w : r5.x;
    r0.w = (r17.y == 0.0) ? r18.z : r0.w;
    ps = (-1.0) - -r5.z;
    r1.z = r4.x * r4.w;
    r14.x = ps;
    r6.yzw = r1.zzz * r19.yzw + ModShadowColor.xyz;
    r4.w = (r17.x == 0.0) ? r18.w : r0.w;
    r5.x = (r17.w == 0.0) ? r6.x : r5.x;
    ps = 1.0 - r5.w;
    r6.x = max(r5.x, 0.0);
    r4.x = ps;
    ps = 1.0 - r5.x;
    r5.y = min(r6.x, 0.3);
    r5.x = ps;
    ps = 3.3333333 * r5.y;
    r14.yz = r4.yz + r16.zw;
    r4.y = ps;
    ps = 2.5 * r5.x;
    r14 = r4.xyyy * r14.wxyz;
    r5.y = ps;
    ps = r5.w;
    r2.xyz = r2.xyz * r1.yyy;
    ps = r14.x + ps;
    r5.w = r14.y + 1.0;
    r4.z = ps;
    ps = r5.w * r5.x;
    r4.xy = r15.xy + r14.zw;
    r6.x = ps;
    ps = r5.y * r5.w;
    r4.xyz = -r13.xyz + r4.xyz;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r0.w = float((r6.x > 0.9));
    r6.x = saturate(ps);
    r4.xyz = r4.xyz * r6.xxx;
    r5.xw = r4.wz + float2(0.25, -2.0);
    r5.w = r3.w * 2.0 + r5.w;
    r1.z = r5.x + r4.w;
    ps = r1.z;
    r5.xy = r13.xy + r4.xy;
    ps = -r5.z + ps;
    r5.xyw = r5.wxy * r1.www;
    r5.z = saturate(ps);
    ps = 1.0 + r5.x;
    r4.xyz = r5.zzz * r12.xyz;
    r5.z = ps;
    r9.xyz = r0.www * r9.xyz - r4.xyz;
    r9.xyz = r11.xyz * r10.xyz + r9.xyz;
    r1.xyz = r9.xyz * r6.xxx + r4.xyz;
    r5.xyz = (r1.www > 0.0) ? r5.ywz : float3(0.0, 0.0, 1.0);
    r5.yzw = (r1.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r2.xyz = r2.xyz * r6.xxx;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r4.xyz = r5.yzw * r5.xxx;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r4.zxy));
    ps = log2(r5.x);
    r1.xyz = r1.xyz * r7.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r3.zyx));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r0.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.ywz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
