// ps_d7a76fa2654be637.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 393 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000624 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
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
sampler2D ModShadowAccumTexture : register(s11);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
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
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = r0.w + r0.w;
    r5.x = r4.w - 4e+02;
    r11.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r1.z + 0.1;
    r2.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = UniformScalar_3.x * UniformVector_4.x;
    r2.z = ps;
    ps = UniformScalar_4.x * r5.z;
    r2.x = dot(r3.zxy, r3.zxy);
    r1.w = ps;
    ps = rsqrt(abs(r2.x));
    r7.zw = r2.yz * abs(r7.xy);
    r5.z = ps;
    ps = floor(r1.w);
    r7.xy = r0.xy * UniformVector_2.xy;
    r12.w = ps;
    ps = 0.00022222222 * r5.x;
    r8 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r5.x = saturate(ps);
    ps = 5.0 * r5.y;
    r12.xyz = r5.zzz * r3.xyz;
    r5.z = saturate(ps);
    ps = 1.0 - r0.z;
    r5.w = UniformScalar_16.x * 0.05;
    r9.z = ps;
    ps = 1.0 / UniformScalar_1.x;
    r5.y = r5.w * r5.x;
    r5.w = ps;
    r2.xyw = r12.wxy * r5.wyy + r0.xwz;
    ps = r0.z + r0.z;
    r9.y = -r2.w + 1.0;
    r11.w = ps;
    ps = UniformVector_1.x * r2.y;
    r9.yz = r9.zy * UniformVector_1.yy;
    r9.w = ps;
    ps = UniformVector_1.x * r0.w;
    r13.zw = r4.xy * ScreenPositionScaleBias.xy;
    r9.x = ps;
    ps = r0.y;
    r3 = r9.wzxy - 0.5;
    ps = UniformScalar_8.x + ps;
    r21 = float4((r9.wzxy >= 0.5));
    r2.z = ps;
    ps = r2.y + r2.y;
    r0 = r3 - r9.wzxy;
    r5.y = ps;
    r0 = r0 * r21 + r9.wzxy;
    ps = r2.w + r2.w;
    r0 = r0 + r0;
    r5.w = ps;
    r11.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r10 = tex2D(Texture2D_9, r7.xy);
    r7.z = tex2D(Texture2D_6, r7.xy).x;
    r3.xyz = tex2D(Texture2D_8, r5.yw).xyz;
    r14 = tex2D(Texture2D_7, r2.xz);
    r20 = tex2D(Texture2D_3, r0.zw);
    r22 = tex2D(Texture2D_3, r0.xy);
    r15 = tex2D(Texture2D_2, r11.zw);
    r9.xyz = tex2D(Texture2D_5, r7.xy).xyz;
    r18.yzw = tex2D(Texture2D_4, r8.zw).xyw;
    r2.xyz = tex2D(Texture2D_0, r5.yw).xyz;
    r7.xyw = tex2D(Texture2D_1, r11.zw).xyz;
    r0 = tex2D(Texture2D_4, r8.xy).xzwy;
    r5.w = saturate(r4.w * 0.0001);
    r5.y = saturate(r6.w * 15.0);
    ps = -r6.w;
    r19.xyz = UniformVector_5.xyz * 2e+01;
    ps = UniformScalar_12.x + ps;
    r1.w = float((UniformScalar_11.x >= 1.0));
    r2.w = ps;
    r17.zw = r0.xw * 2.0 - 1.0;
    r8.xyz = r7.xyw * 2.0 - 1.0;
    r7.xyw = r2.xyz * 2.0 - 1.0;
    r1.w = r2.w * r1.w + r6.w;
    r11.zw = r18.yz * 2.0 - 1.0;
    r16.xy = r11.zw * 0.5;
    ps = -r1.w;
    r9.yzw = r9.xyz + r9.xyz;
    ps = r6.z + ps;
    r8.xyz = r8.xyz - r7.xyw;
    r6.x = ps;
    r3.w = r8.z * r15.w - 2.0;
    r8.xyz = r8.xyz * r15.www + r7.xyw;
    ps = r5.y;
    r6.y = max(r6.x, UniformScalar_13.x);
    r5.x = ps;
    ps = 1.0 - r5.x;
    r7.y = dot(r21.zww, float3(1.0, 1.0, 1.0));
    r1.w = ps;
    ps = 1.0 - r5.z;
    r7.x = dot(r21.xyy, float3(1.0, 1.0, 1.0));
    r5.z = ps;
    r6.x = (r7.x == 0.0) ? r22.x : r22.y;
    r2.w = (r7.y == 0.0) ? r20.x : r20.y;
    ps = 1.0 - r5.w;
    r21 = r7.xyyx + float4(-3.0, -2.0, -3.0, -2.0);
    r2.x = ps;
    r5.x = (r21.y == 0.0) ? r20.z : r2.w;
    r5.w = (r21.w == 0.0) ? r22.z : r6.x;
    r17.x = (r21.x == 0.0) ? r22.w : r5.w;
    r5.x = (r21.z == 0.0) ? r20.w : r5.x;
    ps = ModShadowGroupColor.x * r5.z;
    r6.x = max(r5.x, 0.0);
    r7.x = ps;
    ps = 1.0 / UniformScalar_14.x;
    r6.xy = min(r6.yx, float2(1.0, 0.3));
    r5.w = ps;
    ps = 3.3333333 * r6.y;
    r5.w = saturate(r6.x * r5.w);
    r17.y = ps;
    ps = 1.0 - r5.x;
    r14.xyz = r14.xyz * r14.www;
    r0.x = ps;
    ps = 1.0 - r5.w;
    r2.yw = -r17.xy + 1.0;
    r0.w = ps;
    ps = r5.y;
    r14.xyz = r19.xyz * r14.xyz;
    ps = r2.w * ps;
    r18.x = r0.w * r6.w;
    r16.z = ps;
    r5.w = dot(r5.yy, r2.yy) + r17.x;
    ps = r5.w;
    r5.xy = r18.wx * r0.zy;
    ps = r17.x + ps;
    r16.xyz = r17.zyw + r16.xzy;
    r9.x = ps;
    ps = (-1.0) - -r5.x;
    r6 = r9 + float4(0.25, -1.0, -1.0, -1.0);
    r16.w = ps;
    ps = r6.x;
    r7.w = float((r5.y >= 0.05));
    ps = -r5.x + ps;
    r6.xyz = r6.wyz * UniformVector_4.zxy;
    r5.x = saturate(ps);
    r0.y = r16.w * r16.y + 1.0;
    ps = ModShadowGroupColor.y * r5.z;
    r5.xyw = r5.xxx * r3.xyz;
    r7.y = ps;
    r9 = -r7.wxyz + 1.0;
    r3.xy = r6.yz * r7.zz - r8.xy;
    r13.xy = r16.xy * r16.yz + r3.xy;
    ps = 2.5 * r0.x;
    r3.xyz = -r5.xyw + r15.xyz;
    r0.z = ps;
    r5.z = (UniformScalar_12.x > 0.0) ? r9.x : 1.0;
    r2.y = (UniformScalar_12.x >= 0.0) ? r5.z : r9.x;
    r3.xyz = r3.xyz * r15.www + r5.xyw;
    ps = (-1.0) - -r6.x;
    r5.xy = r0.yz * r0.xy;
    r14.w = ps;
    ps = 1.0 / r4.w;
    r7 = r14 * r7.zzzz;
    r5.z = ps;
    r0.xy = r13.zw * r5.zz + ScreenPositionScaleBias.wz;
    ps = -r8.z;
    r6.x = dot(r1.zxy, r1.zxy);
    ps = r7.w + ps;
    r5.w = float((r5.x >= 0.9));
    r5.x = ps;
    r6.w = saturate(r5.y * r1.w - 0.5);
    r5.yz = r13.xy * r6.ww + r8.xy;
    r4.xyz = r7.xyz * r5.www + r10.xyz;
    ps = 1.0 + r5.x;
    r4.xyz = r4.xyz - r3.xyz;
    r4.w = ps;
    r8 = r4 * r6.wwww + r3;
    r5.w = r2.z * 2.0 + r8.w;
    r5.xyz = r5.wyz * r2.xxx;
    ps = 1.0 + r5.x;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r2.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r2.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r6.x));
    r5.x = dot(r5.wyz, r5.wyz);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r4.xyz = r6.xxx * r1.xyz;
    r5.x = ps;
    r7.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r7.zxy, r12.zxy);
    r5.xyz = r7.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r12.xyz;
    r5.x = saturate(dot(r4.zxy, r5.zxy));
    ps = log2(r5.x);
    r5.z = r2.y * r10.w;
    r11.z = ps;
    r6.xyz = r11.xyz * float3(0.875, 0.875, 15.0);
    r5.xy = r6.xy * r9.yz;
    r1.xyz = r5.xyz + float3(0.125, 0.125, -0.5);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r5.xyz = tex2D(LightAttenuationTexture, r0.xy).zxy;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r2.xyz = r10.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r2.xyz = r2.xyz * r9.www;
    ps = LightColor.x * r5.y;
    r2.xyz = r2.xyz * r6.www;
    r6.x = ps;
    ps = LightColor.y * r5.z;
    r3.xyz = r8.xyz * r3.xyz;
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r5.w = saturate(dot(r7.zyx, r4.zyx));
    r6.z = ps;
    ps = LightColor.z * r5.x;
    r2.xyz = r2.xyz * r6.zzz;
    r6.z = ps;
    r5.xy = r3.xy * r5.ww + r2.xy;
    r5.z = r3.z * r5.w + r2.z;
    ps = r1.x * r1.y;
    r6.xyz = r6.xyz * r5.xyz;
    r5.x = ps;
    r5.xyz = r5.xxx * r0.xyz + ModShadowColor.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
