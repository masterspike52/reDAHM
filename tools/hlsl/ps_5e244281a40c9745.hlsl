// ps_5e244281a40c9745.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 399 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000063C 10041500 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_4.x - r6.w;
    r8.w = ps;
    ps = UniformScalar_8.x;
    r5.x = r4.w - 4e+02;
    ps = 0.05 * ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.w));
    r5.y = r1.z + 0.1;
    r5.w = ps;
    ps = 0.00022222222 * r5.x;
    r2 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r9.w = saturate(ps);
    ps = 5.0 * r5.y;
    r8.xyz = r5.www * r3.xyz;
    r9.x = saturate(ps);
    ps = -r0.z;
    r5.x = r5.z * r9.w;
    r3.xy = r8.xy * r5.xx + r0.wz;
    ps = 1.0 + ps;
    r3.z = -r3.y + 1.0;
    r3.w = ps;
    ps = UniformVector_1.x * r0.w;
    r11.yzw = r3.wxz * UniformVector_1.yxy;
    r11.x = ps;
    r10 = r11.wzxy - 0.5;
    r5 = float4((r11.wxyz >= 0.5));
    ps = r3.x + r3.x;
    r12 = r10 - r11.wzxy;
    r10.x = ps;
    r11 = r12.yxzw * r5.wxyz + r11.zwxy;
    ps = r3.y + r3.y;
    r13 = r11 + r11;
    r10.y = ps;
    r14 = tex2D(Texture2D_8, r0.xy);
    r15 = tex2D(Texture2D_4, r2.xy);
    r20.yzw = tex2D(Texture2D_4, r2.zw).xyw;
    r11 = tex2D(Texture2D_3, r13.zw);
    r3.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.y = saturate(r4.w * 0.0001);
    r2.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.w = float((UniformScalar_3.x >= 1.0));
    r2.y = ps;
    ps = 1.0 / r4.w;
    r10.zw = r4.xy * ScreenPositionScaleBias.xy;
    r2.z = ps;
    r4.yz = r10.zw * r2.zz + ScreenPositionScaleBias.wz;
    r1.w = r8.w * r1.w + r6.w;
    ps = -r1.w;
    r2.yz = r2.xy * abs(r7.xy);
    ps = r6.z + ps;
    r17.x = dot(r5.wxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r17.y = dot(r5.yzz, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    r5.x = (r17.y == 0.0) ? r11.x : r11.y;
    ps = UniformScalar_5.x;
    r12 = r17.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r5.w = ps;
    r5.x = (r12.z == 0.0) ? r11.z : r5.x;
    r5.x = (r12.w == 0.0) ? r11.w : r5.x;
    ps = max(r5.y, r5.w);
    r5.z = max(r5.x, 0.0);
    r5.y = ps;
    ps = 1.0 / UniformScalar_6.x;
    r4.xw = min(r5.yz, float2(1.0, 0.3));
    r5.y = ps;
    r5.y = saturate(r4.x * r5.y);
    r2.xw = -r5.xy + 1.0;
    r20.x = r2.w * r6.w;
    r6.xz = r20.xw * r15.zw;
    ps = r3.x + r3.x;
    r9.z = float((r6.x >= 0.05));
    r7.x = ps;
    ps = r3.y + r3.y;
    r5.xzw = -r9.zxy + 1.0;
    r7.y = ps;
    r5.y = (UniformScalar_4.x > 0.0) ? r5.x : 1.0;
    r5.x = (UniformScalar_4.x >= 0.0) ? r5.y : r5.x;
    ps = r3.w + r3.w;
    r7.w = r5.x * r14.w;
    r7.z = ps;
    ps = r0.w + r0.w;
    r11 = r7 + float4(-1.0, -1.0, -1.0, -0.5);
    r5.x = ps;
    ps = r0.z + r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r11.wwww)) clip(-1.0);
    r5.y = ps;
    r19.xyz = tex2D(LightAttenuationTexture, r4.yz).xyz;
    r9 = tex2D(Texture2D_2, r5.xy);
    r4.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r10.xyz = tex2D(Texture2D_1, r5.xy).xyz;
    r7 = tex2D(Texture2D_3, r13.xy);
    r21.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r0 = tex2D(Texture2D_6, r0.xy);
    r6.xy = tex2D(ModShadowAccumTexture, r2.yz).xy;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    ps = r6.w;
    r18.xyz = UniformVector_4.xyz * 2e+01;
    r16.xyz = r14.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    r12.zw = r15.xy * 2.0 - 1.0;
    ps = 15.0 * ps;
    r15.xyz = r0.xyz * r0.www;
    r17.z = saturate(ps);
    r0.xyz = r21.zxy * 2.0 - 1.0;
    r5.xy = r20.yz * 2.0 - 1.0;
    ps = 0.875 * r6.x;
    r15.xyz = r18.xyz * r15.xyz;
    r18.x = ps;
    ps = UniformVector_3.x * r0.y;
    r6.x = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r0.y = ps;
    ps = UniformVector_3.y * r0.z;
    r6.x = r6.x - r15.x;
    r0.z = ps;
    ps = UniformVector_3.z * r0.x;
    r6.x = saturate(r6.x + r15.x);
    r0.x = ps;
    r2.yz = -r0.yz * r6.xx + r0.yz;
    r6.w = (r17.x == 0.0) ? r7.x : r7.y;
    r6.w = (r12.y == 0.0) ? r7.z : r6.w;
    r12.x = (r12.x == 0.0) ? r7.w : r6.w;
    ps = 0.875 * r6.y;
    r12.y = r4.w * 3.3333333;
    r18.y = ps;
    ps = 0.5 * r5.x;
    r6.yw = -r12.xy + 1.0;
    r7.x = ps;
    ps = 0.5 * r5.y;
    r7.z = r17.z * r6.w;
    r7.y = ps;
    r5.y = dot(r17.zz, r6.yy) + r12.x;
    ps = r5.y;
    r10.yzw = r10.xyz + r10.xyz;
    ps = r12.x + ps;
    r7.xyz = r12.zyw + r7.xzy;
    r10.x = ps;
    ps = 1.0 - r0.x;
    r12 = r10.yxzw + float4(-1.0, 0.25, -1.0, -1.0);
    r6.y = ps;
    ps = (-1.0) - -r6.z;
    r5.y = saturate(r12.y - r6.z);
    r7.w = ps;
    r10.xy = r7.xy * r7.yz + r2.yz;
    r2.y = r7.w * r7.y + 1.0;
    ps = 1.0 - r6.x;
    r4.xyw = r5.yyy * r4.xyz;
    r5.y = ps;
    ps = 2.5 * r2.x;
    r12.y = -r4.w + r9.z;
    r2.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6.z = dot(r1.zxy, r1.zxy);
    r17.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r7.xy = -r4.xy + r9.xy;
    r17.y = ps;
    r7.xy = r7.xy * r9.ww + r4.xy;
    ps = r2.y * r2.x;
    r3.xyz = r19.xyz * LightColor.xyz;
    r18.z = ps;
    ps = r2.z * r2.y;
    r17.xyz = -r17.xyz + 1.0;
    r18.w = ps;
    ps = rsqrt(abs(r6.z));
    r2 = r18.yxzw * r17.yxzz;
    r5.x = ps;
    ps = r2.w;
    r4.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    ps = r2.y;
    r1.xyz = r16.xyz * r5.yyy;
    r5.y = ps;
    ps = 0.125 + r5.y;
    r6.w = float((r2.z >= 0.9));
    r6.z = ps;
    r9.xyz = r15.xyz * r6.www + r14.xyz;
    ps = 0.125 + r2.x;
    r12.xzw = r12.wxz - r11.zxy;
    r6.w = ps;
    ps = (-0.5) + r5.x;
    r7.zw = r6.zy * r6.wx;
    r6.w = saturate(ps);
    r6.xyz = r7.zzz * r13.xyz + ModShadowColor.xyz;
    ps = r0.x;
    r2 = r12.zwxy * r9.wwww;
    ps = r7.w + ps;
    r7.z = r4.w + r2.w;
    r10.z = ps;
    ps = r2.z;
    r0.xyz = r11.xyz + r2.xyz;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r2.xyz = -r0.xyz + r10.xyz;
    r0.w = ps;
    r2.xyz = r2.xyz * r6.www + r0.xyw;
    r0.xyz = r9.xyz - r7.xyz;
    r0.xyz = r0.xyz * r6.www + r7.xyz;
    r2.w = r3.w * 2.0 + r2.z;
    r2.xyw = r2.xyw * r5.www;
    ps = -UniformVector_0.x;
    r2.z = r2.w + 1.0;
    r2.xyz = (r5.www > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r2.xyz = (r5.www >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r1.xyz * r6.www;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r2.xyz = r2.xyz * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r8.zxy);
    r5.z = ps;
    ps = -UniformVector_0.z;
    r7.xyz = r2.xyz * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r4.zxy, r7.zxy));
    r5.w = ps;
    ps = log2(r5.x);
    r0.xyz = r0.xyz * r5.yzw;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r2.zyx, r4.zyx));
    r5.x = ps;
    r5.xyz = r1.xzy * r5.xxx;
    r5.y = r0.z * r5.w + r5.y;
    r5.xz = r0.xy * r5.ww + r5.xz;
    r5.xyz = r3.xzy * r5.xyz;
    r5.xyz = r5.xyz * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
