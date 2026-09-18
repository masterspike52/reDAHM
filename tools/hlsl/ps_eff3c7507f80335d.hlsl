// ps_eff3c7507f80335d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000618 10041700 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c14); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_7 : register(c11); // float
float4 UniformScalar_8 : register(c12); // float
float4 UniformScalar_9 : register(c13); // float
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

    ps = r1.w;
    r7.xy = UniformVector_1.xy * 1.7;
    ps = UniformScalar_4.x * ps;
    r8 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r6.z = ps;
    ps = r1.z;
    r7.xy = r7.xy * r1.wz;
    ps = UniformScalar_4.x * ps;
    r10 = r8 * r1.wzwz;
    r6.w = ps;
    r21.yzw = tex2D(Texture2D_3, r7.xy).xyw;
    r17.x = tex2D(Texture2D_6, r6.zw).x;
    r17.yzw = tex2D(Texture2D_3, r10.xy).xyw;
    ps = 0.0001 * r5.w;
    r6.xy = r1.xy * UniformScalar_0.xx;
    r11.w = saturate(ps);
    r12.xyz = tex2D(Texture2D_0, r6.xy).xyw;
    r6.yzw = tex2D(Texture2D_1, r10.zw).xyz;
    r7.xz = r1.xy * UniformScalar_2.xx;
    ps = -r1.z;
    r7.yw = r1.wz * 1.8e+02;
    ps = 1.0 + ps;
    r6.x = r2.z + 0.1;
    r11.x = ps;
    ps = 1.0 / r5.w;
    r8.yz = r5.xy * ScreenPositionScaleBias.xy;
    r8.x = ps;
    r5.yz = r8.yz * r8.xx + ScreenPositionScaleBias.wz;
    r16.x = r6.w * 2.0 - 1.0;
    ps = 5.0 * r6.x;
    r13.xy = r1.wz * UniformScalar_8.xx;
    r22.x = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r15.xy = r12.xy + r12.xy;
    r13.z = ps;
    ps = 4.0 * r6.y;
    r16.y = float((r1.w >= 0.5));
    r15.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r23.x = float((r11.x >= 0.5));
    r13.w = ps;
    ps = 4.0 * r6.z;
    r22.yzw = r17.xyz * float3(0.6, 4.0, 4.0);
    r15.w = ps;
    ps = r13.z;
    r8 = r15.zwxy + float4(-2.0, -2.0, -1.0, -1.0);
    ps = abs(r9.x) * ps;
    r5.xw = -r22.xy + 1.0;
    r0.z = ps;
    ps = r13.w;
    r11.yz = r5.xx * ModShadowGroupColor.xy;
    ps = abs(r9.y) * ps;
    r11 = -r11.wxyz + float4(1.0, 0.5, 1.0, 1.0);
    r0.w = ps;
    ps = r11.y;
    r2.w = r11.x * UniformScalar_1.x;
    ps = -r1.z + ps;
    r16.zw = r2.ww * r8.zw;
    r6.x = ps;
    r6.y = dot(r6.xx, r23.xx) - r1.z;
    ps = 2.0 + r6.y;
    r18.zw = r16.xy * float2(0.5, -0.5);
    r6.x = ps;
    ps = r6.x;
    r21.x = r18.w + r1.w;
    ps = -r1.z + ps;
    r6.xyw = r21.xyz + r21.xyz;
    r6.z = ps;
    r9.xyz = tex2D(Texture2D_9, r13.xy).xyz;
    r1.xyz = tex2D(Texture2D_7, r10.zw).xyz;
    r19.xyz = tex2D(LightAttenuationTexture, r5.yz).xyz;
    r20.x = tex2D(ShadowTexture, r0.xy).x;
    r14.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r7.yw = tex2D(Texture2D_5, r7.yw).xy;
    r10 = tex2D(Texture2D_2, r6.xz);
    r23.yzw = tex2D(Texture2D_4, r7.xz).xyz;
    r0.xzw = tex2D(Texture2D_8, r7.xz).xyz;
    r7.x = dot(r2.zxy, r2.zxy);
    r7.z = dot(r4.zxy, r4.zxy);
    r6.x = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r7.z));
    r6.x = saturate(-r6.x + 1.0);
    r7.z = ps;
    ps = rsqrt(abs(r7.x));
    r3.xyz = r7.zzz * r4.xyz;
    r7.z = ps;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    ps = r17.w;
    r7.x = dot(r0.wxz, float3(0.11, 0.3, 0.59));
    ps = r21.w * ps;
    r2.xyz = r7.zzz * r2.xyz;
    r0.y = ps;
    ps = log2(r6.x);
    r4.xyz = r7.xxx - r0.xzw;
    r6.x = ps;
    r4.xyz = r4.xyz * UniformScalar_7.xxx + r0.xzw;
    r21.x = r23.w * 2.0 - 1.0;
    r0.xzw = r23.yzx * 2.0 + float3(-1.0, -1.0, 0.0);
    ps = (-1.0) - -r0.y;
    r21.yzw = r0.wxz + r16.yzw;
    r8.z = ps;
    r0.x = (r21.y == 0.0) ? r10.x : r10.y;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r7.xz = r21.yy + float2(-2.0, -3.0);
    r3.w = ps;
    r0.w = r21.x * UniformVector_3.z - r18.z;
    r7.x = (r7.x == 0.0) ? r10.z : r0.x;
    r7.z = (r7.z == 0.0) ? r10.w : r7.x;
    ps = 1.0 - r7.z;
    r10.xyz = r4.xyz * UniformVector_4.xyz;
    r8.w = ps;
    ps = (-0.75) + r7.z;
    r18.xy = r8.xy + r16.zw;
    r7.x = ps;
    ps = (-3.0) + r6.y;
    r8.y = max(r7.z, 0.0);
    r8.x = ps;
    ps = (-3.0) + r6.w;
    r6.x = min(r8.y, 0.3);
    r8.y = ps;
    ps = 3.3333333 * r6.x;
    r6.yzw = r7.ywx + r7.ywz;
    r6.x = ps;
    ps = (-1.0) + r6.y;
    r8.xy = r8.xy + r22.zw;
    r14.z = ps;
    ps = (-1.0) + r6.z;
    r8.xyz = r6.xxx * r8.xzy;
    r14.w = ps;
    ps = 1.0 + r8.y;
    r7.xyw = r8.xzw * float3(4.0, 4.0, 2.5);
    r6.x = ps;
    ps = abs(r6.x) * abs(r6.x);
    r14 = r14 * float4(0.875, 0.875, 0.018, 0.018);
    r20.y = ps;
    r7.w = saturate(r7.w * r6.x - 0.5);
    r7.xy = r21.zw * UniformVector_3.xy + r7.xy;
    ps = r20.x * r20.x;
    r14.xy = r14.xy * r11.zw;
    r6.x = ps;
    ps = r20.y * r20.y;
    r0.xz = r7.xy - r18.xy;
    r1.w = ps;
    ps = pow(2.0, r3.w);
    r8.yzw = r6.xxx * r19.xyz;
    r8.x = ps;
    r7.xyz = r0.xzw * r7.www;
    r0.xzw = r18.xyz + r7.xyz;
    r18.xy = -r0.xz + r14.zw;
    r18.zw = -r0.wy + 1.0;
    r6.x = saturate(r18.w * 0.5 + r6.w);
    r1.xyz = r6.xxx * r1.xyz;
    r12.w = r18.z * r17.x + r0.w;
    r6.xy = r18.xy * r17.xx + r7.xy;
    r14.zw = r6.xy + r16.zw;
    r0.xw = r12.zw - 1.0;
    r6.w = r0.w * r11.x + 1.0;
    r14 = r14 + float4(0.125, 0.125, -2.0, -2.0);
    ps = r14.x * r14.y;
    r0.yz = r14.zw + r15.zw;
    r6.x = ps;
    r7.xyz = r6.xxx * r13.xyz + ModShadowColor.xyz;
    r6.xyz = r0.yxz * r11.xxx;
    ps = 1.0 + r6.y;
    r0.xyz = r1.xyz * r12.zzz;
    r0.w = ps;
    r6.yzw = (r11.xxx > 0.0) ? r6.xzw : float3(0.0, 0.0, 1.0);
    r6.x = (r2.w > 0.0) ? r0.w : 1.0;
    r6.x = (r2.w >= 0.0) ? r6.x : 1.0;
    r1.xyz = (r11.xxx >= 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.w = dot(r1.zxy, r1.zxy);
    r9.xyz = r6.xxx * r9.xyz;
    r6.xyz = r9.xyz * UniformVector_4.xyz;
    r9.xyz = r10.xyz * r9.xyz - r0.xyz;
    r0.xyz = r9.xyz * r7.www + r0.xyz;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r6.xyz * r4.xyz;
    r6.w = ps;
    r4.xyz = r1.xyz * r6.www;
    r6.w = saturate(dot(r4.zyx, r2.zyx));
    r1.xyz = r6.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r6.x = dot(r4.zxy, r3.zxy);
    r0.xyz = r5.www * r0.xyz;
    r0.xyz = r0.xyz * r5.xyz;
    r6.xyz = r4.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r3.xyz;
    ps = r1.w * r1.w;
    r6.x = saturate(dot(r2.zxy, r6.zxy));
    r6.y = ps;
    ps = log2(r6.x);
    r1.xyz = r6.yyy * r1.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r8.xyz = r8.ywz * r8.xxx;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r1.xyz = r1.xyz * r7.www;
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r8.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r7.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
