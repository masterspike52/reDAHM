// ps_6048ae210ac52d17.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 315 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004EC 10041000 0000070A 00000000 000068E7 001F007F 00000001 00003050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 ModShadowAccumResolution : register(c29); // float2
float4 ModShadowColor : register(c27); // float3
float4 ModShadowGroupColor : register(c28); // float3
float4 OpacityOverride : register(c26); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c14); // float
float4 UniformScalar_1 : register(c15); // float
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_19 : register(c18); // float
float4 UniformScalar_23 : register(c19); // float
float4 UniformScalar_24 : register(c20); // float
float4 UniformScalar_25 : register(c21); // float
float4 UniformScalar_26 : register(c22); // float
float4 UniformScalar_27 : register(c23); // float
float4 UniformScalar_28 : register(c24); // float
float4 UniformScalar_29 : register(c25); // float
float4 UniformScalar_6 : register(c16); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_4 : register(c9); // float4
float4 UniformVector_5 : register(c10); // float4
float4 UniformVector_6 : register(c11); // float4
float4 UniformVector_7 : register(c12); // float4
float4 UniformVector_8 : register(c13); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
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
    float4 r6 = In.color1;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r2.w;
    r4.x = UniformScalar_12.x * 1.09;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.zw = r0.zz * ScreenPositionScaleBias.xy;
    r8.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r16.xyz = UniformVector_4.xyz * UniformVector_4.xyz;
    r8.x = ps;
    r8 = r8.zwxy * abs(r7.xyxy);
    r0.zw = r8.xy + ScreenPositionScaleBias.wz;
    r11.zw = r0.zw * 0.5;
    r0.zw = r11.zw + 0.5;
    r7.xy = r4.xx * r0.zw + UniformVector_6.xy;
    r4 = r0.zwzw * float4(1.09, 1.09, 1.0, 1.0);
    r7.zw = r4.xy * UniformScalar_12.xx + UniformVector_6.xy;
    r8.xy = r4.zw * UniformScalar_12.xx + UniformVector_7.xy;
    r4.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r10.zw = tex2D(ModShadowAccumTexture, r8.zw).xy;
    r4.w = tex2D(Texture2D_2, r8.xy).x;
    r8.y = tex2D(Texture2D_1, r7.zw).x;
    r8.z = tex2D(Texture2D_1, r7.xy).x;
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r12 = r5.yxzw * 2.0 - 1.0;
    r6.xyz = r6.xyz * 2.0 - 1.0;
    r5.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r5.x));
    r8.x = UniformScalar_19.x * 0.5;
    r5.x = ps;
    r9.w = r5.x * r1.z;
    r7.xyz = UniformVector_2.xyz * UniformScalar_1.xxx;
    r1.xyz = UniformVector_1.xzy * UniformScalar_0.xxx;
    r6.w = dot(r3.zxy, r3.zxy);
    r5.xyz = r9.xyz + r9.xyz;
    r5.w = dot(r6.zxy, r6.zxy);
    r0.x = dot(r12.zyx, r12.zyx);
    ps = rsqrt(abs(r0.x));
    r8.zw = r4.ww + r8.yz;
    r0.x = ps;
    ps = rsqrt(abs(r5.w));
    r12.xyz = r12.xyz * r0.xxx;
    r5.w = ps;
    r14.xyz = r6.xzy * r5.www;
    r6.xyz = r12.zxy * r14.zxy;
    r6.xyz = r12.xzy * r14.yxz - r6.xzy;
    r9.xyz = r6.xzy * r12.www;
    r6.x = dot(r9.yxz, r9.yxz);
    ps = rsqrt(abs(r6.x));
    r5.w = r0.z * 20.000013;
    r6.x = ps;
    r15.xyz = r9.xzy * r6.xxx;
    r13 = r5 + float4(-1.0, -1.0, -1.0, 0.5);
    r5.xyz = r13.yxz * UniformVector_4.yxz;
    ps = UniformVector_4.x * r5.y;
    r5.w = UniformScalar_24.x - UniformScalar_23.x;
    r16.w = ps;
    r16 = r16 * r13.xyzx;
    r6.x = dot(r5.zx, r5.zx) + r16.w;
    r6.y = dot(r16.zxy, r13.zxy);
    ps = rsqrt(abs(r6.y));
    r12.w = frac(r13.w);
    r6.y = ps;
    r0.xy = r5.zx * r6.yy;
    ps = rsqrt(abs(r6.x));
    r9.xyz = r15.yxz * r0.yyy;
    r6.x = ps;
    r13 = r5.yxzy * r6.xxxy;
    r9.x = r14.z * r13.w + r9.x;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r12.yzx * r13.zzz;
    r5.z = ps;
    r9.yz = r14.yx * r13.ww + r9.zy;
    r6.w = r12.y * r0.x + r9.z;
    r6.xyz = r15.xzy * r13.yyy + r6.xyz;
    r6.xyz = r14.xyz * r13.xxx + r6.xyz;
    r5.xy = r12.xz * r0.xx + r9.xy;
    ps = LocalToWorldMatrix[2].z * r5.y;
    r3.xyz = r5.zzz * r3.xyz;
    r3.w = ps;
    ps = LocalToWorldMatrix[1].z * r5.x;
    r0.x = dot(r13.zxy, r3.zxy);
    r5.z = ps;
    ps = LocalToWorldMatrix[2].x * r6.y;
    r3.y = max(r0.x, 0.0);
    r3.x = ps;
    ps = LocalToWorldMatrix[2].z * r6.y;
    r5.xy = r6.zz * LocalToWorldMatrix[1].xz;
    r3.z = ps;
    r5.xyz = r6.xxw * LocalToWorldMatrix[0].xzz + r5.xyz;
    ps = -UniformScalar_23.x;
    r12.xyz = r5.xyz + r3.xzw;
    ps = 0.5 + ps;
    r6 = r12 * float4(0.8944272, -0.4472136, -0.5, 6.2831855);
    r11.x = ps;
    ps = r6.x + r6.y;
    r0.xy = r6.zw + float2(0.5, -3.1415927);
    r8.y = saturate(ps);
    ps = sin(r0.y);
    r5.xyz = r8.xxy * r8.zwy;
    r11.y = ps;
    ps = -UniformScalar_23.x - -r0.z;
    r3.zw = r11.xy + r11.zy;
    r3.x = ps;
    ps = 1.0 / r5.w;
    r6.zw = r0.ww + r5.xy;
    r5.w = ps;
    ps = OpacityOverride.x;
    r6.xy = saturate(r3.xz * r5.ww);
    r9.z = saturate(ps);
    r6.xy = r6.xy * r3.ww + UniformScalar_25.xx;
    r6.xy = r6.zw * UniformScalar_6.xx + r6.xy;
    ps = r5.z;
    r9.xy = r6.xy * 1.0000007;
    ps = r8.y * ps;
    r5.xyz = r9.wxy + float3(0.1, 0.5, 0.5);
    r0.w = ps;
    ps = 5.0 * r5.x;
    r6.xy = frac(r5.yz);
    r3.x = saturate(ps);
    r5.xw = r6.xy * 6.2831855 - 3.1415927;
    ps = sin(r5.x);
    r5.yz = -r3.yx + float2(0.5, 1.0);
    r10.x = ps;
    ps = 2.5000002 * r5.y;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = saturate(ps);
    ps = ModShadowGroupColor.x * r5.z;
    r6.yzw = UniformVector_8.xyz * UniformScalar_28.xxx;
    r9.x = ps;
    ps = sin(r5.w);
    r3.xyz = r6.yzw * r6.xxx;
    r10.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r6 = r10 * float4(0.5, 0.5, 0.875, 0.875);
    r9.y = ps;
    ps = r6.x;
    r5.xzw = -r9.xyz + 1.0;
    r5.y = ps;
    ps = 0.5 + r5.y;
    r0.xyz = r3.xzy * r0.xxx;
    r3.x = ps;
    ps = 0.5 + r6.y;
    r5.w = float((r5.w >= 0.004));
    r3.y = ps;
    r5.xy = r6.zw * r5.xz + 0.125;
    r6.xw = r3.xy * UniformScalar_27.xx + UniformScalar_26.xx;
    ps = r5.x * r5.y;
    r3.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r5.x = ps;
    r3.xyz = r3.xyz * r6.xxx + r0.www;
    r5.xyz = r5.xxx * r8.xyz + ModShadowColor.xyz;
    r3.xyz = r7.xyz * r3.xyz + r1.xzy;
    r3.xyz = r3.xyz * r4.xyz - r1.xzy;
    r6.xyz = r3.xyz * 0.8 + r1.xzy;
    r6.xyz = r0.xyz * r6.www + r6.xzy;
    r6.xyz = r6.xzy * UniformScalar_29.xxx + UniformVector_0.xyz;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
