// ps_dce129b4716c114d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 399 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000063C 10041800 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c21); // float4
float4 ModShadowAccumResolution : register(c26); // float2
float4 ModShadowColor : register(c24); // float3
float4 ModShadowGroupColor : register(c25); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c23); // float2
float4 SpotDirection : register(c22); // float3
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c17); // float
float4 UniformScalar_11 : register(c18); // float
float4 UniformScalar_12 : register(c19); // float
float4 UniformScalar_13 : register(c20); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_3 : register(c10); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformScalar_8 : register(c15); // float
float4 UniformScalar_9 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
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
sampler2D Texture2D_10 : register(s11);
sampler2D Texture2D_11 : register(s12);
sampler2D ModShadowAccumTexture : register(s13);

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
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.wz * UniformScalar_0.xx;
    r8 = UniformVector_1.xyxy * float4(6.0, 6.0, 1.8, 1.8);
    r9 = r8 * r0.wzwz;
    r13.xyz = tex2D(Texture2D_0, r5.xy).xyw;
    r23.xyz = tex2D(Texture2D_1, r9.zw).xyz;
    ps = 0.1 - -r1.z;
    r6.xy = r0.xy * UniformScalar_3.xx;
    r5.x = ps;
    r17.xyz = tex2D(Texture2D_5, r6.xy).xyz;
    r22.yzw = tex2D(Texture2D_3, r9.xy).xyw;
    ps = r0.w;
    r11.xy = r0.xy * UniformScalar_2.xx;
    ps = UniformScalar_7.x * ps;
    r8.xy = r0.wz * UniformScalar_9.xx;
    r6.z = ps;
    ps = -r0.z;
    r22.x = float((r0.w >= 0.5));
    ps = 1.0 + ps;
    r10.xy = r4.xy * ScreenPositionScaleBias.xy;
    r10.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.yz = UniformVector_1.xy * 1.7;
    r8.z = ps;
    ps = 1.0 / r4.w;
    r5.yw = r5.yz * r0.wz;
    r5.z = ps;
    r10.xy = r10.xy * r5.zz + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r17.w = float((r10.w >= 0.5));
    r8.w = ps;
    ps = 5.0 * r5.x;
    r8.zw = r8.zw * abs(r7.xy);
    r10.z = saturate(ps);
    r23.w = r22.x * (-0.5) + r0.w;
    r21.w = r17.w * 2.0 + r22.x;
    ps = r0.z;
    r5.xz = -r10.wz + float2(0.5, 1.0);
    ps = UniformScalar_7.x * ps;
    r5.x = r5.x - r0.z;
    r6.w = ps;
    r13.w = dot(r5.xx, r17.ww) - r0.z;
    ps = r23.z + r23.z;
    r14.xw = r13.zw + float2(-1.0, 2.0);
    r21.z = ps;
    ps = r23.w + r23.w;
    r21.y = r14.w - r0.z;
    r21.x = ps;
    r7.xyz = tex2D(LightAttenuationTexture, r10.xy).xyz;
    r19.xyz = tex2D(Texture2D_7, r9.zw).xyz;
    r20.yz = tex2D(ModShadowAccumTexture, r8.zw).xy;
    r10.xyz = tex2D(Texture2D_11, r8.xy).xyz;
    r9.xyz = tex2D(Texture2D_9, r6.zw).xyz;
    r8.xyw = tex2D(Texture2D_4, r11.xy).xyz;
    r15 = tex2D(Texture2D_2, r21.xy);
    r6.xyz = tex2D(Texture2D_10, r6.xy).xyz;
    r11.xyz = tex2D(Texture2D_8, r11.xy).xyz;
    r16.xyw = tex2D(Texture2D_3, r5.yw).xyw;
    r5.y = tex2D(Texture2D_6, r0.wz).x;
    ps = r4.w;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r4.y = saturate(ps);
    ps = 1.0 - r5.x;
    r1.w = dot(r1.zxy, r1.zxy);
    r0.x = saturate(ps);
    ps = UniformScalar_4.x * r5.y;
    r18.zw = r16.xy + r16.xy;
    r5.w = saturate(ps);
    ps = r13.x + r13.x;
    r6.w = dot(r3.zxy, r3.zxy);
    r18.x = ps;
    ps = r13.y + r13.y;
    r5.y = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r18.y = ps;
    ps = rsqrt(abs(r5.x));
    r0.yw = r23.xy * 4.0;
    r3.w = ps;
    ps = r22.w;
    r0.z = dot(r6.zxy, float3(0.11, 0.3, 0.59));
    ps = r16.w * ps;
    r16.xyz = r3.www * -SpotDirection.xyz;
    r4.x = ps;
    ps = log2(r5.w);
    r23.xyz = r0.zzz - r6.xyz;
    r5.w = ps;
    ps = log2(r0.x);
    r24.xyz = r5.yyy - r11.xyz;
    r0.x = ps;
    r17.xyw = r17.xyz * 2.0 - 1.0;
    r11.yzw = r24.xyz * UniformScalar_6.xxx + r11.xyz;
    r6.xyz = r23.zxy * UniformScalar_8.xxx + r6.zxy;
    ps = (-1.0) - -r4.x;
    r5.y = dot(r16.zxy, r2.zxy);
    r16.w = ps;
    ps = UniformScalar_5.x * r5.w;
    r18 = r18 + float4(-1.0, -1.0, -3.0, -3.0);
    r5.w = ps;
    r16.yz = r22.yz * 4.0 + r18.zw;
    r0.z = (r21.w == 0.0) ? r15.x : r15.y;
    ps = UniformVector_3.x * r6.y;
    r2.yzw = r8.xyw + r8.xyw;
    r11.x = ps;
    ps = UniformVector_3.y * r6.z;
    r22.xyz = r11.yzw * UniformVector_2.xyz;
    r11.y = ps;
    ps = UniformVector_3.z * r6.x;
    r9.xyz = r22.xyz * r9.xyz;
    r11.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r10.xyz = r11.xyz * r10.xyz;
    r4.z = ps;
    r11.xyz = r10.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r6.xyz = r9.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = ModShadowGroupColor.y * r5.z;
    r22.xyz = r10.xyz - r9.xyz;
    r4.w = ps;
    ps = pow(2.0, r5.w);
    r10 = -r4.yzwx + 1.0;
    r5.w = ps;
    r9.xyz = r22.xyz * r5.www + r9.xyz;
    ps = (-2.0) + r0.y;
    r3.w = r10.x * UniformScalar_1.x;
    r17.z = ps;
    ps = rsqrt(abs(r6.w));
    r4.xyz = r11.xyz - r6.xyz;
    r5.x = ps;
    r11.xyz = r4.xyz * r5.www + r6.xyz;
    r15.xy = r3.ww * r18.xy - 2.0;
    ps = rsqrt(abs(r1.w));
    r6.yzw = r21.zww + float3(-1.0, -3.0, -2.0);
    r5.z = ps;
    r6.x = (r6.w == 0.0) ? r15.z : r0.z;
    r2.x = (r6.z == 0.0) ? r15.w : r6.x;
    ps = 1.0 - r2.x;
    r4.xyz = r5.zzz * r1.xyz;
    r6.x = ps;
    ps = r2.x;
    r8.xyz = r5.xxx * r3.xyz;
    r1.x = ps;
    ps = 0.0;
    r21 = r2.yzwx + float4(-1.0, -1.0, -1.0, -0.75);
    r1.y = ps;
    ps = max(r1.x, r1.y);
    r5.z = r21.w + r2.x;
    r5.x = ps;
    ps = r6.y;
    r20.x = min(r5.x, 0.3);
    r5.x = ps;
    ps = 0.5 * r5.x;
    r1.xyz = r17.xyw - r21.xyz;
    r15.z = ps;
    r17.xy = r1.xy * r5.ww + r21.xy;
    ps = 2.5 * r6.x;
    r2.yzw = r20.xyz * float3(3.3333333, 0.875, 0.875);
    r15.w = ps;
    r5.x = r1.z * r5.w - r15.z;
    r5.z = saturate(r10.w * 0.5 + r5.z);
    ps = (-2.0) + r0.w;
    r6.xyz = r5.zzz * r19.xyz;
    r17.w = ps;
    r16.x = r8.w * 2.0 + r5.x;
    ps = -SpotAngles.x - -r5.y;
    r16.yzw = r2.yyy * r16.yzw;
    r5.x = ps;
    r1 = r3.wwww * r18.xxyy + r17.zxwy;
    r5.yz = r16.yz * 4.0 + r1.yw;
    ps = SpotAngles.y * r5.x;
    r16.zw = r16.xw + float2(-1.0, 1.0);
    r1.y = saturate(ps);
    r6.w = saturate(r15.w * r16.w - 0.5);
    ps = abs(r16.w) * abs(r16.w);
    r16.xy = r5.yz - r1.xz;
    r0.z = ps;
    r5.xyz = r16.zxy * r6.www + r15.zxy;
    ps = (-1.0) - -r5.x;
    r14.yz = r5.yz + r0.yw;
    r2.x = ps;
    r1.zw = r2.zw * r10.yz + 0.125;
    r5.w = r2.x * r10.x + 1.0;
    ps = r0.z * r0.z;
    r5.xyz = r14.xyz * r10.xxx;
    r1.x = ps;
    ps = 1.0 + r5.x;
    r2.xyz = r6.xyz * r13.zzz;
    r6.x = ps;
    r0.yzw = (r10.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.w = (r3.w > 0.0) ? r6.x : 1.0;
    r6.xyz = r1.zxy * r1.wxy;
    r5.xyz = r6.xxx * r12.xyz + ModShadowColor.xyz;
    ps = -UniformVector_0.x;
    r1.yzw = r6.yyy * r11.xyz;
    r2.w = (r3.w >= 0.0) ? r5.w : 1.0;
    r0.yzw = (r10.xxx >= 0.0) ? r0.yzw : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.w = dot(r0.wyz, r0.wyz);
    r1.x = ps;
    r3.xyz = r9.xyz * r2.www - r2.xyz;
    r3.xyz = r3.xyz * r6.www + r2.xyz;
    ps = rsqrt(abs(r5.w));
    r2.xyz = r1.yzw * r6.www;
    r5.w = ps;
    ps = -UniformVector_0.y;
    r0.yzw = r0.yzw * r5.www;
    ps = 1.0 + ps;
    r5.w = dot(r0.wyz, r8.zxy);
    r1.y = ps;
    ps = -UniformVector_0.z;
    r9.xyz = r0.yzw * r5.www;
    r8.xyz = r9.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.w = saturate(dot(r4.zxy, r8.zxy));
    r1.z = ps;
    ps = log2(r5.w);
    r1.xyz = r3.xyz * r1.xyz;
    r5.w = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r6.w = r5.w * 15.0;
    r5.w = ps;
    ps = pow(2.0, r6.w);
    r0.z = saturate(dot(r0.wzy, r4.zyx));
    r6.w = ps;
    ps = pow(2.0, r5.w);
    r6.xyw = r2.xyz * r6.www;
    r5.w = ps;
    r0.xy = r1.xy * r0.zz + r6.xy;
    r0.z = r1.z * r0.z + r6.w;
    r0.xyz = r0.xyz * r5.www;
    r0.xyz = r0.xyz * r7.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r0.xzy * r6.zzz;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
