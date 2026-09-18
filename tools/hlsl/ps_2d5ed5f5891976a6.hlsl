// ps_2d5ed5f5891976a6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 396 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000630 10041800 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
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
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
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
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_7, r0.xy);
    ps = 0.1 - -r2.z;
    r0.w = ps;
    ps = r5.w;
    r7.xy = r1.xy * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r1.z = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    ps = rsqrt(abs(r1.z));
    r1.w = r12.w - 0.5;
    r1.z = ps;
    ps = 5.0 * r0.w;
    r9.xyz = r1.zzz * r4.xyz;
    r1.z = saturate(ps);
    ps = 0.00022222222 * r0.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.wwww)) clip(-1.0);
    r1.w = saturate(ps);
    ps = (-0.025) * r1.w;
    r0.zw = r1.xy * 6.0;
    r2.w = ps;
    r8.xy = r9.xy * r2.ww + r7.xy;
    r7.xyw = tex2D(Texture2D_0, r8.xy).xyz;
    ps = r1.x;
    r10.xy = r1.xy * UniformVector_7.xy;
    ps = UniformVector_2.x * ps;
    r11.y = -r1.y + 1.0;
    r15.x = ps;
    ps = 1.0 / r5.w;
    r4.w = saturate(r5.w * 0.0001);
    r4.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r8.zw = r5.xy * ScreenPositionScaleBias.xy;
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.xyz = r8.zwy * r4.yyx;
    r5.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r11.xw = -r4.zw + 1.0;
    r11.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r15.yzw = r11.yxz * UniformVector_2.yyx;
    r5.y = ps;
    ps = r15.w;
    r6.xy = r5.xy * abs(r6.xy);
    ps = r8.x * ps;
    r5.xyz = r15.zxy - 0.5;
    r13.w = ps;
    ps = r7.x + r7.x;
    r21.x = float((r13.w >= 0.5));
    r13.x = ps;
    ps = r7.y + r7.y;
    r21.yzw = float3((r15.xzy >= 0.5));
    r13.y = ps;
    ps = r7.w + r7.w;
    r16.yzw = r5.xzy - r15.zyx;
    r13.z = ps;
    r14 = r13 + float4(-1.0, -1.0, -1.0, -0.5);
    ps = ScreenPositionScaleBias.w + r4.x;
    r16.x = r14.w - r13.w;
    r5.x = ps;
    r13.x = r16.x * r21.x + r13.w;
    r13.yzw = r16.ywz * r21.zyw + r15.zxy;
    ps = ScreenPositionScaleBias.z + r4.y;
    r13 = r13.zwxy + r13.zwxy;
    r5.y = ps;
    r5.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r8.xyz = tex2D(Texture2D_6, r8.xy).xyz;
    r4 = tex2D(Texture2D_1, r13.xy);
    r20 = tex2D(Texture2D_1, r13.zw);
    r19.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r23 = tex2D(Texture2D_4, r0.xy);
    r24 = tex2D(Texture2D_5, r0.xy);
    r22.xyz = tex2D(Texture2D_8, r10.xy).xyz;
    r10.xyw = tex2D(Texture2D_2, r0.zw).xyw;
    r16.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xyw = tex2D(Texture2D_2, r1.xy).xyw;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r0.w = float((UniformScalar_5.x > 0.0));
    r0.z = ps;
    ps = -ModShadowColor.x;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r13.xyz = UniformVector_6.xzy * 2e+01;
    r17.x = ps;
    ps = -ModShadowColor.y;
    r15.xyz = UniformVector_5.xzy * 2e+01;
    ps = 1.0 + ps;
    r2.w = float((UniformScalar_8.x >= 1.0));
    r17.y = ps;
    ps = -ModShadowColor.z;
    r5.w = dot(r2.zxy, r2.zxy);
    ps = 1.0 + ps;
    r6.z = float((UniformScalar_8.x > 1.0));
    r17.z = ps;
    ps = r6.x + r6.x;
    r0.x = dot(r3.zxy, r3.zxy);
    r18.z = ps;
    ps = r6.y + r6.y;
    r16.xyz = r16.xyz + r16.xyz;
    r18.w = ps;
    r19.zw = r10.xy * 2.0 - 1.0;
    ps = 1.0 - r0.x;
    r1.xy = r12.yz * UniformScalar_9.xx;
    r0.y = saturate(ps);
    r22.xyz = (-abs(r6.zzz) >= 0.0) ? r22.xyz : 1.0;
    ps = rsqrt(abs(r5.w));
    r3.xyz = r24.xzy * r24.www;
    r0.x = ps;
    ps = r10.w;
    r10.xyz = r23.xzy * r23.www;
    ps = r6.w * ps;
    r6.xyz = r0.xxx * r2.xyz;
    r0.x = ps;
    r2.xyz = (-abs(r2.www) >= 0.0) ? 1.0 : r22.yxz;
    ps = (-1.0) - -r0.x;
    r10.xyz = r15.xyz * r10.xyz;
    r15.x = ps;
    ps = log2(r0.y);
    r3.xyz = r13.xyz * r3.xyz;
    r0.y = ps;
    r13.xyz = (abs(r0.www) > 0.0) ? r10.xzy : r3.xzy;
    r15.yzw = (-abs(r0.www) >= 0.0) ? r3.yxz : r10.yxz;
    ps = UniformScalar_9.x * r2.y;
    r10.yz = r1.xy * r2.xz;
    r0.w = ps;
    ps = r0.w;
    r19 = r19 * float4(0.875, 0.875, 0.5, 0.5);
    r15.yzw = (-abs(r0.zzz) >= 0.0) ? r3.yxz : r15.yzw;
    r13.xyz = (abs(r0.zzz) > 0.0) ? r13.xyz : r3.xzy;
    ps = r12.x * ps;
    r0.z = dot(r13.zxy, float3(0.11, 0.3, 0.59));
    r10.x = ps;
    ps = r0.z;
    r3.y = dot(r21.yww, float3(1.0, 1.0, 1.0));
    r3.x = r21.z * 2.0 + r21.x;
    r1.x = (r3.x == 0.0) ? r20.x : r20.y;
    r0.z = (r3.y == 0.0) ? r4.x : r4.y;
    ps = -r13.x + ps;
    r3 = r3.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r0.w = ps;
    r0.z = (r3.z == 0.0) ? r4.z : r0.z;
    r1.x = (r3.y == 0.0) ? r20.z : r1.x;
    r16.w = (r3.x == 0.0) ? r20.w : r1.x;
    r1.x = (r3.w == 0.0) ? r4.w : r0.z;
    ps = r0.w;
    r0.z = max(r1.x, 0.0);
    ps = r13.x + ps;
    r3.xw = -r1.xz + 1.0;
    r4.z = saturate(ps);
    ps = r0.z;
    r1 = r16 + float4(-1.0, -1.0, -1.0, 0.25);
    r0.z = ps;
    ps = 0.3;
    r4.xy = r3.ww * ModShadowGroupColor.xy;
    r0.w = ps;
    ps = r1.w;
    r15.w = saturate(dot(r15.wyz, float3(0.59, 0.11, 0.3)));
    ps = r16.w + ps;
    r1.xyz = r1.zxy * UniformVector_4.zxy;
    r1.w = ps;
    r16.xy = -r1.yz * r15.ww + r1.yz;
    ps = r1.w;
    r10.xyz = r10.xyz + UniformScalar_10.xxx;
    ps = -r0.x + ps;
    r4.xyw = -r4.xyz + 1.0;
    r0.x = saturate(ps);
    ps = min(r0.z, r0.w);
    r8.xyz = r0.xxx * r8.xyz;
    r0.z = ps;
    ps = 3.3333333 * r0.z;
    r18.xy = r19.xy * r4.xy;
    r0.z = ps;
    ps = 1.0 - r1.x;
    r18 = r18 + float4(0.125, 0.125, -1.0, -1.0);
    r0.x = ps;
    ps = r18.x * r18.y;
    r15.yz = r18.zw + r19.zw;
    r0.w = ps;
    r4.xyz = r0.www * r17.xyz + ModShadowColor.xyz;
    ps = 2.5 * r3.x;
    r15 = r0.xzzz * r15.wxyz;
    r3.z = ps;
    ps = r1.x;
    r10.xyz = r10.xyz * r4.www;
    ps = r15.x + ps;
    r3.y = r15.y + 1.0;
    r1.z = ps;
    ps = r3.y * r3.x;
    r1.xy = r16.xy + r15.zw;
    r0.z = ps;
    ps = r3.z * r3.y;
    r1.xyz = -r14.xyz + r1.xyz;
    r0.x = ps;
    ps = (-0.5) + r0.x;
    r0.w = float((r0.z > 0.9));
    r0.z = saturate(ps);
    r1.xy = r1.xy * r0.zz + r14.xy;
    r3.xyz = r0.www * r13.xyz - r8.xyz;
    r0.x = r1.z * r0.z - 2.0;
    r1.z = r7.w * 2.0 + r0.x;
    r2.xyz = r2.yxz * r12.xyz + r3.xyz;
    r8.xyz = r2.xyz * r0.zzz + r8.xyz;
    r1.xyz = r1.zxy * r11.www;
    ps = 1.0 + r1.x;
    r1.w = ps;
    r1.xyz = (r11.www > 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r11.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    r0.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.x));
    r2.xyz = r10.xyz * r0.zzz;
    r0.x = ps;
    r3.xyz = r1.xyz * r0.xxx;
    r0.x = dot(r3.zxy, r9.zxy);
    r0.xzw = r3.xyz * r0.xxx;
    r0.xzw = r0.xzw * 2.0 - r9.xyz;
    r0.x = saturate(dot(r6.zxy, r0.wxz));
    ps = log2(r0.x);
    r1.yzw = r8.xyz * r7.xyz;
    r0.x = ps;
    ps = LightColorAndFalloffExponent.w * r0.y;
    r0.z = r0.x * 15.0;
    r0.x = ps;
    ps = pow(2.0, r0.z);
    r1.x = saturate(dot(r3.zyx, r6.zyx));
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r0.yzw = r2.xyz * r0.yyy;
    r0.x = ps;
    r0.yz = r1.yz * r1.xx + r0.yz;
    r0.w = r1.w * r1.x + r0.w;
    r0.xyz = r0.yzw * r0.xxx;
    r0.xyz = r0.xyz * r5.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.xzy * r4.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
