// ps_1cab4acffe15fda8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 453 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000714 10041900 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c21); // float2
float4 SpotDirection : register(c20); // float3
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_11 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
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
sampler2D ShadowTexture : register(s11);
sampler2D ModShadowAccumTexture : register(s12);

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

    ps = r1.w + r1.w;
    r10.x = r1.w * UniformVector_1.x;
    r9.x = ps;
    ps = r1.z + r1.z;
    r9.w = -r1.z + 1.0;
    r9.y = ps;
    ps = UniformScalar_2.x;
    r10.y = UniformScalar_13.x * 0.05;
    ps = UniformVector_5.y * ps;
    r6.w = UniformVector_5.y * UniformScalar_5.x;
    r12.y = ps;
    ps = UniformVector_3.x;
    r11 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    ps = UniformScalar_4.x * ps;
    r0.w = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = r5.w - 4e+02;
    r12.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = UniformScalar_1.x * UniformVector_3.x;
    r12.w = ps;
    ps = UniformVector_5.x * r6.y;
    r6.x = dot(r3.zxy, r3.zxy);
    r12.x = ps;
    ps = rsqrt(abs(r6.x));
    r10.w = saturate(r0.z * 0.00022222222);
    r0.z = ps;
    ps = rsqrt(abs(r0.w));
    r6.z = r6.z * UniformVector_5.x;
    r6.y = ps;
    ps = r6.y;
    r8.xy = r12.zw * abs(r8.xy);
    ps = r4.x * ps;
    r13.xyz = r0.zzz * -SpotDirection.xyz;
    r15.x = ps;
    ps = r6.y;
    r0.z = dot(r13.zxy, r3.zxy);
    ps = r4.y * ps;
    r0.z = r0.z - SpotAngles.x;
    r15.y = ps;
    ps = r6.y;
    r10.z = saturate(r0.z * SpotAngles.y);
    ps = r4.z * ps;
    r3.xy = r10.yz * r10.wz;
    r15.z = ps;
    ps = r6.z;
    r12.zw = r15.xy * r3.xx;
    ps = r1.x + ps;
    r12 = r12.zwxy + r1.wzxy;
    r0.z = ps;
    ps = r12.x;
    r9.z = -r12.y + 1.0;
    r6.y = ps;
    ps = UniformVector_1.x * r6.y;
    r10.yz = r9.wz * UniformVector_1.yy;
    r10.w = ps;
    ps = r6.w;
    r4 = r10.wzxy - 0.5;
    ps = r1.y + ps;
    r23 = float4((r10.wzxy >= 0.5));
    r0.w = ps;
    ps = r12.x + r12.x;
    r4 = r4 - r10.wzxy;
    r6.y = ps;
    r4 = r4 * r23 + r10.wzxy;
    ps = r12.y + r12.y;
    r13 = r4 + r4;
    r6.z = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r10 = tex2D(Texture2D_9, r1.xy);
    r14.y = tex2D(ShadowTexture, r0.xy).x;
    r8 = tex2D(Texture2D_2, r9.xy);
    r18.xyz = tex2D(Texture2D_8, r6.yz).xyz;
    r4 = tex2D(Texture2D_3, r13.zw);
    r24 = tex2D(Texture2D_3, r13.xy);
    r25 = tex2D(Texture2D_6, r12.zw);
    r22.yzw = tex2D(Texture2D_4, r11.zw).xyw;
    r19 = tex2D(Texture2D_7, r0.zw);
    r0.yzw = tex2D(Texture2D_5, r1.xy).xyz;
    r21 = tex2D(Texture2D_4, r11.xy);
    r1.xyz = tex2D(Texture2D_1, r9.xy).xyz;
    r9.xyz = tex2D(Texture2D_0, r6.yz).xyz;
    ps = r7.w;
    r0.x = dot(r2.zxy, r2.zxy);
    ps = 15.0 * ps;
    r11.w = -r7.w + UniformScalar_9.x;
    r13.w = saturate(ps);
    ps = r5.w;
    r11.xyz = UniformVector_4.xyz * 2e+01;
    ps = 0.0001 * ps;
    r1.w = float((UniformScalar_8.x >= 1.0));
    r6.y = saturate(ps);
    r17.xyz = r9.xyz * 2.0 - 1.0;
    ps = r2.z;
    r16.xyz = r1.xyz + r1.xyz;
    r20.zw = r21.xy * 2.0 - 1.0;
    r0.yzw = r0.yzw * 2.0 - 1.0;
    ps = 0.1 + ps;
    r1.xyz = r19.xyz * r19.www;
    r6.z = ps;
    r3.zw = r22.yz * 2.0 - 1.0;
    ps = 5.0 * r6.z;
    r19.xy = r3.zw * 0.5;
    r6.z = saturate(ps);
    r1.xyz = r25.xyz * r25.www + r1.xyz;
    ps = 1.0 - r6.z;
    r0.yzw = r0.yzw * UniformVector_3.xyz;
    r6.z = ps;
    ps = 1.0 - r6.y;
    r11 = r11 * r1;
    r1.x = ps;
    ps = r11.w;
    r6.y = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    ps = r7.w + ps;
    r6.w = r6.y - r11.x;
    r6.y = ps;
    ps = -r6.y;
    r14.z = saturate(r6.w + r11.x);
    r1.yz = -r0.yz * r14.zz + r0.yz;
    ps = r7.z + ps;
    r12.w = dot(r23.zww, float3(1.0, 1.0, 1.0));
    r6.y = ps;
    ps = r6.y;
    r12.z = dot(r23.xyy, float3(1.0, 1.0, 1.0));
    r3.z = ps;
    r6.w = (r12.z == 0.0) ? r24.x : r24.y;
    r6.y = (r12.w == 0.0) ? r4.x : r4.y;
    ps = UniformScalar_10.x;
    r23 = r12.zwwz + float4(-3.0, -2.0, -3.0, -2.0);
    r3.w = ps;
    r6.y = (r23.y == 0.0) ? r4.z : r6.y;
    r6.w = (r23.w == 0.0) ? r24.z : r6.w;
    r20.x = (r23.x == 0.0) ? r24.w : r6.w;
    r7.x = (r23.z == 0.0) ? r4.w : r6.y;
    ps = max(r3.z, r3.w);
    r6.w = max(r7.x, 0.0);
    r6.y = ps;
    ps = 1.0 / UniformScalar_11.x;
    r6.yw = min(r6.yw, float2(1.0, 0.3));
    r7.y = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r7.y = saturate(r6.y * r7.y);
    r13.y = ps;
    ps = 3.3333333 * r6.w;
    r7.xy = -r7.xy + 1.0;
    r20.y = ps;
    ps = rsqrt(abs(r0.x));
    r6.yw = -r20.xy + 1.0;
    r0.x = ps;
    ps = r13.w;
    r4.xyz = r0.xxx * r2.xyz;
    ps = r6.w * ps;
    r22.x = r7.y * r7.w;
    r19.z = ps;
    r7.z = dot(r13.ww, r6.yy) + r20.x;
    ps = r7.z;
    r6.yw = r22.wx * r21.wz;
    ps = r20.x + ps;
    r19.xyz = r20.zyw + r19.xzy;
    r16.w = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2 = r16 + float4(-1.0, -1.0, -1.0, 0.25);
    r13.z = ps;
    ps = 2.5 * r7.x;
    r0.x = float((r6.w >= 0.05));
    r7.w = ps;
    ps = (-1.0) - -r6.y;
    r6.z = saturate(r2.w - r6.y);
    r19.w = ps;
    r16.xy = r19.xy * r19.yz + r1.yz;
    r7.z = r19.w * r19.y + 1.0;
    ps = r0.w;
    r2.xzw = r2.zxy - r17.zxy;
    r6.y = ps;
    ps = 1.0 - r6.y;
    r1.yzw = r6.zzz * r18.xzy;
    r14.x = ps;
    ps = 1.0 - r0.x;
    r2.y = -r1.z + r8.z;
    r14.w = ps;
    r6.y = (UniformScalar_9.x > 0.0) ? r14.w : 1.0;
    r4.w = (UniformScalar_9.x >= 0.0) ? r6.y : r14.w;
    ps = r7.z * r7.x;
    r3.xz = r14.xy * r14.zy;
    r18.z = ps;
    ps = r7.w * r7.z;
    r16.z = r0.w + r3.x;
    r18.w = ps;
    ps = 1.0 / r5.w;
    r2 = r2.zwxy * r8.wwww;
    r13.x = ps;
    ps = r2.z;
    r13.yzw = -r13.yzw + 1.0;
    r6.z = ps;
    ps = 1.0 - r6.x;
    r18.xy = r5.xy * ScreenPositionScaleBias.xy;
    r3.w = saturate(ps);
    ps = (-2.0) + r6.z;
    r0 = r18.xzyw * r13.xwxw;
    r5.w = ps;
    ps = r0.w;
    r5.xyz = r17.xyz + r2.xyz;
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r6.yzw = -r5.xyz + r16.xyz;
    r7.z = saturate(ps);
    r6.xyz = r6.yzw * r7.zzz + r5.xyw;
    r6.w = r9.z * 2.0 + r6.z;
    r6.xyz = r6.wxy * r1.xxx;
    ps = 1.0 + r6.x;
    r9.xy = -r1.yw + r8.xy;
    r6.w = ps;
    r6.xyz = (r1.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r1.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 - r14.z;
    r6.x = dot(r6.wyz, r6.wyz);
    r1.x = ps;
    ps = rsqrt(abs(r6.x));
    r12.z = r4.w * r10.w;
    r6.x = ps;
    r5.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r5.zxy, r15.zxy);
    r6.xyz = r5.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r15.xyz;
    r6.z = saturate(dot(r4.zxy, r6.zxy));
    ps = log2(r6.z);
    r6.xy = r0.xz + ScreenPositionScaleBias.wz;
    r12.w = ps;
    r7.xyw = r12.wyx * float3(15.0, 0.875, 0.875);
    r12.xy = r7.wy * r13.yz;
    r0.xzw = r12.zxy + float3(-0.5, 0.125, 0.125);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.xxxx)) clip(-1.0);
    r12.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r6.yzw = -ModShadowColor.xyz + 1.0;
    r13.xyz = r10.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = log2(r3.w);
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    r2.xyz = r13.xyz * r1.xxx;
    r9.xy = r9.xy * r8.ww + r1.yw;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r1.xyw = r3.zzz * r12.xzy;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r9.z = r1.z + r2.w;
    r7.w = ps;
    ps = r1.x;
    r6.x = float((r0.y >= 0.9));
    ps = r7.w * ps;
    r2.xyz = r2.xyz * r7.zzz;
    r0.x = ps;
    r10.xyz = r11.xyz * r6.xxx + r10.xyz;
    ps = r1.y;
    r10.xyz = r10.xyz - r9.xyz;
    r9.xyz = r10.xyz * r7.zzz + r9.xyz;
    ps = r7.w * ps;
    r1.xyz = r9.xyz * r8.xyz;
    r0.y = ps;
    ps = pow(2.0, r7.x);
    r6.x = saturate(dot(r5.zyx, r4.zyx));
    r7.x = ps;
    ps = r1.w;
    r7.xyz = r2.xyz * r7.xxx;
    r7.xy = r1.xy * r6.xx + r7.xy;
    r7.z = r1.z * r6.x + r7.z;
    ps = r7.w * ps;
    r6.x = r0.z * r0.w;
    r0.z = ps;
    r6.xyz = r6.xxx * r6.yzw + ModShadowColor.xyz;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r7.xzy * r3.yyy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
