// ps_5679368ff6e35121.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 411 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000066C 10041900 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c20); // float4
float4 LightMapScale : register(c21); // float3
float4 LowerSkyColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 OpacityOverride : register(c17); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
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
float4 UpperSkyColor : register(c18); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D LightMapTexture : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
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
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
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

    r14 = tex2D(Texture2D_8, r1.xy);
    ps = (-0.5) + r14.w;
    r6.xy = r1.wz * 6.0;
    r6.z = ps;
    ps = UniformVector_2.x * r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r12.x = ps;
    r9.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    r13.y = UniformScalar_2.x * UniformVector_6.y;
    ps = UniformVector_6.y;
    r11.xy = r1.wz * UniformVector_7.xy;
    ps = UniformScalar_5.x * ps;
    r24.x = -r1.z + 1.0;
    r13.w = ps;
    ps = OpacityOverride.x;
    r6.z = UniformVector_4.x * UniformScalar_4.x;
    r7.y = saturate(ps);
    ps = UniformScalar_1.x;
    r0.zw = r1.wz * UniformVector_1.xy;
    ps = UniformVector_4.x * ps;
    r7.z = saturate(r3.w * 0.0001);
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = r3.w - 4e+02;
    r7.x = ps;
    ps = 0.00022222222 * r6.w;
    r6.x = dot(r4.zxy, r4.zxy);
    r12.y = saturate(ps);
    r12.zw = r9.xy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.yz = -r7.yz + 1.0;
    r7.y = ps;
    ps = UniformVector_6.x * r6.y;
    r6.w = dot(r2.zxy, r2.zxy);
    r13.x = ps;
    ps = rsqrt(abs(r6.w));
    r8.xy = r7.xy * abs(r8.xy);
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r7.yzw = r6.www * r2.xyz;
    r6.x = ps;
    ps = 0.1 - -r7.w;
    r10.xyz = r6.xxx * r4.xyz;
    r6.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r2.xzw = r12.yzw * float3(-0.025, 0.5, 0.5);
    r6.w = ps;
    r0.zw = r10.xy * r2.xx + r0.zw;
    ps = 5.0 * r6.x;
    r4.x = r0.w * r6.w;
    r4.y = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r24.yw = -r4.xy + 1.0;
    r24.z = ps;
    ps = UniformVector_6.x * r6.z;
    r12.yzw = r24.xyz * UniformVector_2.yyx;
    r13.z = ps;
    ps = r12.w;
    r6 = r13 + r1.xyxy;
    ps = r0.z * ps;
    r4.xyz = r12.zxy - 0.5;
    r3.x = ps;
    ps = (-0.5) - -r3.x;
    r23.xyz = float3((r12.xyz >= 0.5));
    r7.x = ps;
    ps = r7.x;
    r4.yzw = r4.yzx - r12.xyz;
    ps = -r3.x + ps;
    r2.xy = float2((r3.xy >= float2(0.5, 0.004)));
    r7.x = ps;
    r4.x = r7.x * r2.x + r3.x;
    r4.yzw = r4.wyz * r23.zxy + r12.zxy;
    r4 = r4.zwxy + r4.zwxy;
    r12.xyz = tex2D(Texture2D_6, r0.zw).xyz;
    r18.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r22 = tex2D(Texture2D_1, r4.zw);
    r19 = tex2D(Texture2D_1, r4.xy);
    r25 = tex2D(Texture2D_4, r6.xy);
    r8 = tex2D(Texture2D_5, r6.zw);
    r20.xyz = tex2D(Texture2D_7, r11.xy).xyz;
    r4.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    r15.xyw = tex2D(Texture2D_3, r1.xy).xzy;
    r1.xyw = tex2D(Texture2D_0, r0.zw).xyz;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r17.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = dot(r5.zxy, r5.zxy);
    r13.xyz = UniformVector_5.xyz * 2e+01;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r7.x = float((UniformScalar_8.x >= 1.0));
    r6.w = float((UniformScalar_8.x > 1.0));
    r16.xyz = r1.wxy * 2.0 - 1.0;
    ps = r15.y + r15.y;
    r9.xyz = r11.xyz * AmbientColorAndSkyFactor.xyz;
    r21.x = ps;
    r0.yz = r4.xy * 2.0 - 1.0;
    ps = r15.x + r15.x;
    r4.xyz = r14.xyz * UniformScalar_9.xxx;
    r21.y = ps;
    r15.xyz = (-abs(r6.www) >= 0.0) ? r20.xyz : 1.0;
    ps = r15.w + r15.w;
    r6.w = r9.w * r4.w;
    r21.z = ps;
    ps = (-1.0) - -r6.w;
    r8.xyz = r8.xyz * r8.www;
    r20.x = ps;
    r8.xyz = r25.xyz * r25.www + r8.xyz;
    r15.xyz = (-abs(r7.xxx) >= 0.0) ? 1.0 : r15.xyz;
    r4.xyz = r4.xyz * r15.xyz + UniformScalar_10.xxx;
    ps = r0.y;
    r13.xyz = r13.xyz * r8.xyz;
    ps = r2.z + ps;
    r20.w = r0.z + r2.w;
    r12.w = ps;
    ps = rsqrt(abs(r0.x));
    r7.x = dot(r13.zxy, float3(0.11, 0.3, 0.59));
    r0.x = ps;
    ps = r7.x;
    r8.xyz = r0.xxx * r5.xyz;
    r20.yz = -r24.ww * ModShadowGroupColor.xy + 1.0;
    ps = -r13.x + ps;
    r0.x = dot(r23.xyy, float3(1.0, 1.0, 1.0));
    r2.z = ps;
    r7.x = (r0.x == 0.0) ? r19.x : r19.y;
    r0.y = r23.z * 2.0 + r2.x;
    r1.z = (r0.y == 0.0) ? r22.x : r22.y;
    ps = r2.z;
    r0 = r0.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r7.x = (r0.y == 0.0) ? r19.z : r7.x;
    r1.z = (r0.z == 0.0) ? r22.z : r1.z;
    r21.w = (r0.w == 0.0) ? r22.w : r1.z;
    r7.x = (r0.x == 0.0) ? r19.w : r7.x;
    ps = r13.x + ps;
    r0.x = max(r7.x, 0.0);
    r19.x = saturate(ps);
    ps = 1.0 - r7.x;
    r18.x = min(r0.x, 0.3);
    r0.x = ps;
    ps = 2.5 * r0.x;
    r5 = r21 + float4(-1.0, -1.0, -1.0, 0.25);
    r7.x = ps;
    ps = r5.w;
    r19.yzw = r5.xzy * UniformVector_4.zyx;
    r2.xz = -r19.wz * r19.xx + r19.wz;
    ps = r21.w + ps;
    r18.yzw = r18.xyz * float3(3.3333333, 0.875, 0.875);
    r1.z = ps;
    r5.y = r18.y * r20.w + r2.z;
    r0.yzw = r18.yzw * r20.xyz + float3(1.0, 0.125, 0.125);
    ps = r1.z;
    r1.xy = -r19.xy + 1.0;
    r5.z = r1.y * r19.x + r19.y;
    ps = -r6.w + ps;
    r4.xyz = r4.xyz * r1.xxx;
    r18.x = saturate(ps);
    r6.w = saturate(r7.x * r0.y - 0.5);
    r12 = r18.xxxy * r12;
    r0.xy = r0.yz * r0.xw;
    r1.xyz = r0.yyy * r17.xyz + ModShadowColor.xyz;
    ps = r2.x;
    r7.x = float((r0.x > 0.9));
    ps = r12.w + ps;
    r13.xyz = r13.xzy * r7.xxx;
    r5.x = ps;
    r0.xyz = -r16.xyz + r5.zxy;
    r0.yz = r0.yz * r6.ww + r16.yz;
    r5.xyz = r13.xyz * r6.www + UniformVector_0.xzy;
    r13.xyz = r15.xzy * r14.xzy + r13.xyz;
    r7.x = r0.x * r6.w - 2.0;
    r0.x = r1.w * 2.0 + r7.x;
    r13.xyz = r13.xyz - r12.xzy;
    r12.xyz = r13.xyz * r6.www + r12.xzy;
    r9.xyz = r9.xyz * r12.xzy + r5.xzy;
    r0.xyz = r0.xyz * r3.zzz;
    ps = 1.0 + r0.x;
    r4.xyz = r4.xzy * r6.www;
    r0.w = ps;
    r0.xyz = (r3.zzz > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r5.xyz = (r3.zzz >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r6.w = dot(r5.zxy, r5.zxy);
    ps = rsqrt(abs(r6.w));
    r0.xyz = r12.xzy * r11.xyz;
    r6.w = ps;
    r2.xzw = r5.xyz * r6.www;
    r6.w = dot(r2.wxz, r10.zxy);
    ps = LightMapScale.x * r6.y;
    r5.yzw = r2.xzw * r6.www;
    r5.x = ps;
    r5.yzw = r5.yzw * 2.0 - r10.xyz;
    ps = LightMapScale.y * r6.z;
    r6.w = saturate(dot(r7.wyz, r5.wyz));
    r5.y = ps;
    ps = log2(r6.w);
    r7.x = dot(r8.zxy, r2.wxz);
    r7.y = ps;
    ps = LightMapScale.z * r6.x;
    r7.xyz = r7.xxy * float3(-0.5, 0.5, 15.0);
    r5.z = ps;
    ps = pow(2.0, r7.z);
    r6.xy = r7.yx + 0.5;
    r6.z = ps;
    ps = abs(r6.y) * abs(r6.y);
    r7.xyz = r5.xzy * r2.www;
    r6.y = ps;
    ps = abs(r6.x) * abs(r6.x);
    r5.xyz = r5.xzy * r6.zzz;
    r6.x = ps;
    r8.xyz = r0.xzy * r6.yyy;
    r6.xyz = r0.xzy * r6.xxx;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r9.xzy;
    r6.xyz = r8.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r5.xyz * r4.xyz + r6.xzy;
    r6.xyz = r7.xzy * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xzy * r1.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r2.y + r3.w;
    r6.xyz = r7.xyz * r2.yyy + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
