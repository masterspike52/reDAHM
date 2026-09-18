// ps_da23334f688a1e97.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 351 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000057C 10041600 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D ShadowTexture : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
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
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
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

    ps = r1.x;
    r6.zw = UniformVector_1.xy * 1.7;
    ps = UniformScalar_2.x * ps;
    r7 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r16.x = ps;
    ps = r1.y;
    r6.zw = r6.zw * r1.wz;
    ps = UniformScalar_2.x * ps;
    r9 = r7 * r1.wzwz;
    r16.y = ps;
    r7.xyz = tex2D(Texture2D_1, r9.zw).xyz;
    r20.xyz = tex2D(Texture2D_4, r16.xy).xyz;
    r11.x = tex2D(ShadowTexture, r0.xy).x;
    r21 = tex2D(Texture2D_3, r9.xy);
    r13 = tex2D(Texture2D_3, r6.zw);
    ps = 0.0001 * r5.w;
    r6.xy = r1.xy * UniformScalar_0.xx;
    r0.x = saturate(ps);
    r12.xyz = tex2D(Texture2D_0, r6.xy).xyw;
    ps = r2.z;
    r1.x = r21.w * r13.w;
    ps = 0.1 + ps;
    r10.xy = r1.wz * UniformScalar_5.xx;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r10.z = float((r1.w >= 0.5));
    r0.y = saturate(ps);
    ps = r12.x + r12.x;
    r11.yz = r5.xy * ScreenPositionScaleBias.xy;
    r19.x = ps;
    ps = 1.0 - r1.z;
    r2.w = dot(r4.zxy, r4.zxy);
    r0.z = ps;
    ps = 1.0 / r5.w;
    r20.w = float((r0.z >= 0.5));
    r11.w = ps;
    ps = r12.y + r12.y;
    r6.xyw = r11.yxz * r11.wxw;
    r19.y = ps;
    r19.z = r20.w * 2.0 + r10.z;
    ps = 1.0 - r1.x;
    r0.yw = -r0.yz + float2(1.0, 0.5);
    r10.w = ps;
    ps = ScreenPositionScaleBias.w + r6.x;
    r0.yz = r0.yy * ModShadowGroupColor.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.xw = r10.zw * float2(-0.5, 0.5);
    r10.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = r0.w - r1.z;
    r10.w = ps;
    r15.y = dot(r6.zz, r20.ww) - r1.z;
    ps = r5.x;
    r8.xy = r10.zw * abs(r8.xy);
    ps = r1.w + ps;
    r0.yzw = -r0.xyz + 1.0;
    r7.w = ps;
    ps = UniformScalar_1.x * r0.y;
    r11 = r19.zyxz + float4(-3.0, -1.0, -1.0, -2.0);
    r4.w = ps;
    ps = ScreenPositionScaleBias.z + r6.w;
    r15.zw = r4.ww * r11.yz;
    r5.z = ps;
    ps = r7.z + r7.z;
    r14.xyz = r15.ywz + float3(2.0, -2.0, -2.0);
    r1.y = ps;
    ps = r7.w + r7.w;
    r1.w = r14.x - r1.z;
    r1.z = ps;
    r10.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r9.xyz = tex2D(Texture2D_5, r9.zw).xyz;
    r11.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r17 = tex2D(Texture2D_2, r1.zw);
    r18.xyz = tex2D(LightAttenuationTexture, r5.yz).xyz;
    r22.xyz = tex2D(Texture2D_6, r16.xy).xyz;
    r6.z = dot(r2.zxy, r2.zxy);
    r6.x = dot(r3.zxy, r3.zxy);
    r0.x = r21.z * 2.0 + r13.z;
    ps = rsqrt(abs(r2.w));
    r13.zw = r13.xy + r13.xy;
    r2.w = ps;
    ps = rsqrt(abs(r6.z));
    r4.xyz = r2.www * r4.xyz;
    r2.w = ps;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 - r6.x;
    r6.z = dot(r22.zxy, float3(0.11, 0.3, 0.59));
    r6.x = saturate(ps);
    ps = 4.0 * r7.x;
    r3.xyz = r2.www * r2.xyz;
    r13.x = ps;
    ps = log2(r6.x);
    r2.xyz = r6.zzz - r22.xyz;
    r6.x = ps;
    ps = 4.0 * r7.y;
    r18.yzw = r6.yyy * r18.xyz;
    r13.y = ps;
    r5.xyz = r2.xyz * UniformScalar_4.xxx + r22.xyz;
    r20.xyz = r20.zxy * 2.0 - 1.0;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r2 = r13 + float4(-2.0, -2.0, -3.0, -3.0);
    r3.w = ps;
    r6.xz = r21.yx * 4.0 + r2.wz;
    r6.y = (r19.z == 0.0) ? r17.x : r17.y;
    r6.y = (r11.w == 0.0) ? r17.z : r6.y;
    r7.x = (r11.x == 0.0) ? r17.w : r6.y;
    ps = 1.0 - r7.x;
    r6.w = max(r7.x, 0.0);
    r6.y = ps;
    ps = 2.5 * r6.y;
    r20.w = r20.z + r15.z;
    r2.z = ps;
    ps = r20.y;
    r11.x = min(r6.w, 0.3);
    ps = r15.w + ps;
    r11.xyw = r11.yzx * float3(0.875, 0.875, 3.3333333);
    r6.y = ps;
    ps = UniformVector_3.x * r6.y;
    r7.yzw = r11.wxy * r0.xzw;
    r18.x = ps;
    ps = 0.1 * r7.y;
    r6.yw = r1.yx - 1.0;
    r19.x = ps;
    ps = 0.5 * r6.y;
    r11.xyz = r5.xyz * UniformVector_4.xyz;
    r15.x = ps;
    ps = pow(2.0, r3.w);
    r17.yzw = r7.xzw + float3(-0.75, 0.125, 0.125);
    r1.x = ps;
    ps = r17.y;
    r1.xyz = r18.ywz * r1.xxx;
    ps = r7.x + ps;
    r6.xyz = r11.www * r6.wxz;
    r6.w = ps;
    ps = 1.0 + r6.x;
    r15.yz = r2.xy + r15.wz;
    r2.w = ps;
    ps = r6.z + r6.z;
    r18.yz = r20.xw * UniformVector_3.zy;
    r19.y = ps;
    ps = r6.y + r6.y;
    r6.w = saturate(r6.w + r5.w);
    r19.z = ps;
    ps = abs(r2.w) * abs(r2.w);
    r9.xyz = r6.www * r9.xyz;
    r17.x = ps;
    ps = r17.x * r17.x;
    r6.xyz = r19.yxz + r18.xyz;
    r2.x = ps;
    ps = r17.z * r17.w;
    r7.yzw = r6.yxz - r15.xyz;
    r2.y = ps;
    r6.xzw = r2.yyy * r16.xyz + ModShadowColor.xyz;
    r2.xw = r2.zx * r2.wx;
    ps = r9.x;
    r7.x = saturate(r2.x - 0.5);
    r12.w = r7.y * r7.x + r15.x;
    r7.yz = r7.zw * r7.xx + r14.yz;
    ps = r12.z * ps;
    r2.yz = r7.yz + r13.xy;
    r9.x = ps;
    ps = r9.y;
    r7.yz = r12.zw - 1.0;
    ps = r12.z * ps;
    r13.xy = r2.yz * r0.yy;
    r9.y = ps;
    r13.zw = r7.zy * r0.yy + 1.0;
    r6.y = (r4.w > 0.0) ? r13.w : 1.0;
    r7.yzw = (r0.yyy > 0.0) ? r13.xyz : float3(0.0, 0.0, 1.0);
    r6.y = (r4.w >= 0.0) ? r6.y : 1.0;
    ps = r9.z;
    r10.xyz = r6.yyy * r10.xyz;
    r7.yzw = (r0.yyy >= 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    ps = r12.z * ps;
    r6.y = dot(r7.wyz, r7.wyz);
    r9.z = ps;
    r0.xyz = r11.xyz * r10.xyz - r9.xyz;
    r10.xyz = r10.xyz * UniformVector_4.xyz;
    r5.xyz = r10.xyz * r5.xyz;
    r0.xyz = r0.xyz * r7.xxx + r9.xyz;
    ps = rsqrt(abs(r6.y));
    r0.xyz = r0.xyz * r8.xyz;
    r6.y = ps;
    r2.xyz = r5.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r7.yzw = r7.yzw * r6.yyy;
    r6.y = dot(r7.wyz, r4.zxy);
    r5.xyz = r7.yzw * r6.yyy;
    r4.xyz = r5.xyz * 2.0 - r4.xyz;
    r6.y = saturate(dot(r3.zxy, r4.zxy));
    ps = log2(r6.y);
    r2.xyz = r2.www * r2.xyz;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r7.w = saturate(dot(r7.wzy, r3.zyx));
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r7.xyz = r2.xyz * r7.xxx;
    r6.y = ps;
    r7.xyz = r7.xyz * r6.yyy;
    r7.xy = r0.xy * r7.ww + r7.xy;
    r7.z = r0.z * r7.w + r7.z;
    r7.xyz = r1.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xwz;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
