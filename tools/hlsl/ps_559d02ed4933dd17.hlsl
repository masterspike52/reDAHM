// ps_559d02ed4933dd17.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 405 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000654 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_14 : register(c17); // float
float4 UniformScalar_16 : register(c18); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.w + r0.w;
    r5.x = r4.w - 4e+02;
    r10.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r1.z + 0.1;
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = UniformScalar_3.x * UniformVector_4.x;
    r8.y = ps;
    ps = UniformScalar_4.x * r5.z;
    r3.w = dot(r3.zxy, r3.zxy);
    r1.w = ps;
    ps = rsqrt(abs(r3.w));
    r7.xw = r8.xy * abs(r7.xy);
    r5.z = ps;
    ps = floor(r1.w);
    r7.yz = r0.xy * UniformVector_2.xy;
    r11.w = ps;
    ps = 0.00022222222 * r5.x;
    r8 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r3.w = saturate(ps);
    ps = 5.0 * r5.y;
    r11.xyz = r5.zzz * r3.xyz;
    r3.x = saturate(ps);
    ps = 1.0 - r0.z;
    r5.w = UniformScalar_16.x * 0.05;
    r9.z = ps;
    ps = 1.0 / UniformScalar_1.x;
    r5.x = r5.w * r3.w;
    r5.y = ps;
    r5.xyw = r11.wxy * r5.yxx + r0.xwz;
    ps = r0.z + r0.z;
    r9.x = -r5.w + 1.0;
    r10.w = ps;
    ps = UniformVector_1.x * r5.y;
    r9.zw = r9.xz * UniformVector_1.yy;
    r9.x = ps;
    ps = UniformVector_1.x * r0.w;
    r3.z = saturate(r4.w * 0.0001);
    r9.y = ps;
    ps = r0.y;
    r12 = r9.xzwy - 0.5;
    ps = UniformScalar_8.x + ps;
    r21 = float4((r9.zwxy >= 0.5));
    r5.z = ps;
    ps = r5.y + r5.y;
    r12 = r12 - r9.xzwy;
    r0.x = ps;
    r9 = r12 * r21.zxyw + r9.xzwy;
    ps = r5.w + r5.w;
    r12 = r9.xywz + r9.xywz;
    r0.y = ps;
    r10.xy = tex2D(ModShadowAccumTexture, r7.xw).xy;
    r9 = tex2D(Texture2D_9, r7.yz);
    r17.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    r20 = tex2D(Texture2D_3, r12.zw);
    r22 = tex2D(Texture2D_3, r12.xy);
    r7.x = tex2D(Texture2D_6, r7.yz).x;
    r16 = tex2D(Texture2D_2, r10.zw);
    r13 = tex2D(Texture2D_7, r5.xz);
    r5.xyz = tex2D(Texture2D_5, r7.yz).xyz;
    r12.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xzw = tex2D(Texture2D_1, r10.zw).xyz;
    r18 = tex2D(Texture2D_4, r8.xy);
    r19.yzw = tex2D(Texture2D_4, r8.zw).xyw;
    ps = r6.w;
    r0.y = -r6.w + UniformScalar_12.x;
    ps = 15.0 * ps;
    r14.xyz = UniformVector_5.xyz * 2e+01;
    r3.y = saturate(ps);
    ps = r19.y + r19.y;
    r5.w = float((UniformScalar_11.x >= 1.0));
    r8.x = ps;
    r15.zw = r18.xy * 2.0 - 1.0;
    r7.yzw = r0.xzw * 2.0 - 1.0;
    r0.xzw = r12.xyz * 2.0 - 1.0;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    r5.w = r0.y * r5.w + r6.w;
    ps = r19.z + r19.z;
    r5.w = -r5.w + r6.z;
    r8.y = ps;
    ps = UniformVector_4.x * r5.y;
    r13.xyz = r13.xyz * r13.www;
    r5.y = ps;
    ps = UniformVector_4.y * r5.z;
    r13.xyz = r14.xyz * r13.xyz;
    r5.z = ps;
    ps = UniformVector_4.z * r5.x;
    r7.yzw = r7.yzw - r0.xzw;
    r5.x = ps;
    r8.w = r7.w * r16.w - 2.0;
    ps = (-1.0) - -r5.x;
    r0.y = max(r5.w, UniformScalar_13.x);
    r13.w = ps;
    r12.xyw = r7.yzw * r16.www + r0.xzw;
    r14.xy = r5.yz * r7.xx - r12.xy;
    ps = r3.y;
    r13 = r13 * r7.xxxx;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r0.z = dot(r21.wyy, float3(1.0, 1.0, 1.0));
    r6.z = ps;
    ps = 1.0 - r3.x;
    r0.x = dot(r21.zxx, float3(1.0, 1.0, 1.0));
    r5.z = ps;
    r5.y = (r0.x == 0.0) ? r22.x : r22.y;
    r5.x = (r0.z == 0.0) ? r20.x : r20.y;
    ps = 1.0 - r3.z;
    r21 = r0.xzzx + float4(-3.0, -2.0, -3.0, -2.0);
    r1.w = ps;
    r5.x = (r21.y == 0.0) ? r20.z : r5.x;
    r5.y = (r21.w == 0.0) ? r22.z : r5.y;
    r15.x = (r21.x == 0.0) ? r22.w : r5.y;
    r5.x = (r21.z == 0.0) ? r20.w : r5.x;
    ps = ModShadowGroupColor.x * r5.z;
    r0.x = max(r5.x, 0.0);
    r7.y = ps;
    ps = 1.0 / UniformScalar_14.x;
    r5.yw = min(r0.xy, float2(0.3, 1.0));
    r0.x = ps;
    ps = 3.3333333 * r5.y;
    r5.w = saturate(r5.w * r0.x);
    r15.y = ps;
    ps = 1.0 - r5.x;
    r10.z = dot(r1.zxy, r1.zxy);
    r0.x = ps;
    ps = 1.0 - r5.w;
    r0.yz = -r15.yx + 1.0;
    r0.w = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r19.x = r0.w * r6.w;
    r7.z = ps;
    r5.x = dot(r3.yy, r0.zz) + r15.x;
    ps = r5.x;
    r14.zw = r4.xy * ScreenPositionScaleBias.xy;
    ps = r15.x + ps;
    r6.xy = r19.wx * r18.wz;
    r8.z = ps;
    ps = 2.5 * r0.x;
    r5.xyz = r8.xzy + float3(-1.0, 0.25, -1.0);
    r0.z = ps;
    ps = r3.y;
    r7.w = float((r6.y >= 0.05));
    ps = r0.y * ps;
    r5.w = saturate(r5.y - r6.x);
    r8.z = ps;
    ps = 0.5 * r5.x;
    r3.xyz = r5.www * r17.xyz;
    r8.x = ps;
    ps = 0.5 * r5.z;
    r7 = -r7.wyzx + 1.0;
    r8.y = ps;
    ps = (-1.0) - -r6.x;
    r15.xyz = r15.zyw + r8.xzy;
    r15.w = ps;
    ps = 1.0 / r4.w;
    r5.yzw = -r3.xyz + r16.xyz;
    r5.x = ps;
    r6.x = (UniformScalar_12.x > 0.0) ? r7.x : 1.0;
    r3.w = (UniformScalar_12.x >= 0.0) ? r6.x : r7.x;
    r8.xyz = r5.yzw * r16.www + r3.xyz;
    r0.y = r15.w * r15.y + 1.0;
    r14.xy = r15.xy * r15.yz + r14.xy;
    r5.yz = r14.zw * r5.xx + ScreenPositionScaleBias.wz;
    ps = -r12.w;
    r6.xy = r0.yz * r0.xy;
    ps = r13.w + ps;
    r5.w = float((r6.x >= 0.9));
    r5.x = ps;
    r0.y = saturate(r6.y * r6.z - 0.5);
    r6.xy = r14.xy * r0.yy + r12.xy;
    r0.xzw = r13.xyz * r5.www + r9.xyz;
    ps = 1.0 + r5.x;
    r4.xyz = r0.xzw - r8.xyz;
    r4.w = ps;
    r8 = r4 * r0.yyyy + r8;
    r6.z = r12.z * 2.0 + r8.w;
    r6.xyz = r6.zxy * r1.www;
    ps = 1.0 + r6.x;
    r5.x = dot(r2.zxy, r2.zxy);
    r6.w = ps;
    r6.xyz = (r1.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r1.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r10.z));
    r5.w = dot(r6.zxy, r6.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r5.w));
    r3.xyz = r6.www * r1.xyz;
    r5.w = ps;
    ps = 1.0 - r5.x;
    r4.xyz = r6.xyz * r5.www;
    r5.x = saturate(ps);
    r5.w = dot(r4.zxy, r11.zxy);
    r6.xyz = r4.xyz * r5.www;
    r6.xyz = r6.xyz * 2.0 - r11.xyz;
    r5.w = saturate(dot(r3.zxy, r6.zxy));
    ps = log2(r5.w);
    r0.w = r3.w * r9.w;
    r10.z = ps;
    r6.xyw = r10.zyx * float3(15.0, 0.875, 0.875);
    r0.xz = r6.wy * r7.yz;
    r0.xzw = r0.wxz + float3(-0.5, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    r1.xyz = tex2D(LightAttenuationTexture, r5.yz).xyz;
    r9.xyz = r9.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = log2(r5.x);
    r5.yzw = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r1.xyw = r1.xzy * r2.www;
    r6.w = ps;
    ps = r1.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    ps = r6.w * ps;
    r2.xyz = r9.xyz * r7.www;
    r0.x = ps;
    ps = r1.y;
    r2.xyz = r2.xyz * r0.yyy;
    ps = r6.w * ps;
    r1.xyz = r8.xyz * r7.xyz;
    r0.y = ps;
    ps = pow(2.0, r6.x);
    r5.x = saturate(dot(r4.zyx, r3.zyx));
    r6.x = ps;
    ps = r1.w;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r5.xx + r6.xy;
    r6.z = r1.z * r5.x + r6.z;
    ps = r6.w * ps;
    r5.x = r0.z * r0.w;
    r0.z = ps;
    r5.xyz = r5.xxx * r5.yzw + ModShadowColor.xyz;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
