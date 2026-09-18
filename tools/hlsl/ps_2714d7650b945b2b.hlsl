// ps_2714d7650b945b2b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 438 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006D8 10041900 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c23); // float4
float4 LightMapScale : register(c24); // float3
float4 LowerSkyColor : register(c22); // float3
float4 ModShadowAccumResolution : register(c27); // float2
float4 ModShadowColor : register(c25); // float3
float4 ModShadowGroupColor : register(c26); // float3
float4 OpacityOverride : register(c20); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_14 : register(c19); // float
float4 UniformScalar_3 : register(c14); // float
float4 UniformScalar_4 : register(c15); // float
float4 UniformScalar_5 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_10 : register(c9); // float4
float4 UniformVector_11 : register(c10); // float4
float4 UniformVector_12 : register(c11); // float4
float4 UniformVector_13 : register(c12); // float4
float4 UniformVector_14 : register(c13); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_8 : register(c8); // float4
float4 UpperSkyColor : register(c21); // float3
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
    float4 r25 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r16 = tex2D(Texture2D_9, r1.xy);
    r7.yz = saturate(UniformVector_12.xy);
    ps = UniformVector_1.x + UniformVector_1.x;
    r9.y = UniformScalar_4.x * UniformScalar_5.x;
    r7.x = ps;
    ps = r3.w;
    r6.x = dot(r2.zxy, r2.zxy);
    ps = (-2e+02) + ps;
    r7.w = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.y = UniformScalar_3.x * UniformVector_4.x;
    r6.z = ps;
    ps = rsqrt(abs(r7.w));
    r6.w = r16.w - 0.5;
    r7.w = ps;
    ps = rsqrt(abs(r6.x));
    r11.xyz = r7.www * r4.xyz;
    r6.x = ps;
    ps = r1.w;
    r10.xyz = r6.xxx * r2.xyz;
    ps = UniformVector_1.x * ps;
    r0.z = r10.z + 0.1;
    r4.x = ps;
    ps = r1.z;
    r13.zw = saturate(r0.zw * float2(5.0, 0.00022222222));
    ps = UniformVector_1.y * ps;
    r6.x = r13.w * (-0.1);
    r4.y = ps;
    ps = UniformScalar_5.x * r6.y;
    r9.zw = r11.xy * r6.xx;
    r9.x = ps;
    ps = UniformVector_2.x * r6.z;
    r6.xy = floor(r9.xy);
    r6.z = ps;
    r6.xy = r6.xy * UniformVector_11.xy - r9.xy;
    ps = 1.0 / UniformVector_1.y;
    r4.zw = r6.xy * r7.yz;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4 = r9.zwxy + r4;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.w = r6.z * r4.x;
    r6.z = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r0.zw = r1.wz * UniformVector_14.xy;
    r7.y = ps;
    r7.zw = r7.xy * r1.wz;
    ps = r3.w;
    r9.xy = r6.yz * abs(r8.xy);
    ps = 0.0001 * ps;
    r13.x = r4.y * r6.x;
    r13.y = saturate(ps);
    r6.xy = r1.yx * UniformVector_13.yx + r4.wz;
    ps = UniformVector_8.x * r6.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r6.z = ps;
    ps = UniformVector_8.y * r6.x;
    r2.xyz = -r13.xyz + 1.0;
    r6.w = ps;
    ps = 1.0 - r1.z;
    r6.yz = frac(r6.zw);
    r2.w = ps;
    ps = 1.0 / UniformVector_10.x;
    r6.xw = float2((UniformVector_10.xy >= r6.yz));
    r23.x = ps;
    ps = r6.x * r6.w;
    r23.zw = float2((UniformVector_10.yx > r6.zy));
    r6.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r12.yz = r2.wx * UniformVector_2.yy;
    r23.y = ps;
    r6.xyw = r6.yzx * r23.xyz;
    ps = UniformVector_2.x * r1.w;
    r18.xyz = UniformVector_5.xyz * 2e+01;
    r12.x = ps;
    r8 = r12 - 0.5;
    r24 = float4((r12 >= 0.5));
    ps = r1.w + r1.w;
    r8 = r8 - r12;
    r7.x = ps;
    r8 = r8.xywz * r24.xywz + r12.xywz;
    ps = r1.z + r1.z;
    r8 = r8 + r8;
    r7.y = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r9.xy).xy;
    r14.xyz = tex2D(Texture2D_7, r4.xy).xyz;
    r21 = tex2D(Texture2D_3, r8.zw).xzwy;
    r22 = tex2D(Texture2D_3, r8.xy);
    r20 = tex2D(Texture2D_2, r7.zw);
    r19.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r17.xyz = tex2D(Texture2D_8, r0.zw).xyz;
    r4.xyw = tex2D(Texture2D_0, r4.xy).xyz;
    r8.xyz = tex2D(Texture2D_1, r7.zw).xyz;
    r25 = tex2D(Texture2D_6, r6.xy);
    r6.xyz = tex2D(LightMapTexture, r0.xy).zxy;
    r7.xyz = tex2D(Texture2D_4, r7.xy).wyx;
    r7.w = float((UniformScalar_12.x >= 1.0));
    r0.w = dot(r5.zxy, r5.zxy);
    r1.yzw = -UniformVector_0.xyz + 1.0;
    ps = OpacityOverride.x;
    r0.x = float((UniformScalar_12.x > 1.0));
    r9.w = saturate(ps);
    ps = r25.x * r25.w;
    r13.yzw = r1.yzw * AmbientColorAndSkyFactor.xyz;
    r9.x = ps;
    r15.xyz = r8.zxy * 2.0 - 1.0;
    r8.xyz = r4.wxy * 2.0 - 1.0;
    r17.xyz = (-abs(r0.xxx) >= 0.0) ? r17.xyz : 1.0;
    r19.xyz = r19.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r0.xyz = r16.xyz * UniformScalar_13.xxx;
    r1.x = ps;
    ps = r25.y * r25.w;
    r19.yzw = r19.xzy * UniformVector_4.zyx;
    r9.y = ps;
    r17.xyz = (-abs(r7.www) >= 0.0) ? 1.0 : r17.xyz;
    ps = r25.z * r25.w;
    r15.yzw = r15.xyz - r8.xyz;
    r9.z = ps;
    r15.x = r15.y * r20.w - 2.0;
    r15.yzw = r15.yzw * r20.www + r8.xyz;
    r8.yzw = r0.xyz * r17.xyz + UniformScalar_14.xxx;
    ps = r6.w;
    r0.y = dot(r24.wzz, float3(1.0, 1.0, 1.0));
    ps = r23.w * ps;
    r0.x = dot(r24.xyy, float3(1.0, 1.0, 1.0));
    r6.w = ps;
    r7.w = (r0.x == 0.0) ? r22.x : r22.y;
    r4.z = (r0.y == 0.0) ? r21.x : r21.w;
    ps = (-1.0) + r7.x;
    r9.xyz = r9.xyz * r6.www;
    r21.x = ps;
    ps = r7.z + r7.z;
    r18.xyz = r18.xyz * r9.xyz;
    r7.x = ps;
    ps = r7.y + r7.y;
    r0 = r0.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r7.y = ps;
    ps = LightMapScale.x * r6.y;
    r6.w = dot(r18.zxy, float3(0.11, 0.3, 0.59));
    r8.x = ps;
    r6.y = (r0.z == 0.0) ? r21.y : r4.z;
    r7.z = (r0.y == 0.0) ? r22.z : r7.w;
    r19.x = (r0.x == 0.0) ? r22.w : r7.z;
    r7.z = (r0.w == 0.0) ? r21.z : r6.y;
    ps = ModShadowGroupColor.x * r2.z;
    r6.y = r6.w - r18.x;
    r9.y = ps;
    ps = ModShadowGroupColor.y * r2.z;
    r9.x = saturate(r6.y + r18.x);
    r9.z = ps;
    r12.zw = -r19.wz * r9.xx + r19.wz;
    ps = (-1.0) + r7.x;
    r6.y = max(r19.x, 0.0);
    r21.y = ps;
    ps = (-1.0) + r7.y;
    r6.w = min(r6.y, 0.3);
    r21.z = ps;
    ps = (-0.75) + r7.z;
    r0.xw = -r19.xy + 1.0;
    r21.w = ps;
    r19.z = r0.w * r9.x + r19.y;
    ps = r21.w;
    r9 = -r9.wxyz + 1.0;
    ps = r7.z + ps;
    r8.yzw = r8.yzw * r9.yyy;
    r6.y = saturate(ps);
    ps = 3.3333333 * r6.w;
    r14.xyz = r6.yyy * r14.xyz;
    r6.y = ps;
    ps = 2.5 * r0.x;
    r7.xyz = r6.yyy * r21.xyz;
    r0.z = ps;
    r19.xy = r7.yz * 2.0 + r12.zw;
    ps = 1.0 + r7.x;
    r21.xyz = -r14.xzy + r20.xzy;
    r0.y = ps;
    r14.xyz = r21.xyz * r20.www + r14.xzy;
    ps = r0.y * r0.x;
    r7.x = float((r9.x >= 0.004));
    r6.y = ps;
    ps = r0.z * r0.y;
    r19.xyz = -r15.yzw + r19.zxy;
    r6.w = ps;
    ps = (-0.5) + r6.w;
    r7.y = float((r6.y > 0.9));
    r0.x = saturate(ps);
    ps = LightMapScale.y * r6.z;
    r4.xyz = r8.ywz * r0.xxx;
    r8.y = ps;
    r15.yzw = r19.xyz * r0.xxx + r15.xzw;
    ps = LightMapScale.z * r6.x;
    r0.yzw = r18.xyz * r7.yyy;
    r8.z = ps;
    r7.yzw = r0.yzw * r0.xxx + UniformVector_0.xyz;
    r15.x = r4.w * 2.0 + r15.y;
    r6.xyz = r17.xyz * r16.xyz + r0.yzw;
    ps = r1.x;
    r0.yzw = r6.xyz - r14.xzy;
    ps = r5.x * ps;
    r6.xyw = r15.zwx * r2.yyy;
    r13.x = ps;
    r0.xyz = r0.yzw * r0.xxx + r14.xzy;
    r7.yzw = r13.yzw * r0.xyz + r7.yzw;
    ps = r1.x;
    r6.z = r6.w + 1.0;
    r6.xyz = (r2.yyy > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r2.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r5.y * ps;
    r6.x = dot(r6.wyz, r6.wyz);
    r13.y = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r0.xyz * r1.yzw;
    r6.x = ps;
    ps = r1.x;
    r6.yzw = r6.yzw * r6.xxx;
    ps = r5.z * ps;
    r1.xyz = r8.xzy * r6.www;
    r13.z = ps;
    r12.z = dot(r13.zxy, r6.wyz);
    ps = -ModShadowColor.x;
    r6.x = dot(r6.wyz, r11.zxy);
    ps = 1.0 + ps;
    r6.xzw = r6.yzw * r6.xxx;
    r6.y = ps;
    ps = -ModShadowColor.y;
    r2 = r12.zzxy * float4(-0.5, 0.5, 0.875, 0.875);
    r6.xzw = r6.xzw * 2.0 - r11.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r10.zxy, r6.wxz));
    r6.z = ps;
    r2.zw = r2.zw * r9.zw + 0.125;
    ps = -ModShadowColor.z;
    r2.xy = r2.xy + 0.5;
    ps = 1.0 + ps;
    r2.xy = abs(r2.xy) * abs(r2.xy);
    r6.w = ps;
    ps = log2(r6.x);
    r0.w = r2.z * r2.w;
    r6.x = ps;
    r6.yzw = r0.www * r6.yzw + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r5.xyz = r0.xzy * r2.yyy;
    r6.x = ps;
    r7.yzw = r5.xyz * UpperSkyColor.xzy + r7.ywz;
    ps = pow(2.0, r6.x);
    r5.xyz = r0.xzy * r2.xxx;
    r6.x = ps;
    r2.xyz = r8.xzy * r6.xxx;
    r7.yzw = r5.xzy * LowerSkyColor.xyz + r7.ywz;
    r7.yzw = r2.xyz * r4.xyz + r7.ywz;
    r7.yzw = r1.xzy * r0.xyz + r7.ywz;
    ps = -r3.w;
    r6.xyz = r7.yzw * r6.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.x + r3.w;
    r6.xyz = r0.xyz * r7.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
