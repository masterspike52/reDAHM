// ps_d0d2bf382c36bc88.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 399 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000063C 10041300 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c17); // float2
float4 SpotDirection : register(c16); // float3
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_5 : register(c12); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
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
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r17.z = tex2D(ShadowTexture, r0.xy).x;
    r10.xyw = tex2D(Texture2D_2, r1.wz).xyw;
    ps = UniformVector_2.x * r1.w;
    r6.xy = r1.wz * 6.0;
    r12.y = ps;
    r11.xyz = tex2D(Texture2D_2, r6.xy).xyw;
    r14.xy = r1.xy * UniformScalar_0.xx;
    ps = -r1.z;
    r8.xy = r1.wz * UniformVector_7.xy;
    ps = 1.0 + ps;
    r6.zw = r1.wz * UniformVector_1.xy;
    r6.y = ps;
    ps = r5.w;
    r7.x = dot(r4.zxy, r4.zxy);
    ps = 0.0001 * ps;
    r6.x = r5.w - 4e+02;
    r18.y = saturate(ps);
    ps = 1.0 / r5.w;
    r7.zw = r5.xy * ScreenPositionScaleBias.xy;
    r7.y = ps;
    r8.zw = r7.zw * r7.yy + ScreenPositionScaleBias.wz;
    r7.yz = r11.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.x));
    r12.zw = r10.xy + r10.xy;
    r7.x = ps;
    ps = 0.00022222222 * r6.x;
    r5.xyz = r7.xxx * r4.xyz;
    r7.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r0.xyw = r7.yxz * float3(0.5, -0.025, 0.5);
    r17.w = ps;
    r17.xy = r5.xy * r0.yy + r6.zw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r18.xz = r17.yz * r17.wz;
    r7.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.xw = -r18.xy + 1.0;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.xyw = r6.zxy * UniformVector_2.xyy;
    r7.y = ps;
    ps = r4.x;
    r6.xy = r7.xy * abs(r9.xy);
    ps = r17.x * ps;
    r0.yz = r4.yw - 0.5;
    r12.x = ps;
    ps = r0.y;
    r7.xy = float2((r4.yw >= 0.5));
    ps = -r4.y + ps;
    r13 = r12.xzwy + float4(-0.5, -1.0, -1.0, -0.5);
    r9.x = ps;
    ps = r0.z;
    r7.zw = float2((r12.xy >= 0.5));
    ps = -r4.w + ps;
    r9.zw = r13.xw - r12.xy;
    r9.y = ps;
    r4.xz = r9.zw * r7.zw + r12.xy;
    r4.yw = r9.xy * r7.xy + r4.yw;
    r4 = r4 + r4;
    r16.xyz = tex2D(Texture2D_7, r17.xy).xyz;
    r0.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r15.xyz = tex2D(LightAttenuationTexture, r8.zw).xyz;
    r12.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r9 = tex2D(Texture2D_1, r4.xy);
    r19 = tex2D(Texture2D_1, r4.zw);
    r8.xzw = tex2D(Texture2D_8, r8.xy).xyz;
    r10.xyz = tex2D(Texture2D_0, r17.xy).xyz;
    r17.yzw = tex2D(Texture2D_3, r14.xy).xyw;
    r1 = tex2D(Texture2D_6, r1.xy);
    r8.y = dot(r2.zxy, r2.zxy);
    r2.w = float((UniformScalar_5.x >= 1.0));
    r4.x = float((UniformScalar_5.x > 1.0));
    r6.y = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r6.y));
    r17.x = r11.z * r10.w;
    r6.z = ps;
    ps = 1.0 - r6.y;
    r11.yzw = r10.xyz + r10.xyz;
    r6.x = saturate(ps);
    r8.xzw = (-abs(r4.xxx) >= 0.0) ? r8.xzw : 1.0;
    r4.xyz = (-abs(r2.www) >= 0.0) ? 1.0 : r8.xwz;
    ps = log2(r6.x);
    r8.xzw = r6.zzz * -SpotDirection.xyz;
    r6.x = ps;
    r13.xw = r17.xw - 1.0;
    ps = UniformVector_6.x * UniformVector_6.w;
    r6.z = dot(r8.wxz, r3.zxy);
    r3.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r11.x = r13.w * r6.w;
    r3.y = ps;
    ps = UniformScalar_1.x * r6.w;
    r11 = r11 + float4(1.0, -1.0, -1.0, -1.0);
    r8.w = ps;
    r6.y = (r8.w > 0.0) ? r11.x : 1.0;
    r3.w = (r8.w >= 0.0) ? r6.y : 1.0;
    r7.xy = r7.xy * 2.0 + r7.zw;
    r8.x = (r7.y == 0.0) ? r19.x : r19.y;
    r8.z = (r7.x == 0.0) ? r9.x : r9.y;
    ps = UniformVector_6.z * UniformVector_6.w;
    r14 = r7.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r3.z = ps;
    r7 = r3 * r1;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r4.xyz = r7.xzy * r4.xyz;
    r6.y = ps;
    r6.x = (r14.y == 0.0) ? r9.z : r8.z;
    r8.x = (r14.z == 0.0) ? r19.z : r8.x;
    r7.z = (r14.w == 0.0) ? r19.w : r8.x;
    r7.x = (r14.x == 0.0) ? r9.w : r6.x;
    ps = rsqrt(abs(r8.y));
    r8.x = r4.x * r3.w;
    r6.x = ps;
    ps = pow(2.0, r6.y);
    r4.x = r8.x * r1.w;
    r8.x = ps;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    ps = r1.w;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = ps;
    ps = 1.0 - r6.y;
    r1.xyz = r12.xyz + r12.xyz;
    r6.y = ps;
    r12.yzw = r6.yyy * UniformVector_5.xyz;
    ps = r2.z;
    r3.xyz = r6.xxx * r2.xyz;
    ps = 0.1 + ps;
    r2.xyz = r18.zzz * r15.xyz;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r8.xyz = r2.xzy * r8.xxx;
    r7.y = saturate(ps);
    ps = r1.w;
    r13.yz = r13.yz + r0.xw;
    r6.y = ps;
    ps = r17.y + r17.y;
    r4.yz = r4.zy * r7.ww;
    r15.z = ps;
    r1.w = r7.x * 2.0 - r17.x;
    ps = 1.0 - r7.y;
    r6.x = max(r7.z, 0.0);
    r7.x = ps;
    ps = 1.0 - r7.z;
    r0.x = min(r6.x, 0.3);
    r6.x = ps;
    r7.xy = -r7.xx * ModShadowGroupColor.xy + 1.0;
    ps = r17.z + r17.z;
    r1 = r1.xywz + float4(-1.0, -1.0, 1.25, -1.0);
    r15.w = ps;
    r2.w = r1.w * UniformVector_4.z - r11.w;
    ps = r1.z;
    r0.xyw = r0.yzx * float3(0.875, 0.875, 3.3333333);
    ps = -r17.x + ps;
    r15.xy = r0.xy * r7.xy;
    r7.x = saturate(ps);
    ps = 2.5 * r6.x;
    r7.xyz = r7.xxx * r16.xyz;
    r4.w = ps;
    r7.w = r0.w * r13.x + 1.0;
    r1.w = saturate(r4.w * r7.w - 0.5);
    r2.xyz = r4.xyz * r7.www - r7.xyz;
    ps = UniformScalar_6.x * r6.y;
    r15 = r15 + float4(0.125, 0.125, -1.0, -1.0);
    r10.w = ps;
    r12.x = r2.w * r1.w - 2.0;
    r1.xy = r8.ww * r15.zw + r1.xy;
    r2.xyz = r2.xyz * r1.www + r7.xyz;
    ps = -SpotAngles.x - -r6.z;
    r7.x = r15.x * r15.y;
    r6.x = ps;
    r7.xyz = r7.xxx * r14.xyz + ModShadowColor.xyz;
    ps = SpotAngles.y * r6.x;
    r0.xyz = r2.xyz * r9.xyz;
    r9.y = saturate(ps);
    r1.xy = r1.xy * UniformVector_4.xy - r11.yz;
    r1.yz = r0.ww * r13.yz + r1.xy;
    ps = abs(r7.w) * abs(r7.w);
    r2 = r12 + r10.zwww;
    r1.x = ps;
    r4.xyz = r4.xyz * UniformScalar_7.xxx + r2.yzw;
    ps = r2.x;
    r9.xzw = r1.xyz * r1.xww;
    ps = r10.z + ps;
    r2.xy = r11.yz + r9.zw;
    r2.z = ps;
    r2.xyw = r2.xyz * r6.www;
    ps = r9.x * r9.x;
    r2.z = r2.w + 1.0;
    r7.w = ps;
    r2.xyz = (r6.www > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r2.xyz = (r6.www >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    ps = r9.y * r9.y;
    r6.x = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r4.xyz = r7.www * r4.xyz;
    r6.x = ps;
    r2.xyz = r2.xyz * r6.xxx;
    r6.x = dot(r2.zxy, r5.zxy);
    r6.xzw = r2.xyz * r6.xxx;
    r6.xzw = r6.xzw * 2.0 - r5.xyz;
    r6.x = saturate(dot(r3.zxy, r6.wxz));
    ps = log2(r6.x);
    r1.xyz = r4.xyz * r1.www;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r7.w = saturate(dot(r2.zyx, r3.zyx));
    r6.x = ps;
    r6.xzw = r1.xyz * r6.xxx;
    r6.xz = r0.xy * r7.ww + r6.xz;
    r6.w = r0.z * r7.w + r6.w;
    r6.xzw = r8.xzy * r6.xzw;
    r6.xzw = r6.xzw * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xwz * r6.yyy;
    r6.xyz = r6.xzy * r7.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
