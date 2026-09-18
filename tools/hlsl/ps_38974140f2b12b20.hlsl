// ps_38974140f2b12b20.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 459 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000072C 10041800 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_13 : register(c14); // float
float4 UniformScalar_14 : register(c15); // float
float4 UniformScalar_16 : register(c16); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
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
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = -r7.w;
    r6.x = UniformScalar_16.x * 0.05;
    ps = UniformScalar_12.x + ps;
    r6.z = dot(r4.zxy, r4.zxy);
    r11.w = ps;
    ps = rsqrt(abs(r6.z));
    r6.y = dot(r2.zxy, r2.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r11.xyz = r6.zzz * r4.xyz;
    r6.y = ps;
    ps = r3.w;
    r10.xyz = r6.yyy * r2.xyz;
    ps = (-4e+02) + ps;
    r6.y = r10.z + 0.1;
    r6.z = ps;
    ps = r1.w;
    r15.zw = saturate(r6.yz * float2(5.0, 0.00022222222));
    ps = 18.0 * ps;
    r6.x = r6.x * r15.w;
    r2.x = ps;
    r9.yz = r11.xy * r6.xx + r1.wz;
    ps = 1.0 - r1.z;
    r23.xyz = UniformVector_4.xzy * 2e+01;
    r9.w = ps;
    ps = r1.z;
    r9.x = -r9.z + 1.0;
    ps = 18.0 * ps;
    r12.yzw = r9.wxy * UniformVector_1.yyx;
    r2.y = ps;
    ps = UniformVector_1.x * r1.w;
    r24.xyz = UniformVector_5.xzy * 2e+01;
    r12.x = ps;
    ps = r1.w;
    r4 = r12.wzxy - 0.5;
    ps = 3.0 * ps;
    r6 = float4((r12.wxyz >= 0.5));
    r2.z = ps;
    ps = r1.z;
    r4 = r4 - r12.wzxy;
    r4 = r4.zwxy * r6.yzxw + r12.xywz;
    ps = 3.0 * ps;
    r4 = r4.xywz + r4.xywz;
    r2.w = ps;
    r14 = tex2D(Texture2D_9, r1.xy);
    r19 = tex2D(Texture2D_4, r2.zw);
    r16.xyz = tex2D(Texture2D_4, r2.xy).xyw;
    r2 = tex2D(Texture2D_3, r4.xy);
    r13.xyz = tex2D(Texture2D_5, r1.xy).zxy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15.y = saturate(r3.w * 0.0001);
    r12.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = float((UniformScalar_11.x >= 1.0));
    r12.y = ps;
    r0.z = r11.w * r0.z + r7.w;
    ps = -r0.z;
    r8.xy = r12.xy * abs(r8.xy);
    ps = r7.z + ps;
    r21.z = dot(r6.xww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r6.x;
    r21.y = dot(r6.yzz, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r6.y = (r21.y == 0.0) ? r2.x : r2.y;
    ps = UniformScalar_13.x;
    r12 = r21.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r6.w = ps;
    r6.y = (r12.y == 0.0) ? r2.z : r6.y;
    r6.z = (r12.x == 0.0) ? r2.w : r6.y;
    ps = max(r6.x, r6.w);
    r6.y = max(r6.z, 0.0);
    r6.x = ps;
    ps = 1.0 / UniformScalar_14.x;
    r6.xw = min(r6.xy, float2(1.0, 0.3));
    r6.y = ps;
    r6.y = saturate(r6.x * r6.y);
    r0.zw = -r6.zy + 1.0;
    ps = r1.w + r1.w;
    r16.w = r0.w * r7.w;
    r2.x = ps;
    ps = r1.z + r1.z;
    r7.xy = r16.zw * r19.wz;
    r2.y = ps;
    ps = r13.x + r13.x;
    r15.x = float((r7.y >= 0.05));
    r13.x = ps;
    ps = r13.y + r13.y;
    r6.xyz = -r15.xyz + 1.0;
    r13.y = ps;
    r2.z = (UniformScalar_12.x > 0.0) ? r6.x : 1.0;
    r2.z = (UniformScalar_12.x >= 0.0) ? r2.z : r6.x;
    ps = r13.z + r13.z;
    r13.w = r2.z * r14.w;
    r13.z = ps;
    ps = r9.y + r9.y;
    r20 = r13 + float4(-1.0, -1.0, -1.0, -0.5);
    r2.z = ps;
    ps = r9.z + r9.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r20.wwww)) clip(-1.0);
    r2.w = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r18.xyz = tex2D(Texture2D_8, r2.zw).xyz;
    r8 = tex2D(Texture2D_3, r4.wz);
    r4.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r17 = tex2D(Texture2D_2, r2.xy);
    r13 = tex2D(Texture2D_7, r1.xy);
    r9 = tex2D(Texture2D_6, r1.xy).xzyw;
    r1.xyw = tex2D(Texture2D_0, r2.zw).xyz;
    r15.xyz = tex2D(Texture2D_1, r2.xy).xyz;
    r0.x = dot(r5.zxy, r5.zxy);
    r2.xyz = r14.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r22.zw = r19.xy * 2.0 - 1.0;
    r19.xyz = r15.zxy * 2.0 - 1.0;
    r15.yzw = r1.wxy * 2.0 - 1.0;
    ps = r9.x * r9.w;
    r0.y = float((UniformScalar_8.x >= UniformScalar_1.x));
    r9.x = ps;
    ps = r9.y * r9.w;
    r13.xyz = r13.xzy * r13.www;
    r9.y = ps;
    ps = r9.z * r9.w;
    r13.xyz = r24.xyz * r13.xyz;
    r9.z = ps;
    r9.xyz = r23.xyz * r9.xyz;
    r19.xyz = r19.xyz - r15.yzw;
    r15.x = r19.x * r17.w - 2.0;
    r15.yzw = r19.xyz * r17.www + r15.yzw;
    r19.xyz = (-abs(r0.yyy) >= 0.0) ? r13.xyz : r9.xyz;
    r0.y = dot(r19.yxz, float3(0.11, 0.3, 0.59));
    ps = rsqrt(abs(r0.x));
    r2.w = r0.y - r19.x;
    r0.x = ps;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    ps = OpacityOverride.x;
    r4.xyz = r4.xyz * LightMapScale.xyz;
    r21.x = saturate(ps);
    ps = r7.w;
    r9.xyz = r1.xyz * AmbientColorAndSkyFactor.xyz;
    ps = 15.0 * ps;
    r13.xyz = r0.xxx * r5.xyz;
    r21.w = saturate(ps);
    r7.z = (r21.z == 0.0) ? r8.x : r8.y;
    r7.z = (r12.z == 0.0) ? r8.z : r7.z;
    r22.y = (r12.w == 0.0) ? r8.w : r7.z;
    ps = r16.x + r16.x;
    r22.x = r6.w * 3.3333333;
    r5.y = ps;
    ps = r16.y + r16.y;
    r7.zw = -r22.xy + 1.0;
    r5.z = ps;
    r6.w = dot(r21.ww, r7.ww) + r22.y;
    ps = r21.w;
    r5.x = r6.w + r22.y;
    ps = r7.z * ps;
    r8.xyw = r5.yzx + float3(-1.0, -1.0, 0.25);
    r5.z = ps;
    ps = (-1.0) - -r7.x;
    r5.xy = r8.xy * 0.5;
    r16.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r18.w = saturate(dot(r19.zyx, float3(0.59, 0.11, 0.3)));
    r21.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r16.xyz = r22.zxw + r5.xzy;
    r21.z = ps;
    r0.x = r16.w * r16.y + 1.0;
    r5 = -r21.wxyz + 1.0;
    ps = 2.5 * r0.z;
    r6.w = float((r5.y >= 0.004));
    r0.y = ps;
    ps = r2.w;
    r6.xz = r0.xy * r0.zx;
    ps = r19.x + ps;
    r6.xz = r6.xz * r5.xx;
    r0.y = saturate(ps);
    ps = (-0.5) + r6.z;
    r0.xzw = r20.xzy * UniformVector_3.zyx;
    r2.w = saturate(ps);
    r7.zw = -r0.wz * r18.ww + r0.wz;
    r16.xy = r16.xy * r16.yz + r7.zw;
    ps = r0.y;
    r7.z = float((r6.x >= 0.9));
    r6.x = ps;
    ps = 1.0 - r6.x;
    r19.xzw = r7.zzz * r19.xzy;
    r19.y = ps;
    r8.xyz = r19.xzw * r2.www + UniformVector_0.xyz;
    ps = 1.0 - r0.x;
    r14.xyz = r19.xzw + r14.xyz;
    r19.z = ps;
    ps = r8.w;
    r2.xyz = r2.xyz * r19.yyy;
    ps = -r7.x + ps;
    r2.xyz = r2.xzy * r2.www;
    r19.x = saturate(ps);
    r7 = r19.xxxz * r18;
    ps = r0.x;
    r18.xyz = -r7.xzy + r17.xzy;
    r0.xyz = r18.xyz * r17.www + r7.xzy;
    ps = r7.w + ps;
    r14.xyz = r14.xyz - r0.xzy;
    r16.z = ps;
    r7.xyz = -r15.yzw + r16.zxy;
    r7.yzw = r7.xyz * r2.www + r15.xzw;
    r0.xyz = r14.xyz * r2.www + r0.xzy;
    r8.xyz = r9.xyz * r0.xyz + r8.xyz;
    r7.x = r1.w * 2.0 + r7.y;
    r7.xyz = r7.xzw * r6.yyy;
    ps = 1.0 + r7.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = ps;
    r7.xyz = (r6.yyy > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r6.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r6.x));
    r0.xyz = r0.xyz * r1.xyz;
    r6.x = ps;
    r7.xyz = r7.xyz * r6.xxx;
    r1.xyz = r4.xzy * r7.zzz;
    r12.z = dot(r13.zxy, r7.zxy);
    r6.x = dot(r7.zxy, r11.zxy);
    r6.xyz = r7.xyz * r6.xxx;
    r7 = r12.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r6.xyz = r6.xyz * 2.0 - r11.xyz;
    r6.x = saturate(dot(r10.zxy, r6.zxy));
    r6.yz = r7.xy * r5.zw + 0.125;
    r7.xy = r7.zw + 0.5;
    r5.xy = abs(r7.xy) * abs(r7.xy);
    ps = log2(r6.x);
    r6.y = r6.y * r6.z;
    r6.x = ps;
    r7.xyz = r6.yyy * r9.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r9.xyz = r0.xzy * r5.yyy;
    r7.w = ps;
    r6.xyz = r9.xyz * UpperSkyColor.xzy + r8.xzy;
    ps = pow(2.0, r7.w);
    r5.xyz = r0.xzy * r5.xxx;
    r7.w = ps;
    r4.xyz = r4.xzy * r7.www;
    r6.xyz = r5.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r4.xyz * r2.xyz + r6.xzy;
    r6.xyz = r1.xzy * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
