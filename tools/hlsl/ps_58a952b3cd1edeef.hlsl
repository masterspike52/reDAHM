// ps_58a952b3cd1edeef.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 408 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000660 10041700 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c18); // float4
float4 ConstantLighting : register(c19); // float3
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
sampler2D ModShadowAccumTexture : register(s9);

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

    r14 = tex2D(Texture2D_8, r0.xy);
    ps = (-0.5) + r14.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r15.x = ps;
    r5.xyz = tex2D(Texture2D_2, r5.xy).xwy;
    ps = r2.w;
    r6.xy = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r6.z = ps;
    r8.yz = r5.xz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r8.x = saturate(r6.z * 0.00022222222);
    r5.w = ps;
    r10.xyz = r5.www * r3.xyz;
    r12.xyz = r8.xyz * float3(-0.025, 0.5, 0.5);
    r9.xy = r10.xy * r12.xx + r6.xy;
    r8.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r3.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    ps = 1.0 / UniformVector_1.y;
    r6.xy = r0.wz * UniformVector_7.xy;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r22.x = -r0.z + 1.0;
    r9.z = ps;
    r8.xyz = r8.zxy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.xyz = r8.xzy * UniformVector_4.zyx;
    r9.w = ps;
    ps = r3.w + r3.w;
    r13.w = r9.y * r5.w;
    r8.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r22.yw = -r13.wx + 1.0;
    r22.z = ps;
    ps = r3.x + r3.x;
    r15.yzw = r22.xyz * UniformVector_2.yyx;
    r8.z = ps;
    ps = r15.w;
    r11.xyz = r15.zxy - 0.5;
    ps = r9.x * ps;
    r21.xyz = float3((r15.xyz >= 0.5));
    r8.x = ps;
    ps = r3.y + r3.y;
    r21.w = float((r8.x >= 0.5));
    r8.w = ps;
    ps = r9.z;
    r16.xyz = r11.yzx - r15.xyz;
    ps = abs(r7.x) * ps;
    r11 = r8 + float4(-0.5, -1.0, -1.0, -1.0);
    r6.z = ps;
    ps = r9.w;
    r16.w = r11.x - r8.x;
    r8.x = r16.w * r21.w + r8.x;
    r8.yzw = r16.zxy * r21.zxy + r15.zxy;
    ps = abs(r7.y) * ps;
    r8 = r8.zwxy + r8.zwxy;
    r6.w = ps;
    r3.xyz = tex2D(Texture2D_6, r9.xy).xyz;
    r7.zw = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r16 = tex2D(Texture2D_1, r8.xy);
    r18 = tex2D(Texture2D_1, r8.zw);
    r17 = tex2D(Texture2D_5, r0.xy);
    r8 = tex2D(Texture2D_4, r0.xy);
    r9.xyz = tex2D(Texture2D_7, r6.xy).xyz;
    r0.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    ps = OpacityOverride.x;
    r19.xyz = -ModShadowColor.xyz + 1.0;
    r12.w = saturate(ps);
    ps = r2.w;
    r5.z = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = 0.0001 * ps;
    r6.w = float((UniformScalar_11.x >= 1.0));
    r12.x = saturate(ps);
    ps = UniformVector_5.x;
    r5.x = dot(r1.zxy, r1.zxy);
    ps = 2e+01 * ps;
    r23.xyz = UniformVector_6.xzy * 2e+01;
    r20.y = ps;
    ps = UniformVector_5.z;
    r5.w = dot(r4.zxy, r4.zxy);
    ps = 2e+01 * ps;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r20.z = ps;
    ps = UniformVector_5.y;
    r9.w = float((UniformScalar_11.x > 1.0));
    r7.xy = r0.xy * 2.0 - 1.0;
    ps = 2e+01 * ps;
    r0.xyz = r14.xyz * UniformScalar_12.xxx;
    r20.w = ps;
    r15.xyz = (-abs(r9.www) >= 0.0) ? r9.xyz : 1.0;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r9.xyz = r8.xzy * r8.www;
    r8.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r17.xyz = r17.xzy * r17.www;
    r8.y = ps;
    ps = rsqrt(abs(r5.w));
    r5.y = r5.y * r0.w;
    r5.w = ps;
    ps = (-1.0) - -r5.y;
    r17.xyz = r23.xyz * r17.xyz;
    r20.x = ps;
    ps = rsqrt(abs(r5.x));
    r9.xyz = r20.yzw * r9.xyz;
    r5.x = ps;
    r15.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r15.xyz;
    r0.yzw = r0.xyz * r15.xyz + UniformScalar_13.xxx;
    r17.xyz = (-abs(r5.zzz) >= 0.0) ? r17.xyz : r9.xyz;
    ps = r7.x;
    r9.xyz = r5.xxx * r1.xyz;
    ps = r12.y + ps;
    r5.x = dot(r17.yxz, float3(0.11, 0.3, 0.59));
    r17.w = ps;
    ps = r7.y;
    r5.z = saturate(dot(r17.zyx, float3(0.59, 0.11, 0.3)));
    r8.zw = -r13.zy * r5.zz + r13.zy;
    ps = r12.z + ps;
    r5.x = r5.x - r17.x;
    r20.w = ps;
    r13.z = r22.w * r5.z + r13.x;
    ps = r5.x;
    r1.x = dot(r21.xyy, float3(1.0, 1.0, 1.0));
    r1.y = r21.z * 2.0 + r21.w;
    r5.z = (r1.y == 0.0) ? r18.x : r18.y;
    r5.x = (r1.x == 0.0) ? r16.x : r16.y;
    ps = r17.x + ps;
    r1 = r1.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r12.z = saturate(ps);
    r5.x = (r1.y == 0.0) ? r16.z : r5.x;
    r5.z = (r1.z == 0.0) ? r18.z : r5.z;
    r9.w = (r1.w == 0.0) ? r18.w : r5.z;
    r5.x = (r1.x == 0.0) ? r16.w : r5.x;
    ps = 1.0 - r5.x;
    r1.x = max(r5.x, 0.0);
    r0.x = ps;
    ps = 2.5 * r0.x;
    r5.xz = r9.zw + float2(0.1, 0.25);
    r7.x = ps;
    ps = 5.0 * r5.x;
    r6.w = r5.z + r9.w;
    r12.y = saturate(ps);
    ps = r6.w;
    r7.y = min(r1.x, 0.3);
    ps = -r5.y + ps;
    r18.yzw = r7.yzw * float3(3.3333333, 0.875, 0.875);
    r7.y = saturate(ps);
    ps = r7.y;
    r1 = -r12.wzyx + 1.0;
    ps = r3.x * ps;
    r16.xyz = r0.yzw * r1.yyy;
    r12.x = ps;
    ps = r7.y;
    r6.w = float((r1.x >= 0.004));
    r20.yz = -r1.zz * ModShadowGroupColor.xy + 1.0;
    r13.y = r18.y * r20.w + r8.w;
    r0.yzw = r18.yzw * r20.xyz + float3(1.0, 0.125, 0.125);
    r7.x = saturate(r7.x * r0.y - 0.5);
    ps = r3.y * ps;
    r0.xy = r0.yz * r0.xw;
    r12.y = ps;
    r5.xyz = r0.yyy * r19.xyz + ModShadowColor.xyz;
    ps = r7.y;
    r18.x = float((r0.x > 0.9));
    ps = r3.z * ps;
    r0 = r18.xxxy * r17.xzyw;
    r12.z = ps;
    r7.yzw = r0.xyz * r7.xxx + UniformVector_0.xyz;
    ps = r8.z;
    r3.xyz = r16.xzy * r7.xxx;
    r14.xyz = r15.xzy * r14.xzy + r0.xzy;
    ps = r0.w + ps;
    r0.xyz = r14.xyz - r12.xzy;
    r13.x = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r1.xyz = -r11.yzw + r13.zxy;
    r8.z = ps;
    r0.xyz = r0.xyz * r7.xxx + r12.xzy;
    r8.xyz = r8.xyz * r0.xzy + r7.yzw;
    r7.yz = r1.yz * r7.xx + r11.zw;
    r0.w = r1.x * r7.x - 2.0;
    r7.x = r3.w * 2.0 + r0.w;
    r7.xyw = r7.yzx * r1.www;
    ps = r5.w;
    r7.z = r7.w + 1.0;
    r1.xyz = (r1.www > 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r1.yzw = (r1.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    ps = r4.x * ps;
    r0.w = dot(r1.wyz, r1.wyz);
    r1.x = ps;
    ps = rsqrt(abs(r0.w));
    r0.xyz = r0.xzy * r6.yzx;
    r6.x = ps;
    ps = r5.w;
    r6.xyz = r1.yzw * r6.xxx;
    ps = r4.y * ps;
    r0.w = dot(r6.zxy, r10.zxy);
    r1.y = ps;
    ps = r5.w;
    r7.xyz = r6.xyz * r0.www;
    r7.xyz = r7.xyz * 2.0 - r10.xyz;
    ps = r4.z * ps;
    r5.w = saturate(dot(r9.zxy, r7.zxy));
    r1.z = ps;
    ps = log2(r5.w);
    r1.x = dot(r1.zxy, r6.zxy);
    r1.y = ps;
    r1.xyz = r1.xxy * float3(-0.5, 0.5, 15.0);
    r4.xy = r1.xy + 0.5;
    ps = pow(2.0, r1.z);
    r6.xy = abs(r4.xy) * abs(r4.xy);
    r5.w = ps;
    ps = ConstantLighting.x * r5.w;
    r1.xyz = r6.zzz * ConstantLighting.xyz;
    r4.x = ps;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r0.xzy * r6.xxx;
    r4.y = ps;
    ps = ConstantLighting.y * r5.w;
    r6.xyz = r0.xzy * r6.yyy;
    r4.z = ps;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r8.xzy;
    r6.xyz = r7.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r4.xyz * r3.xyz + r6.xzy;
    r6.xyz = r1.xyz * r0.xyz + r6.xzy;
    ps = -r2.w;
    r5.xyz = r6.xzy * r5.xzy;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xzy - r5.xzy;
    r0.w = ps;
    oC0.w = r0.w * r6.w + r2.w;
    r5.xyz = r0.xyz * r6.www + r5.xzy;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
