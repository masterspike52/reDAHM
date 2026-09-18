// ps_20377e6d3d70ec70.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 459 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000072C 10041400 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c10); // float
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_13 : register(c13); // float
float4 UniformScalar_14 : register(c14); // float
float4 UniformScalar_15 : register(c15); // float
float4 UniformScalar_17 : register(c16); // float
float4 UniformScalar_7 : register(c7); // float
float4 UniformScalar_8 : register(c8); // float
float4 UniformScalar_9 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D ShadowTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
    float4 color2 : COLOR2; // r8
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
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color1;
    float4 r8 = In.color2;
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

    ps = r5.w;
    r6.y = dot(r4.zxy, r4.zxy);
    ps = (-4e+02) + ps;
    r6.w = r2.z + 0.1;
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r15.xw = saturate(r6.wz * float2(5.0, 0.00022222222));
    r6.y = ps;
    ps = UniformVector_1.x * r1.w;
    r6.x = UniformScalar_17.x * 0.05;
    r16.z = ps;
    ps = UniformScalar_13.x - r8.w;
    r11.xyz = r6.yyy * r4.xyz;
    r4.w = ps;
    ps = 15.0 * r8.w;
    r6.x = r6.x * r15.w;
    r2.w = saturate(ps);
    r13.xz = r11.yx * r6.xx + r1.zw;
    r0.zw = r13.xz + r13.xz;
    r10.xyw = tex2D(Texture2D_0, r0.wz).xyz;
    r4.xy = r5.xy * ScreenPositionScaleBias.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r20.z = float((UniformScalar_12.x >= 1.0));
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.yz = r1.wz * 3.0;
    r7.y = ps;
    r6.x = r8.w * (-0.8) + r6.z;
    ps = r10.x + r10.x;
    r7.zw = r7.xy * abs(r9.xy);
    r17.x = ps;
    ps = r10.y + r10.y;
    r17.w = r13.z * UniformVector_1.x;
    r17.y = ps;
    ps = r10.w + r10.w;
    r20.y = float((r17.w >= 0.5));
    r17.z = ps;
    r12 = r17 + float4(-1.0, -1.0, -1.0, -0.5);
    ps = 1.0 / r5.w;
    r4.z = r12.w - r17.w;
    r20.x = ps;
    r4 = r4.ywxz * r20.xzxy;
    r6.w = r4.y + r8.w;
    r6.w = -r6.w + r8.z;
    r6.w = max(r6.w, UniformScalar_14.x);
    ps = 1.0 / UniformScalar_15.x;
    r7.x = min(r6.w, 1.0);
    r6.w = ps;
    ps = -r1.z;
    r13.y = saturate(r7.x * r6.w);
    ps = 1.0 + ps;
    r14.yz = -r13.xy + 1.0;
    r14.x = ps;
    ps = r1.w;
    r16.xy = r14.xy * UniformVector_1.yy;
    ps = 18.0 * ps;
    r9.xyz = r16.xyz - 0.5;
    r7.x = ps;
    ps = r17.w;
    r13.xyw = float3((r16.xzy >= 0.5));
    ps = r4.w + ps;
    r9.yzw = r9.xyz - r16.xyz;
    r9.x = ps;
    r9.yzw = r9.zyw * r13.wxy + r16.yxz;
    ps = 6.0 * r6.x;
    r17 = r9.wzxy + r9.wzxy;
    r7.y = ps;
    r9 = tex2D(Texture2D_3, r17.xy).xwyz;
    r16.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r7.xyz = tex2D(Texture2D_4, r7.xy).xwy;
    r6 = tex2D(Texture2D_4, r6.yx).wxzy;
    r16.zw = r7.xz * 2.0 - 1.0;
    ps = r6.y + r6.y;
    r19 = r16 * float4(0.875, 0.875, 0.5, 0.5);
    r8.y = ps;
    ps = r6.w + r6.w;
    r8.x = dot(r13.yxx, float3(1.0, 1.0, 1.0));
    r8.z = ps;
    r7.w = (r8.x == 0.0) ? r9.x : r9.z;
    ps = r6.z;
    r16 = r8.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r6.y = ps;
    r7.w = (r16.y == 0.0) ? r9.w : r7.w;
    ps = (-0.3) * r6.y;
    r9.xz = r16.zw + r19.zw;
    r8.x = ps;
    r15.z = (r16.x == 0.0) ? r9.y : r7.w;
    ps = r7.y;
    r7.x = max(r15.z, 0.0);
    ps = r6.x * ps;
    r7.x = min(r7.x, 0.3);
    r6.y = ps;
    ps = (-1.0) - -r6.y;
    r15.y = r7.x * 3.3333333;
    r9.w = ps;
    ps = 0.01 * r9.x;
    r7.yzw = -r15.zxy + 1.0;
    r8.y = ps;
    r9.y = r2.w * r7.w + r15.y;
    r15.xz = r8.yx * r9.yy + r1.xy;
    r8.xyz = r9.wxy * r9.yyz;
    r15.y = r8.z * 0.025 + r15.z;
    r6.x = tex2D(Texture2D_7, r1.xy).w;
    r9.xyz = tex2D(Texture2D_5, r15.xy).xyz;
    ps = r5.w;
    r9.xyz = r9.xyz + r9.xyz;
    ps = 0.0001 * ps;
    r7.x = r14.z * r8.w;
    r5.x = saturate(ps);
    ps = ModShadowGroupColor.x * r7.z;
    r18.yz = r7.xy * r6.zz;
    r5.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r5.w = float((r18.y >= 0.05));
    r5.z = ps;
    r5 = -r5.wyxz + 1.0;
    r6.z = (UniformScalar_13.x > 0.0) ? r5.x : 1.0;
    r6.z = (UniformScalar_13.x >= 0.0) ? r6.z : r5.x;
    ps = r4.z;
    r9.w = r6.z * r6.x;
    r6.x = ps;
    ps = ScreenPositionScaleBias.w + r6.x;
    r9 = r9.xywz + float4(-1.0, -1.0, -0.5, -1.0);
    r6.x = ps;
    ps = ScreenPositionScaleBias.z + r4.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r9.zzzz)) clip(-1.0);
    r6.z = ps;
    r10.xyz = tex2D(LightAttenuationTexture, r6.xz).xyz;
    r4.z = tex2D(ShadowTexture, r0.xy).x;
    r16.xyz = tex2D(Texture2D_8, r0.wz).xyz;
    ps = 1.0 + r8.x;
    r6.xz = r1.wz + r1.wz;
    r18.w = ps;
    r14 = tex2D(Texture2D_2, r6.xz);
    r17 = tex2D(Texture2D_3, r17.zw).zwxy;
    r4.xyw = tex2D(Texture2D_1, r6.xz).xyz;
    r15.xyz = tex2D(Texture2D_7, r15.xy).xyz;
    r6.z = tex2D(Texture2D_6, r1.xy).x;
    r5.x = float((UniformScalar_9.x >= 1.0));
    r0.w = float((UniformScalar_9.x > 1.0));
    ps = UniformVector_5.x * UniformVector_5.w;
    r6.w = dot(r2.zxy, r2.zxy);
    r1.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r1.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r6.x = dot(r3.zxy, r3.zxy);
    r1.z = ps;
    ps = 1.0 - r6.x;
    r13.xyz = r1.xyz * r15.xyz;
    r6.x = saturate(ps);
    r3.xyz = r13.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = log2(r6.x);
    r15.yzw = r4.xyw + r4.xyw;
    r6.x = ps;
    r1.z = r13.w * 2.0 + r20.y;
    r8.w = (r1.z == 0.0) ? r17.z : r17.w;
    ps = abs(r18.w) * abs(r18.w);
    r17.z = r18.w * r7.y;
    r18.x = ps;
    ps = r18.x * r18.x;
    r1.xy = r19.xy * r5.yw;
    r5.y = ps;
    ps = r18.z * r18.w;
    r1 = r1.xyzz + float4(0.125, 0.125, -3.0, -2.0);
    r5.w = ps;
    r8.w = (r1.w == 0.0) ? r17.x : r8.w;
    ps = r5.w;
    r3.w = r1.x * r1.y;
    r0.xyz = r3.www * r0.xyz + ModShadowColor.xyz;
    r17.w = (r1.z == 0.0) ? r17.y : r8.w;
    r1.yz = r9.xy * UniformVector_3.xy + r8.yz;
    ps = -r17.z + ps;
    r8.x = -r17.w + 1.0;
    r8.y = ps;
    r17.xy = r2.ww * r8.xy;
    r8.xy = r17.xz + r17.wy;
    r4.w = saturate(r8.y * 2.5 - 0.5);
    ps = -UniformVector_0.x;
    r8.x = r8.x + r17.x;
    ps = 1.0 + ps;
    r15.x = r8.x + r17.w;
    r1.x = ps;
    ps = rsqrt(abs(r6.w));
    r8 = r15 + float4(0.25, -1.0, -1.0, -1.0);
    r6.w = ps;
    ps = r8.x;
    r2.xyz = r6.www * r2.xyz;
    ps = -r6.y + ps;
    r15.xyz = r8.yzw - r12.xyz;
    r6.y = saturate(ps);
    r12.w = r15.z * r14.w - 2.0;
    ps = -UniformVector_0.y;
    r8.xyz = r6.yyy * r16.xyz;
    r9.xyz = r15.xyz * r14.www + r12.xyz;
    r13.w = r9.w * UniformVector_3.z - r9.z;
    ps = 1.0 + ps;
    r4.xy = r1.yz - r9.xy;
    r1.y = ps;
    ps = -UniformVector_0.z;
    r12.xyz = -r8.xyz + r14.xyz;
    r12.xyz = r12.xyz * r14.www + r8.xyz;
    r13.xyz = r13.xyz * r7.yyy - r12.xyz;
    ps = 1.0 + ps;
    r8.xyz = r4.xyz * r4.wwz;
    r1.z = ps;
    ps = UniformScalar_8.x * r6.z;
    r9.xy = r9.xy + r8.xy;
    r8.w = ps;
    r12 = r13 * r4.wwww + r12;
    r9.z = r10.w * 2.0 + r12.w;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r9.xyw = r9.xyz * r5.zzz;
    r6.y = ps;
    ps = r8.z;
    r9.z = r9.w + 1.0;
    r6.xzw = (r5.zzz > 0.0) ? r9.xyz : float3(0.0, 0.0, 1.0);
    r9.xyz = (r5.zzz >= 0.0) ? r6.xzw : float3(0.0, 0.0, 1.0);
    ps = r10.x * ps;
    r6.x = dot(r9.zxy, r9.zxy);
    r8.x = ps;
    ps = rsqrt(abs(r6.x));
    r1.xyz = r12.xyz * r1.xyz;
    r6.x = ps;
    ps = r8.z;
    r9.xyz = r9.xyz * r6.xxx;
    ps = r10.y * ps;
    r6.x = dot(r9.zxy, r11.zxy);
    r8.y = ps;
    ps = r8.z;
    r6.xzw = r9.xyz * r6.xxx;
    r6.xzw = r6.xzw * 2.0 - r11.xyz;
    ps = r10.z * ps;
    r6.x = saturate(dot(r2.zxy, r6.wxz));
    r8.z = ps;
    ps = log2(r6.x);
    r6.w = saturate(dot(r9.zyx, r2.zyx));
    r6.x = ps;
    ps = pow(2.0, r6.y);
    r6.z = r6.x * UniformScalar_7.x;
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r6.x = r6.x * 15.0;
    r6.z = ps;
    r8 = r8.xzyw * r6.yyyz;
    r5.z = (r0.w > 0.0) ? 0.0 : r8.w;
    r6.yz = r5.xy * r5.zy;
    r2.xyz = r3.xyz + r6.yyy;
    r2.xyz = r6.zzz * r2.xyz;
    r2.xyz = r2.xyz * r4.www;
    ps = pow(2.0, r6.x);
    r7.xyz = r2.xyz * r7.yyy;
    r6.x = ps;
    r6.xyz = r7.xyz * r6.xxx;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r8.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r0.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
