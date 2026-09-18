// ps_9a1f5c718f9d91b9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 408 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000660 10041900 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
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
float4 LowerSkyColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
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
    float4 texcoord3 : TEXCOORD3; // r1
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
    float4 r1 = In.texcoord3;
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

    r16 = tex2D(Texture2D_8, r0.xy);
    ps = (-0.5) + r16.w;
    r6.xy = r0.wz * 6.0;
    r6.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r13.x = ps;
    r9.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    ps = r3.w;
    r7.xy = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    r6.yz = r9.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r6.x = saturate(r6.x * 0.00022222222);
    r6.w = ps;
    r9.xyz = r6.www * r4.xyz;
    r6.xyw = r6.yxz * float3(0.5, -0.025, 0.5);
    r4.xy = r9.xy * r6.yy + r7.xy;
    r10.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_0, r4.xy).zxy;
    ps = 1.0 / UniformVector_1.y;
    r7.xy = r0.wz * UniformVector_7.xy;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r24.x = -r0.z + 1.0;
    r4.z = ps;
    r10.xyz = r10.zxy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r15.xyz = r10.xzy * UniformVector_4.zyx;
    r4.w = ps;
    ps = r11.x + r11.x;
    r15.w = r4.y * r6.z;
    r10.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r24.yw = -r15.wx + 1.0;
    r24.z = ps;
    ps = r11.y + r11.y;
    r13.yzw = r24.xyz * UniformVector_2.yyx;
    r10.z = ps;
    ps = r13.w;
    r12.xyz = r13.zxy - 0.5;
    ps = r4.x * ps;
    r23.xyz = float3((r13.xyz >= 0.5));
    r10.x = ps;
    ps = r11.z + r11.z;
    r23.w = float((r10.x >= 0.5));
    r10.w = ps;
    ps = r4.z;
    r14.xyz = r12.yzx - r13.xyz;
    ps = abs(r8.x) * ps;
    r12 = r10 + float4(-0.5, -1.0, -1.0, -1.0);
    r7.z = ps;
    ps = r4.w;
    r14.w = r12.x - r10.x;
    r10.x = r14.w * r23.w + r10.x;
    r10.yzw = r14.zxy * r23.zxy + r13.zxy;
    ps = abs(r8.y) * ps;
    r10 = r10.zwxy + r10.zwxy;
    r7.w = ps;
    r11.yzw = tex2D(Texture2D_6, r4.xy).xyz;
    r4.yz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r19 = tex2D(Texture2D_1, r10.xy);
    r22 = tex2D(Texture2D_1, r10.zw);
    r18 = tex2D(Texture2D_5, r0.xy);
    r10 = tex2D(Texture2D_4, r0.xy);
    r13.xyz = tex2D(Texture2D_7, r7.xy).xyz;
    r8.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    ps = OpacityOverride.x;
    r20.xyz = -ModShadowColor.xyz + 1.0;
    r14.w = saturate(ps);
    ps = r3.w;
    r7.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = 0.0001 * ps;
    r0.w = float((UniformScalar_11.x >= 1.0));
    r14.x = saturate(ps);
    ps = UniformVector_5.x;
    r6.z = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r25.xyz = UniformVector_6.xzy * 2e+01;
    r21.y = ps;
    ps = UniformVector_5.z;
    r4.x = dot(r5.zxy, r5.zxy);
    ps = 2e+01 * ps;
    r7.xyz = -UniformVector_0.zxy + 1.0;
    r21.z = ps;
    ps = UniformVector_5.y;
    r4.w = float((UniformScalar_11.x > 1.0));
    r8.xy = r8.xy * 2.0 - 1.0;
    ps = 2e+01 * ps;
    r0.xyz = r16.xyz * UniformScalar_12.xxx;
    r21.w = ps;
    r17.xyz = (-abs(r4.www) >= 0.0) ? r13.xyz : 1.0;
    ps = AmbientColorAndSkyFactor.x * r7.y;
    r10.xyz = r10.xzy * r10.www;
    r13.x = ps;
    ps = AmbientColorAndSkyFactor.y * r7.z;
    r18.xyz = r18.xzy * r18.www;
    r13.y = ps;
    ps = rsqrt(abs(r4.x));
    r6.y = r9.w * r8.z;
    r4.w = ps;
    ps = (-1.0) - -r6.y;
    r18.xyz = r25.xyz * r18.xyz;
    r21.x = ps;
    ps = rsqrt(abs(r6.z));
    r10.xyz = r21.yzw * r10.xyz;
    r6.z = ps;
    r17.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r17.xyz;
    r0.yzw = r0.xyz * r17.xyz + UniformScalar_13.xxx;
    r18.xyz = (-abs(r7.www) >= 0.0) ? r18.xyz : r10.xyz;
    ps = r8.x;
    r10.xyz = r6.zzz * r2.xyz;
    ps = r6.x + ps;
    r7.w = dot(r18.yxz, float3(0.11, 0.3, 0.59));
    r18.w = ps;
    ps = r8.y;
    r6.z = saturate(dot(r18.zyx, float3(0.59, 0.11, 0.3)));
    r8.xw = -r15.yz * r6.zz + r15.yz;
    ps = r6.w + ps;
    r6.x = r7.w - r18.x;
    r21.w = ps;
    r15.z = r24.w * r6.z + r15.x;
    ps = r6.x;
    r2.x = dot(r23.xyy, float3(1.0, 1.0, 1.0));
    r2.y = r23.z * 2.0 + r23.w;
    r6.z = (r2.y == 0.0) ? r22.x : r22.y;
    r6.x = (r2.x == 0.0) ? r19.x : r19.y;
    ps = r18.x + ps;
    r2 = r2.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r14.z = saturate(ps);
    r6.x = (r2.y == 0.0) ? r19.z : r6.x;
    r6.z = (r2.z == 0.0) ? r22.z : r6.z;
    r10.w = (r2.w == 0.0) ? r22.w : r6.z;
    r6.x = (r2.x == 0.0) ? r19.w : r6.x;
    ps = 1.0 - r6.x;
    r2.x = max(r6.x, 0.0);
    r0.x = ps;
    ps = 2.5 * r0.x;
    r6.xz = r10.zw + float2(0.1, 0.25);
    r7.w = ps;
    ps = 5.0 * r6.x;
    r6.w = r6.z + r10.w;
    r14.y = saturate(ps);
    ps = r6.w;
    r4.x = min(r2.x, 0.3);
    ps = -r6.y + ps;
    r19.yzw = r4.xyz * float3(3.3333333, 0.875, 0.875);
    r8.y = saturate(ps);
    ps = r8.y;
    r2 = -r14.wzyx + 1.0;
    ps = r11.y * ps;
    r4.xyz = r0.yzw * r2.yyy;
    r14.x = ps;
    ps = r8.y;
    r6.w = float((r2.x >= 0.004));
    r21.yz = -r2.zz * ModShadowGroupColor.xy + 1.0;
    r15.y = r19.y * r21.w + r8.x;
    r0.yzw = r19.yzw * r21.xyz + float3(1.0, 0.125, 0.125);
    r7.w = saturate(r7.w * r0.y - 0.5);
    ps = r11.z * ps;
    r0.xy = r0.yz * r0.xw;
    r14.y = ps;
    r6.xyz = r0.yyy * r20.xyz + ModShadowColor.xyz;
    ps = r8.y;
    r19.x = float((r0.x > 0.9));
    ps = r11.w * ps;
    r0 = r19.xxxy * r18.xzyw;
    r14.z = ps;
    r8.xyz = r0.xyz * r7.www + UniformVector_0.xyz;
    ps = r8.w;
    r4.xyz = r4.xzy * r7.www;
    r16.xyz = r17.xzy * r16.xzy + r0.xzy;
    ps = r0.w + ps;
    r0.xyz = r16.xyz - r14.xzy;
    r15.x = ps;
    ps = AmbientColorAndSkyFactor.z * r7.x;
    r2.xyz = -r12.yzw + r15.zxy;
    r13.z = ps;
    r0.xyz = r0.xyz * r7.www + r14.xzy;
    r8.xyz = r13.xyz * r0.xzy + r8.xyz;
    r11.yz = r2.yz * r7.ww + r12.zw;
    r7.w = r2.x * r7.w - 2.0;
    r11.x = r11.x * 2.0 + r7.w;
    r11.xyw = r11.yzx * r2.www;
    ps = r4.w;
    r11.z = r11.w + 1.0;
    r2.xyz = (r2.www > 0.0) ? r11.xyz : float3(0.0, 0.0, 1.0);
    r2.yzw = (r2.www >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    ps = r5.x * ps;
    r7.w = dot(r2.wyz, r2.wyz);
    r2.x = ps;
    ps = rsqrt(abs(r7.w));
    r0.xyz = r0.xzy * r7.yzx;
    r7.x = ps;
    ps = r4.w;
    r7.xyw = r2.yzw * r7.xxx;
    ps = r5.y * ps;
    r7.z = dot(r7.wxy, r9.zxy);
    r2.y = ps;
    ps = r4.w;
    r11.xyz = r7.xyw * r7.zzz;
    r9.xyz = r11.xyz * 2.0 - r9.xyz;
    ps = r5.z * ps;
    r7.z = saturate(dot(r10.zxy, r9.zxy));
    r2.z = ps;
    ps = log2(r7.z);
    r2.x = dot(r2.zxy, r7.wxy);
    r2.y = ps;
    r7.xyz = r2.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r7.z);
    r7.xy = r7.yx + 0.5;
    r7.z = ps;
    ps = abs(r7.y) * abs(r7.y);
    r2.xyz = r7.www * r1.xyz;
    r7.y = ps;
    ps = abs(r7.x) * abs(r7.x);
    r1.xyz = r7.zzz * r1.xzy;
    r7.x = ps;
    r5.xyz = r0.xzy * r7.yyy;
    r7.xyz = r0.xzy * r7.xxx;
    r7.xyz = r7.xyz * UpperSkyColor.xzy + r8.xzy;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r1.xyz * r4.xyz + r7.xzy;
    r7.xyz = r2.xyz * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xzy;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
