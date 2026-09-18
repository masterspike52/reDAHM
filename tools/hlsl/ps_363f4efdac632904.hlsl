// ps_363f4efdac632904.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 408 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000660 10041A00 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c20); // float4
float4 LowerSkyColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 OpacityOverride : register(c17); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_5 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
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
    float4 r26 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r15 = tex2D(Texture2D_8, r0.xy);
    ps = (-0.5) + r15.w;
    r6.xy = r0.wz * 6.0;
    r6.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r14.x = ps;
    r9.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    r12.y = UniformScalar_2.x * UniformVector_6.y;
    ps = UniformVector_6.y;
    r11.xy = r0.wz * UniformVector_7.xy;
    ps = UniformScalar_5.x * ps;
    r24.x = -r0.z + 1.0;
    r12.w = ps;
    ps = OpacityOverride.x;
    r6.z = UniformVector_4.x * UniformScalar_4.x;
    r7.y = saturate(ps);
    ps = UniformScalar_1.x;
    r7.xw = r0.wz * UniformVector_1.xy;
    ps = UniformVector_4.x * ps;
    r7.z = saturate(r3.w * 0.0001);
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = r3.w - 4e+02;
    r10.x = ps;
    ps = 0.00022222222 * r6.w;
    r6.x = dot(r4.zxy, r4.zxy);
    r13.x = saturate(ps);
    r13.yz = r9.xy * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.yz = -r7.yz + 1.0;
    r10.y = ps;
    ps = UniformVector_6.x * r6.y;
    r6.w = dot(r2.zxy, r2.zxy);
    r12.x = ps;
    ps = rsqrt(abs(r6.w));
    r8.zw = r10.xy * abs(r8.xy);
    r6.w = ps;
    ps = rsqrt(abs(r6.x));
    r2.xyz = r6.www * r2.xzy;
    r6.x = ps;
    ps = 0.1 - -r2.y;
    r10.xyz = r6.xxx * r4.xyz;
    r6.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r4.xzw = r13.xyz * float3(-0.025, 0.5, 0.5);
    r6.w = ps;
    r8.xy = r10.xy * r4.xx + r7.xw;
    ps = 5.0 * r6.x;
    r7.x = r8.y * r6.w;
    r7.w = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r24.yw = -r7.xw + 1.0;
    r24.z = ps;
    ps = UniformVector_6.x * r6.z;
    r14.yzw = r24.xyz * UniformVector_2.yyx;
    r12.z = ps;
    ps = r14.w;
    r13 = r12 + r0.xyxy;
    ps = r8.x * ps;
    r12.xyz = r14.zxy - 0.5;
    r7.x = ps;
    ps = (-0.5) - -r7.x;
    r6.yzw = float3((r14.xzy >= 0.5));
    r6.x = ps;
    ps = r6.x;
    r12.yzw = r12.yzx - r14.xyz;
    ps = -r7.x + ps;
    r4.xy = float2((r7.xy >= float2(0.5, 0.004)));
    r6.x = ps;
    r12.x = r6.x * r4.x + r7.x;
    r12.yzw = r12.wyz * r6.zyw + r14.zxy;
    r14 = r12.zwxy + r12.zwxy;
    r12.xyz = tex2D(Texture2D_6, r8.xy).xyz;
    r19.yz = tex2D(ModShadowAccumTexture, r8.zw).xy;
    r23 = tex2D(Texture2D_1, r14.zw);
    r22 = tex2D(Texture2D_1, r14.xy);
    r25 = tex2D(Texture2D_4, r13.xy);
    r14 = tex2D(Texture2D_5, r13.zw);
    r26.xyz = tex2D(Texture2D_7, r11.xy).xyz;
    r17.yzw = tex2D(Texture2D_2, r0.wz).xwy;
    r16.xyw = tex2D(Texture2D_3, r0.xy).xzy;
    r8.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    r18.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = dot(r5.zxy, r5.zxy);
    r21.yzw = UniformVector_5.xyz * 2e+01;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r7.w = float((UniformScalar_8.x >= 1.0));
    r6.x = float((UniformScalar_8.x > 1.0));
    r9.xyz = r8.wxy * 2.0 - 1.0;
    ps = r16.y + r16.y;
    r13.xyz = r11.xyz * AmbientColorAndSkyFactor.xyz;
    r17.x = ps;
    r0.yz = r17.yw * 2.0 - 1.0;
    ps = r16.x + r16.x;
    r20.xyz = r15.xyz * UniformScalar_9.xxx;
    r17.y = ps;
    r16.xyz = (-abs(r6.xxx) >= 0.0) ? r26.xyz : 1.0;
    ps = r16.w + r16.w;
    r6.x = r9.w * r17.z;
    r17.z = ps;
    ps = (-1.0) - -r6.x;
    r14.xyz = r14.xyz * r14.www;
    r21.x = ps;
    r14.xyz = r25.xyz * r25.www + r14.xyz;
    r16.xyz = (-abs(r7.www) >= 0.0) ? 1.0 : r16.xyz;
    r20.xyz = r20.xyz * r16.xyz + UniformScalar_10.xxx;
    ps = r0.y;
    r14.xyz = r21.yzw * r14.xyz;
    ps = r4.z + ps;
    r21.w = r0.z + r4.w;
    r12.w = ps;
    ps = rsqrt(abs(r0.x));
    r7.w = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    r0.x = ps;
    ps = r7.w;
    r8.xyz = r0.xxx * r5.xyz;
    r21.yz = -r24.ww * ModShadowGroupColor.xy + 1.0;
    ps = -r14.x + ps;
    r0.x = dot(r6.yww, float3(1.0, 1.0, 1.0));
    r6.w = ps;
    r6.y = (r0.x == 0.0) ? r22.x : r22.y;
    r0.y = r6.z * 2.0 + r4.x;
    r6.z = (r0.y == 0.0) ? r23.x : r23.y;
    ps = r6.w;
    r0 = r0.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r6.y = (r0.y == 0.0) ? r22.z : r6.y;
    r6.z = (r0.z == 0.0) ? r23.z : r6.z;
    r17.w = (r0.w == 0.0) ? r23.w : r6.z;
    r6.z = (r0.x == 0.0) ? r22.w : r6.y;
    ps = r14.x + ps;
    r6.y = max(r6.z, 0.0);
    r5.x = saturate(ps);
    ps = 1.0 - r6.z;
    r19.x = min(r6.y, 0.3);
    r0.x = ps;
    ps = 2.5 * r0.x;
    r22 = r17 + float4(-1.0, -1.0, -1.0, 0.25);
    r6.z = ps;
    ps = r22.w;
    r5.yzw = r22.xzy * UniformVector_4.zyx;
    r6.yw = -r5.wz * r5.xx + r5.wz;
    ps = r17.w + ps;
    r19.yzw = r19.xyz * float3(3.3333333, 0.875, 0.875);
    r7.w = ps;
    r17.y = r19.y * r21.w + r6.w;
    r0.yzw = r19.yzw * r21.xyz + float3(1.0, 0.125, 0.125);
    ps = r7.w;
    r4.xz = -r5.xy + 1.0;
    r17.z = r4.z * r5.x + r5.y;
    ps = -r6.x + ps;
    r5.xyz = r20.xyz * r4.xxx;
    r19.x = saturate(ps);
    r6.w = saturate(r6.z * r0.y - 0.5);
    r12 = r19.xxxy * r12;
    r6.xz = r0.yz * r0.xw;
    r0.xyz = r6.zzz * r18.xyz + ModShadowColor.xyz;
    ps = r6.y;
    r6.x = float((r6.x > 0.9));
    ps = r12.w + ps;
    r14.xyz = r14.xzy * r6.xxx;
    r17.x = ps;
    r6.xyz = -r9.xyz + r17.zxy;
    r6.yz = r6.yz * r6.ww + r9.yz;
    r9.xyz = r14.xyz * r6.www + UniformVector_0.xzy;
    r14.xyz = r16.xzy * r15.xzy + r14.xyz;
    r6.x = r6.x * r6.w - 2.0;
    r6.x = r8.w * 2.0 + r6.x;
    r14.xyz = r14.xyz - r12.xzy;
    r12.xyz = r14.xyz * r6.www + r12.xzy;
    r9.xyz = r13.xyz * r12.xzy + r9.xzy;
    r6.xyz = r6.xyz * r7.zzz;
    ps = 1.0 + r6.x;
    r5.xyz = r5.xzy * r6.www;
    r6.w = ps;
    r6.xyz = (r7.zzz > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r7.xyz = r12.xzy * r11.xyz;
    r6.x = ps;
    r6.xyw = r6.yzw * r6.xxx;
    r6.z = dot(r6.wxy, r10.zxy);
    r11.xyz = r6.xyw * r6.zzz;
    r10.xyz = r11.xyz * 2.0 - r10.xyz;
    r6.z = saturate(dot(r2.yxz, r10.zxy));
    ps = log2(r6.z);
    r2.x = dot(r8.zxy, r6.wxy);
    r2.y = ps;
    r6.xyz = r2.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r6.z);
    r6.xy = r6.yx + 0.5;
    r6.z = ps;
    ps = abs(r6.y) * abs(r6.y);
    r2.xyz = r6.www * r1.xyz;
    r6.y = ps;
    ps = abs(r6.x) * abs(r6.x);
    r1.xyz = r6.zzz * r1.xzy;
    r6.x = ps;
    r8.xyz = r7.xzy * r6.yyy;
    r6.xyz = r7.xzy * r6.xxx;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r9.xzy;
    r6.xyz = r8.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r1.xyz * r5.xyz + r6.xzy;
    r6.xyz = r2.xyz * r7.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xzy * r0.xzy;
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
