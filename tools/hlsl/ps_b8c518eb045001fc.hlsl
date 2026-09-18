// ps_b8c518eb045001fc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 411 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000066C 10041600 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c17); // float4
float4 LightMapScale : register(c18); // float3
float4 LowerSkyColor : register(c16); // float3
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_7, r1.xy);
    ps = (-0.5) + r11.w;
    r6.xy = r1.wz * 6.0;
    r6.z = ps;
    ps = UniformVector_2.x * r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r9.x = ps;
    r13 = tex2D(Texture2D_5, r1.xy);
    r14 = tex2D(Texture2D_4, r1.xy);
    r10.yzw = tex2D(Texture2D_2, r6.xy).xyw;
    r15.xzw = tex2D(Texture2D_2, r1.wz).wxy;
    r7.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r21.x = -r1.z + 1.0;
    r6.w = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r6.yz = r1.wz * UniformVector_1.xy;
    r7.w = ps;
    ps = r3.w;
    r12.xyz = UniformVector_5.xzy * 2e+01;
    ps = (-4e+02) + ps;
    r18.xyz = UniformVector_6.xzy * 2e+01;
    r6.x = ps;
    r9.yzw = r7.zxy * 2.0 - 1.0;
    ps = 0.00022222222 * r6.x;
    r7.y = dot(r4.zxy, r4.zxy);
    r10.x = saturate(ps);
    r10.yz = r10.yz * 2.0 - 1.0;
    ps = r14.x * r14.w;
    r6.x = dot(r2.zxy, r2.zxy);
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r17.xyz = r13.xzy * r13.www;
    r6.x = ps;
    ps = rsqrt(abs(r7.y));
    r13.xyz = r6.xxx * r2.xyz;
    r6.x = ps;
    ps = r14.z * r14.w;
    r16.xyz = r6.xxx * r4.xyz;
    r7.y = ps;
    ps = r14.y * r14.w;
    r2.xyz = r18.xyz * r17.xyz;
    r7.z = ps;
    ps = r10.w;
    r7.xyz = r12.xyz * r7.xyz;
    ps = r15.x * ps;
    r4.xzw = r10.xyz * float3(-0.025, 0.5, 0.5);
    r13.w = ps;
    r7.xyz = (-abs(r7.www) >= 0.0) ? r2.xyz : r7.xyz;
    r14.xyz = (-abs(r6.www) >= 0.0) ? r2.xyz : r7.xyz;
    r6.xy = r16.xy * r4.xx + r6.yz;
    ps = 1.0 / UniformVector_1.y;
    r4.xy = r13.zw + float2(0.1, -1.0);
    r7.x = ps;
    r6.z = dot(r14.yxz, float3(0.11, 0.3, 0.59));
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = r6.z - r14.x;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.y = saturate(r6.z + r14.x);
    r0.w = ps;
    ps = OpacityOverride.x;
    r6.zw = r1.wz * UniformVector_7.xy;
    r7.z = saturate(ps);
    ps = r6.y;
    r19.yzw = r9.ywz * UniformVector_4.zyx;
    ps = r7.x * ps;
    r0.zw = r0.zw * abs(r8.xy);
    r19.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r21.yw = -r19.xy + 1.0;
    r21.z = ps;
    ps = 5.0 * r4.x;
    r9.yzw = r21.xyz * UniformVector_2.yyx;
    r7.x = saturate(ps);
    ps = r9.w;
    r1.yzw = -r7.zxy + 1.0;
    ps = r6.x * ps;
    r7.yzw = r9.zxy - 0.5;
    r1.x = ps;
    ps = (-0.5) - -r1.x;
    r18.xyw = float3((r9.xzy >= 0.5));
    r7.x = ps;
    ps = r7.x;
    r7.yzw = r7.zwy - r9.xyz;
    ps = -r1.x + ps;
    r8.xy = float2((r1.xy >= float2(0.5, 0.004)));
    r7.x = ps;
    r7.x = r7.x * r8.x + r1.x;
    r7.yzw = r7.wyz * r18.yxw + r9.zxy;
    r7 = r7.zwxy + r7.zwxy;
    r12.xyz = tex2D(Texture2D_6, r6.xy).xyz;
    r15.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r20 = tex2D(Texture2D_1, r7.zw);
    r9 = tex2D(Texture2D_1, r7.xy);
    r10.xyz = tex2D(Texture2D_8, r6.zw).xyz;
    r2.xyw = tex2D(Texture2D_0, r6.xy).xyz;
    r6.xzw = tex2D(LightMapTexture, r0.xy).yxz;
    r18.z = saturate(r3.w * 0.0001);
    r6.y = float((UniformScalar_8.x >= 1.0));
    r7.x = dot(r5.zxy, r5.zxy);
    r7.yzw = -UniformVector_0.xyz + 1.0;
    r0.z = float((UniformScalar_8.x > 1.0));
    r17.xyz = r2.wxy * 2.0 - 1.0;
    r0.xy = r15.zw * 2.0 - 1.0;
    r22.xyz = (-abs(r0.zzz) >= 0.0) ? r10.xyz : 1.0;
    ps = rsqrt(abs(r7.x));
    r0.zw = r11.yz * UniformScalar_9.xx;
    r7.x = ps;
    r10.xyz = r7.xxx * r5.xyz;
    r2.xyz = (-abs(r6.yyy) >= 0.0) ? 1.0 : r22.yxz;
    ps = UniformScalar_9.x * r2.y;
    r5.yw = r0.zw * r2.xz;
    r6.y = ps;
    ps = r6.y;
    r4.zw = r0.xy + r4.zw;
    ps = r11.x * ps;
    r6.y = saturate(dot(r14.zyx, float3(0.59, 0.11, 0.3)));
    r5.x = ps;
    r0.yw = -r19.wz * r6.yy + r19.wz;
    r5.z = r21.w * r6.y + r19.y;
    ps = ModShadowGroupColor.x * r1.z;
    r0.x = dot(r18.xww, float3(1.0, 1.0, 1.0));
    r18.x = ps;
    r6.y = (r0.x == 0.0) ? r9.x : r9.y;
    r0.z = r18.y * 2.0 + r8.x;
    r7.x = (r0.z == 0.0) ? r20.x : r20.y;
    ps = ModShadowGroupColor.y * r1.z;
    r19 = r0.xxzz + float4(-3.0, -2.0, -2.0, -3.0);
    r18.y = ps;
    r6.y = (r19.y == 0.0) ? r9.z : r6.y;
    r7.x = (r19.z == 0.0) ? r20.z : r7.x;
    r15.z = (r19.w == 0.0) ? r20.w : r7.x;
    r7.x = (r19.x == 0.0) ? r9.w : r6.y;
    ps = 1.0 - r7.x;
    r6.y = max(r7.x, 0.0);
    r0.x = ps;
    ps = 2.5 * r0.x;
    r6.y = min(r6.y, 0.3);
    r0.z = ps;
    ps = 3.3333333 * r6.y;
    r9.yzw = r5.xyw + UniformScalar_10.xxx;
    r6.y = ps;
    r5.xy = r6.yy * r4.zw + r0.yw;
    r0.y = r6.y * r4.y + 1.0;
    ps = r0.y * r0.x;
    r8.xzw = -r18.xyz + 1.0;
    r6.y = ps;
    ps = r0.z * r0.y;
    r4.xyz = -r17.xyz + r5.zxy;
    r7.x = ps;
    ps = (-0.5) + r7.x;
    r0.x = float((r6.y > 0.9));
    r7.x = saturate(ps);
    r0.yz = r4.yz * r7.xx + r17.yz;
    r6.y = r4.x * r7.x - 2.0;
    r4.xyz = r0.xxx * r14.xzy;
    r5.xyz = r4.xyz * r7.xxx + UniformVector_0.xyz;
    r11.xyz = r2.yzx * r11.xzy + r4.xzy;
    r0.x = r2.w * 2.0 + r6.y;
    r0.xyz = r0.xyz * r8.www;
    ps = 1.0 + r0.x;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = ps;
    r0.xyz = (r8.www > 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    r0.xyz = (r8.www >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    ps = AmbientColorAndSkyFactor.x * r7.y;
    r6.y = dot(r0.zxy, r0.zxy);
    r9.x = ps;
    ps = rsqrt(abs(r6.y));
    r2.xyz = r9.yzw * r1.www;
    r6.y = ps;
    ps = AmbientColorAndSkyFactor.y * r7.z;
    r1.xyz = r0.xyz * r6.yyy;
    r9.y = ps;
    ps = AmbientColorAndSkyFactor.z * r7.w;
    r15.w = dot(r10.zxy, r1.zxy);
    r9.z = ps;
    ps = LightMapScale.x * r6.z;
    r6.y = dot(r1.zxy, r16.zxy);
    r10.x = ps;
    ps = LightMapScale.y * r6.x;
    r0.xyz = r1.xyz * r6.yyy;
    r10.y = ps;
    r4.xyz = r0.xyz * 2.0 - r16.xyz;
    ps = LightMapScale.z * r6.w;
    r0 = r15.wxyw * float4(0.5, 0.875, 0.875, -0.5);
    r10.z = ps;
    ps = r0.w;
    r2.xyz = r2.xzy * r7.xxx;
    r6.x = ps;
    ps = 0.5 + r6.x;
    r15.xy = r0.yz * r8.xz;
    r6.y = ps;
    ps = 0.5 + r0.x;
    r6.x = saturate(dot(r13.zxy, r4.zxy));
    r6.z = ps;
    ps = log2(r6.x);
    r4.zw = abs(r6.yz) * abs(r6.yz);
    r6.x = ps;
    ps = 15.0 * r6.x;
    r0.xyz = r15.zxy + float3(0.25, 0.125, 0.125);
    r6.w = ps;
    ps = r0.y * r0.z;
    r0.x = r0.x + r15.z;
    r6.x = ps;
    r6.xyz = r6.xxx * r14.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r0.x = saturate(r0.x - r13.w);
    r6.w = ps;
    ps = r10.x;
    r1.xyz = r10.xzy * r1.zzz;
    ps = r6.w * ps;
    r0.xyz = r0.xxx * r12.xyz;
    r4.x = ps;
    ps = r10.z;
    r11.xyz = r11.xyz - r0.xzy;
    r0.xyz = r11.xyz * r7.xxx + r0.xzy;
    r9.xyz = r9.xyz * r0.xzy + r5.xyz;
    ps = r6.w * ps;
    r0.xyz = r0.xzy * r7.yzw;
    r4.y = ps;
    ps = r10.y;
    r5.xyz = r0.xzy * r4.zzz;
    ps = r6.w * ps;
    r7.xyz = r0.xzy * r4.www;
    r4.z = ps;
    r7.xyz = r7.xyz * UpperSkyColor.xzy + r9.xzy;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r4.xyz * r2.xyz + r7.xzy;
    r7.xyz = r1.xzy * r0.xyz + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xzy;
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
