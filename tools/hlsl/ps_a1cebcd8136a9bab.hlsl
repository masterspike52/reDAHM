// ps_a1cebcd8136a9bab.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 381 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005F4 10041800 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 LightMapScale : register(c17); // float3
float4 LowerSkyColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 OpacityOverride : register(c13); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
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
float4 UpperSkyColor : register(c14); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D LightMapTexture : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = r3.w - 4e+02;
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r9.xy = r6.zw * abs(r8.xy);
    r6.w = ps;
    ps = -r1.z;
    r0.zw = r1.wz * 6.0;
    ps = 1.0 + ps;
    r8.xy = r1.wz * UniformVector_6.xy;
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r12.xy = r1.wz * UniformVector_1.xy;
    r7.y = ps;
    ps = 0.00022222222 * r6.y;
    r6.z = dot(r2.zxy, r2.zxy);
    r6.x = saturate(ps);
    ps = (-0.025) * r6.x;
    r10.xyz = r6.www * r4.xyz;
    r6.x = ps;
    ps = rsqrt(abs(r6.z));
    r7.zw = r10.xy * r6.xx;
    r6.x = ps;
    ps = UniformVector_2.x * r1.w;
    r23.xyz = UniformVector_5.xzy * 2e+01;
    r7.x = ps;
    ps = r7.x;
    r11.xyz = r6.xxx * r2.xyz;
    r6.y = ps;
    ps = (-0.5) + r6.y;
    r6.xz = float2((r7.xy >= 0.5));
    r6.y = ps;
    ps = (-0.5) + r7.y;
    r11.w = dot(r6.xzz, float3(1.0, 1.0, 1.0));
    r6.w = ps;
    r6.yw = r6.yw - r7.xy;
    ps = r3.w;
    r12.zw = r6.yw * r6.xz;
    ps = 0.0001 * ps;
    r2.xyz = r11.zww + float3(0.1, -3.0, -2.0);
    r4.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r6 = r7.zwxy + r12;
    r7.x = ps;
    ps = 5.0 * r2.x;
    r4.z = r6.y * r7.x;
    r4.y = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r12.xzw = -r4.zxy + 1.0;
    r12.y = ps;
    ps = r6.z + r6.z;
    r7.yz = r12.xy * UniformVector_2.yx;
    r8.z = ps;
    ps = r6.w + r6.w;
    r7.x = r7.z * r6.x;
    r8.w = ps;
    r4.xyz = tex2D(Texture2D_5, r6.xy).xyz;
    r13.yw = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r21 = tex2D(Texture2D_1, r8.zw);
    r22 = tex2D(Texture2D_4, r1.xy);
    r24.xyz = tex2D(Texture2D_7, r8.xy).xyz;
    r17.xyz = tex2D(Texture2D_2, r0.zw).xyw;
    r18 = tex2D(Texture2D_1, r7.xy);
    r15.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    r19.yzw = tex2D(Texture2D_3, r1.xy).xyz;
    r7.yzw = tex2D(Texture2D_6, r1.xy).xyz;
    r1.xyz = tex2D(Texture2D_0, r6.xy).zxy;
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    ps = -ModShadowColor.x;
    r7.x = float((UniformScalar_4.x >= 1.0));
    ps = 1.0 + ps;
    r1.w = dot(r5.zxy, r5.zxy);
    r16.x = ps;
    ps = trunc(UniformScalar_1.x);
    r9.yzw = -UniformVector_0.xyz + 1.0;
    r19.x = ps;
    ps = OpacityOverride.x;
    r0.x = float((UniformScalar_4.x > 1.0));
    r6.w = saturate(ps);
    r14.xyz = r1.xyz * 2.0 - 1.0;
    ps = UniformScalar_5.x * r7.z;
    r8.xyz = r9.yzw * AmbientColorAndSkyFactor.xyz;
    r16.y = ps;
    ps = UniformScalar_5.x * r7.w;
    r20.xyz = r19.wyz + r19.wyz;
    r16.z = ps;
    r13.xz = r15.xy * 2.0 - 1.0;
    r2.w = (r19.x == 0.0) ? r18.x : r18.y;
    ps = 1.0 - r6.w;
    r19.yz = r17.xy + r17.xy;
    r0.w = ps;
    r0.xyz = (-abs(r0.xxx) >= 0.0) ? r24.xyz : 1.0;
    ps = rsqrt(abs(r1.w));
    r22.xyz = r22.xyz * r22.www;
    r1.w = ps;
    ps = r17.z;
    r15.xyz = r23.xzy * r22.xyz;
    r0.xyz = (-abs(r7.xxx) >= 0.0) ? 1.0 : r0.zxy;
    r17.xyz = r0.yxz * r7.ywz + r15.xzy;
    ps = r15.w * ps;
    r6.w = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r7.x = ps;
    ps = UniformScalar_5.x * r0.y;
    r22 = r19.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r4.w = ps;
    ps = (-1.0) - -r7.x;
    r7.y = r4.w * r7.y;
    r19.x = ps;
    r2.w = (r22.y == 0.0) ? r18.z : r2.w;
    ps = r6.w;
    r0.w = float((r0.w >= 0.004));
    ps = -r15.x + ps;
    r1.yz = r22.zw * 0.5;
    r6.w = ps;
    ps = r13.x;
    r7.zw = r16.yz * r0.zx;
    ps = r1.y + ps;
    r19.w = r13.z + r1.z;
    r4.w = ps;
    r20.w = (r22.x == 0.0) ? r18.w : r2.w;
    ps = r6.w;
    r0.xyz = r7.ywz + UniformScalar_6.xxx;
    r6.w = (r11.w == 0.0) ? r21.x : r21.y;
    ps = r15.x + ps;
    r22 = r20 + float4(-1.0, -1.0, -1.0, 0.25);
    r18.x = saturate(ps);
    ps = r22.w;
    r18.yzw = r22.xzy * UniformVector_4.zyx;
    r1.yz = -r18.wz * r18.xx + r18.wz;
    r6.w = (r2.z == 0.0) ? r21.z : r6.w;
    r6.w = (r2.y == 0.0) ? r21.w : r6.w;
    ps = r20.w + ps;
    r7.yz = -r18.yx + 1.0;
    r7.w = ps;
    r13.z = r7.y * r18.x + r18.y;
    ps = r7.w;
    r7.y = max(r6.w, 0.0);
    ps = -r7.x + ps;
    r0.xyz = r0.xzy * r7.zzz;
    r18.x = saturate(ps);
    ps = 1.0 - r6.w;
    r13.x = min(r7.y, 0.3);
    r7.x = ps;
    r19.yz = -r12.ww * ModShadowGroupColor.xy + 1.0;
    ps = 2.5 * r7.x;
    r18.yzw = r13.xyw * float3(3.3333333, 0.875, 0.875);
    r6.w = ps;
    r13.y = r18.y * r19.w + r1.z;
    r7.yzw = r18.yzw * r19.xyz + float3(1.0, 0.125, 0.125);
    r2.w = saturate(r6.w * r7.y - 0.5);
    ps = -ModShadowColor.y;
    r4 = r18.yxxx * r4.wxyz;
    ps = 1.0 + ps;
    r7.xw = r7.zy * r7.wx;
    r16.y = ps;
    ps = -ModShadowColor.z;
    r2.xyz = r0.xzy * r2.www;
    ps = 1.0 + ps;
    r0.xyz = r17.xzy - r4.yzw;
    r16.z = ps;
    r7.xyz = r7.xxx * r16.xyz + ModShadowColor.xyz;
    r0.xyz = r0.xyz * r2.www + r4.yzw;
    ps = r1.y;
    r6.w = float((r7.w > 0.9));
    ps = r4.x + ps;
    r4.yzw = r15.xyz * r6.www;
    r13.x = ps;
    ps = LightMapScale.x * r6.y;
    r13.xyz = -r14.xyz + r13.zxy;
    r4.x = ps;
    r1.yz = r13.yz * r2.ww + r14.yz;
    r6.w = r13.x * r2.w - 2.0;
    r4.yzw = r4.yzw * r2.www + UniformVector_0.xyz;
    r8.xyz = r8.xzy * r0.xzy + r4.ywz;
    r1.x = r1.x * 2.0 + r6.w;
    ps = LightMapScale.y * r6.z;
    r13.xyw = r1.yzx * r12.zzz;
    r4.y = ps;
    ps = r1.w;
    r13.z = r13.w + 1.0;
    r1.xyz = (r12.zzz > 0.0) ? r13.xyz : float3(0.0, 0.0, 1.0);
    r1.xyz = (r12.zzz >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    ps = r5.x * ps;
    r6.w = dot(r1.zxy, r1.zxy);
    r9.x = ps;
    ps = rsqrt(abs(r6.w));
    r0.xyz = r0.xzy * r9.ywz;
    r6.w = ps;
    ps = r1.w;
    r1.xyz = r1.xyz * r6.www;
    ps = r5.y * ps;
    r6.w = dot(r1.zxy, r10.zxy);
    r9.y = ps;
    ps = r1.w;
    r12.xyz = r1.xyz * r6.www;
    r10.xyz = r12.xyz * 2.0 - r10.xyz;
    ps = r5.z * ps;
    r6.w = saturate(dot(r11.zxy, r10.zxy));
    r9.z = ps;
    ps = log2(r6.w);
    r4.z = dot(r9.zxy, r1.zxy);
    r4.w = ps;
    ps = LightMapScale.z * r6.x;
    r1.xyw = r4.zzw * float3(-0.5, 0.5, 15.0);
    r4.z = ps;
    ps = pow(2.0, r1.w);
    r6.xy = r1.yx + 0.5;
    r6.z = ps;
    ps = abs(r6.y) * abs(r6.y);
    r1.xyz = r4.xzy * r1.zzz;
    r6.y = ps;
    ps = abs(r6.x) * abs(r6.x);
    r4.xyz = r4.xzy * r6.zzz;
    r6.x = ps;
    r5.xyz = r0.xzy * r6.yyy;
    r6.xyz = r0.xzy * r6.xxx;
    r6.xyz = r6.xyz * UpperSkyColor.xyz + r8.xzy;
    r6.xyz = r5.xzy * LowerSkyColor.xzy + r6.xzy;
    r6.xyz = r4.xzy * r2.xzy + r6.xzy;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xzy * r7.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r0.w + r3.w;
    r6.xyz = r7.xyz * r0.www + r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
