// ps_f4488f136a5b8272.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 438 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006D8 10041700 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c22); // float4
float4 ConstantLighting : register(c23); // float3
float4 LowerSkyColor : register(c21); // float3
float4 ModShadowAccumResolution : register(c26); // float2
float4 ModShadowColor : register(c24); // float3
float4 ModShadowGroupColor : register(c25); // float3
float4 OpacityOverride : register(c19); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_14 : register(c17); // float
float4 UniformScalar_16 : register(c18); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c20); // float3
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

    r1.w = UniformScalar_16.x * 0.05;
    r5.w = UniformScalar_3.x * UniformVector_4.x;
    ps = r2.w;
    r5.yz = r0.xy * UniformVector_2.xy;
    ps = (-4e+02) + ps;
    r8 = r0.wzwz * float4(18.0, 18.0, 3.0, 3.0);
    r5.x = ps;
    ps = 0.00022222222 * r5.x;
    r7.w = r5.w * UniformScalar_4.x;
    r5.w = saturate(ps);
    ps = floor(r7.w);
    r5.x = dot(r3.zxy, r3.zxy);
    r9.x = ps;
    ps = rsqrt(abs(r5.x));
    r5.w = r1.w * r5.w;
    r5.x = ps;
    ps = 1.0 / UniformScalar_1.x;
    r9.yzw = r5.xxx * r3.xyz;
    r5.x = ps;
    r3.xyz = r9.zyx * r5.wwx + r0.zwx;
    ps = 1.0 - r3.x;
    r10.x = r0.w * UniformVector_1.x;
    r7.w = ps;
    ps = 1.0 - r0.z;
    r5.w = dot(r1.zxy, r1.zxy);
    r7.z = ps;
    ps = UniformVector_1.x * r3.y;
    r10.yz = r7.zw * UniformVector_1.yy;
    r10.w = ps;
    ps = r0.w + r0.w;
    r11 = r10.wzxy - 0.5;
    r7.z = ps;
    ps = r0.z + r0.z;
    r22 = float4((r10.wzxy >= 0.5));
    r7.w = ps;
    ps = r3.y + r3.y;
    r11 = r11 - r10.wzxy;
    r20.x = ps;
    r10 = r11.xzwy * r22.xzwy + r10.wxyz;
    ps = r3.x + r3.x;
    r10 = r10 + r10;
    r20.y = ps;
    r14 = tex2D(Texture2D_9, r5.yz);
    r19 = tex2D(Texture2D_2, r7.zw);
    r18 = tex2D(Texture2D_3, r10.yz);
    r23 = tex2D(Texture2D_3, r10.xw);
    r16.y = tex2D(Texture2D_6, r5.yz).x;
    r5.xyz = tex2D(Texture2D_5, r5.yz).xyz;
    r15.xyz = tex2D(Texture2D_4, r8.xy).xyw;
    r13 = tex2D(Texture2D_4, r8.zw);
    r10.xyw = tex2D(Texture2D_0, r20.xy).xyz;
    r8.xyw = tex2D(Texture2D_1, r7.zw).xyz;
    r16.z = saturate(r6.w * 15.0);
    r16.w = float((UniformScalar_11.x >= 1.0));
    r17.xyz = r8.wxy * 2.0 - 1.0;
    r21.xyz = r10.wxy * 2.0 - 1.0;
    r7.zw = r13.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r13.xy = r15.xy + r15.xy;
    r5.w = ps;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    ps = UniformScalar_12.x - r6.w;
    r10.xyz = r5.www * r1.xyz;
    r1.w = ps;
    ps = UniformVector_4.z * r5.x;
    r5.w = r10.z + 0.1;
    r1.x = ps;
    ps = UniformVector_4.x * r5.y;
    r16.x = saturate(r5.w * 5.0);
    r1.y = ps;
    ps = UniformVector_4.y * r5.z;
    r11.xyz = -r16.zxy + 1.0;
    r1.z = ps;
    r12.xzw = r1.wyz * r16.wyy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xy = r11.yy * ModShadowGroupColor.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r12.x + r6.w;
    r5.z = ps;
    ps = -r5.x;
    r20.zw = r5.yz * abs(r7.xy);
    ps = r6.z + ps;
    r7.x = dot(r22.zww, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r7.y = dot(r22.xyy, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    r5.w = (r7.y == 0.0) ? r23.x : r23.y;
    r5.x = (r7.x == 0.0) ? r18.x : r18.y;
    ps = UniformScalar_13.x;
    r22 = r7.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r5.z = ps;
    r5.x = (r22.y == 0.0) ? r18.z : r5.x;
    r5.w = (r22.z == 0.0) ? r23.z : r5.w;
    r7.y = (r22.w == 0.0) ? r23.w : r5.w;
    r5.x = (r22.x == 0.0) ? r18.w : r5.x;
    ps = max(r5.y, r5.z);
    r5.w = -r5.x + 1.0;
    r5.y = ps;
    ps = 2.5 * r5.w;
    r5.x = max(r5.x, 0.0);
    r5.z = ps;
    ps = 1.0 / UniformScalar_14.x;
    r5.xy = min(r5.xy, float2(0.3, 1.0));
    r3.w = ps;
    ps = 3.3333333 * r5.x;
    r8.w = saturate(r5.y * r3.w);
    r7.x = ps;
    ps = r7.x;
    r17.xyz = r17.xyz - r21.xyz;
    r5.x = ps;
    ps = 0.0001 * r2.w;
    r0.w = dot(r4.zxy, r4.zxy);
    r8.z = saturate(ps);
    ps = 1.0 - r5.x;
    r8 = -r8.wxyz + 1.0;
    r5.x = ps;
    ps = 1.0 - r7.y;
    r15.w = r8.x * r6.w;
    r5.y = ps;
    r5.y = dot(r16.zz, r5.yy) + r7.y;
    ps = r5.y;
    r17.xyz = r17.xyz * r19.www;
    ps = r7.y + ps;
    r6.xy = r15.zw * r13.wz;
    r13.z = ps;
    ps = r16.z;
    r15.xyz = r13.xzy + float3(-1.0, 0.25, -1.0);
    ps = r5.x * ps;
    r13.xy = r15.xz * 0.5;
    r13.z = ps;
    ps = (-1.0) - -r6.x;
    r18.xyz = r7.zxw + r13.xzy;
    r18.w = ps;
    r5.x = r18.w * r18.y + 1.0;
    r6.zw = r5.xz * r5.wx;
    ps = OpacityOverride.x;
    r13.xz = float2((r6.yz >= float2(0.05, 0.9)));
    r13.y = saturate(ps);
    r7.xw = -r13.xy + 1.0;
    r5.x = (UniformScalar_12.x > 0.0) ? r7.x : 1.0;
    r5.x = (UniformScalar_12.x >= 0.0) ? r5.x : r7.x;
    r17.w = r5.x * r14.w;
    ps = r0.y;
    r5.xw = r17.wx + float2(-0.5, -2.0);
    ps = UniformScalar_8.x + ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r3.w = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r20.zw).xy;
    r0.xyz = tex2D(Texture2D_8, r20.xy).xyz;
    r20 = tex2D(Texture2D_7, r3.zw);
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r22.xyz = UniformVector_5.xyz * 2e+01;
    r5.xyz = -UniformVector_0.zxy + 1.0;
    r3.xyw = r14.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = rsqrt(abs(r0.w));
    r20.xyz = r20.xyz * r20.www;
    r0.w = ps;
    r4.xyz = r0.www * r4.xyz;
    r20.xyz = r22.xyz * r20.xyz;
    ps = (-1.0) - -r1.x;
    r17.xyz = r21.xyz + r17.xyz;
    r20.w = ps;
    ps = AmbientColorAndSkyFactor.x * r5.y;
    r16 = r20 * r16.yyyy;
    r15.x = ps;
    ps = AmbientColorAndSkyFactor.y * r5.z;
    r6.x = saturate(r15.y - r6.x);
    r15.y = ps;
    ps = AmbientColorAndSkyFactor.z * r5.x;
    r0.xyz = r6.xxx * r0.xyz;
    r15.z = ps;
    ps = -r17.x;
    r1.xyz = -r0.xzy + r19.xzy;
    r0.xyz = r1.xyz * r19.www + r0.xzy;
    r1.xy = r18.xy * r18.yz + r12.zw;
    ps = r16.w + ps;
    r1.xy = r1.xy - r17.yz;
    r6.x = ps;
    r6.z = saturate(r6.w * r11.x - 0.5);
    r1.yz = r1.xy * r6.zz + r17.yz;
    ps = 1.0 + r6.x;
    r13.xyz = r16.xyz * r13.zzz;
    r13.w = ps;
    ps = r3.x;
    r16.xyz = r13.xyz + r14.xyz;
    ps = r11.z * ps;
    r6.x = float((r7.w >= 0.004));
    r0.w = ps;
    r14.xyz = r13.xyz * r6.zzz + UniformVector_0.xyz;
    ps = r3.y;
    r16.xyz = r16.xyz - r0.xzy;
    r0.xyz = r16.xyz * r6.zzz + r0.xzy;
    r3.xyz = r15.xyz * r0.xyz + r14.xyz;
    r5.w = r13.w * r6.z + r5.w;
    r1.x = r10.w * 2.0 + r5.w;
    ps = r11.z * ps;
    r1.xyw = r1.yzx * r8.www;
    r6.y = ps;
    ps = r3.w;
    r1.z = r1.w + 1.0;
    r1.xyz = (r8.www > 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    r1.xyz = (r8.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    ps = r11.z * ps;
    r5.w = dot(r1.zxy, r1.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r5.w));
    r0.xyz = r0.xyz * r5.yzx;
    r5.x = ps;
    ps = r0.w;
    r5.xyw = r1.xyz * r5.xxx;
    ps = r6.z * ps;
    r12.z = dot(r4.zxy, r5.wxy);
    r4.x = ps;
    ps = r6.w;
    r5.z = dot(r5.wxy, r9.wyz);
    ps = r6.z * ps;
    r11.xyz = r5.xyw * r5.zzz;
    r4.y = ps;
    ps = r6.y;
    r1 = r12.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r9.xyz = r11.xyz * 2.0 - r9.yzw;
    ps = r6.z * ps;
    r6.y = saturate(dot(r10.zxy, r9.zxy));
    r4.z = ps;
    r6.zw = r1.xy * r8.yz + 0.125;
    ps = ConstantLighting.x * r5.w;
    r1.yz = r1.zw + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r5.w;
    r1.zw = abs(r1.yz) * abs(r1.yz);
    r1.y = ps;
    ps = log2(r6.y);
    r5.z = r6.z * r6.w;
    r5.x = ps;
    r6.yzw = r5.zzz * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r5.x;
    r7.xyz = r0.xzy * r1.zzz;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r8.xyz = r0.xzy * r1.www;
    r5.z = ps;
    r3.xyz = r8.xyz * UpperSkyColor.xzy + r3.xzy;
    r3.xyz = r7.xzy * LowerSkyColor.xyz + r3.xzy;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r5.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r5.xyz = r7.xyz * r4.xyz + r3.xzy;
    r5.xyz = r1.xyz * r0.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.x + r2.w;
    r5.xyz = r0.xyz * r6.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
