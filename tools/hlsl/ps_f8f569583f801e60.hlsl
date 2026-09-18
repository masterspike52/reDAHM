// ps_f8f569583f801e60.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 432 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006C0 10041600 0000080A 00000000 00008108 003F00FF 00000021 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 - r0.z;
    r13.w = ps;
    ps = -r7.w;
    r6.x = UniformScalar_8.x * 0.05;
    ps = UniformScalar_4.x + ps;
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
    r6.z = r10.z + 0.1;
    r6.y = ps;
    ps = r0.w;
    r18.xw = saturate(r6.zy * float2(5.0, 0.00022222222));
    ps = 18.0 * ps;
    r6.y = r6.x * r18.w;
    r6.x = ps;
    r13.yz = r11.xy * r6.yy + r0.wz;
    ps = r0.z;
    r13.x = -r13.z + 1.0;
    ps = 18.0 * ps;
    r12.yzw = r13.wxy * UniformVector_1.yyx;
    r6.y = ps;
    ps = UniformVector_1.x * r0.w;
    r16.xyz = UniformVector_4.xyz * 2e+01;
    r12.x = ps;
    ps = r0.w;
    r2 = r12.wzxy - 0.5;
    ps = 3.0 * ps;
    r9 = float4((r12.wzxy >= 0.5));
    r6.z = ps;
    ps = r0.z;
    r2 = r2 - r12.wzxy;
    r2 = r2.zwxy * r9.zwxy + r12.xywz;
    ps = 3.0 * ps;
    r4 = r2.xywz + r2.xywz;
    r6.w = ps;
    r14 = tex2D(Texture2D_8, r0.xy);
    r21 = tex2D(Texture2D_4, r6.zw);
    r22.xyz = tex2D(Texture2D_4, r6.xy).xyw;
    r2 = tex2D(Texture2D_3, r4.xy);
    r12 = tex2D(Texture2D_6, r0.xy);
    r15.xyz = tex2D(Texture2D_5, r0.xy).zxy;
    ps = r0.w + r0.w;
    r6.w = float((UniformScalar_3.x >= 1.0));
    r6.x = ps;
    ps = r0.z + r0.z;
    r12.xyz = r12.xyz * r12.www;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r16.xyz = r16.xyz * r12.xyz;
    r0.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = dot(r16.zxy, float3(0.11, 0.3, 0.59));
    r0.y = ps;
    r6.w = r11.w * r6.w + r7.w;
    ps = -r6.w;
    r8.xy = r0.xy * abs(r8.xy);
    ps = r7.z + ps;
    r12.w = dot(r9.xyy, float3(1.0, 1.0, 1.0));
    r6.w = ps;
    ps = r6.w;
    r12.z = dot(r9.zww, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    r6.w = (r12.z == 0.0) ? r2.x : r2.y;
    ps = UniformScalar_5.x;
    r9 = r12.zwwz + float4(-3.0, -2.0, -3.0, -2.0);
    r0.w = ps;
    r6.w = (r9.w == 0.0) ? r2.z : r6.w;
    r0.y = (r9.x == 0.0) ? r2.w : r6.w;
    ps = max(r0.z, r0.w);
    r0.x = max(r0.y, 0.0);
    r0.z = ps;
    ps = 1.0 / UniformScalar_6.x;
    r0.xw = min(r0.zx, float2(1.0, 0.3));
    r6.w = ps;
    ps = r15.x + r15.x;
    r0.z = saturate(r0.x * r6.w);
    r15.x = ps;
    ps = r6.z;
    r2.zw = -r0.yz + 1.0;
    ps = -r16.x + ps;
    r22.w = r2.w * r7.w;
    r6.z = ps;
    ps = r6.z;
    r2.xy = r22.zw * r21.wz;
    ps = r16.x + ps;
    r18.z = float((r2.y >= 0.05));
    r18.y = saturate(ps);
    ps = r15.y + r15.y;
    r0.xyz = -r18.zyx + 1.0;
    r15.y = ps;
    r6.z = (UniformScalar_4.x > 0.0) ? r0.x : 1.0;
    r6.z = (UniformScalar_4.x >= 0.0) ? r6.z : r0.x;
    ps = r15.z + r15.z;
    r15.w = r6.z * r14.w;
    r15.z = ps;
    ps = r13.y + r13.y;
    r17 = r15 + float4(-1.0, -1.0, -1.0, -0.5);
    r6.z = ps;
    ps = r13.z + r13.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r17.wwww)) clip(-1.0);
    r6.w = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r15.xyz = tex2D(Texture2D_7, r6.zw).xyz;
    r8 = tex2D(Texture2D_3, r4.wz);
    r20 = tex2D(Texture2D_2, r6.xy);
    r4.xyz = tex2D(Texture2D_0, r6.zw).zxy;
    r13.xyz = tex2D(Texture2D_1, r6.xy).xyz;
    ps = OpacityOverride.x;
    r17.w = saturate(r3.w * 0.0001);
    r9.x = saturate(ps);
    ps = r7.w;
    r6.w = dot(r5.zxy, r5.zxy);
    ps = 15.0 * ps;
    r6.xyz = -UniformVector_0.zxy + 1.0;
    r9.w = saturate(ps);
    r19.xyz = r14.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    r21.zw = r21.xy * 2.0 - 1.0;
    r13.xyz = r13.zxy * 2.0 - 1.0;
    r7.xzw = r4.xyz * 2.0 - 1.0;
    ps = r22.x + r22.x;
    r13.yzw = r13.xyz - r7.xzw;
    r7.y = ps;
    r13.x = r13.y * r20.w - 2.0;
    r13.yzw = r13.yzw * r20.www + r7.xzw;
    r7.x = (r12.w == 0.0) ? r8.x : r8.y;
    r7.x = (r9.y == 0.0) ? r8.z : r7.x;
    r21.y = (r9.z == 0.0) ? r8.w : r7.x;
    ps = r22.y + r22.y;
    r21.x = r0.w * 3.3333333;
    r7.z = ps;
    ps = rsqrt(abs(r6.w));
    r7.xw = -r21.yx + 1.0;
    r6.w = ps;
    ps = r9.w;
    r5.xyz = r6.www * r5.xyz;
    r6.w = dot(r9.ww, r7.xx) + r21.y;
    ps = r7.w * ps;
    r7.x = r6.w + r21.y;
    r8.z = ps;
    ps = (-1.0) - -r2.x;
    r7.xyz = r7.yzx + float3(-1.0, -1.0, 0.25);
    r8.w = ps;
    ps = 0.5 * r7.x;
    r6.w = saturate(r7.z - r2.x);
    r8.x = ps;
    ps = 0.5 * r7.y;
    r15.xyz = r6.www * r15.xyz;
    r8.y = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r8.xyz = r21.zxw + r8.xzy;
    r9.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r7.xyz = -r15.xzy + r20.xzy;
    r9.z = ps;
    r15.xyz = r7.xyz * r20.www + r15.xzy;
    r2.x = r8.w * r8.y + 1.0;
    ps = 2.5 * r2.z;
    r9 = -r9.wxyz + 1.0;
    r2.y = ps;
    ps = r19.x;
    r6.w = float((r9.y >= 0.004));
    ps = r0.y * ps;
    r7.xy = r2.xy * r2.zx;
    r2.x = ps;
    ps = r19.y;
    r7.xw = r7.xy * r9.xx;
    ps = r0.y * ps;
    r17.xyz = r17.xzy * UniformVector_3.zyx;
    r2.y = ps;
    ps = r19.z;
    r7.z = float((r7.x >= 0.9));
    r7.xy = -r17.zy * r18.yy + r17.zy;
    ps = r0.y * ps;
    r7.w = saturate(r7.w - 0.5);
    r2.z = ps;
    r7.xy = r8.xy * r8.yz + r7.xy;
    r0.xw = -r17.xw + 1.0;
    r16.xyz = r16.xyz * r7.zzz;
    r8.xyz = r16.xyz * r7.www + UniformVector_0.xyz;
    r7.z = r0.x * r18.y + r17.x;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r14.yzw = r16.xyz + r14.xyz;
    r14.x = ps;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r16.xyz = r14.yzw - r15.xzy;
    r14.y = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r7.xyz = -r13.yzw + r7.zxy;
    r14.z = ps;
    r0.xyz = r16.xyz * r7.www + r15.xzy;
    r8.xyz = r14.xyz * r0.xyz + r8.xyz;
    r4.yzw = r7.xyz * r7.www + r13.xzw;
    r4.x = r4.x * 2.0 + r4.y;
    r7.xyz = r4.xzw * r0.www;
    ps = 1.0 + r7.x;
    r4.xyz = r2.xzy * r7.www;
    r7.w = ps;
    r7.xyz = (r0.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.xyz = (r0.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r7.w = dot(r7.zxy, r7.zxy);
    ps = rsqrt(abs(r7.w));
    r0.xyz = r0.xyz * r6.yzx;
    r6.x = ps;
    r7.xyz = r7.xyz * r6.xxx;
    r2.xyz = r7.zzz * r1.xyz;
    r12.z = dot(r5.zxy, r7.zxy);
    ps = -ModShadowColor.x;
    r6.x = dot(r7.zxy, r11.zxy);
    ps = 1.0 + ps;
    r6.xyz = r7.xyz * r6.xxx;
    r7.x = ps;
    ps = -ModShadowColor.y;
    r5 = r12.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r6.xyz = r6.xyz * 2.0 - r11.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r10.zxy, r6.zxy));
    r7.y = ps;
    r6.yz = r5.xy * r9.zw + 0.125;
    ps = -ModShadowColor.z;
    r7.zw = r5.zw + 0.5;
    ps = 1.0 + ps;
    r5.xy = abs(r7.zw) * abs(r7.zw);
    r7.z = ps;
    ps = log2(r6.x);
    r6.y = r6.y * r6.z;
    r6.x = ps;
    r7.xyz = r6.yyy * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r9.xyz = r0.xzy * r5.yyy;
    r7.w = ps;
    r6.xyz = r9.xyz * UpperSkyColor.xzy + r8.xzy;
    ps = pow(2.0, r7.w);
    r5.xyz = r0.xzy * r5.xxx;
    r7.w = ps;
    r1.xyz = r7.www * r1.xzy;
    r6.xyz = r5.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r1.xyz * r4.xyz + r6.xzy;
    r6.xyz = r2.xyz * r0.xyz + r6.xzy;
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
