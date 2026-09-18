// ps_e809dcd54b243d5f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 432 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006C0 10041900 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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

    ps = UniformScalar_13.x;
    r5.xy = r4.xy * ScreenPositionScaleBias.xy;
    ps = 0.05 * ps;
    r8.y = saturate(r6.w * 15.0);
    r5.z = ps;
    ps = r1.z;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r8.z = r4.w - 4e+02;
    r8.x = ps;
    ps = rsqrt(abs(r5.w));
    r8.xz = saturate(r8.xz * float2(5.0, 0.00022222222));
    r5.w = ps;
    ps = 1.0 / r4.w;
    r9.xyz = r5.www * r3.xyz;
    r8.w = ps;
    ps = UniformScalar_9.x - r6.w;
    r15 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r9.w = ps;
    ps = -r0.z;
    r5.xyw = r5.zxy * r8.zww;
    r3.xy = r9.xy * r5.xx + r0.wz;
    ps = 1.0 + ps;
    r3.z = -r3.y + 1.0;
    r3.w = ps;
    ps = UniformVector_1.x * r0.w;
    r10.yzw = r3.wxz * UniformVector_1.yxy;
    r10.x = ps;
    r11 = r10.wzxy - 0.5;
    r12 = float4((r10.wzxy >= 0.5));
    r11 = r11 - r10.wzxy;
    r10 = r11.yxzw * r12.yxzw + r10.zwxy;
    r13 = r10.zwxy + r10.zwxy;
    r10 = tex2D(Texture2D_9, r0.xy);
    r11 = tex2D(Texture2D_4, r15.xy);
    r14 = tex2D(Texture2D_3, r13.xy);
    r15.yzw = tex2D(Texture2D_4, r15.zw).xyw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r13.xy = r0.wz + r0.wz;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = float((UniformScalar_8.x >= 1.0));
    r0.w = ps;
    r5.x = r9.w * r5.x + r6.w;
    ps = -r5.x;
    r7.xy = r0.zw * abs(r7.xy);
    ps = r6.z + ps;
    r22.x = dot(r12.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r22.y = dot(r12.zww, float3(1.0, 1.0, 1.0));
    r7.z = ps;
    r5.x = (r22.y == 0.0) ? r14.x : r14.y;
    ps = UniformScalar_10.x;
    r12 = r22.yyxx + float4(-2.0, -3.0, -3.0, -2.0);
    r7.w = ps;
    r5.x = (r12.x == 0.0) ? r14.z : r5.x;
    r0.z = (r12.y == 0.0) ? r14.w : r5.x;
    ps = max(r7.z, r7.w);
    r5.x = max(r0.z, 0.0);
    r5.z = ps;
    ps = 1.0 / UniformScalar_11.x;
    r5.xz = min(r5.zx, float2(1.0, 0.3));
    r0.w = ps;
    r5.x = saturate(r5.x * r0.w);
    ps = 1.0 - r5.x;
    r14.y = r5.z * 3.3333333;
    r5.z = ps;
    r15.x = r5.z * r6.w;
    ps = r15.y + r15.y;
    r6.xy = r15.wx * r11.wz;
    r14.x = ps;
    ps = r15.z + r15.z;
    r0.w = float((r6.y >= 0.05));
    r14.z = ps;
    ps = ScreenPositionScaleBias.w + r5.y;
    r0.zw = -r0.zw + 1.0;
    r6.y = ps;
    r5.z = (UniformScalar_9.x > 0.0) ? r0.w : 1.0;
    r5.z = (UniformScalar_9.x >= 0.0) ? r5.z : r0.w;
    ps = ScreenPositionScaleBias.z + r5.w;
    r14.w = r5.z * r10.w;
    r6.z = ps;
    ps = r3.x + r3.x;
    r15.xyz = r14.xzw + float3(-1.0, -1.0, -0.5);
    r5.x = ps;
    ps = r3.y + r3.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r15.zzzz)) clip(-1.0);
    r5.y = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r6.yz).xyz;
    r17 = tex2D(Texture2D_2, r13.xy);
    r19.xyz = tex2D(Texture2D_8, r5.xy).xyz;
    r20 = tex2D(Texture2D_3, r13.zw);
    r6.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r25 = tex2D(Texture2D_6, r0.xy);
    r18.xyz = tex2D(Texture2D_1, r13.xy).xyz;
    r24 = tex2D(Texture2D_7, r0.xy);
    r5.zw = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7.xyw = tex2D(Texture2D_0, r5.xy).xyz;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r3.w = float((UniformScalar_5.x > 0.0));
    r1.w = ps;
    ps = r4.w;
    r21.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r4.w = saturate(ps);
    r16.xyz = r10.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r13.xyz = r7.xyw * 2.0 - 1.0;
    r14.zw = r11.xy * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r11.xyz = UniformVector_5.xzy * 2e+01;
    r5.y = saturate(ps);
    ps = 0.875 * r5.z;
    r23.xyz = UniformVector_4.xzy * 2e+01;
    r0.x = ps;
    ps = 0.875 * r5.w;
    r5.x = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    ps = r24.x * r24.w;
    r18.xyz = r18.xyz + r18.xyz;
    r2.x = ps;
    ps = r24.z * r24.w;
    r4.xyz = r25.xzy * r25.www;
    r2.y = ps;
    r6.yzw = r6.yzw * 2.0 - 1.0;
    ps = r24.y * r24.w;
    r6.yzw = r6.wyz * UniformVector_3.zxy;
    r2.z = ps;
    ps = rsqrt(abs(r5.x));
    r4.xyz = r23.xyz * r4.xyz;
    r5.x = ps;
    ps = log2(r5.y);
    r2.xyz = r11.xyz * r2.xyz;
    r5.y = ps;
    r11.xyz = (abs(r3.www) > 0.0) ? r4.xzy : r2.xzy;
    r4.xyz = (-abs(r3.www) >= 0.0) ? r2.yxz : r4.yxz;
    r4.xyz = (-abs(r1.www) >= 0.0) ? r2.yxz : r4.xyz;
    r11.xyz = (abs(r1.www) > 0.0) ? r11.xyz : r2.xzy;
    ps = r8.y;
    r2.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r1.x = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r5.w = ps;
    ps = 1.0 - r8.x;
    r1.w = saturate(dot(r4.zxy, float3(0.59, 0.11, 0.3)));
    r5.z = ps;
    r12.xy = -r6.zw * r1.ww + r6.zw;
    ps = ModShadowGroupColor.x * r5.z;
    r5.x = r1.x - r11.x;
    r4.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r4.x = saturate(r5.x + r11.x);
    r4.z = ps;
    ps = 1.0 - r6.y;
    r4 = -r4 + 1.0;
    r1.x = ps;
    r1.yz = r0.xy * r4.yz + 0.125;
    r5.x = (r22.x == 0.0) ? r20.x : r20.y;
    r0.xy = r1.xy * r1.wz;
    r1.xyz = r0.yyy * r21.xyz + ModShadowColor.xyz;
    r5.x = (r12.w == 0.0) ? r20.z : r5.x;
    r14.x = (r12.z == 0.0) ? r20.w : r5.x;
    ps = r6.y;
    r5.xz = -r14.xy + 1.0;
    r6.z = dot(r8.yy, r5.xx) + r14.x;
    ps = r0.x + ps;
    r18.w = r6.z + r14.x;
    r12.w = ps;
    ps = r8.y;
    r18 = r18 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = r5.z * ps;
    r5.x = saturate(r18.w - r6.x);
    r8.z = ps;
    ps = (-1.0) - -r6.x;
    r7.xyz = r5.xxx * r19.xyz;
    r8.w = ps;
    ps = -r7.z;
    r6.xzw = r18.zxy - r13.zxy;
    ps = r17.z + ps;
    r5.xz = -r7.xy + r17.xy;
    r6.y = ps;
    r7.xy = r5.xz * r17.ww + r7.xy;
    ps = 2.5 * r0.z;
    r6 = r6.zwxy * r17.wwww;
    r0.y = ps;
    ps = r7.z;
    r4.xyz = r16.xyz * r4.xxx;
    ps = r6.w + ps;
    r8.xy = r15.xy * 0.5;
    r7.z = ps;
    ps = r6.z;
    r8.xyz = r14.zyw + r8.xzy;
    r5.x = ps;
    r12.yz = r8.xy * r8.yz + r12.xy;
    r0.x = r8.w * r8.y + 1.0;
    ps = r0.x * r0.z;
    r6.xyz = r13.xyz + r6.xyz;
    r12.x = ps;
    ps = r0.y * r0.x;
    r8.xyz = -r6.xyz + r12.yzw;
    r12.y = ps;
    ps = (-2.0) + r5.x;
    r5.zw = r12.yx * r5.ww;
    r6.w = ps;
    ps = (-0.5) + r5.z;
    r5.x = float((r5.w >= 0.9));
    r5.z = saturate(ps);
    r0.xyz = r5.xxx * r11.xyz + r10.xyz;
    r6.xyz = r8.xyz * r5.zzz + r6.xyw;
    r6.w = r7.w * 2.0 + r6.z;
    r0.xyz = r0.xyz - r7.xyz;
    r7.xyz = r0.xyz * r5.zzz + r7.xyz;
    r6.xyw = r6.xyw * r4.www;
    ps = -UniformVector_0.x;
    r6.z = r6.w + 1.0;
    r6.xyz = (r4.www > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r4.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.x = dot(r6.wyz, r6.wyz);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r4.xyz * r5.zzz;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r6.yzw * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r4.zxy, r9.zxy);
    r6.y = ps;
    ps = -UniformVector_0.z;
    r5.xzw = r4.xyz * r5.xxx;
    r5.xzw = r5.xzw * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r2.zxy, r5.wxz));
    r6.z = ps;
    ps = log2(r5.x);
    r6.yzw = r7.xyz * r6.xyz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r5.z = r5.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.z);
    r6.x = saturate(dot(r4.zyx, r2.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r0.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r1.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
