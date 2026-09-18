// ps_3dfac0484e606831.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 552 ucode dwords, 12 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 000000C0 000008A0 10041700 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000007 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_11 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
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
sampler2D Texture2D_9 : register(s10);
sampler2D ShadowTexture : register(s11);
sampler2D ModShadowAccumTexture : register(s12);

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
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r13.x = float((UniformScalar_7.x >= 1.0));
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = r1.w * UniformVector_1.x;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = -r1.z + 1.0;
    r6.w = ps;
    ps = UniformVector_1.y * r6.x;
    r7 = r1.wzwz * float4(3.0, 3.0, 0.5, 0.5);
    r6.x = ps;
    r8.xy = r8.ww * float2(0.16, -0.8) + r7.xy;
    ps = (-0.5) + r6.y;
    r6.zw = r6.zw * abs(r9.xy);
    r0.z = ps;
    ps = (-0.5) + r6.x;
    r13.yz = float2((r6.xy >= 0.5));
    r0.w = ps;
    ps = 6.0 * r8.x;
    r15.yz = r0.zw - r6.yx;
    r0.z = ps;
    ps = UniformScalar_8.x - r8.w;
    r9.x = saturate(r5.w * 0.0001);
    r15.x = ps;
    r6.xy = r15.yz * r13.zy + r6.yx;
    ps = 6.0 * r8.y;
    r6.xy = r6.xy + r6.xy;
    r0.w = ps;
    r12 = tex2D(Texture2D_4, r6.xy).xwyz;
    r14.yzw = tex2D(Texture2D_3, r0.zw).xyw;
    r7.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r11 = tex2D(Texture2D_3, r8.xy);
    ps = r8.w;
    r0.z = UniformScalar_13.x * 0.05;
    ps = 15.0 * ps;
    r6.x = r2.z + 0.1;
    r20.z = saturate(ps);
    ps = r5.w;
    r3.x = r11.z * (-0.3);
    r10.xy = r11.yx * 2.0 - 1.0;
    ps = (-4e+02) + ps;
    r9.zw = r14.yz + r14.yz;
    r6.y = ps;
    ps = 0.875 * r7.x;
    r9.y = dot(r13.zyy, float3(1.0, 1.0, 1.0));
    r3.z = ps;
    r6.w = (r9.y == 0.0) ? r12.x : r12.z;
    r6.z = r15.x * r13.x + r8.w;
    ps = 0.875 * r7.y;
    r13 = r9.yyzw + float4(-3.0, -2.0, -1.0, -1.0);
    r3.w = ps;
    ps = r11.z;
    r9.yz = r13.zw * 0.5;
    r6.w = (r13.y == 0.0) ? r12.w : r6.w;
    ps = r8.w * ps;
    r6.z = -r6.z + r8.z;
    r0.w = ps;
    ps = 5.0 * r6.x;
    r6.z = max(r6.z, UniformScalar_9.x);
    r12.x = saturate(ps);
    r19.z = (r13.x == 0.0) ? r12.y : r6.w;
    r10.zw = r11.xy * 2.0 + r9.yz;
    ps = 0.00022222222 * r6.y;
    r13 = r10 + r9.zyyz;
    r12.y = saturate(ps);
    ps = r13.y;
    r6.w = max(r19.z, 0.0);
    r6.x = ps;
    ps = 1.0 / UniformScalar_0.x;
    r6.yz = min(r6.wz, float2(0.3, 1.0));
    r6.w = ps;
    ps = 0.01 * r6.x;
    r12.z = saturate(r6.z * r6.w);
    r6.w = ps;
    ps = 3.3333333 * r6.y;
    r6.xz = -r12.zx + 1.0;
    r10.z = ps;
    ps = r0.w;
    r14.x = r6.x * r8.w;
    ps = r6.x * ps;
    r8.xy = r14.xw * r11.zw;
    r8.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r10.xy = float2((r8.xw >= 0.05));
    r9.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r15.xzw = -r10.xyz + 1.0;
    r9.z = ps;
    r9.w = r20.z * r15.w + r10.z;
    ps = (-1.0) - -r8.y;
    r6.w = r6.w * r9.w;
    r3.y = ps;
    ps = r13.y;
    r10.x = r6.w + r1.x;
    ps = r9.w * ps;
    r6.y = dot(r4.zxy, r4.zxy);
    r14.x = ps;
    ps = r9.w;
    r9.xyz = -r9.xyz + 1.0;
    ps = r13.x * ps;
    r18 = r3.zwxy * r9.yzww;
    r14.y = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = r18.z + r1.y;
    r14.z = ps;
    ps = r0.z;
    r3.xyz = r14.yzz * float3(0.025, -0.125, 1.0);
    ps = r12.y * ps;
    r10.y = r6.x + r3.x;
    r6.x = ps;
    ps = r3.x;
    r4 = r3.zzzy * r4.xyzx;
    ps = r18.z + ps;
    r6.xy = r4.xy * r6.xx;
    r6.z = ps;
    r12 = r6.xzwy + r1.wyxz;
    r6.x = tex2D(Texture2D_5, r12.zy).w;
    r6.yz = tex2D(Texture2D_6, r7.zw).xy;
    r23 = tex2D(Texture2D_5, r10.xy);
    r6.w = tex2D(ShadowTexture, r0.xy).x;
    ps = -r8.z;
    r7.xy = saturate(UniformVector_2.xy);
    ps = 1.0 + ps;
    r20.w = r6.w * r6.w;
    r3.x = ps;
    ps = r23.w;
    r6.yw = r6.yz + r6.yz;
    r6.z = ps;
    ps = (-0.5) + r6.z;
    r7.xy = r7.yx * UniformScalar_4.xx;
    r7.z = ps;
    ps = 1.0 / UniformScalar_4.x;
    r7.xy = floor(-r7.xy);
    r6.z = ps;
    ps = (-0.5) + r6.x;
    r0.xy = -r7.xy * r6.zz;
    r7.w = ps;
    ps = (-1.0) + r6.y;
    r3.yz = r0.xy + UniformScalar_5.xx;
    r7.x = ps;
    ps = (-1.0) + r6.w;
    r0 = r3.xxyz - r0.xyxy;
    r7.y = ps;
    ps = 1.0 / r0.z;
    r20.xy = saturate(r7.zw * 3.3333333);
    r6.x = ps;
    ps = 1.0 / r0.w;
    r3.xyz = -r20.xyz + 1.0;
    r6.y = ps;
    r6.xz = saturate(r0.xy * r6.xy);
    r0.x = r6.x * r3.x + r20.x;
    r6.yw = r13.zw - 2.0;
    r0.yz = r6.yw + r11.xy;
    ps = (UniformScalar_1.x >= 0.0) ? 1.0 : 0.0;
    r11.xyw = r0.yxz + r11.xzy;
    r0.w = ps;
    ps = (UniformScalar_1.x > 0.0) ? 1.0 : 0.0;
    r15.y = float((r11.y >= 0.5));
    r8.z = ps;
    r6.yw = (-abs(r8.zz) >= 0.0) ? 1.0 : r15.xy;
    r13.yz = (-abs(r0.ww) >= 0.0) ? r15.zy : r6.yw;
    r0.xy = r12.xw + r12.xw;
    ps = r12.x;
    r6.w = -r12.w + 1.0;
    r6.y = ps;
    ps = UniformVector_1.x * r6.y;
    r6.x = r6.w * UniformVector_1.y;
    r6.y = ps;
    ps = (-0.5) + r6.x;
    r10.zw = float2((r6.xy >= 0.5));
    r12.x = ps;
    ps = (-0.5) + r6.y;
    r13.x = dot(r10.wzz, float3(1.0, 1.0, 1.0));
    r12.y = ps;
    ps = 1.0 / r5.w;
    r12.xy = r12.xy - r6.xy;
    r13.w = ps;
    r6.xy = r12.xy * r10.zw + r6.xy;
    ps = r6.y + r6.y;
    r12.xyw = r13.yxx + float3(-0.5, -3.0, -2.0);
    r6.y = ps;
    ps = r6.x + r6.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r12.xxxx)) clip(-1.0);
    r6.w = ps;
    r16 = tex2D(Texture2D_4, r6.yw);
    r17.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = r10.x + r10.x;
    r17.xyz = r17.xyz + r17.xyz;
    r11.y = ps;
    r19.xy = r6.zz * r3.xy + r20.xy;
    ps = r10.y + r10.y;
    r6.xyz = -r19.zxy + 1.0;
    r11.z = ps;
    ps = r10.z + r10.z;
    r19 = r11.xwxw * r6.zzyy;
    r11.w = ps;
    r19.xy = (-abs(r8.zz) >= 0.0) ? 0.0 : r19.xy;
    r12.xz = (-abs(r0.ww) >= 0.0) ? r19.zw : r19.xy;
    ps = 2.5 * r6.x;
    r22.xyz = r18.xyw + float3(0.125, 0.125, 1.0);
    r6.y = ps;
    r18.x = saturate(r6.y * r22.z - 0.5);
    r6.y = (r13.x == 0.0) ? r16.x : r16.y;
    r6.y = (r12.w == 0.0) ? r16.z : r6.y;
    r11.x = (r12.y == 0.0) ? r16.w : r6.y;
    ps = r1.z;
    r16 = r11 - 1.0;
    r12.y = ps;
    ps = 0.036 * r7.x;
    r17.w = r16.x * r3.z;
    r19.x = ps;
    ps = 0.036 * r7.y;
    r11 = r17 + float4(-1.0, -1.0, -1.0, 2.25);
    r19.y = ps;
    r18.yz = r11.xy * UniformVector_4.xy - r19.xy;
    r18.w = r11.z * UniformVector_4.z - 1.0;
    ps = r1.w + r1.w;
    r3 = r20.xxxx * r18;
    r6.y = ps;
    ps = r1.z + r1.z;
    r7.xy = r19.xy + r3.yz;
    r6.w = ps;
    ps = r4.w;
    r7.xy = r7.xy + r14.xy;
    ps = r1.w + ps;
    r14.xy = r7.xy + r12.xz;
    r12.x = ps;
    ps = abs(r22.z) * abs(r22.z);
    r14.zw = r5.xy * ScreenPositionScaleBias.xy;
    r7.x = ps;
    r1.xy = r14.zw * r13.ww + ScreenPositionScaleBias.wz;
    r12.xyz = tex2D(Texture2D_8, r12.xy).xyz;
    r7.yzw = tex2D(Texture2D_1, r6.yw).xyz;
    r19.yzw = tex2D(LightAttenuationTexture, r1.xy).xyz;
    r1 = tex2D(Texture2D_2, r6.yw).xwyz;
    r0.xyz = tex2D(Texture2D_9, r0.xy).xyz;
    ps = UniformVector_6.x * UniformVector_6.w;
    r6.w = dot(r2.zxy, r2.zxy);
    r5.y = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r21.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r5.x = -r23.w + 1.0;
    r5.w = ps;
    ps = r23.w;
    r5.yzw = r5.yzw * r23.xyz;
    r6.y = ps;
    ps = UniformScalar_10.x * r6.y;
    r11.xyz = r5.yzw * r23.www;
    r2.w = ps;
    r5.xyz = r5.xxx * UniformVector_5.xzy + r2.www;
    r5.xyz = r11.xyz * UniformScalar_11.xxx + r5.xzy;
    r8.z = (abs(r8.z) > 0.0) ? r15.y : 1.0;
    r0.w = (abs(r0.w) > 0.0) ? r8.z : r15.y;
    ps = r7.x * r7.x;
    r15.yzw = r7.yzw + r7.yzw;
    r22.w = ps;
    r7.xw = r22.xw * r22.yw;
    r7.xyz = r7.xxx * r21.xyz + ModShadowColor.xyz;
    r5.xyz = r7.www * r5.xzy;
    r5.yzw = r5.xzy * r6.xxx;
    r7.w = r11.w + r17.w;
    r5.x = saturate(r7.w - r8.y);
    ps = -r18.x;
    r17 = r5.xxxy * r0;
    ps = r3.x + ps;
    r8.xyz = -r17.xyz + r1.xzw;
    r19.x = ps;
    r3.xyz = r8.xyz * r1.yyy + r17.xyz;
    r8 = r20.zwww * r19;
    r11.w = r18.x + r8.x;
    ps = rsqrt(abs(r6.w));
    r1.x = r17.w * r11.w;
    r6.w = ps;
    ps = r3.w;
    r2.xyz = r6.www * r2.xyz;
    ps = r13.z * ps;
    r11.xyz = r11.xyz - r12.xyz;
    r15.x = ps;
    r15 = r15 + float4(1.0, -1.0, -1.0, -1.0);
    r17.xyz = r15.yzw - r16.yzw;
    r3.w = r17.z * r1.y - 2.0;
    r1.yzw = r17.xyz * r1.yyy + r16.yzw;
    ps = r15.x;
    r0 = r11 * r0.wwww;
    r13.xy = r14.xy * r13.zz - r1.yz;
    r1.yz = r13.xy * r11.ww + r1.yz;
    ps = -r1.w + ps;
    r12.xyz = r0.xyz + r12.xyz;
    r12.w = ps;
    r12.xyz = r6.xxx * r12.xyz - r3.xyz;
    r3 = r12 * r11.wwww + r3;
    r1.w = r10.z * 2.0 + r3.w;
    r6.xyz = r1.wyz * r9.xxx;
    ps = 1.0 + r6.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r9.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r9.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r1.yz = r0.ww * r5.zw;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r4.zxy);
    r5.xyz = r6.yzw * r6.xxx;
    r4.xyz = r5.xyz * 2.0 - r4.xyz;
    r6.x = saturate(dot(r2.zxy, r4.zxy));
    ps = log2(r6.x);
    r0.xyz = r3.xyz * r0.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wyz, r2.zxy));
    r6.x = ps;
    r6.xyz = r1.xzy * r6.xxx;
    r6.y = r0.z * r6.w + r6.y;
    r6.xz = r0.xy * r6.ww + r6.xz;
    r6.xyz = r8.ywz * r6.xyz;
    r6.xyz = r6.xyz * LightColor.xzy;
    r6.xyz = r6.xzy * r7.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
