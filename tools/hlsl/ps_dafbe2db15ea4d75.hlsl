// ps_dafbe2db15ea4d75.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 471 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000075C 10041700 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c22); // float4
float4 LightMapScale : register(c23); // float3
float4 LowerSkyColor : register(c21); // float3
float4 ModShadowAccumResolution : register(c26); // float2
float4 ModShadowColor : register(c24); // float3
float4 ModShadowGroupColor : register(c25); // float3
float4 OpacityOverride : register(c19); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
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
float4 UpperSkyColor : register(c20); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D Texture2D_9 : register(s9);
sampler2D LightMapTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 - r1.z;
    r9.w = ps;
    ps = -r7.w;
    r6.x = UniformScalar_13.x * 0.05;
    ps = UniformScalar_9.x + ps;
    r6.z = dot(r4.zxy, r4.zxy);
    r12.w = ps;
    ps = rsqrt(abs(r6.z));
    r6.y = dot(r2.zxy, r2.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r12.xyz = r6.zzz * r4.xyz;
    r6.y = ps;
    ps = r3.w;
    r11.xyz = r6.yyy * r2.xyz;
    ps = (-4e+02) + ps;
    r6.z = r11.z + 0.1;
    r6.y = ps;
    ps = r1.w;
    r10.xw = saturate(r6.zy * float2(5.0, 0.00022222222));
    ps = 18.0 * ps;
    r6.x = r6.x * r10.w;
    r2.x = ps;
    r9.yz = r12.xy * r6.xx + r1.wz;
    ps = r1.z;
    r9.x = -r9.z + 1.0;
    ps = 18.0 * ps;
    r4.yzw = r9.wxy * UniformVector_1.yyx;
    r2.y = ps;
    ps = OpacityOverride.x;
    r4.x = r1.w * UniformVector_1.x;
    r13.y = saturate(ps);
    ps = r1.w;
    r14 = r4.wzxy - 0.5;
    ps = 3.0 * ps;
    r6 = float4((r4.wxyz >= 0.5));
    r2.z = ps;
    ps = r1.z;
    r14 = r14 - r4.wzxy;
    r4 = r14.zwxy * r6.yzxw + r4.xywz;
    ps = 3.0 * ps;
    r17 = r4.xywz + r4.xywz;
    r2.w = ps;
    r15 = tex2D(Texture2D_9, r1.xy);
    r19 = tex2D(Texture2D_4, r2.zw);
    r14.xyz = tex2D(Texture2D_4, r2.xy).xyw;
    r2 = tex2D(Texture2D_3, r17.xy);
    r18.yzw = tex2D(Texture2D_5, r1.xy).xyz;
    ps = r1.w + r1.w;
    r10.z = saturate(r7.w * 15.0);
    r4.x = ps;
    ps = r1.z + r1.z;
    r16.y = UniformScalar_2.x * UniformVector_5.y;
    r4.y = ps;
    ps = UniformVector_5.y;
    r0.z = float((UniformScalar_8.x >= 1.0));
    ps = UniformScalar_5.x * ps;
    r13.x = UniformScalar_1.x * UniformVector_3.x;
    r16.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r13.z = UniformVector_3.x * UniformScalar_4.x;
    r4.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r16.xz = r13.xz * UniformVector_5.xx;
    r4.w = ps;
    r0.z = r12.w * r0.z + r7.w;
    ps = -r0.z;
    r16 = r16 + r1.xyxy;
    ps = r7.z + ps;
    r13.w = dot(r6.xww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r6.x;
    r13.z = dot(r6.yzz, float3(1.0, 1.0, 1.0));
    r1.x = ps;
    r0.z = (r13.z == 0.0) ? r2.x : r2.y;
    ps = UniformScalar_10.x;
    r6 = r13.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r1.y = ps;
    r0.z = (r6.y == 0.0) ? r2.z : r0.z;
    r18.x = (r6.x == 0.0) ? r2.w : r0.z;
    ps = max(r1.x, r1.y);
    r0.w = max(r18.x, 0.0);
    r0.z = ps;
    ps = 1.0 / UniformScalar_11.x;
    r6.xy = min(r0.zw, float2(1.0, 0.3));
    r0.z = ps;
    ps = r18.w + r18.w;
    r10.y = saturate(r6.x * r0.z);
    r1.x = ps;
    ps = r18.y + r18.y;
    r2.xyw = -r10.xyz + 1.0;
    r1.y = ps;
    ps = r18.z + r18.z;
    r14.w = r2.y * r7.w;
    r1.z = ps;
    ps = r4.z;
    r7.xy = r14.zw * r19.wz;
    ps = abs(r8.x) * ps;
    r13.x = float((r7.y >= 0.05));
    r0.z = ps;
    ps = r4.w;
    r7.zw = -r13.xy + 1.0;
    r0.w = (UniformScalar_9.x > 0.0) ? r7.z : 1.0;
    r0.w = (UniformScalar_9.x >= 0.0) ? r0.w : r7.z;
    ps = abs(r8.y) * ps;
    r1.w = r0.w * r15.w;
    r0.w = ps;
    ps = r9.y + r9.y;
    r20 = r1 + float4(-1.0, -1.0, -1.0, -0.5);
    r1.x = ps;
    ps = r9.z + r9.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r20.wwww)) clip(-1.0);
    r1.y = ps;
    r13.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r18.yzw = tex2D(Texture2D_8, r1.xy).xyz;
    r9.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r8 = tex2D(Texture2D_3, r17.wz);
    r21 = tex2D(Texture2D_2, r4.xy);
    r23 = tex2D(Texture2D_6, r16.xy);
    r0 = tex2D(Texture2D_7, r16.zw);
    r1.xyw = tex2D(Texture2D_0, r1.xy).xyz;
    r16.xyz = tex2D(Texture2D_1, r4.xy).xyz;
    r17.xyz = UniformVector_4.xyz * 2e+01;
    r4.xyz = r15.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r22.zw = r19.xy * 2.0 - 1.0;
    r19.xyz = r16.zxy * 2.0 - 1.0;
    r16.yzw = r1.wxy * 2.0 - 1.0;
    r0.xyz = r0.xyz * r0.www;
    r0.xyz = r23.xyz * r23.www + r0.xyz;
    r19.xyz = r19.xyz - r16.yzw;
    r16.x = r19.x * r21.w - 2.0;
    r16.yzw = r19.xyz * r21.www + r16.yzw;
    r0.xyz = r17.xyz * r0.xyz;
    r0.w = dot(r0.zxy, float3(0.11, 0.3, 0.59));
    r1.z = (r13.w == 0.0) ? r8.x : r8.y;
    r6.z = (r6.z == 0.0) ? r8.z : r1.z;
    r22.y = (r6.w == 0.0) ? r8.w : r6.z;
    ps = r3.w;
    r22.x = r6.y * 3.3333333;
    ps = 0.0001 * ps;
    r6.xy = -r22.yx + 1.0;
    r19.x = saturate(ps);
    ps = r14.x + r14.x;
    r17.z = r10.z * r6.y;
    r6.y = ps;
    ps = r14.y + r14.y;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = ps;
    ps = r0.w;
    r6.w = dot(r5.zxy, r5.zxy);
    ps = -r0.x + ps;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    ps = r0.w;
    r9.xyz = r9.xyz * LightMapScale.xyz;
    ps = r0.x + ps;
    r14.xyz = r1.xyz * AmbientColorAndSkyFactor.xyz;
    r19.w = saturate(ps);
    ps = rsqrt(abs(r6.w));
    r19.yz = r2.xx * ModShadowGroupColor.xy;
    r6.w = ps;
    r6.x = dot(r10.zz, r6.xx) + r22.y;
    ps = r6.x;
    r5.xyz = r6.www * r5.xyz;
    ps = r22.y + ps;
    r10 = -r19.wxyz + 1.0;
    r6.x = ps;
    r6.xyz = r6.yzx + float3(-1.0, -1.0, 0.25);
    ps = 0.5 * r6.x;
    r6.w = saturate(r6.z - r7.x);
    r17.x = ps;
    ps = 0.5 * r6.y;
    r18.yzw = r6.www * r18.yzw;
    r17.y = ps;
    r17.xyz = r22.zxw + r17.xzy;
    ps = (-1.0) - -r7.x;
    r6.xyz = -r18.ywz + r21.xzy;
    r17.w = ps;
    r2.xyz = r6.xyz * r21.www + r18.ywz;
    r6.x = r17.w * r17.y + 1.0;
    r18.yzw = r20.xzy * UniformVector_3.zyx;
    r6.yz = -r18.wz * r19.ww + r18.wz;
    r17.xy = r17.xy * r17.yz + r6.yz;
    r6.yw = -r18.xy + 1.0;
    r17.z = r6.w * r19.w + r18.y;
    ps = 2.5 * r6.y;
    r6.z = ps;
    ps = r6.x * r6.y;
    r4.xyz = r4.xyz * r10.xxx;
    r7.x = ps;
    ps = r6.z * r6.x;
    r17.xyz = -r16.yzw + r17.zxy;
    r7.y = ps;
    r7.xy = r7.yx * r2.ww;
    ps = (-0.5) + r7.x;
    r0.w = saturate(ps);
    r4.xyz = r4.xzy * r0.www;
    r7.xy = float2((r7.yw >= float2(0.9, 0.004)));
    r6.yzw = r17.xyz * r0.www + r16.xzw;
    r6.x = r1.w * 2.0 + r6.y;
    r16.xyz = r0.xyz * r7.xxx;
    r0.xyz = r16.xyz * r0.www + UniformVector_0.xyz;
    r15.xyz = r16.xyz + r15.xyz;
    r6.xyz = r6.xzw * r10.yyy;
    ps = 1.0 + r6.x;
    r15.xyz = r15.xyz - r2.xzy;
    r6.w = ps;
    r2.xyz = r15.xyz * r0.www + r2.xzy;
    r0.xyz = r14.xyz * r2.xyz + r0.xyz;
    r6.xyz = (r10.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r10.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r1.xyz = r2.xyz * r1.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r2.xyz = r9.xzy * r6.www;
    r13.z = dot(r5.zxy, r6.wyz);
    r6.x = dot(r6.wyz, r12.zxy);
    r6.xyz = r6.yzw * r6.xxx;
    r5 = r13.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r6.xyz = r6.xyz * 2.0 - r12.xyz;
    r6.x = saturate(dot(r11.zxy, r6.zxy));
    r6.yz = r5.xy * r10.zw + 0.125;
    r7.zw = r5.zw + 0.5;
    r7.xz = abs(r7.zw) * abs(r7.zw);
    ps = log2(r6.x);
    r6.y = r6.y * r6.z;
    r6.x = ps;
    r6.yzw = r6.yyy * r8.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r5.xyz = r1.xzy * r7.zzz;
    r6.x = ps;
    r0.xyz = r5.xyz * UpperSkyColor.xzy + r0.xzy;
    ps = pow(2.0, r6.x);
    r8.xyz = r1.xzy * r7.xxx;
    r6.x = ps;
    r5.xyz = r9.xzy * r6.xxx;
    r0.xyz = r8.xzy * LowerSkyColor.xyz + r0.xzy;
    r0.xyz = r5.xyz * r4.xyz + r0.xzy;
    r0.xyz = r2.xzy * r1.xyz + r0.xzy;
    ps = -r3.w;
    r6.xyz = r0.xyz * r6.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.y + r3.w;
    r6.xyz = r0.xyz * r7.yyy + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
