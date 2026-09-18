// ps_88b4dec2b7dd7001.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 372 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005D0 10041500 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
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
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.z = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r5.z));
    r5.y = r4.w - 4e+02;
    r6.x = ps;
    ps = 0.1 - -r1.z;
    r17.w = saturate(r4.w * 0.0001);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r5.zw = r0.wz * UniformVector_1.xy;
    r6.y = saturate(ps);
    ps = 0.00022222222 * r5.y;
    r8.xyz = r6.xxx * r3.xyz;
    r6.z = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r5.y = r6.z * (-0.025);
    r5.x = ps;
    r9.xy = r8.xy * r5.yy + r5.zw;
    r6.x = r9.y * r5.x;
    ps = 1.0 / UniformVector_1.x;
    r5.yw = -r6.xy + 1.0;
    r5.x = ps;
    r5.yz = r5.yx * UniformVector_2.yx;
    r5.x = r5.z * r9.x;
    r6 = tex2D(Texture2D_1, r5.xy).zwxy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r0.w * UniformVector_2.x;
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r15.y = trunc(UniformScalar_1.x);
    r3.y = ps;
    r5.z = (r15.y == 0.0) ? r6.z : r6.w;
    ps = -r0.z;
    r9.zw = r0.wz * 6.0;
    ps = 1.0 + ps;
    r12.zw = r0.wz * UniformVector_6.xy;
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r11.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    ps = (-0.5) + r5.y;
    r10.xy = float2((r5.yx >= 0.5));
    r3.z = ps;
    ps = (-0.5) + r5.x;
    r15.x = dot(r10.xyy, float3(1.0, 1.0, 1.0));
    r3.w = ps;
    ps = 1.0 / r4.w;
    r11.xy = r3.zw - r5.yx;
    r10.z = ps;
    r12.xy = r11.zw * r10.zz + ScreenPositionScaleBias.wz;
    r6.zw = r11.xy * r10.xy + r5.yx;
    r11 = r15.yyxx + float4(-3.0, -2.0, -3.0, -2.0);
    r5.x = (r11.y == 0.0) ? r6.x : r5.z;
    r6.x = (r11.x == 0.0) ? r6.y : r5.x;
    ps = 0.25 + r6.x;
    r5.xy = r3.xy * abs(r7.xy);
    r6.y = ps;
    r3.xyw = r6.zwy + r6.zwx;
    r10.xyz = tex2D(Texture2D_5, r9.xy).xyz;
    r7 = tex2D(Texture2D_1, r3.xy);
    r16.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r13 = tex2D(Texture2D_4, r0.xy);
    r20.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r21.xyz = tex2D(Texture2D_7, r12.zw).xyz;
    r17.xyz = tex2D(LightAttenuationTexture, r12.xy).xyz;
    r6.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r19.xyw = tex2D(Texture2D_2, r9.zw).xyw;
    r14.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r0.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    ps = -ModShadowColor.x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r18.xyz = UniformVector_5.xzy * 2e+01;
    r12.x = ps;
    ps = -ModShadowColor.y;
    r3.z = float((UniformScalar_4.x >= 1.0));
    ps = 1.0 + ps;
    r1.w = dot(r1.zxy, r1.zxy);
    r12.y = ps;
    ps = -ModShadowColor.z;
    r5.x = float((UniformScalar_4.x > 1.0));
    ps = 1.0 + ps;
    r5.z = dot(r2.zxy, r2.zxy);
    r12.z = ps;
    r9.xyz = r0.xyw * 2.0 - 1.0;
    ps = 1.0 - r5.z;
    r15.zw = r14.xy + r14.xy;
    r5.y = saturate(ps);
    r16.zw = r19.xy * 2.0 - 1.0;
    ps = UniformScalar_5.x * r6.z;
    r17.xyz = r17.xyz * r2.www;
    r4.w = ps;
    r14.xyz = (-abs(r5.xxx) >= 0.0) ? r21.xyz : 1.0;
    r19.xyz = r20.xyz * 2.0 - 1.0;
    ps = UniformScalar_5.x * r6.y;
    r5.x = r19.w * r14.w;
    r8.w = ps;
    ps = (-1.0) - -r5.x;
    r13.xyz = r13.xyz * r13.www;
    r6.w = ps;
    ps = rsqrt(abs(r5.z));
    r0.xyz = r19.zxy * UniformVector_4.zxy;
    r5.z = ps;
    ps = rsqrt(abs(r1.w));
    r13.xyz = r18.xzy * r13.xyz;
    r1.w = ps;
    r18.xyz = (-abs(r3.zzz) >= 0.0) ? 1.0 : r14.xyz;
    r14.xyz = r18.xyz * r6.xyz + r13.xyz;
    ps = 1.0 - r0.x;
    r3.xyz = r1.www * r1.xyz;
    r11.y = ps;
    ps = r8.w;
    r1.xzw = r5.zzz * -SpotDirection.xyz;
    ps = r18.y * ps;
    r16 = r16 * float4(0.875, 0.875, 0.5, 0.5);
    r1.y = ps;
    ps = log2(r5.y);
    r5.z = dot(r1.wxz, r2.zxy);
    r5.y = ps;
    ps = r4.w;
    r1.w = dot(r13.zxy, float3(0.11, 0.3, 0.59));
    ps = r18.z * ps;
    r1.x = r18.x * UniformScalar_5.x;
    r1.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r1.x = r1.x * r6.x;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r6.x = r1.w - r13.x;
    r6.y = ps;
    ps = -SpotAngles.x - -r5.z;
    r2.xyz = r17.xzy * r6.yyy;
    r5.z = ps;
    r6.z = (r15.x == 0.0) ? r7.x : r7.y;
    ps = SpotAngles.y * r5.z;
    r6.x = saturate(r6.x + r13.x);
    r11.x = saturate(ps);
    r13.xy = -r0.yz * r6.xx + r0.yz;
    ps = 1.0 - r6.x;
    r1.xyz = r1.xyz + UniformScalar_6.xxx;
    r6.y = ps;
    r5.z = (r11.w == 0.0) ? r7.z : r6.z;
    ps = ModShadowGroupColor.x * r5.w;
    r7.xyz = r1.xyz * r6.yyy;
    r17.y = ps;
    r17.x = (r11.z == 0.0) ? r7.w : r5.z;
    ps = ModShadowGroupColor.y * r5.w;
    r5.z = max(r17.x, 0.0);
    r17.z = ps;
    ps = r5.z;
    r1 = -r17 + 1.0;
    r5.y = ps;
    ps = 0.3;
    r15.xy = r16.xy * r1.yz;
    r5.z = ps;
    ps = min(r5.y, r5.z);
    r5.x = saturate(r3.w - r5.x);
    r5.y = ps;
    ps = 3.3333333 * r5.y;
    r10.xyz = r5.xxx * r10.xyz;
    r11.z = ps;
    ps = r1.x;
    r15 = r15 + float4(0.125, 0.125, -1.0, -1.0);
    r5.x = ps;
    ps = r15.x * r15.y;
    r6.yz = r15.zw + r16.zw;
    r5.y = ps;
    r1.xyz = r5.yyy * r12.xyz + ModShadowColor.xyz;
    ps = 2.5 * r5.x;
    r12 = r11.yzzz * r6.xwyz;
    r11.y = ps;
    ps = r0.x;
    r6.yzw = r14.xyz - r10.xyz;
    ps = r12.x + ps;
    r11.z = r12.y + 1.0;
    r5.z = ps;
    ps = r11.x * r11.x;
    r5.xy = r13.xy + r12.zw;
    r6.x = ps;
    ps = r11.y * r11.z;
    r5.yzw = -r9.xzy + r5.xzy;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r0.x = saturate(ps);
    r6.yzw = r6.yzw * r0.xxx + r10.xyz;
    r5.xy = r5.yw * r0.xx + r9.xy;
    r5.z = r5.z * r0.x - 2.0;
    r5.z = r0.w * 2.0 + r5.z;
    r5.xyz = r5.zxy * r1.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r1.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r1.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r0.xyz = r7.xyz * r0.xxx;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r7.xyz = r5.yzw * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r7.zxy));
    ps = log2(r5.x);
    r6.yzw = r6.yzw * r4.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r3.zyx));
    r5.x = ps;
    r5.xyz = r0.xyz * r5.xxx;
    r5.xy = r6.yz * r5.ww + r5.xy;
    r5.z = r6.w * r5.w + r5.z;
    r5.xyz = r2.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.xxx;
    r5.xyz = r5.xzy * r1.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
