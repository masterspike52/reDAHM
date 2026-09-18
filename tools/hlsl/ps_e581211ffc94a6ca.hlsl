// ps_e581211ffc94a6ca.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 411 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000066C 10041800 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c18); // float4
float4 LightMapScale : register(c19); // float3
float4 LowerSkyColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 OpacityOverride : register(c15); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
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
float4 UpperSkyColor : register(c16); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r18 = tex2D(Texture2D_8, r1.xy);
    ps = (-0.5) + r18.w;
    r6.xy = r1.wz * 6.0;
    r6.z = ps;
    ps = UniformVector_2.x * r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r11.x = ps;
    r10 = tex2D(Texture2D_5, r1.xy);
    r12 = tex2D(Texture2D_4, r1.xy).xzyw;
    r6.xzw = tex2D(Texture2D_2, r6.xy).xyw;
    r9.xy = r1.wz * UniformVector_7.xy;
    ps = OpacityOverride.x;
    r24.x = -r1.z + 1.0;
    r9.z = saturate(ps);
    ps = r1.w;
    r13.xyz = UniformVector_5.xzy * 2e+01;
    ps = UniformVector_1.x * ps;
    r7.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    r0.z = ps;
    ps = r1.z;
    r9.w = dot(r4.zxy, r4.zxy);
    ps = UniformVector_1.y * ps;
    r6.y = r3.w - 4e+02;
    r0.w = ps;
    ps = 0.00022222222 * r6.y;
    r14.xyz = UniformVector_6.xzy * 2e+01;
    r11.y = saturate(ps);
    r11.zw = r6.xz * 2.0 - 1.0;
    ps = r12.x * r12.w;
    r6.y = dot(r2.zxy, r2.zxy);
    r12.x = ps;
    ps = rsqrt(abs(r6.y));
    r10.xyz = r10.xzy * r10.www;
    r6.y = ps;
    ps = r12.y * r12.w;
    r7.xyz = r6.yyy * r2.xzy;
    r12.y = ps;
    ps = r12.z * r12.w;
    r10.xyz = r14.xyz * r10.xyz;
    r12.z = ps;
    ps = rsqrt(abs(r9.w));
    r2.xyz = r13.xyz * r12.xyz;
    r6.y = ps;
    r14.xyz = (-abs(r7.www) >= 0.0) ? r10.xyz : r2.xyz;
    ps = 0.1 - -r7.y;
    r10.xyz = r6.yyy * r4.xyz;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r4.xzw = r11.yzw * float3(-0.025, 0.5, 0.5);
    r2.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r7.w = dot(r14.yxz, float3(0.11, 0.3, 0.59));
    r6.y = ps;
    r0.zw = r10.xy * r4.xx + r0.zw;
    ps = r0.w;
    r7.w = r7.w - r14.x;
    ps = r6.y * ps;
    r9.w = saturate(r7.w + r14.x);
    r2.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r24.yw = -r2.yx + 1.0;
    r2.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r2.yz = -r9.zw + 1.0;
    r24.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r11.yzw = r24.xyz * UniformVector_2.yyx;
    r2.w = ps;
    ps = r11.w;
    r9.zw = r2.xw * abs(r8.xy);
    ps = r0.z * ps;
    r8.xyz = r11.zxy - 0.5;
    r2.x = ps;
    ps = (-0.5) - -r2.x;
    r22.xyz = float3((r11.xyz >= 0.5));
    r6.y = ps;
    ps = r6.y;
    r8.yzw = r8.yzx - r11.xyz;
    ps = -r2.x + ps;
    r4.xy = float2((r2.xy >= float2(0.5, 0.004)));
    r6.y = ps;
    r8.x = r6.y * r4.x + r2.x;
    r8.yzw = r8.wyz * r22.zxy + r11.zxy;
    r8 = r8.zwxy + r8.zwxy;
    r11.xyz = tex2D(Texture2D_6, r0.zw).xyz;
    r12.yz = tex2D(ModShadowAccumTexture, r9.zw).xy;
    r23 = tex2D(Texture2D_1, r8.zw);
    r17 = tex2D(Texture2D_1, r8.xy);
    r20.xyz = tex2D(Texture2D_7, r9.xy).xyz;
    r19.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    r1.yzw = tex2D(Texture2D_3, r1.xy).xyz;
    r9.xyw = tex2D(Texture2D_0, r0.zw).xyz;
    r8.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = float((UniformScalar_11.x >= 1.0));
    r7.w = dot(r5.zxy, r5.zxy);
    ps = r3.w;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    ps = 0.0001 * ps;
    r1.x = float((UniformScalar_11.x > 1.0));
    r0.x = saturate(ps);
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r8.xyz = r8.xyz * LightMapScale.xyz;
    r15.x = ps;
    r13.xyz = r9.wxy * 2.0 - 1.0;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r21.xyz = r1.wyz + r1.wyz;
    r15.y = ps;
    r0.yz = r19.xy * 2.0 - 1.0;
    r19.xyz = (-abs(r1.xxx) >= 0.0) ? r20.xyz : 1.0;
    ps = rsqrt(abs(r7.w));
    r6.w = r6.w * r19.w;
    r7.w = ps;
    ps = (-1.0) - -r6.w;
    r1.xyz = r18.xyz * UniformScalar_12.xxx;
    r20.x = ps;
    r19.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r19.xyz;
    r1.yzw = r1.xyz * r19.xyz + UniformScalar_13.xxx;
    ps = r0.y;
    r5.xyz = r7.www * r5.xyz;
    r20.yz = -r24.ww * ModShadowGroupColor.xy + 1.0;
    ps = r4.z + ps;
    r12.x = dot(r22.xyy, float3(1.0, 1.0, 1.0));
    r11.w = ps;
    r7.w = (r12.x == 0.0) ? r17.x : r17.y;
    r12.w = r22.z * 2.0 + r4.x;
    r0.y = (r12.w == 0.0) ? r23.x : r23.y;
    ps = r0.z;
    r22 = r12.xxww + float4(-3.0, -2.0, -2.0, -3.0);
    r7.w = (r22.y == 0.0) ? r17.z : r7.w;
    r0.y = (r22.z == 0.0) ? r23.z : r0.y;
    r21.w = (r22.w == 0.0) ? r23.w : r0.y;
    r7.w = (r22.x == 0.0) ? r17.w : r7.w;
    ps = r4.w + ps;
    r1.x = -r7.w + 1.0;
    r20.w = ps;
    ps = 2.5 * r1.x;
    r0.y = max(r7.w, 0.0);
    r7.w = ps;
    ps = r0.y;
    r14.w = saturate(dot(r14.zyx, float3(0.59, 0.11, 0.3)));
    r0.y = ps;
    ps = 0.3;
    r17 = r21 + float4(-1.0, -1.0, -1.0, 0.25);
    r0.z = ps;
    ps = min(r0.y, r0.z);
    r2.w = r17.w + r21.w;
    r12.x = ps;
    ps = r2.w;
    r0.yzw = r17.xzy * UniformVector_4.zyx;
    r4.xz = -r0.wz * r14.ww + r0.wz;
    ps = -r6.w + ps;
    r12.yzw = r12.xyz * float3(3.3333333, 0.875, 0.875);
    r12.x = saturate(ps);
    r17.y = r12.y * r20.w + r4.z;
    ps = r0.y;
    r2.xyz = r1.yzw * r2.zzz;
    r6.w = ps;
    r1.yzw = r12.yzw * r20.xyz + float3(1.0, 0.125, 0.125);
    r7.w = saturate(r7.w * r1.y - 0.5);
    ps = 1.0 - r6.w;
    r12 = r12.xxxy * r11;
    r11.y = ps;
    ps = 1.0 - r0.x;
    r1.xw = r1.zy * r1.wx;
    r11.z = ps;
    r1.xyz = r1.xxx * r16.xyz + ModShadowColor.xyz;
    ps = r4.x;
    r11.x = float((r1.w > 0.9));
    ps = r12.w + ps;
    r16 = r11.xxxy * r14.xzyw;
    r17.x = ps;
    r14.xyz = r16.xyz * r7.www + UniformVector_0.xyz;
    ps = r0.y;
    r2.xyz = r2.xzy * r7.www;
    r0.xyz = r19.xzy * r18.xzy + r16.xzy;
    ps = r16.w + ps;
    r16.xyz = r0.xyz - r12.xzy;
    r17.z = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r0.xyz = -r13.xyz + r17.zxy;
    r15.z = ps;
    r12.xyz = r16.xyz * r7.www + r12.xzy;
    r9.xyz = r15.xyz * r12.xzy + r14.xyz;
    r0.yz = r0.yz * r7.ww + r13.yz;
    r6.w = r0.x * r7.w - 2.0;
    r0.x = r9.w * 2.0 + r6.w;
    r0.xyz = r0.xyz * r11.zzz;
    ps = 1.0 + r0.x;
    r0.w = ps;
    r0.xyz = (r11.zzz > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r11.xyz = (r11.zzz >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r6.w = dot(r11.zxy, r11.zxy);
    ps = rsqrt(abs(r6.w));
    r0.xyz = r12.xzy * r6.yzx;
    r6.x = ps;
    r6.xyw = r11.xyz * r6.xxx;
    r6.z = dot(r6.wxy, r10.zxy);
    r11.xyz = r6.xyw * r6.zzz;
    r10.xyz = r11.xyz * 2.0 - r10.xyz;
    r6.z = saturate(dot(r7.yxz, r10.zxy));
    ps = log2(r6.z);
    r7.x = dot(r5.zxy, r6.wxy);
    r7.y = ps;
    r6.xyz = r7.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r6.z);
    r6.xy = r6.yx + 0.5;
    r6.z = ps;
    ps = abs(r6.y) * abs(r6.y);
    r7.xyz = r8.xzy * r6.www;
    r6.y = ps;
    ps = abs(r6.x) * abs(r6.x);
    r5.xyz = r8.xzy * r6.zzz;
    r6.x = ps;
    r8.xyz = r0.xzy * r6.yyy;
    r6.xyz = r0.xzy * r6.xxx;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r9.xzy;
    r6.xyz = r8.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r5.xyz * r2.xyz + r6.xzy;
    r6.xyz = r7.xzy * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xzy * r1.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r4.y + r3.w;
    r6.xyz = r7.xyz * r4.yyy + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
