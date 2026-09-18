// ps_6af9af06e988a1f6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 435 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006CC 10041700 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c23); // float4
float4 ConstantLighting : register(c24); // float3
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
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
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
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_9, r0.xy);
    r5.xw = saturate(UniformVector_12.xy);
    ps = UniformVector_1.x + UniformVector_1.x;
    r12.y = UniformScalar_4.x * UniformScalar_5.x;
    r8.y = ps;
    ps = r2.w;
    r6.z = dot(r1.zxy, r1.zxy);
    ps = (-2e+02) + ps;
    r8.z = dot(r3.zxy, r3.zxy);
    r6.w = ps;
    ps = 1.0 / UniformVector_1.x;
    r5.y = UniformScalar_3.x * UniformVector_4.x;
    r5.z = ps;
    ps = rsqrt(abs(r8.z));
    r6.y = r15.w - 0.5;
    r8.z = ps;
    ps = rsqrt(abs(r6.z));
    r10.xyz = r8.zzz * r3.xyz;
    r6.z = ps;
    ps = r0.w;
    r9.xyz = r6.zzz * r1.xyz;
    ps = UniformVector_1.x * ps;
    r6.z = r9.z + 0.1;
    r1.x = ps;
    ps = r0.z;
    r11.zw = saturate(r6.zw * float2(5.0, 0.00022222222));
    ps = UniformVector_1.y * ps;
    r6.z = r11.w * (-0.1);
    r1.y = ps;
    ps = UniformScalar_5.x * r5.y;
    r12.zw = r10.xy * r6.zz;
    r12.x = ps;
    ps = UniformVector_2.x * r5.z;
    r6.zw = floor(r12.xy);
    r5.y = ps;
    r6.zw = r6.zw * UniformVector_11.xy - r12.xy;
    ps = 1.0 / UniformVector_1.y;
    r1.zw = r6.zw * r5.xw;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1 = r12 + r1.zwxy;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.w = r5.y * r1.z;
    r6.w = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r3.xy = r0.wz * UniformVector_14.xy;
    r8.z = ps;
    r5.zw = r8.yz * r0.wz;
    ps = r2.w;
    r3.zw = r6.zw * abs(r7.xy);
    ps = 0.0001 * ps;
    r11.x = r1.w * r5.x;
    r11.y = saturate(ps);
    r5.xy = r0.yx * UniformVector_13.yx + r1.yx;
    ps = UniformVector_8.x * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.yyyy)) clip(-1.0);
    r7.x = ps;
    ps = UniformVector_8.y * r5.x;
    r6.yzw = -r11.xzy + 1.0;
    r7.y = ps;
    ps = 1.0 - r0.z;
    r7.yz = frac(r7.xy);
    r6.x = ps;
    ps = 1.0 / UniformVector_10.x;
    r5.xy = float2((UniformVector_10.xy >= r7.yz));
    r20.x = ps;
    ps = r5.x * r5.y;
    r20.zw = float2((UniformVector_10.yx > r7.zy));
    r7.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r8.yz = r6.xy * UniformVector_2.yy;
    r20.y = ps;
    r16.xyw = r7.yzx * r20.xyz;
    ps = UniformVector_2.x * r0.w;
    r19.xyz = UniformVector_5.xyz * 2e+01;
    r8.x = ps;
    r7 = r8 - 0.5;
    r13 = float4((r8.xzwy >= 0.5));
    ps = r0.w + r0.w;
    r7 = r7 - r8;
    r5.x = ps;
    r7 = r7.xywz * r13.xwzy + r8.xywz;
    ps = r0.z + r0.z;
    r7 = r7 + r7;
    r5.y = ps;
    r1.xy = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r12.xyz = tex2D(Texture2D_7, r1.zw).xyz;
    r8.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r11 = tex2D(Texture2D_3, r7.xy);
    r18 = tex2D(Texture2D_3, r7.zw);
    r21 = tex2D(Texture2D_2, r5.zw);
    r23.xyz = tex2D(Texture2D_8, r3.xy).xyz;
    r7.xyw = tex2D(Texture2D_0, r1.zw).xyz;
    r14.xyz = tex2D(Texture2D_1, r5.zw).xyz;
    r3 = tex2D(Texture2D_6, r16.xy);
    r5.xyz = tex2D(Texture2D_4, r5.xy).wxy;
    r5.w = dot(r4.zxy, r4.zxy);
    r0.w = float((UniformScalar_12.x >= 1.0));
    r17.yz = r5.yz * 2.0 - 1.0;
    ps = r3.x * r3.w;
    r1.z = float((UniformScalar_12.x > 1.0));
    r3.x = ps;
    ps = r3.y * r3.w;
    r0.xyz = r15.xyz * UniformScalar_13.xxx;
    r3.y = ps;
    r22.xyz = r14.zxy * 2.0 - 1.0;
    r14.yzw = r7.wxy * 2.0 - 1.0;
    r23.xyz = (-abs(r1.zzz) >= 0.0) ? r23.xyz : 1.0;
    r16.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r23.xyz;
    ps = r3.z * r3.w;
    r22.xyz = r22.xyz - r14.yzw;
    r3.z = ps;
    r14.x = r22.x * r21.w - 2.0;
    r14.yzw = r22.xyz * r21.www + r14.yzw;
    r0.xyz = r0.xyz * r16.xyz + UniformScalar_14.xxx;
    ps = r16.w;
    r13.x = dot(r13.xww, float3(1.0, 1.0, 1.0));
    ps = r20.w * ps;
    r13.y = dot(r13.zyy, float3(1.0, 1.0, 1.0));
    r0.w = ps;
    r1.z = (r13.y == 0.0) ? r18.x : r18.y;
    r1.w = (r13.x == 0.0) ? r11.x : r11.y;
    r3.xyz = r3.xyz * r0.www;
    r3.xyz = r19.xyz * r3.xyz;
    ps = OpacityOverride.x;
    r13 = r13.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r20.w = saturate(ps);
    ps = (-1.0) + r5.x;
    r0.w = dot(r3.zxy, float3(0.11, 0.3, 0.59));
    r17.x = ps;
    r5.x = (r13.y == 0.0) ? r11.z : r1.w;
    r5.y = (r13.z == 0.0) ? r18.z : r1.z;
    r18.w = (r13.w == 0.0) ? r18.w : r5.y;
    r19.x = (r13.x == 0.0) ? r11.w : r5.x;
    ps = ModShadowGroupColor.x * r6.z;
    r5.x = r0.w - r3.x;
    r20.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r20.x = saturate(r5.x + r3.x);
    r20.z = ps;
    ps = r19.x;
    r18.xyz = r8.zxy + r8.zxy;
    r5.x = ps;
    ps = 0.0;
    r22 = r18 + float4(-1.0, -1.0, -1.0, -0.75);
    r5.y = ps;
    ps = max(r5.x, r5.y);
    r8 = -r20.wxyz + 1.0;
    r5.x = ps;
    ps = rsqrt(abs(r5.w));
    r11.xyz = r0.xyz * r8.yyy;
    r5.y = ps;
    ps = r5.x;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = 0.3;
    r0.yzw = -UniformVector_0.xyz + 1.0;
    r5.z = ps;
    ps = min(r5.x, r5.z);
    r13.xyz = r0.yzw * AmbientColorAndSkyFactor.xyz;
    r5.x = ps;
    ps = r22.w;
    r4.xyz = r5.yyy * r4.xyz;
    ps = r18.w + ps;
    r19.yzw = r22.xzy * UniformVector_4.zyx;
    r5.y = saturate(ps);
    ps = 3.3333333 * r5.x;
    r12.xyz = r5.yyy * r12.xyz;
    r5.x = ps;
    r5.xyz = r5.xxx * r17.xyz;
    r1.zw = -r19.wz * r20.xx + r19.wz;
    r17.xy = r5.yz * 2.0 + r1.zw;
    r18.zw = -r19.xy + 1.0;
    r22.xyz = -r12.xzy + r21.xzy;
    r12.xyz = r22.xyz * r21.www + r12.xzy;
    r17.z = r18.w * r20.x + r19.y;
    ps = 1.0 + r5.x;
    r18.y = r18.z * 2.5;
    r18.x = ps;
    ps = r18.x * r18.z;
    r0.x = float((r8.x >= 0.004));
    r5.y = ps;
    ps = r18.y * r18.x;
    r17.xyz = -r14.yzw + r17.zxy;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r1.z = float((r5.y > 0.9));
    r3.w = saturate(ps);
    r5.yzw = r17.xyz * r3.www + r14.xzw;
    r14.xyz = r3.xyz * r1.zzz;
    r3.xyz = r14.xyz * r3.www + UniformVector_0.xyz;
    r5.x = r7.w * 2.0 + r5.y;
    r14.xyz = r16.xyz * r15.xyz + r14.xyz;
    r5.xyz = r5.xzw * r6.www;
    ps = 1.0 + r5.x;
    r14.xyz = r14.xyz - r12.xzy;
    r5.w = ps;
    r12.xyz = r14.xyz * r3.www + r12.xzy;
    r3.xyz = r13.xyz * r12.xyz + r3.xyz;
    r5.xyz = (r6.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r6.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r0.yzw = r12.xyz * r0.yzw;
    r5.x = ps;
    ps = r11.x;
    r5.xyw = r5.yzw * r5.xxx;
    ps = r3.w * ps;
    r1.z = dot(r4.zxy, r5.wxy);
    r4.x = ps;
    ps = r11.z;
    r5.z = dot(r5.wxy, r10.zxy);
    ps = r3.w * ps;
    r6.xyz = r5.xyw * r5.zzz;
    r4.y = ps;
    ps = r11.y;
    r1 = r1.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r6.xyz = r6.xyz * 2.0 - r10.xyz;
    ps = r3.w * ps;
    r6.x = saturate(dot(r9.zxy, r6.zxy));
    r4.z = ps;
    r6.yz = r1.xy * r8.zw + 0.125;
    ps = ConstantLighting.x * r5.w;
    r1.yz = r1.zw + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r5.w;
    r1.zw = abs(r1.yz) * abs(r1.yz);
    r1.y = ps;
    ps = log2(r6.x);
    r5.z = r6.y * r6.z;
    r5.x = ps;
    r6.xyz = r5.zzz * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r5.x;
    r7.xyz = r0.ywz * r1.zzz;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r8.xyz = r0.ywz * r1.www;
    r5.z = ps;
    r3.xyz = r8.xyz * UpperSkyColor.xzy + r3.xzy;
    r3.xyz = r7.xzy * LowerSkyColor.xyz + r3.xzy;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r5.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r5.xyz = r7.xyz * r4.xyz + r3.xzy;
    r5.xyz = r1.xyz * r0.yzw + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r0.x + r2.w;
    r5.xyz = r6.xyz * r0.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
