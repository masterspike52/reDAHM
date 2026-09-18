// ps_9f86cd92e6a451db.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 345 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000564 10041300 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.wz * UniformVector_6.xy;
    r6.xyz = tex2D(Texture2D_7, r5.xy).xyz;
    r9.xyw = tex2D(Texture2D_6, r0.xy).yzx;
    ps = r4.w;
    r5.y = float((UniformScalar_4.x >= 1.0));
    ps = (-4e+02) + ps;
    r5.z = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.z));
    r10.zw = r9.yx * UniformScalar_5.xx;
    r5.w = ps;
    ps = 0.00022222222 * r5.x;
    r5.z = float((UniformScalar_4.x > 1.0));
    r5.x = saturate(ps);
    r6.xyz = (-abs(r5.zzz) >= 0.0) ? r6.xyz : 1.0;
    r17.yzw = (-abs(r5.yyy) >= 0.0) ? 1.0 : r6.xyz;
    ps = (-0.025) * r5.x;
    r5.yz = r0.wz * UniformVector_1.xy;
    r5.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r8.xyz = r5.www * r3.xyz;
    r17.x = ps;
    r10.xy = r8.xy * r5.xx + r5.yz;
    r13.yzw = r10.wzy * r17.zwx;
    ps = 1.0 / UniformVector_1.x;
    r5.y = -r13.w + 1.0;
    r5.x = ps;
    r5.yz = r5.yx * UniformVector_2.yx;
    r5.x = r5.z * r10.x;
    r11 = tex2D(Texture2D_1, r5.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = r0.w * UniformVector_2.x;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.z = trunc(UniformScalar_1.x);
    r5.w = ps;
    r5.y = (r3.z == 0.0) ? r11.x : r11.y;
    ps = -r0.z;
    r7.xy = r5.xw * abs(r7.xy);
    ps = 1.0 + ps;
    r15.xy = r0.wz * 6.0;
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r12.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    ps = (-0.5) + r5.z;
    r6.yz = float2((r5.zx >= 0.5));
    r6.x = ps;
    ps = (-0.5) + r5.x;
    r3.y = dot(r6.yzz, float3(1.0, 1.0, 1.0));
    r6.w = ps;
    ps = 1.0 / r4.w;
    r12.zw = r6.xw - r5.zx;
    r6.x = ps;
    r7.zw = r12.xy * r6.xx + ScreenPositionScaleBias.wz;
    r5.zw = r12.zw * r6.yz + r5.zx;
    r6 = r3.zzyy + float4(-3.0, -2.0, -3.0, -2.0);
    r5.x = (r6.y == 0.0) ? r11.z : r5.y;
    r5.x = (r6.x == 0.0) ? r11.w : r5.x;
    ps = 0.25 + r5.x;
    r3.w = saturate(r4.w * 0.0001);
    r5.y = ps;
    r4.xyw = r5.zwy + r5.zwx;
    r11.xyz = tex2D(Texture2D_5, r10.xy).xyz;
    r14.xyz = tex2D(LightAttenuationTexture, r7.zw).xyz;
    r16.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r12 = tex2D(Texture2D_1, r4.xy);
    r18 = tex2D(Texture2D_4, r0.xy);
    r7.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r15.xyw = tex2D(Texture2D_2, r15.xy).wyx;
    r5.yzw = tex2D(Texture2D_2, r0.wz).xyw;
    r0.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    ps = r1.z;
    r1.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    r4.xyz = r0.xyw * 2.0 - 1.0;
    ps = r5.y + r5.y;
    r19.xyz = UniformVector_5.xzy * 2e+01;
    r15.z = ps;
    r16.zw = r15.wy * 2.0 - 1.0;
    r7.xyz = r7.xyz * 2.0 - 1.0;
    ps = r5.z + r5.z;
    r18.xyz = r18.xyz * r18.www;
    r15.w = ps;
    ps = 5.0 * r5.x;
    r0.xyz = r19.xzy * r18.xyz;
    r7.w = saturate(ps);
    r9.xyz = r17.yzw * r9.wxy + r0.xyz;
    ps = r15.x;
    r5.y = dot(r0.zxy, float3(0.11, 0.3, 0.59));
    ps = r5.w * ps;
    r5.z = r17.y * UniformScalar_5.x;
    r5.x = ps;
    ps = (-1.0) - -r5.x;
    r13.x = r5.z * r9.w;
    r6.y = ps;
    ps = r5.y;
    r7.xyz = r7.xyz * UniformVector_4.xyz;
    ps = -r0.x + ps;
    r5.zw = -r7.zw + 1.0;
    r3.x = ps;
    r5.y = (r3.y == 0.0) ? r12.x : r12.y;
    ps = ModShadowGroupColor.x * r5.w;
    r6.x = saturate(r3.x + r0.x);
    r3.y = ps;
    r12.xy = -r7.xy * r6.xx + r7.xy;
    r5.y = (r6.w == 0.0) ? r12.z : r5.y;
    r3.x = (r6.z == 0.0) ? r12.w : r5.y;
    ps = ModShadowGroupColor.y * r5.w;
    r5.y = max(r3.x, 0.0);
    r3.z = ps;
    ps = r5.y;
    r16 = r16 * float4(0.875, 0.875, 0.5, 0.5);
    r6.z = ps;
    ps = 0.3;
    r3 = -r3 + 1.0;
    r6.w = ps;
    ps = min(r6.z, r6.w);
    r15.xy = r16.xy * r3.yz;
    r5.y = ps;
    ps = 3.3333333 * r5.y;
    r15 = r15 + float4(0.125, 0.125, -1.0, -1.0);
    r5.y = ps;
    ps = r15.x * r15.y;
    r6.zw = r15.zw + r16.zw;
    r0.z = ps;
    r0.xyz = r0.zzz * r10.xyz + ModShadowColor.xyz;
    ps = 1.0 - r6.x;
    r10 = r5.yyzy * r6.yzxw;
    r5.w = ps;
    ps = rsqrt(abs(r1.w));
    r10.z = r7.z + r10.z;
    r6.w = ps;
    ps = r3.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r5.y = ps;
    ps = 2.5 * r5.y;
    r6.xyz = r14.xyz * r2.www;
    r5.z = ps;
    ps = r4.w;
    r3.xyz = r6.www * r1.xyz;
    ps = -r5.x + ps;
    r1.xyz = r13.xyz + UniformScalar_6.xxx;
    r5.y = saturate(ps);
    ps = r10.x;
    r2.xyz = r1.xyz * r5.www;
    r5.x = ps;
    ps = 1.0 + r5.x;
    r10.xy = r12.xy + r10.yw;
    r11.w = ps;
    r1 = r5.yyyz * r11;
    ps = r1.w;
    r5.yzw = -r4.xzy + r10.xzy;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r9.xyz = r9.xyz - r1.xyz;
    r6.w = saturate(ps);
    r1.xyz = r9.xyz * r6.www + r1.xyz;
    r5.xy = r5.yw * r6.ww + r4.xy;
    r5.z = r5.z * r6.w - 2.0;
    r5.z = r0.w * 2.0 + r5.z;
    r5.xyz = r5.zxy * r3.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r3.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r3.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r2.xyz = r2.xyz * r6.www;
    r5.x = ps;
    r4.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r4.zxy, r8.zxy);
    r5.xyz = r4.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r5.zxy));
    ps = log2(r5.x);
    r1.xyz = r1.xyz * r7.xyz;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r4.zyx, r3.zyx));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r6.xzy * r5.xzy;
    r5.xyz = r5.xyz * LightColor.xzy;
    r5.xyz = r5.xzy * r0.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
