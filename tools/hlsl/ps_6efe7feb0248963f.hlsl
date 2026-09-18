// ps_6efe7feb0248963f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 405 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000654 10041900 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c17); // float2
float4 SpotDirection : register(c16); // float3
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
sampler2D ShadowTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_8, r1.xy);
    ps = (-0.5) + r10.w;
    r0.zw = r1.wz * 6.0;
    r6.x = ps;
    ps = UniformVector_2.x * r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r12.y = ps;
    r9.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    ps = r2.z;
    r11.xy = r1.wz * UniformVector_7.xy;
    ps = 0.1 + ps;
    r7.xy = r1.wz * UniformVector_1.xy;
    r6.z = ps;
    ps = r5.w;
    r6.x = dot(r3.zxy, r3.zxy);
    ps = (-4e+02) + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = 1.0 / r5.w;
    r11.zw = r5.xy * ScreenPositionScaleBias.xy;
    r7.z = ps;
    r11.zw = r11.zw * r7.zz + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.w));
    r12.zw = r9.xy + r9.xy;
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r9.xyz = r6.www * r4.xyz;
    r6.w = ps;
    ps = 0.00022222222 * r6.y;
    r4.xyz = r6.www * -SpotDirection.xyz;
    r4.w = saturate(ps);
    ps = 5.0 * r6.z;
    r6.w = dot(r4.zxy, r3.zxy);
    r4.x = saturate(ps);
    ps = -r1.z;
    r6.y = r4.w * (-0.025);
    r7.yz = r9.xy * r6.yy + r7.xy;
    ps = 1.0 + ps;
    r6.y = r6.w - SpotAngles.x;
    r22.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r7.x = saturate(r6.y * SpotAngles.y);
    r7.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.yz = r7.zx * r7.wx;
    r6.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r22.xw = -r4.yx + 1.0;
    r22.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.xyw = r22.zxy * UniformVector_2.xyy;
    r6.z = ps;
    ps = r3.x;
    r6.yz = r6.yz * abs(r8.xy);
    ps = r7.y * ps;
    r8.xz = r3.wy - 0.5;
    r12.x = ps;
    ps = r8.z;
    r20.zw = float2((r3.yw >= 0.5));
    ps = -r3.y + ps;
    r13 = r12 + float4(-0.5, -0.5, -1.0, -1.0);
    r8.z = ps;
    ps = r8.x;
    r20.xy = float2((r12.xy >= 0.5));
    ps = -r3.w + ps;
    r8.xy = r13.xy - r12.xy;
    r8.w = ps;
    r3.xz = r8.xy * r20.xy + r12.xy;
    r3.yw = r8.zw * r20.zw + r3.yw;
    r3 = r3 + r3;
    r15.xyz = tex2D(LightAttenuationTexture, r11.zw).xyz;
    r17.xyz = tex2D(Texture2D_6, r7.yz).xyz;
    r18.x = tex2D(ShadowTexture, r0.xy).x;
    r19 = tex2D(Texture2D_1, r3.zw);
    r21 = tex2D(Texture2D_1, r3.xy);
    r0.xy = tex2D(ModShadowAccumTexture, r6.yz).xy;
    r3 = tex2D(Texture2D_5, r1.xy);
    r24 = tex2D(Texture2D_4, r1.xy);
    r8.xyz = tex2D(Texture2D_7, r11.xy).xyz;
    r11.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r6.yzw = tex2D(Texture2D_2, r0.zw).xyw;
    r1.xyz = tex2D(Texture2D_0, r7.yz).zxy;
    ps = UniformVector_5.x;
    r7.yzw = -ModShadowColor.xyz + 1.0;
    ps = 2e+01 * ps;
    r25.xyz = UniformVector_6.xzy * 2e+01;
    r23.x = ps;
    ps = UniformVector_5.z;
    r7.x = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = 2e+01 * ps;
    r1.w = float((UniformScalar_11.x >= 1.0));
    r23.y = ps;
    ps = UniformVector_5.y;
    r2.w = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r8.w = float((UniformScalar_11.x > 1.0));
    r23.z = ps;
    r12.xyz = r1.yzx * 2.0 - 1.0;
    r0.zw = r6.yz * 2.0 - 1.0;
    r14.xyz = r11.xyz * 2.0 - 1.0;
    r11.xyz = (-abs(r8.www) >= 0.0) ? r8.xyz : 1.0;
    ps = r24.x * r24.w;
    r16.xyz = r10.xyz * UniformScalar_12.xxx;
    r18.y = ps;
    ps = rsqrt(abs(r2.w));
    r8.xyz = r3.xzy * r3.www;
    r2.w = ps;
    ps = r24.z * r24.w;
    r3.xyz = r2.www * r2.xyz;
    r18.z = ps;
    ps = r24.y * r24.w;
    r8.xyz = r25.xyz * r8.xyz;
    r18.w = ps;
    ps = 1.0 - r6.x;
    r18.yzw = r23.xyz * r18.yzw;
    r6.x = saturate(ps);
    r11.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r11.xyz;
    ps = log2(r6.x);
    r14.xyz = r14.xyz * UniformVector_4.xyz;
    r6.y = ps;
    r0 = r0.xzwy * float4(0.875, 0.5, 0.5, 0.875);
    r2.xyz = r16.xyz * r11.xyz + UniformScalar_13.xxx;
    r16.xyz = (-abs(r7.xxx) >= 0.0) ? r8.yxz : r18.zyw;
    r8.xyz = (abs(r7.xxx) > 0.0) ? r18.ywz : r8.xzy;
    r6.x = dot(r8.zxy, float3(0.11, 0.3, 0.59));
    r2.w = saturate(dot(r16.zxy, float3(0.59, 0.11, 0.3)));
    r13.xy = -r14.xy * r2.ww + r14.xy;
    r6.x = r6.x - r8.x;
    r14.w = saturate(r6.x + r8.x);
    ps = r5.w;
    r16.xz = -r14.zw + 1.0;
    ps = 0.0001 * ps;
    r1.yzw = r2.xyz * r16.zzz;
    r6.z = saturate(ps);
    r2.xy = -r22.ww * ModShadowGroupColor.xy + 1.0;
    ps = r6.w;
    r5.xy = r0.xw * r2.xy;
    r2.xy = r20.zw * 2.0 + r20.xy;
    r7.x = (r2.x == 0.0) ? r21.x : r21.y;
    r6.x = (r2.y == 0.0) ? r19.x : r19.y;
    ps = r9.w * ps;
    r20 = r2.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r6.w = ps;
    r6.x = (r20.z == 0.0) ? r19.z : r6.x;
    r7.x = (r20.y == 0.0) ? r21.z : r7.x;
    r5.z = (r20.x == 0.0) ? r21.w : r7.x;
    r6.x = (r20.w == 0.0) ? r19.w : r6.x;
    ps = (-1.0) - -r6.w;
    r7.x = max(r6.x, 0.0);
    r2.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r18.yzw = r5.xyz + float3(0.125, 0.125, 0.25);
    r0.w = ps;
    ps = 1.0 - r6.x;
    r7.x = min(r7.x, 0.3);
    r6.x = ps;
    ps = 1.0 - r6.z;
    r0.x = r18.w + r5.z;
    r6.y = ps;
    ps = r0.x;
    r2.yz = r13.zw + r0.yz;
    ps = -r6.w + ps;
    r0.xy = r18.xy * r18.xz;
    r6.z = saturate(ps);
    r7.yzw = r0.yyy * r7.yzw + ModShadowColor.xyz;
    ps = 3.3333333 * r7.x;
    r5.xyz = r6.zzz * r17.xyz;
    r16.y = ps;
    ps = 2.5 * r6.x;
    r2 = r16.yyxy * r2.yzwx;
    r6.w = ps;
    ps = r14.z;
    r0.xyz = r0.xxx * r15.xyz;
    ps = r2.z + ps;
    r6.z = r2.w + 1.0;
    r2.z = ps;
    ps = pow(2.0, r0.w);
    r2.xy = r13.xy + r2.xy;
    r7.x = ps;
    ps = r6.z * r6.x;
    r0.xyz = r0.xzy * r7.xxx;
    r7.x = ps;
    ps = r6.w * r6.z;
    r2.xyz = -r12.xyz + r2.xyz;
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r0.w = float((r7.x > 0.9));
    r7.x = saturate(ps);
    r2.xy = r2.xy * r7.xx + r12.xy;
    r8.xyz = r0.www * r8.xyz - r5.xyz;
    r0.w = r2.z * r7.x - 2.0;
    r2.z = r1.x * 2.0 + r0.w;
    r8.xyz = r11.xyz * r10.xyz + r8.xyz;
    r5.xyz = r8.xyz * r7.xxx + r5.xyz;
    r2.xyw = r2.xyz * r6.yyy;
    ps = -UniformVector_0.x;
    r2.z = r2.w + 1.0;
    r2.xyz = (r6.yyy > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r6.yyy >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r6.x = dot(r6.wyz, r6.wyz);
    r1.x = ps;
    ps = rsqrt(abs(r6.x));
    r2.xyz = r1.yzw * r7.xxx;
    r6.x = ps;
    ps = -UniformVector_0.y;
    r6.yzw = r6.yzw * r6.xxx;
    ps = 1.0 + ps;
    r6.x = dot(r6.wyz, r9.zxy);
    r1.y = ps;
    ps = -UniformVector_0.z;
    r8.xyz = r6.yzw * r6.xxx;
    r8.xyz = r8.xyz * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r3.zxy, r8.zxy));
    r1.z = ps;
    ps = log2(r6.x);
    r1.xyz = r5.xyz * r1.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r3.zyx));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r4.zzz;
    r6.xyz = r6.xzy * r7.yzw;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
