// ps_e4f5c620e831d643.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 453 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000714 10041400 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_15 : register(c13); // float
float4 UniformScalar_16 : register(c14); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_20 : register(c18); // float
float4 UniformScalar_22 : register(c19); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.z = UniformScalar_22.x * 0.05;
    ps = r0.w - r0.x;
    r5.w = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = r0.z - r0.y;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r6.x));
    r5.xy = r5.xy * UniformScalar_6.xx;
    r6.x = ps;
    ps = rsqrt(abs(r5.w));
    r10.xyz = r6.xxx * r3.xyz;
    r5.w = ps;
    ps = r2.w;
    r9.xyz = r5.www * r1.xyz;
    ps = (-4e+02) + ps;
    r6.x = r9.z + 0.1;
    r6.y = ps;
    ps = 1.0 - r0.z;
    r6.xy = saturate(r6.xy * float2(5.0, 0.00022222222));
    r8.x = ps;
    ps = UniformScalar_1.x;
    r5.z = r5.z * r6.y;
    ps = UniformVector_3.x * ps;
    r5.zw = r10.xy * r5.zz;
    r8.y = ps;
    ps = 1.0 / UniformScalar_2.x;
    r11 = r5 + r0.xywz;
    r5.x = ps;
    ps = r11.z;
    r5.z = float((UniformScalar_17.x >= 1.0));
    r5.y = ps;
    ps = UniformScalar_18.x - r6.w;
    r13 = r0.wzwz * float4(18.0, 18.0, 3.0, 3.0);
    r8.z = ps;
    ps = r11.w;
    r1.xw = r8.yz * r5.xz;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r5.zw = r11.xy * UniformVector_5.xy;
    r8.y = ps;
    r1.y = r1.x * UniformScalar_3.x + r5.z;
    ps = UniformVector_1.x * r5.y;
    r3.yz = r8.xy * UniformVector_1.yy;
    r3.w = ps;
    ps = OpacityOverride.x;
    r3.x = r0.w * UniformVector_1.x;
    r8.w = saturate(ps);
    r12 = r3.wzxy - 0.5;
    r16 = float4((r3.wzxy >= 0.5));
    r12 = r12 - r3.wzxy;
    r3 = r12.xzwy * r16.xzwy + r3.wxyz;
    ps = UniformVector_6.y + r5.w;
    r3 = r3 + r3;
    r1.z = ps;
    r12.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r15 = tex2D(Texture2D_3, r3.yz);
    r19 = tex2D(Texture2D_3, r3.xw);
    r5 = tex2D(Texture2D_7, r1.yz);
    r17 = tex2D(Texture2D_6, r0.xy);
    r3 = tex2D(Texture2D_4, r13.zw);
    r14.xyz = tex2D(Texture2D_4, r13.xy).xyw;
    ps = r6.w;
    r8.xyz = UniformVector_4.xyz * 2e+01;
    r13.zw = r3.xy * 2.0 - 1.0;
    ps = 15.0 * ps;
    r5.xyz = r5.xyz * r5.www;
    r5.w = saturate(ps);
    ps = r17.w;
    r1.xyz = r8.xyz * r5.xyz;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r5.z = r1.w + r6.w;
    r5.y = ps;
    ps = -r5.z;
    r1 = r1.xyxz * float4(0.3, 1.0, 1.0, 1.0);
    ps = r6.z + ps;
    r18.xyz = r1.zyw * r5.yyy;
    r5.x = ps;
    ps = r14.x + r14.x;
    r1.w = max(r5.x, UniformScalar_19.x);
    r1.y = ps;
    r5.x = dot(r18.zy, float2(0.11, 0.59)) + 0.0;
    r5.x = dot(r1.zx, r5.yy) + r5.x;
    ps = r14.y + r14.y;
    r6.z = saturate(r5.x - r18.x);
    r1.z = ps;
    ps = 1.0 - r6.x;
    r8.x = dot(r16.zww, float3(1.0, 1.0, 1.0));
    r5.z = ps;
    ps = 1.0 - r6.z;
    r8.y = dot(r16.xyy, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r5.y = (r8.y == 0.0) ? r19.x : r19.y;
    r5.x = (r8.x == 0.0) ? r15.x : r15.y;
    ps = ModShadowGroupColor.x * r5.z;
    r16 = r8.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r8.x = ps;
    r5.x = (r16.y == 0.0) ? r15.z : r5.x;
    r5.y = (r16.z == 0.0) ? r19.z : r5.y;
    r13.y = (r16.w == 0.0) ? r19.w : r5.y;
    r5.x = (r16.x == 0.0) ? r15.w : r5.x;
    ps = ModShadowGroupColor.y * r5.z;
    r1.x = max(r5.x, 0.0);
    r8.y = ps;
    ps = 1.0 - r5.x;
    r5.yz = min(r1.xw, float2(0.3, 1.0));
    r1.x = ps;
    ps = 1.0 / UniformScalar_20.x;
    r13.x = r5.y * 3.3333333;
    r1.w = ps;
    ps = r5.z;
    r12.xyz = r12.zxy + r12.zxy;
    ps = r1.w * ps;
    r5.yz = -r13.yx + 1.0;
    r8.z = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r8 = -r8.wxyz + 1.0;
    r15.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r14.w = r8.w * r6.w;
    r15.y = ps;
    r5.x = dot(r5.ww, r5.yy) + r13.y;
    ps = r5.x;
    r7.zw = r15.xy * abs(r7.xy);
    ps = r13.y + ps;
    r5.xy = r14.zw * r3.wz;
    r1.w = ps;
    ps = r5.w;
    r3.xyz = r1.yzw + float3(-1.0, -1.0, 0.25);
    ps = r5.z * ps;
    r1.yz = r3.xy * 0.5;
    r1.w = ps;
    ps = (-1.0) - -r5.x;
    r13.xyz = r13.zxw + r1.ywz;
    r13.w = ps;
    ps = 1.0 - r5.w;
    r15.xyz = r13.wxy * r13.yyz;
    r1.w = ps;
    ps = 2.5 * r1.x;
    r1.y = r15.x + 1.0;
    r1.z = ps;
    r5.zw = r1.yz * r1.xy;
    r5.zw = r5.wz * r1.ww;
    ps = r0.w + r0.w;
    r1.xz = float2((r5.yw >= float2(0.05, 0.9)));
    r7.x = ps;
    ps = r0.z + r0.z;
    r6.w = -r1.x + 1.0;
    r7.y = ps;
    r0.x = (UniformScalar_18.x > 0.0) ? r6.w : 1.0;
    r12.w = (UniformScalar_18.x >= 0.0) ? r0.x : r6.w;
    ps = r11.z + r11.z;
    r14 = r12 + float4(-1.0, -1.0, -1.0, -0.5);
    r0.x = ps;
    ps = r11.w + r11.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r14.wwww)) clip(-1.0);
    r0.y = ps;
    r1.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r12.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    r19 = tex2D(Texture2D_2, r7.xy);
    r3.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = dot(r4.zxy, r4.zxy);
    r13.xyz = r17.xyz * UniformScalar_15.xxx + UniformScalar_16.xxx;
    r20.xyz = r11.zxy * 2.0 - 1.0;
    r11.yzw = r3.wxy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r16.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r6.w = ps;
    r4.xyz = r6.www * r4.xyz;
    r20.xyz = r20.xyz - r11.yzw;
    r11.x = r20.x * r19.w - 2.0;
    r11.yzw = r20.xyz * r19.www + r11.yzw;
    r6.w = float((r8.x >= 0.004));
    r0.w = saturate(r3.z - r5.x);
    r12.xyz = r0.www * r12.xyz;
    r20.xyz = -r12.xzy + r19.xzy;
    r12.xyz = r20.xyz * r19.www + r12.xzy;
    ps = (-0.5) + r5.z;
    r18.xyz = r18.xyz * r1.zzz;
    r5.z = saturate(ps);
    r5.xyw = r18.xyz * r5.zzz + UniformVector_0.xyz;
    r17.xyz = r18.xyz + r17.xyz;
    ps = r2.w;
    r17.xyz = r17.xyz - r12.xzy;
    r12.xyz = r17.xyz * r5.zzz + r12.xzy;
    r3.xyz = r16.xyz * r12.xyz + r5.xyw;
    ps = 0.0001 * ps;
    r14.xyz = r14.xzy * UniformVector_3.zyx;
    r14.w = saturate(ps);
    r5.xy = -r14.zy * r6.zz + r14.zy;
    ps = r13.x;
    r8.xw = -r14.xw + 1.0;
    ps = r6.x * ps;
    r5.xy = r5.xy + r15.yz;
    r1.z = ps;
    r5.w = r8.x * r6.z + r14.x;
    ps = r13.y;
    r5.xyw = -r11.yzw + r5.wxy;
    r11.yzw = r5.xyw * r5.zzz + r11.xzw;
    r11.x = r3.w * 2.0 + r11.y;
    ps = r6.x * ps;
    r11.xyw = r11.zwx * r8.www;
    r0.w = ps;
    ps = r13.z;
    r11.z = r11.w + 1.0;
    r5.xyw = (r8.www > 0.0) ? r11.xyz : float3(0.0, 0.0, 1.0);
    r11.xyz = (r8.www >= 0.0) ? r5.xyw : float3(0.0, 0.0, 1.0);
    ps = r6.x * ps;
    r5.x = dot(r11.zxy, r11.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r12.xyz * r0.xyz;
    r5.x = ps;
    ps = r1.z;
    r5.xyw = r11.xyz * r5.xxx;
    ps = r5.z * ps;
    r1.z = dot(r4.zxy, r5.wxy);
    r4.x = ps;
    ps = r6.y;
    r6.x = dot(r5.wxy, r10.zxy);
    ps = r5.z * ps;
    r6.xyz = r5.xyw * r6.xxx;
    r4.y = ps;
    ps = r0.w;
    r1 = r1.xyzz * float4(0.875, 0.875, -0.5, 0.5);
    r6.xyz = r6.xyz * 2.0 - r10.xyz;
    ps = r5.z * ps;
    r6.x = saturate(dot(r9.zxy, r6.zxy));
    r4.z = ps;
    r6.yz = r1.xy * r8.yz + 0.125;
    ps = ConstantLighting.x * r5.w;
    r1.yz = r1.zw + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r5.w;
    r1.zw = abs(r1.yz) * abs(r1.yz);
    r1.y = ps;
    ps = log2(r6.x);
    r5.z = r6.y * r6.z;
    r5.y = ps;
    r6.xyz = r5.zzz * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r5.y;
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
    r5.xyz = r5.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.w + r2.w;
    r5.xyz = r0.xyz * r6.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
