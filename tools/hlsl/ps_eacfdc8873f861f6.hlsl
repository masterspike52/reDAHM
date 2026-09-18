// ps_eacfdc8873f861f6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000618 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_5 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_8, r0.xy);
    ps = (-0.5) + r10.w;
    r18.xyz = r10.xyz * UniformScalar_9.xxx;
    r5.x = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r15.y = ps;
    r6.xyz = tex2D(Texture2D_2, r0.wz).wxy;
    r12.y = UniformScalar_2.x * UniformVector_6.y;
    ps = UniformVector_6.y;
    r5.xw = r0.wz * 6.0;
    ps = UniformScalar_5.x * ps;
    r8.y = -r0.z + 1.0;
    r12.w = ps;
    ps = r1.z;
    r11.xy = r0.wz * UniformVector_7.xy;
    ps = 0.1 + ps;
    r9.zw = r4.xy * ScreenPositionScaleBias.xy;
    r11.w = ps;
    ps = r4.w;
    r8.xw = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r5.y = UniformScalar_1.x * UniformVector_4.x;
    r11.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.z = UniformVector_4.x * UniformScalar_4.x;
    r8.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15.zw = r6.yz + r6.yz;
    r9.x = ps;
    ps = UniformVector_6.x * r5.y;
    r6.w = dot(r3.zxy, r3.zxy);
    r12.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yz = saturate(r11.wz * float2(5.0, 0.00022222222));
    r9.y = ps;
    ps = rsqrt(abs(r6.w));
    r11.zw = r9.xy * abs(r7.xy);
    r6.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r7.xyz = r6.www * r3.xyz;
    r6.w = ps;
    ps = 1.0 / r4.w;
    r3.x = r6.z * (-0.025);
    r1.w = ps;
    r9.xy = r7.xy * r3.xx + r8.xw;
    r13.xy = r9.zw * r1.ww + ScreenPositionScaleBias.wz;
    r8.x = -r9.y * r6.w + 1.0;
    ps = UniformVector_6.x * r5.z;
    r8.xyw = r8.zxy * UniformVector_2.xyy;
    r12.z = ps;
    ps = r8.x;
    r12 = r12 + r0.xyxy;
    ps = r9.x * ps;
    r5.yz = r8.yw - 0.5;
    r15.x = ps;
    ps = r5.y;
    r20.xy = float2((r8.yw >= 0.5));
    ps = -r8.y + ps;
    r3 = r15 + float4(-0.5, -0.5, -1.0, -1.0);
    r14.x = ps;
    ps = r5.z;
    r20.zw = float2((r15.xy >= 0.5));
    ps = -r8.w + ps;
    r14.zw = r3.xy - r15.xy;
    r14.y = ps;
    r8.xz = r14.zw * r20.zw + r15.xy;
    r8.yw = r14.xy * r20.xy + r8.yw;
    r14 = r8 + r8;
    r8.xyz = tex2D(Texture2D_6, r9.xy).xyz;
    r19.xyz = tex2D(LightAttenuationTexture, r13.xy).xyz;
    r13 = tex2D(Texture2D_1, r14.zw);
    r15 = tex2D(Texture2D_1, r14.xy);
    r14.xy = tex2D(ModShadowAccumTexture, r11.zw).xy;
    r22 = tex2D(Texture2D_4, r12.xy);
    r16 = tex2D(Texture2D_5, r12.zw);
    r21.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_7, r11.xy).xyz;
    r0.xyw = tex2D(Texture2D_2, r5.xw).xyw;
    r9.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    r5.w = dot(r1.zxy, r1.zxy);
    r17.xyz = UniformVector_5.xyz * 2e+01;
    r5.z = float((UniformScalar_8.x >= 1.0));
    r5.x = dot(r2.zxy, r2.zxy);
    r5.y = float((UniformScalar_8.x > 1.0));
    r12.xyz = r9.xyw * 2.0 - 1.0;
    r14.zw = r0.xy * 2.0 - 1.0;
    r11.xyz = (-abs(r5.yyy) >= 0.0) ? r11.xyz : 1.0;
    r21.xyz = r21.xyz * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r16.xyz = r16.xyz * r16.www;
    r5.x = saturate(ps);
    r16.xyz = r22.xyz * r22.www + r16.xyz;
    ps = log2(r5.x);
    r0.xyz = r21.zxy * UniformVector_4.zxy;
    r5.y = ps;
    r11.xyz = (-abs(r5.zzz) >= 0.0) ? 1.0 : r11.xyz;
    r18.xyz = r18.xyz * r11.xyz + UniformScalar_10.xxx;
    r9.xyz = r17.xyz * r16.xyz;
    ps = r4.w;
    r17 = r14 * float4(0.875, 0.875, 0.5, 0.5);
    ps = 0.0001 * ps;
    r5.x = dot(r9.zxy, float3(0.11, 0.3, 0.59));
    r14.w = saturate(ps);
    ps = r0.w;
    r5.x = r5.x - r9.x;
    ps = r6.x * ps;
    r3.x = saturate(r5.x + r9.x);
    r5.x = ps;
    r16.xy = -r0.yz * r3.xx + r0.yz;
    r4.xy = r20.xy * 2.0 + r20.zw;
    r6.x = (r4.x == 0.0) ? r15.x : r15.y;
    r5.z = (r4.y == 0.0) ? r13.x : r13.y;
    ps = (-1.0) - -r5.x;
    r4 = r4.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r3.y = ps;
    r5.z = (r4.z == 0.0) ? r13.z : r5.z;
    r6.x = (r4.y == 0.0) ? r15.z : r6.x;
    r14.z = (r4.x == 0.0) ? r15.w : r6.x;
    r6.x = (r4.w == 0.0) ? r13.w : r5.z;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r5.z = max(r6.x, 0.0);
    r5.y = ps;
    ps = 1.0 - r0.x;
    r5.z = min(r5.z, 0.3);
    r4.x = ps;
    ps = 3.3333333 * r5.z;
    r3.zw = r3.zw + r17.zw;
    r4.y = ps;
    ps = rsqrt(abs(r5.w));
    r15 = r4.yyxy * r3.yzxw;
    r5.w = ps;
    ps = pow(2.0, r5.y);
    r15.z = r0.x + r15.z;
    r5.z = ps;
    ps = 1.0 - r3.x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r5.y = ps;
    ps = 1.0 - r6.x;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    ps = 1.0 - r6.y;
    r0.xyz = r19.xyz * r2.www;
    r6.z = ps;
    ps = 2.5 * r6.w;
    r3.xyz = r5.www * r1.xyz;
    r6.y = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r0.xyz = r0.xzy * r5.zzz;
    r14.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.xyz = r18.xyz * r5.yyy;
    r14.y = ps;
    ps = r15.x;
    r1.xyw = -r14.xyw + 1.0;
    r5.y = ps;
    ps = 1.0 + r5.y;
    r14.xy = r17.xy * r1.xy;
    r6.x = ps;
    r5.yz = r6.yx * r6.xw;
    ps = (-0.5) + r5.y;
    r6.xyz = r14.xzy + float3(0.125, 0.25, 0.125);
    r6.w = saturate(ps);
    ps = r6.x * r6.z;
    r15.xy = r16.xy + r15.yw;
    r6.x = ps;
    ps = r6.y;
    r1.xyz = -r12.xyz + r15.xyz;
    ps = r14.z + ps;
    r0.w = float((r5.z > 0.9));
    r5.w = ps;
    r6.xyz = r6.xxx * r13.xyz + ModShadowColor.xyz;
    r5.yz = r1.xy * r6.ww + r12.xy;
    r5.x = saturate(r5.w - r5.x);
    r5.w = r1.z * r6.w - 2.0;
    r5.w = r9.w * 2.0 + r5.w;
    r8.xyz = r5.xxx * r8.xyz;
    r9.xyz = r9.xyz * r0.www - r8.xyz;
    r5.xyz = r5.wyz * r1.www;
    r9.xyz = r11.xyz * r10.xyz + r9.xyz;
    r1.xyz = r9.xyz * r6.www + r8.xyz;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r1.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r1.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r2.xyz = r2.xyz * r6.www;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r7.zxy);
    r8.xyz = r5.yzw * r5.xxx;
    r7.xyz = r8.xyz * 2.0 - r7.xyz;
    r5.x = saturate(dot(r3.zxy, r7.zxy));
    ps = log2(r5.x);
    r1.xyz = r1.xyz * r4.xyz;
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
    r5.xyz = r5.xzy * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
