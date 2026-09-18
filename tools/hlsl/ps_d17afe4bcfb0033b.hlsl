// ps_d17afe4bcfb0033b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000618 10041500 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_13 : register(c14); // float
float4 UniformScalar_8 : register(c11); // float
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_8, r0.xy);
    r0.z = r10.w - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r8 = tex2D(Texture2D_5, r0.xy);
    r13 = tex2D(Texture2D_4, r0.xy);
    r12.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    ps = r1.x;
    r9.xy = r1.xy * 6.0;
    ps = UniformVector_2.x * ps;
    r7.xy = r1.xy * UniformVector_7.xy;
    r11.x = ps;
    ps = -r1.y;
    r15.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = 1.0 + ps;
    r20.yzw = -ModShadowColor.xyz + 1.0;
    r11.z = ps;
    ps = r1.x;
    r16.xyz = UniformVector_5.xzy * 2e+01;
    ps = UniformVector_1.x * ps;
    r17.xyz = UniformVector_6.xzy * 2e+01;
    r9.z = ps;
    ps = r1.y;
    r1.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = UniformVector_1.y * ps;
    r0.x = r5.w - 4e+02;
    r9.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.y = r2.z + 0.1;
    r7.z = ps;
    ps = r12.x + r12.x;
    r0.w = dot(r4.zxy, r4.zxy);
    r12.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.xyz = r13.xzy * r13.www;
    r7.w = ps;
    ps = 0.00022222222 * r0.x;
    r14.xyz = r8.xzy * r8.www;
    r0.z = saturate(ps);
    ps = rsqrt(abs(r0.w));
    r7.zw = r7.zw * abs(r6.xy);
    r0.w = ps;
    ps = 5.0 * r0.y;
    r8.xyz = r0.www * r4.xyz;
    r0.w = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r14.xyz = r17.xyz * r14.xyz;
    r11.w = ps;
    ps = (-0.025) * r0.z;
    r21.xyz = r16.xyz * r13.xyz;
    r0.x = ps;
    r4.xyz = (-abs(r1.www) >= 0.0) ? r14.yxz : r21.yxz;
    ps = 1.0 / UniformVector_1.y;
    r13.w = saturate(dot(r4.zxy, float3(0.59, 0.11, 0.3)));
    r20.x = ps;
    r0.xy = r8.xy * r0.xx + r9.zw;
    r11.y = -r0.y * r20.x + 1.0;
    ps = r12.y + r12.y;
    r11.yzw = r11.zyw * UniformVector_2.yyx;
    r12.y = ps;
    ps = r12.z + r12.z;
    r4.xyz = r11.zxy - 0.5;
    r12.z = ps;
    ps = r11.w;
    r13.xyz = float3((r11.xzy >= 0.5));
    ps = r0.x * ps;
    r6.xyz = r4.xzy - r11.zyx;
    r12.w = ps;
    r4 = r12 + float4(-1.0, -1.0, -1.0, -0.5);
    r11.yzw = r6.xzy * r13.yxz + r11.zxy;
    ps = r4.w;
    r19.x = float((r12.w >= 0.5));
    ps = -r12.w + ps;
    r4.xzw = r4.zxy * UniformVector_4.zxy;
    r15.x = ps;
    ps = 1.0 / r5.w;
    r19.yz = -r4.zw * r13.ww;
    r19.w = ps;
    r6.xy = r15.yz * r19.ww + ScreenPositionScaleBias.wz;
    r11.x = r15.x * r19.x + r12.w;
    r11 = r11.zwxy + r11.zwxy;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r15.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r18 = tex2D(Texture2D_1, r11.zw);
    r12 = tex2D(Texture2D_1, r11.xy);
    r16.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r11.xyz = tex2D(Texture2D_7, r7.xy).xyz;
    r7.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r9.xyw = tex2D(Texture2D_2, r9.xy).xyw;
    r1.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r2.w = float((UniformScalar_11.x >= 1.0));
    r4.y = float((UniformScalar_11.x > 1.0));
    r0.x = dot(r3.zxy, r3.zxy);
    r0.y = dot(r2.zxy, r2.zxy);
    r16.zw = r9.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.y));
    r17.xyz = r7.xyw + r7.xyw;
    r0.y = ps;
    ps = 1.0 - r0.x;
    r3.xyz = r10.xyz * UniformScalar_12.xxx;
    r0.x = saturate(ps);
    r11.xyz = (-abs(r4.yyy) >= 0.0) ? r11.xyz : 1.0;
    r11.xyz = (-abs(r2.www) >= 0.0) ? 1.0 : r11.xyz;
    ps = log2(r0.x);
    r7.xyz = r0.yyy * r2.xyz;
    r0.y = ps;
    r16 = r16 * float4(0.875, 0.875, 0.5, 0.5);
    r2.xyz = r3.xyz * r11.xyz + UniformScalar_13.xxx;
    r9.xyz = (abs(r1.www) > 0.0) ? r21.xzy : r14.xzy;
    r0.x = dot(r9.zxy, float3(0.11, 0.3, 0.59));
    r0.x = r0.x - r9.x;
    ps = r5.w;
    r0.x = saturate(r0.x + r9.x);
    ps = 0.0001 * ps;
    r0.xw = -r0.wx + 1.0;
    r0.z = saturate(ps);
    ps = r1.x + r1.x;
    r3.xyz = r2.xyz * r0.www;
    r2.z = ps;
    r0.xw = -r0.xx * ModShadowGroupColor.xy + 1.0;
    ps = r1.y + r1.y;
    r2.xy = r16.xy * r0.xw;
    r2.w = ps;
    ps = r9.w;
    r14.y = dot(r13.xzz, float3(1.0, 1.0, 1.0));
    r0.x = (r14.y == 0.0) ? r12.x : r12.y;
    ps = r1.z * ps;
    r5 = r2 + float4(0.125, 0.125, -1.0, -1.0);
    r0.w = ps;
    ps = r13.y + r13.y;
    r1.x = r5.x * r5.y;
    r4.y = ps;
    r2.xyz = r1.xxx * r20.yzw + ModShadowColor.xyz;
    ps = (-1.0) - -r0.w;
    r14.xzw = r4.yzw + r19.xyz;
    r13.x = ps;
    r2.w = (r14.x == 0.0) ? r18.x : r18.y;
    ps = 1.0 - r4.x;
    r1 = r14.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r5.x = ps;
    r0.x = (r1.z == 0.0) ? r12.z : r0.x;
    r2.w = (r1.y == 0.0) ? r18.z : r2.w;
    r17.w = (r1.x == 0.0) ? r18.w : r2.w;
    r0.x = (r1.w == 0.0) ? r12.w : r0.x;
    ps = 1.0 - r0.x;
    r1.y = max(r0.x, 0.0);
    r1.x = ps;
    ps = 1.0 - r0.z;
    r1.y = min(r1.y, 0.3);
    r1.w = ps;
    ps = 2.5 * r1.x;
    r12 = r17 + float4(-1.0, -1.0, -1.0, 0.25);
    r1.z = ps;
    ps = 3.3333333 * r1.y;
    r0.x = r12.w + r17.w;
    r5.y = ps;
    ps = r0.x;
    r13.yz = r5.zw + r16.zw;
    ps = -r0.w + ps;
    r13 = r5.xyyy * r13.wxyz;
    r0.x = saturate(ps);
    ps = r4.x;
    r5.xyz = r0.xxx * r15.xyz;
    ps = r13.x + ps;
    r1.y = r13.y + 1.0;
    r4.z = ps;
    ps = r1.y * r1.x;
    r4.xy = r14.zw + r13.zw;
    r0.z = ps;
    ps = r1.z * r1.y;
    r4.xyz = -r12.xyz + r4.xyz;
    r0.x = ps;
    ps = (-0.5) + r0.x;
    r0.w = float((r0.z > 0.9));
    r0.z = saturate(ps);
    r4.xy = r4.xy * r0.zz + r12.xy;
    r9.xyz = r0.www * r9.xyz - r5.xyz;
    r0.x = r4.z * r0.z - 2.0;
    r4.z = r7.w * 2.0 + r0.x;
    r9.xyz = r11.xyz * r10.xyz + r9.xyz;
    r5.xyz = r9.xyz * r0.zzz + r5.xyz;
    r4.xyw = r4.xyz * r1.www;
    ps = -UniformVector_0.x;
    r4.z = r4.w + 1.0;
    r4.xyz = (r1.www > 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    r1.yzw = (r1.www >= 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r0.x = dot(r1.wyz, r1.wyz);
    r1.x = ps;
    ps = rsqrt(abs(r0.x));
    r3.xyz = r3.xyz * r0.zzz;
    r0.x = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r1.yzw * r0.xxx;
    ps = 1.0 + ps;
    r0.x = dot(r4.zxy, r8.zxy);
    r1.y = ps;
    ps = -UniformVector_0.z;
    r0.xzw = r4.xyz * r0.xxx;
    r0.xzw = r0.xzw * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r0.x = saturate(dot(r7.zxy, r0.wxz));
    r1.z = ps;
    ps = log2(r0.x);
    r1.yzw = r5.xyz * r1.xyz;
    r0.x = ps;
    ps = LightColorAndFalloffExponent.w * r0.y;
    r0.z = r0.x * 15.0;
    r0.x = ps;
    ps = pow(2.0, r0.z);
    r1.x = saturate(dot(r4.zyx, r7.zyx));
    r0.y = ps;
    ps = pow(2.0, r0.x);
    r0.yzw = r3.xyz * r0.yyy;
    r0.x = ps;
    r0.yz = r1.yz * r1.xx + r0.yz;
    r0.w = r1.w * r1.x + r0.w;
    r0.xyz = r0.yzw * r0.xxx;
    r0.xyz = r0.xyz * r6.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r0.xzy * r2.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
