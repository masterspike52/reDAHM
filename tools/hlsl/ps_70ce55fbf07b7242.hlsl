// ps_70ce55fbf07b7242.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 387 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000060C 10000F00 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 MinZ_MaxZRatio : register(c2); // float4
float4 OpacityOverride : register(c40); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c14); // float
float4 UniformScalar_1 : register(c15); // float
float4 UniformScalar_2 : register(c16); // float
float4 UniformScalar_27 : register(c20); // float
float4 UniformScalar_34 : register(c21); // float
float4 UniformScalar_35 : register(c22); // float
float4 UniformScalar_36 : register(c23); // float
float4 UniformScalar_37 : register(c24); // float
float4 UniformScalar_38 : register(c25); // float
float4 UniformScalar_4 : register(c17); // float
float4 UniformScalar_40 : register(c26); // float
float4 UniformScalar_41 : register(c27); // float
float4 UniformScalar_42 : register(c28); // float
float4 UniformScalar_43 : register(c29); // float
float4 UniformScalar_44 : register(c30); // float
float4 UniformScalar_45 : register(c31); // float
float4 UniformScalar_46 : register(c32); // float
float4 UniformScalar_47 : register(c33); // float
float4 UniformScalar_48 : register(c34); // float
float4 UniformScalar_49 : register(c35); // float
float4 UniformScalar_50 : register(c36); // float
float4 UniformScalar_51 : register(c37); // float
float4 UniformScalar_52 : register(c38); // float
float4 UniformScalar_53 : register(c39); // float
float4 UniformScalar_8 : register(c18); // float
float4 UniformScalar_9 : register(c19); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_10 : register(c13); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
float4 UniformVector_6 : register(c9); // float4
float4 UniformVector_7 : register(c10); // float4
float4 UniformVector_8 : register(c11); // float4
float4 UniformVector_9 : register(c12); // float4
sampler2D SceneDepthTexture : register(s0);
sampler2D SceneColorTexture : register(s1);
sampler2D Texture2D_0 : register(s2);
sampler2D Texture2D_1 : register(s3);
sampler2D Texture2D_2 : register(s4);
sampler2D Texture2D_3 : register(s5);
sampler2D Texture2D_4 : register(s6);
sampler2D Texture2D_5 : register(s7);
sampler2D Texture2D_6 : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 color0 : COLOR0; // r4
    float4 color2 : COLOR2; // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord5;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r1.w;
    r4.xy = r0.xy * UniformScalar_36.xx;
    r5.w = ps;
    r4.y = tex2D(Texture2D_3, r4.xy).x;
    r4.xz = UniformVector_3.xy * UniformScalar_8.xx;
    ps = UniformScalar_37.x * r4.y;
    r4.xz = r4.xz * UniformScalar_4.xx;
    r4.w = ps;
    r8.yzw = r4.wxz + r0.zxy;
    r13 = r8.zwzw * float4(1.03, 1.03, 1.01, 1.01);
    ps = r0.w;
    r6 = r8.zwzw * float4(1.09, 1.09, 1.07, 1.07);
    r8.x = ps;
    r4.xz = r6.zw * UniformScalar_9.xx + UniformVector_6.xy;
    r7.xy = r6.xy * UniformScalar_9.xx + UniformVector_7.xy;
    r5.xy = r13.xy * UniformScalar_27.xx + UniformVector_9.xy;
    r7.zw = r13.zw * UniformScalar_27.xx + UniformVector_8.xy;
    r6.xy = r13.xy * UniformScalar_9.xx + UniformVector_5.xy;
    r6.xyz = tex2D(Texture2D_1, r6.xy).zxy;
    r12.xy = tex2D(Texture2D_2, r7.zw).xy;
    r10.zw = tex2D(Texture2D_2, r5.xy).xy;
    r5.xyz = tex2D(Texture2D_4, r8.xy).wyx;
    r7.xzw = tex2D(Texture2D_1, r7.xy).zxy;
    r11.xyz = tex2D(Texture2D_1, r4.xz).xyz;
    r4.z = UniformScalar_47.x * 4e+01;
    r4.x = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    r12.z = r7.x * 2.0 + r11.z;
    ps = rsqrt(abs(r4.x));
    r4.w = dot(r2.zxy, r2.zxy);
    r2.w = ps;
    r4.x = r5.x * UniformScalar_38.x + UniformScalar_40.x;
    ps = rsqrt(abs(r4.w));
    r8.xyz = r2.www * UniformVector_2.xyz;
    r4.w = ps;
    r9.xyz = r4.www * r2.xzy;
    r10.xy = r9.xz * r8.xy;
    r7.xy = r13.zw * UniformScalar_9.xx + UniformVector_4.xy;
    ps = 1.0000007 * r4.x;
    r10.yzw = r10.xzw + r10.yzw;
    r10.x = ps;
    r2.xyw = r10.zwx + float3(-2.0, -2.0, 0.5);
    r4.xw = r12.xy * 2.0 + r2.xy;
    r4.xw = r4.xw * UniformScalar_34.xx + r7.zw;
    r12.xy = r4.xw + r7.zw;
    ps = frac(r2.w);
    r2.xyz = r12.xyz + r11.xyz;
    r4.x = ps;
    ps = r2.z;
    r7.zw = r0.xy * UniformScalar_1.xx;
    ps = r6.x + ps;
    r2.xy = r2.xy + r11.xy;
    r2.z = ps;
    ps = 6.2831855 * r4.x;
    r15.yzw = r2.xyz + r6.yzx;
    r15.x = ps;
    r13.zw = r15.wx + float2(-4.0, -3.1415927);
    ps = cos(r13.w);
    r11.xy = r4.zz * r0.xy;
    r4.z = ps;
    ps = UniformScalar_49.x * r4.z;
    r2.yzw = UniformVector_1.xzy * UniformScalar_0.xxx;
    r4.x = ps;
    r4.xw = r0.xy * UniformScalar_48.xx + r4.xx;
    r14.w = tex2D(Texture2D_6, r11.xy).x;
    r6.x = tex2D(Texture2D_6, r4.xw).x;
    r11.y = tex2D(Texture2D_0, r7.zw).x;
    r7.xyz = tex2D(Texture2D_1, r7.xy).xzy;
    r4.w = tex2D(Texture2D_4, r0.wz).w;
    r0.xy = r5.ww * ScreenPositionScaleBias.xy;
    r12.xy = r0.xy * r1.xy + ScreenPositionScaleBias.wz;
    r4.x = max(r9.y, 0.0);
    ps = 1.0 - r4.x;
    r0.xy = r15.yz + r6.yz;
    r4.x = ps;
    ps = abs(r4.x) * abs(r4.x);
    r13.xy = r0.xy - 4.0;
    r4.x = ps;
    ps = 1.0 - r4.y;
    r0.xyz = r13.xyz + r7.xzy;
    r5.x = ps;
    ps = sin(r13.w);
    r7.y = r0.z + r7.y;
    r4.y = ps;
    ps = r5.z + r5.z;
    r11.xzw = r4.yzz * float3(0.5, -1.0, 1.0);
    r5.z = ps;
    ps = r5.y + r5.y;
    r13.xy = r11.xy + float2(0.5, -1.0);
    r5.w = ps;
    ps = 1.0 - r4.x;
    r5.y = r13.y * UniformScalar_2.x;
    r6.y = ps;
    ps = 1.0 - r4.w;
    r5.yzw = r5.yzw + float3(1.0, -1.0, -1.0);
    r6.z = ps;
    ps = UniformScalar_35.x * r5.y;
    r14.xy = -r9.xz * 1.8;
    r14.z = ps;
    ps = r5.x * r5.z;
    r7.zw = r0.xy + r7.xz;
    r13.z = ps;
    ps = r5.w * r5.x;
    r0 = r14 * r6.yyyx;
    r13.w = ps;
    ps = 1.0 - r5.y;
    r13 = r13.xzzw * float4(0.7, -1.0, 1.0, 1.0);
    r7.x = ps;
    r5 = r0.xyzz * r7.xxzw;
    ps = r5.x + r5.z;
    r4.z = r13.x + 0.3;
    r4.y = ps;
    ps = r0.w;
    r0.xyz = r13.zyw * r11.zwz;
    ps = r4.z * ps;
    r0.xyz = r0.xzy * r4.www;
    r0.w = ps;
    ps = r5.y + r5.w;
    r0 = r0 * r6.zzzz;
    r4.z = ps;
    r7.xzw = r0.xyz * UniformScalar_41.xxx + r4.yzy;
    r4.z = dot(r7.yxz, r7.yxz);
    ps = rsqrt(abs(r4.z));
    r4.y = dot(r7.yzx, r7.yzw);
    r2.x = ps;
    ps = rsqrt(abs(r4.y));
    r5.yzw = r7.xyz * r2.xxx;
    r4.y = ps;
    r6.xyz = r7.xzy * r4.yyy;
    r4.y = dot(r9.yxz, r6.zxy);
    r4.z = dot(r9.yxz, r5.zyw);
    r5.x = dot(r8.zxy, r5.zyw);
    r5.xyz = r5.yzw * r5.xxx;
    r6.xyz = r5.xzy * 2.0 - r8.xyz;
    r4.yz = r4.yz * 0.5 + 0.5;
    ps = log2(abs(r10.y));
    r4.yz = abs(r4.yz) * abs(r4.yz);
    r5.x = ps;
    r4.yz = -r4.yz * r4.yz + 1.0;
    ps = log2(abs(r4.y));
    r4.y = ps;
    ps = log2(abs(r4.z));
    r5.x = r5.x * UniformScalar_42.x;
    r4.z = ps;
    ps = pow(2.0, r5.x);
    r4.yz = r4.zy * UniformScalar_45.xx;
    r5.x = ps;
    ps = pow(2.0, r4.y);
    r11.z = r5.x * UniformScalar_43.x;
    r11.y = ps;
    ps = pow(2.0, r4.z);
    r4.y = -r11.y + 1.0;
    r11.x = ps;
    ps = log2(abs(r4.y));
    r5.xyz = -r6.xyz + r9.xzy;
    r5.w = ps;
    r5 = r11.zzzy * r5.xzyw;
    ps = pow(2.0, r5.w);
    r10.xyz = r6.xyz + r5.xzy;
    r4.y = ps;
    r6.xyz = tex2D(Texture2D_5, r4.yy).xyz;
    r0.xyz = tex2D(SceneColorTexture, r12.xy).xyz;
    r4.y = tex2D(SceneDepthTexture, r12.xy).x;
    ps = 1.0 / UniformScalar_51.x;
    r6.w = r1.z - UniformScalar_50.x;
    r5.w = ps;
    r4.z = r4.w * UniformScalar_53.x + UniformScalar_52.x;
    r4.x = r4.y * MinZ_MaxZRatio.z - MinZ_MaxZRatio.w;
    ps = 1.0 / r4.x;
    r5.xyz = r0.xyz + UniformVector_0.xyz;
    r4.w = ps;
    r4.xy = r11.xy * 0.7;
    r11.xy = -r4.xy + 1.0;
    r4.xz = r11.xy * r4.zz + r4.xy;
    r4.y = dot(r10.zxy, r10.zxy);
    ps = rsqrt(abs(r4.y));
    r8.xyz = r8.xzy * r2.xxx;
    r4.y = ps;
    r10.xyz = r10.xyz * r4.yyy;
    r4.y = saturate(dot(r10.zxy, r9.yxz));
    ps = log2(r4.y);
    r7.x = saturate(dot(r8.yxz, r7.yxz));
    r4.y = ps;
    ps = UniformScalar_44.x * r4.y;
    r4.y = ps;
    ps = pow(2.0, r4.y);
    r2.x = -r4.x + 1.0;
    r4.y = ps;
    r2.yzw = r2.ywz * r4.yyy;
    r2.yzw = r6.xzy * UniformScalar_46.xxx + r2.ywz;
    r2.yzw = r7.xxx * r6.xyz + r2.ywz;
    ps = r6.w;
    r6.xyz = -r2.yzw + 1.0;
    r2.yzw = r0.www * r6.xyz + r2.yzw;
    ps = r5.w * ps;
    r6.xyz = -r2.ywz + UniformVector_10.xzy;
    r4.y = saturate(ps);
    r2.yzw = r4.yyy * r6.xyz + r2.ywz;
    ps = r4.w;
    r2 = r2.xywz * float4(5e+02, 1.000001, 1.000001, 1.000001);
    ps = -r1.w + ps;
    r4.w = max(r2.x, 0.001);
    r4.y = ps;
    ps = 1.0 / r4.w;
    r0.xyz = r2.yzw - r0.xyz;
    r4.w = ps;
    r4.y = saturate(r4.y * r4.w);
    r5.xyz = r4.yyy * r0.xyz + r5.xyz;
    r5.xyz = r5.xyz * r3.www + r3.xyz;
    ps = OpacityOverride.x * r4.z;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
