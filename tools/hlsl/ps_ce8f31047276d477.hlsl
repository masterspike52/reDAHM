// ps_ce8f31047276d477.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 414 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000678 10041900 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c17); // float4
float4 LowerSkyColor : register(c16); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 OpacityOverride : register(c14); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UpperSkyColor : register(c15); // float3
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

    r7 = tex2D(Texture2D_7, r0.xy).xzyw;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r6.x = r7.w - 0.5;
    r9.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r14.xzw = tex2D(Texture2D_2, r0.wz).wxy;
    ps = OpacityOverride.x;
    r6.xy = r0.wz * 6.0;
    r15.x = saturate(ps);
    r10.xyz = tex2D(Texture2D_2, r6.xy).wxy;
    ps = r0.w;
    r9.xy = r0.wz * UniformVector_1.xy;
    ps = UniformVector_2.x * ps;
    r6.z = dot(r4.zxy, r4.zxy);
    r11.x = ps;
    ps = -r0.z;
    r6.w = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r6.y = r3.w - 4e+02;
    r6.x = ps;
    r10.yz = r10.yz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r12.w = r10.x * r14.x;
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r12.xyz = r6.www * r2.xyz;
    r6.z = ps;
    ps = 0.00022222222 * r6.y;
    r13.xyz = r6.zzz * r4.xyz;
    r10.x = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r4.xzw = r10.xyz * float3(-0.025, 0.5, 0.5);
    r6.w = ps;
    r9.xy = r13.xy * r4.xx + r9.xy;
    ps = 1.0 / UniformVector_1.y;
    r4.xy = r12.zw + float2(0.1, -1.0);
    r6.z = ps;
    ps = 5.0 * r4.x;
    r10.xy = r0.wz * UniformVector_7.xy;
    r6.y = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = r9.y * r6.z;
    r2.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yz = -r6.zy + 1.0;
    r2.y = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r8.zw = r2.xy * abs(r8.xy);
    r15.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r11.yzw = r6.xyw * UniformVector_2.yyx;
    r15.z = ps;
    ps = r11.w;
    r2.yzw = -r15.xyz + 1.0;
    ps = r9.x * ps;
    r6.yzw = r11.zxy - 0.5;
    r2.x = ps;
    ps = (-0.5) - -r2.x;
    r23.xyz = float3((r11.xyz >= 0.5));
    r6.x = ps;
    ps = r6.x;
    r6.yzw = r6.zwy - r11.xyz;
    ps = -r2.x + ps;
    r8.xy = float2((r2.xy >= float2(0.5, 0.004)));
    r6.x = ps;
    r6.x = r6.x * r8.x + r2.x;
    r6.yzw = r6.wyz * r23.zxy + r11.zxy;
    r6 = r6.zwxy + r6.zwxy;
    r14.xy = tex2D(ModShadowAccumTexture, r8.zw).xy;
    r22.xyz = tex2D(Texture2D_6, r9.xy).xyz;
    r20 = tex2D(Texture2D_1, r6.zw).xzwy;
    r17 = tex2D(Texture2D_1, r6.xy);
    r21 = tex2D(Texture2D_5, r0.xy);
    r19 = tex2D(Texture2D_4, r0.xy);
    r18.yzw = tex2D(Texture2D_8, r10.xy).xyz;
    r10.xyw = tex2D(Texture2D_3, r0.xy).xzy;
    r9.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r6.x = saturate(r3.w * 0.0001);
    r10.z = ps;
    ps = UniformVector_5.x;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    ps = 2e+01 * ps;
    r25.xyz = UniformVector_6.xzy * 2e+01;
    r24.x = ps;
    ps = UniformVector_5.z;
    r6.w = float((UniformScalar_8.x >= 1.0));
    ps = 2e+01 * ps;
    r6.z = dot(r5.zxy, r5.zxy);
    r24.y = ps;
    ps = UniformVector_5.y;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    ps = 2e+01 * ps;
    r6.y = float((UniformScalar_8.x > 1.0));
    r24.z = ps;
    r15.xyz = r9.wxy * 2.0 - 1.0;
    ps = r10.y + r10.y;
    r16.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r18.x = ps;
    r8.zw = r14.zw * 2.0 - 1.0;
    r18.yzw = (-abs(r6.yyy) >= 0.0) ? r18.yzw : 1.0;
    ps = r7.z;
    r19.xyz = r19.xzy * r19.www;
    r6.y = ps;
    ps = rsqrt(abs(r6.z));
    r21.xyz = r21.xzy * r21.www;
    r0.w = ps;
    ps = UniformScalar_9.x * r6.y;
    r21.xyz = r25.xyz * r21.xyz;
    r6.y = ps;
    ps = UniformScalar_9.x * r7.y;
    r24.xyz = r24.xyz * r19.xyz;
    r6.z = ps;
    r19.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r18.yzw;
    ps = r10.x + r10.x;
    r6.zw = r6.yz * r19.yz;
    r18.y = ps;
    r10.xyz = (-abs(r10.zzz) >= 0.0) ? r21.xyz : r24.xyz;
    ps = r10.w + r10.w;
    r6.y = r19.x * UniformScalar_9.x;
    r18.z = ps;
    ps = r6.y;
    r4.zw = r8.zw + r4.zw;
    r10.xyz = (-abs(r9.zzz) >= 0.0) ? r21.xyz : r10.xyz;
    ps = r7.x * ps;
    r8.z = dot(r10.yxz, float3(0.11, 0.3, 0.59));
    r6.y = ps;
    ps = r8.z;
    r10.w = saturate(dot(r10.zyx, float3(0.59, 0.11, 0.3)));
    ps = -r10.x + ps;
    r21.xyz = r6.yzw + UniformScalar_10.xxx;
    r6.y = ps;
    ps = r6.y;
    r8.z = dot(r23.xyy, float3(1.0, 1.0, 1.0));
    r6.y = (r8.z == 0.0) ? r17.x : r17.y;
    r8.w = r23.z * 2.0 + r8.x;
    r6.z = (r8.w == 0.0) ? r20.x : r20.w;
    ps = r10.x + ps;
    r23 = r8.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r20.x = saturate(ps);
    r6.y = (r23.y == 0.0) ? r17.z : r6.y;
    r6.z = (r23.z == 0.0) ? r20.y : r6.z;
    r18.w = (r23.w == 0.0) ? r20.z : r6.z;
    r6.z = (r23.x == 0.0) ? r17.w : r6.y;
    ps = 1.0 - r6.x;
    r6.y = max(r6.z, 0.0);
    r6.w = ps;
    ps = 1.0 - r6.z;
    r6.y = min(r6.y, 0.3);
    r6.z = ps;
    ps = 2.5 * r6.z;
    r17 = r18 + float4(-1.0, -1.0, -1.0, 0.25);
    r6.x = ps;
    ps = 3.3333333 * r6.y;
    r8.z = r17.w + r18.w;
    r9.z = ps;
    ps = r8.z;
    r20.yzw = r17.xzy * UniformVector_4.zyx;
    r6.y = r9.z * r4.y + 1.0;
    r8.zw = -r20.wz * r10.ww + r20.wz;
    r18.xy = r9.zz * r4.zw + r8.zw;
    ps = -r12.w + ps;
    r17.yz = -r20.xy + 1.0;
    r4.x = saturate(ps);
    ps = r6.y * r6.z;
    r4.xyz = r4.xxx * r22.xyz;
    r6.z = ps;
    ps = r6.x * r6.y;
    r21.xyz = r21.xyz * r17.yyy;
    r6.x = ps;
    r17.x = float((r6.z > 0.9));
    ps = (-0.5) + r6.x;
    r17 = r17.xxxz * r10.xzyw;
    r4.w = saturate(ps);
    r10.xyz = r17.xyz * r4.www + UniformVector_0.xyz;
    ps = r20.y;
    r9.xyz = r21.xzy * r4.www;
    r7.xyz = r19.xzy * r7.xyz + r17.xzy;
    ps = r17.w + ps;
    r17.xyz = r7.xyz - r4.xzy;
    r18.z = ps;
    ps = r0.w;
    r7.xyz = -r15.xyz + r18.zxy;
    r4.xyz = r17.xyz * r4.www + r4.xzy;
    r10.xyz = r16.xyz * r4.xzy + r10.xyz;
    r7.yz = r7.yz * r4.ww + r15.yz;
    r7.x = r7.x * r4.w - 2.0;
    r7.x = r9.w * 2.0 + r7.x;
    ps = r5.x * ps;
    r15.xyw = r7.yzx * r6.www;
    r7.x = ps;
    ps = r0.w;
    r15.z = r15.w + 1.0;
    r7.yzw = (r6.www > 0.0) ? r15.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r6.www >= 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    ps = r5.y * ps;
    r6.x = dot(r6.wyz, r6.wyz);
    r7.y = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r4.xzy * r0.xyz;
    r6.x = ps;
    ps = r0.w;
    r6.yzw = r6.yzw * r6.xxx;
    ps = r5.z * ps;
    r4.xyz = r6.www * r1.xyz;
    r7.z = ps;
    r14.z = dot(r7.zxy, r6.wyz);
    r6.x = dot(r6.wyz, r13.zxy);
    r6.xyz = r6.yzw * r6.xxx;
    r7 = r14.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r6.xyz = r6.xyz * 2.0 - r13.xyz;
    r6.y = saturate(dot(r12.zxy, r6.zxy));
    r6.xz = r7.xy * r2.zw + 0.125;
    r7.xy = r7.zw + 0.5;
    r7.xw = abs(r7.yx) * abs(r7.yx);
    ps = log2(r6.y);
    r6.x = r6.x * r6.z;
    r6.y = ps;
    r6.xzw = r6.xxx * r11.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.y;
    r2.xyz = r0.xzy * r7.xxx;
    r6.y = ps;
    r7.xyz = r2.xyz * UpperSkyColor.xzy + r10.xzy;
    ps = pow(2.0, r6.y);
    r2.xyz = r0.xzy * r7.www;
    r6.y = ps;
    r1.xyz = r6.yyy * r1.xzy;
    r7.xyz = r2.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r1.xyz * r9.xyz + r7.xzy;
    r7.xyz = r4.xyz * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xwz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xzy - r6.xzy;
    r7.w = ps;
    oC0.w = r7.w * r8.y + r3.w;
    r6.xyz = r7.xyz * r8.yyy + r6.xzy;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
