// ps_cc211b6902d93e5c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 465 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000744 10041600 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c19); // float4
float4 LightMapScale : register(c20); // float3
float4 LowerSkyColor : register(c18); // float3
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 OpacityOverride : register(c16); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_6 : register(c9); // float
float4 UniformScalar_7 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c17); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = -r7.w;
    r6.y = UniformScalar_13.x * 0.05;
    ps = UniformScalar_9.x + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r11.w = ps;
    ps = rsqrt(abs(r6.w));
    r6.z = dot(r2.zxy, r2.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r11.xyz = r6.www * r4.xyz;
    r6.z = ps;
    ps = r3.w;
    r10.xyz = r6.zzz * r2.xyz;
    ps = (-4e+02) + ps;
    r6.w = r10.z + 0.1;
    r6.z = ps;
    ps = r1.w;
    r9.yz = saturate(r6.wz * float2(5.0, 0.00022222222));
    ps = 18.0 * ps;
    r6.y = r6.y * r9.z;
    r2.x = ps;
    r12.yz = r11.xy * r6.yy + r1.wz;
    ps = 1.0 - r1.z;
    r16.w = saturate(r7.w * 15.0);
    r12.w = ps;
    ps = r1.z;
    r12.x = -r12.z + 1.0;
    ps = 18.0 * ps;
    r6.yzw = r12.wxy * UniformVector_1.yyx;
    r2.y = ps;
    ps = UniformVector_1.x * r1.w;
    r21.xyz = UniformVector_4.xzy * 2e+01;
    r6.x = ps;
    ps = r1.w;
    r4 = r6.wzxy - 0.5;
    ps = 3.0 * ps;
    r18 = float4((r6.wzxy >= 0.5));
    r2.z = ps;
    ps = r1.z;
    r4 = r4 - r6.wzxy;
    r6 = r4.zwxy * r18.zwxy + r6.xywz;
    ps = 3.0 * ps;
    r6 = r6.xywz + r6.xywz;
    r2.w = ps;
    r15 = tex2D(Texture2D_9, r1.xy);
    r4.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r13 = tex2D(Texture2D_3, r6.xy);
    r19 = tex2D(Texture2D_3, r6.wz);
    r6 = tex2D(Texture2D_4, r2.zw);
    r17.xyz = tex2D(Texture2D_4, r2.xy).xyw;
    r16.x = saturate(r3.w * 0.0001);
    ps = r17.x + r17.x;
    r0.z = float((UniformScalar_8.x >= 1.0));
    r2.x = ps;
    r14.zw = r6.xy * 2.0 - 1.0;
    r0.z = r11.w * r0.z + r7.w;
    ps = r17.y + r17.y;
    r2.z = dot(r18.zww, float3(1.0, 1.0, 1.0));
    r2.y = ps;
    ps = -r0.z;
    r2.w = dot(r18.xyy, float3(1.0, 1.0, 1.0));
    r0.z = (r2.w == 0.0) ? r19.x : r19.y;
    r0.w = (r2.z == 0.0) ? r13.x : r13.y;
    ps = r7.z + ps;
    r18 = r2.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r7.x = ps;
    r7.y = (r18.y == 0.0) ? r13.z : r0.w;
    r0.z = (r18.z == 0.0) ? r19.z : r0.z;
    r14.y = (r18.w == 0.0) ? r19.w : r0.z;
    r9.x = (r18.x == 0.0) ? r13.w : r7.y;
    ps = r9.x;
    r0.z = max(r7.x, UniformScalar_10.x);
    r2.z = ps;
    ps = 0.0;
    r7.xy = -r9.xy + 1.0;
    r2.w = ps;
    ps = max(r2.z, r2.w);
    r16.yz = r7.yy * ModShadowGroupColor.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = min(r0.zw, float2(1.0, 0.3));
    r2.z = ps;
    ps = 1.0 / UniformScalar_11.x;
    r14.x = r6.y * 3.3333333;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = saturate(r6.x * r0.z);
    r2.w = ps;
    ps = 1.0 - r6.x;
    r13.xyz = r4.zxy + r4.zxy;
    r0.z = ps;
    ps = r0.z;
    r4.xy = r2.zw * abs(r8.xy);
    ps = r7.w * ps;
    r6.xy = -r14.xy + 1.0;
    r17.w = ps;
    r7.z = dot(r16.ww, r6.yy) + r14.y;
    ps = r7.z;
    r9 = -r16.wxyz + 1.0;
    ps = r14.y + ps;
    r6.yw = r17.zw * r6.wz;
    r2.z = ps;
    ps = r16.w;
    r2.xyz = r2.xyz + float3(-1.0, -1.0, 0.25);
    ps = r6.x * ps;
    r8.xy = r2.xy * 0.5;
    r8.z = ps;
    ps = (-1.0) - -r6.y;
    r8.xyz = r14.zxw + r8.xzy;
    r8.w = ps;
    r2.xyw = r8.wxy * r8.yyz;
    ps = 2.5 * r7.x;
    r7.z = r2.x + 1.0;
    r7.w = ps;
    r6.xz = r7.zw * r7.xz;
    r6.xz = r6.zx * r9.xx;
    ps = OpacityOverride.x;
    r19.xz = float2((r6.wz >= float2(0.05, 0.9)));
    r19.y = saturate(ps);
    ps = r1.w + r1.w;
    r7.xy = -r19.yx + 1.0;
    r7.z = ps;
    r7.w = (UniformScalar_9.x > 0.0) ? r7.y : 1.0;
    r7.w = (UniformScalar_9.x >= 0.0) ? r7.w : r7.y;
    ps = r1.z + r1.z;
    r13.w = r7.w * r15.w;
    r7.w = ps;
    ps = r12.y + r12.y;
    r17 = r13.wxyz + float4(-0.5, -1.0, -1.0, -1.0);
    r0.z = ps;
    ps = r12.z + r12.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r17.xxxx)) clip(-1.0);
    r0.w = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r13.xyz = tex2D(Texture2D_8, r0.zw).xyz;
    r4.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r16 = tex2D(Texture2D_2, r7.zw);
    r8 = tex2D(Texture2D_7, r1.xy);
    r1 = tex2D(Texture2D_6, r1.xy).xzyw;
    r0.xyw = tex2D(Texture2D_0, r0.zw).xyz;
    r14.xyz = tex2D(Texture2D_1, r7.zw).xyz;
    r7.z = dot(r5.zxy, r5.zxy);
    r18.xyz = r15.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r20.xyz = r14.zxy * 2.0 - 1.0;
    r14.yzw = r0.wxy * 2.0 - 1.0;
    ps = r1.x * r1.w;
    r22.xyz = UniformVector_5.xzy * 2e+01;
    r1.x = ps;
    ps = r1.y * r1.w;
    r8.xyz = r8.xzy * r8.www;
    r1.y = ps;
    ps = r1.z * r1.w;
    r8.xyz = r22.xyz * r8.xyz;
    r1.z = ps;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r1.xyz = r21.xyz * r1.xyz;
    r7.w = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r20.xyz = r20.xyz - r14.yzw;
    r0.z = ps;
    r14.x = r20.x * r16.w - 2.0;
    r14.yzw = r20.xyz * r16.www + r14.yzw;
    r1.xyz = (-abs(r0.zzz) >= 0.0) ? r8.xyz : r1.xyz;
    r1.xyz = (-abs(r7.www) >= 0.0) ? r8.xyz : r1.xyz;
    r7.w = dot(r1.yxz, float3(0.11, 0.3, 0.59));
    r7.w = r7.w - r1.x;
    ps = rsqrt(abs(r7.z));
    r17.x = saturate(r7.w + r1.x);
    r7.z = ps;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r4.xyz = r4.xyz * LightMapScale.xyz;
    r8.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r5.xyz = r7.zzz * r5.xyz;
    r13.w = saturate(dot(r1.zyx, float3(0.59, 0.11, 0.3)));
    ps = (-0.5) + r6.x;
    r1.xyz = r19.zzz * r1.xzy;
    r1.w = saturate(ps);
    r7.yzw = r1.xyz * r1.www + UniformVector_0.xyz;
    r15.xyz = r1.xyz + r15.xyz;
    ps = r2.z;
    r7.x = float((r7.x >= 0.004));
    ps = -r6.y + ps;
    r17.yzw = r17.ywz * UniformVector_3.zyx;
    r6.y = saturate(ps);
    r1.xy = -r17.wz * r13.ww + r17.wz;
    ps = r1.x;
    r6.zw = -r17.xy + 1.0;
    ps = r2.y + ps;
    r18.xyz = r18.xyz * r6.zzz;
    r6.x = ps;
    ps = r1.y;
    r2.xyz = r18.xzy * r1.www;
    ps = r2.w + ps;
    r13 = r6.yyyw * r13;
    r6.y = ps;
    ps = r17.y;
    r1.xyz = -r13.xzy + r16.xzy;
    r1.xyz = r1.xyz * r16.www + r13.xzy;
    ps = r13.w + ps;
    r13.xyz = r15.xyz - r1.xzy;
    r6.z = ps;
    r6.xyz = -r14.yzw + r6.zxy;
    r6.yzw = r6.xyz * r1.www + r14.xzw;
    r1.xyz = r13.xyz * r1.www + r1.xzy;
    r7.yzw = r8.xyz * r1.xyz + r7.yzw;
    r6.x = r0.w * 2.0 + r6.y;
    r6.xyz = r6.xzw * r9.yyy;
    ps = 1.0 + r6.x;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r9.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r9.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r0.xyz = r1.xyz * r0.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r1.xyz = r4.xzy * r6.www;
    r12.z = dot(r5.zxy, r6.wyz);
    r6.x = dot(r6.wyz, r11.zxy);
    r6.xyz = r6.yzw * r6.xxx;
    r5 = r12.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r6.xyz = r6.xyz * 2.0 - r11.xyz;
    r6.y = saturate(dot(r10.zxy, r6.zxy));
    r6.xz = r5.xy * r9.zw + 0.125;
    r5.xy = r5.zw + 0.5;
    r5.xy = abs(r5.xy) * abs(r5.xy);
    ps = log2(r6.y);
    r6.x = r6.x * r6.z;
    r6.y = ps;
    r6.xzw = r6.xxx * r8.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.y;
    r8.xyz = r0.xzy * r5.yyy;
    r6.y = ps;
    r7.yzw = r8.xyz * UpperSkyColor.xzy + r7.ywz;
    ps = pow(2.0, r6.y);
    r5.xyz = r0.xzy * r5.xxx;
    r6.y = ps;
    r4.xyz = r4.xzy * r6.yyy;
    r7.yzw = r5.xzy * LowerSkyColor.xyz + r7.ywz;
    r7.yzw = r4.xyz * r2.xyz + r7.ywz;
    r7.yzw = r1.xzy * r0.xyz + r7.ywz;
    ps = -r3.w;
    r6.xyz = r7.yzw * r6.xzw;
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
