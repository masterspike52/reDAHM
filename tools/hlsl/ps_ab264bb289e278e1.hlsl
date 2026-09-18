// ps_ab264bb289e278e1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 411 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000066C 10041900 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D Texture2D_9 : register(s9);
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
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 r23 = 0.0;
    float4 r24 = 0.0;
    float4 r25 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r1.xy * UniformScalar_0.xx;
    r6.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.x = dot(r2.zxy, r2.zxy);
    r6.z = ps;
    r10.x = tex2D(ShadowTexture, r0.xy).x;
    ps = UniformVector_2.x * r1.w;
    r6.zw = r6.zw * abs(r9.xy);
    r13.y = ps;
    r7.zw = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r8.yzw = tex2D(Texture2D_4, r6.xy).xyw;
    r6.zw = r1.wz * UniformVector_1.xy;
    ps = r5.w;
    r7.x = dot(r4.zxy, r4.zxy);
    ps = (-4e+02) + ps;
    r6.x = r2.z + 0.1;
    r6.y = ps;
    ps = rsqrt(abs(r7.x));
    r13.zw = r8.yz + r8.yz;
    r7.x = ps;
    ps = 0.00022222222 * r6.y;
    r9.xyz = r7.xxx * r4.xyz;
    r7.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r17.xyz = r7.zwx * float3(0.875, 0.875, -0.025);
    r10.w = ps;
    r10.yz = r9.xy * r17.zz + r6.zw;
    ps = 5.0 * r6.x;
    r12.yz = r10.zx * r10.wx;
    r12.x = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r7.xz = -r12.yx + 1.0;
    r7.w = ps;
    ps = 1.0 - r1.z;
    r6.w = float((UniformScalar_5.x >= 1.0));
    r7.y = ps;
    r6.xyz = r7.xyw * UniformVector_2.yyx;
    r13.x = r6.z * r10.y;
    r11.xy = r1.wz * UniformVector_7.xy;
    r14.zw = r5.xy * ScreenPositionScaleBias.xy;
    ps = (-0.5) + r6.x;
    r4 = r1.wzwz * float4(6.0, 6.0, 0.5, 0.5);
    r7.x = ps;
    ps = (-0.5) + r6.y;
    r22.xy = float2((r6.xy >= 0.5));
    r7.y = ps;
    r7.xy = r7.xy - r6.xy;
    r0.yw = r7.xy * r22.xy + r6.xy;
    r18 = r13 + float4(-0.5, -0.5, -1.0, -1.0);
    r20.xy = float2((r13.xy >= 0.5));
    ps = 1.0 / r5.w;
    r14.xy = r18.xy - r13.xy;
    r20.z = ps;
    r6.xy = r14.zw * r20.zz + ScreenPositionScaleBias.wz;
    r0.xz = r14.xy * r20.xy + r13.xy;
    r0 = r0 + r0;
    r16.xyz = tex2D(Texture2D_8, r10.yz).xyz;
    r19 = tex2D(Texture2D_1, r0.zw);
    r21 = tex2D(Texture2D_1, r0.xy);
    r22.zw = tex2D(Texture2D_3, r4.zw).xy;
    r0.xzw = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r7.xyw = tex2D(Texture2D_5, r1.xy).xyz;
    r24.xyz = tex2D(Texture2D_9, r11.xy).xyz;
    r15 = tex2D(Texture2D_6, r1.xy);
    r23.xyz = tex2D(Texture2D_2, r4.xy).xyw;
    r1.yzw = tex2D(Texture2D_2, r1.wz).xyw;
    r10.xyz = tex2D(Texture2D_0, r10.yz).xyz;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    ps = r5.w;
    r25.xyz = UniformVector_6.xyz * UniformVector_6.www;
    ps = 0.0001 * ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r1.x = saturate(ps);
    r14.xyw = r10.xyz * 2.0 - 1.0;
    r13.yz = r1.yz * 2.0 - 1.0;
    ps = 1.0 - r6.x;
    r6.z = float((UniformScalar_5.x > 1.0));
    r6.y = saturate(ps);
    ps = r23.x + r23.x;
    r15.xyz = r25.xyz * r15.xyz;
    r17.z = ps;
    r5.xyz = (-abs(r6.zzz) >= 0.0) ? r24.xyz : 1.0;
    ps = r23.y + r23.y;
    r6.z = r23.z * r1.w;
    r17.w = ps;
    r7.xyw = r7.xwy * 2.0 - 1.0;
    ps = rsqrt(abs(r8.x));
    r0.y = float((r15.w >= 0.5));
    r8.x = ps;
    ps = rsqrt(abs(r6.x));
    r2.xyz = r8.xxx * r2.xyz;
    r6.x = ps;
    ps = UniformScalar_6.x * r0.y;
    r1.yzw = r6.xxx * -SpotDirection.xyz;
    r10.w = ps;
    r5.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r5.xyz;
    ps = log2(r6.y);
    r6.w = -r0.y + 1.0;
    r6.x = ps;
    ps = UniformVector_4.z * r7.y;
    r15.xyz = r15.xyz * r5.xyz;
    r13.x = ps;
    ps = (-1.0) - -r6.z;
    r7.y = dot(r1.wyz, r3.zxy);
    r3.z = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r12.xyz = r12.zzz * r0.xzw;
    r2.w = ps;
    r0.zw = r22.zw * 2.0 - 1.0;
    r1.yz = r22.xy * 2.0 + r20.xy;
    r6.y = (r1.y == 0.0) ? r21.x : r21.y;
    r6.x = (r1.z == 0.0) ? r19.x : r19.y;
    ps = UniformVector_5.x * r6.w;
    r20 = r1.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r5.y = ps;
    r6.x = (r20.z == 0.0) ? r19.z : r6.x;
    r6.y = (r20.y == 0.0) ? r21.z : r6.y;
    r8.x = (r20.x == 0.0) ? r21.w : r6.y;
    r1.w = (r20.w == 0.0) ? r19.w : r6.x;
    ps = ModShadowGroupColor.x * r7.z;
    r6.x = max(r1.w, 0.0);
    r1.y = ps;
    ps = ModShadowGroupColor.y * r7.z;
    r0.x = min(r6.x, 0.3);
    r1.z = ps;
    ps = UniformVector_5.y * r6.w;
    r1 = -r1.wyzx + 1.0;
    r5.z = ps;
    ps = r1.w;
    r17.xy = r17.xy * r1.yz;
    r6.y = ps;
    ps = UniformScalar_1.x * r6.y;
    r0.xzw = r0.zwx * float3(0.012, 0.012, 3.3333333);
    r6.y = ps;
    r7.xz = r6.yy * r18.zw + r7.xw;
    ps = UniformVector_5.z * r6.w;
    r17 = r17 + float4(0.125, 0.125, -1.0, -1.0);
    r5.w = ps;
    r6.xw = r7.xz * UniformVector_4.xy - r0.xz;
    r0.xz = r6.xw * r0.yy + r0.xz;
    r3.xy = r17.zw * 0.5 + r13.yz;
    ps = -SpotAngles.x - -r7.y;
    r6.w = r17.x * r17.y;
    r6.x = ps;
    r7.xyz = r6.www * r4.xyz + ModShadowColor.xyz;
    ps = SpotAngles.y * r6.x;
    r13.yzw = r0.www * r3.xyz;
    r4.x = saturate(ps);
    ps = r8.w;
    r3.xy = r0.xz + r13.yz;
    r6.x = ps;
    ps = r1.x;
    r0.xw = r13.xw + float2(-1.0, 1.0);
    r6.w = ps;
    ps = 2.5 * r6.w;
    r13.yz = -r14.xy + r3.xy;
    r6.w = ps;
    r13.w = saturate(r6.w * r0.w - 0.5);
    ps = (-1.0) + r6.x;
    r13.x = abs(r0.w) * abs(r0.w);
    r3.x = ps;
    ps = 0.25 + r8.x;
    r4.yzw = r13.xyz * r13.xww;
    r3.w = ps;
    ps = r3.w;
    r3.yz = r14.xy + r4.zw;
    ps = r8.x + ps;
    r3.xyw = r3.yzx * r1.www;
    r6.w = ps;
    ps = r6.w;
    r6.x = r3.w + 1.0;
    r6.x = (r6.y > 0.0) ? r6.x : 1.0;
    r0.z = (r6.y >= 0.0) ? r6.x : 1.0;
    ps = -r6.z + ps;
    r6.xy = r0.yx * r0.zy;
    r6.z = saturate(ps);
    ps = -r14.w;
    r14.xyz = r6.zzz * r16.xyz;
    ps = r6.y + ps;
    r6.xzw = r15.xyz * r6.xxx;
    r6.y = ps;
    r8.yzw = r6.xzw * r0.www - r14.xyz;
    ps = pow(2.0, r2.w);
    r8.x = r6.y + 1.0;
    r7.w = ps;
    r0.xyz = r8.yzw * r13.www + r14.xyz;
    r6.y = r8.x * r13.w - 2.0;
    ps = r6.y;
    r8.xyz = r12.xzy * r7.www;
    ps = r10.z + ps;
    r0.xyz = r0.xyz * r11.xyz;
    r5.x = ps;
    ps = r4.x * r4.x;
    r5 = r5 + r10.zwww;
    r6.y = ps;
    r1.xyz = r6.xzw * UniformScalar_7.xxx + r5.yzw;
    r3.z = r5.x * r1.w + 1.0;
    r6.xzw = (r1.www > 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r3.xyz = (r1.www >= 0.0) ? r6.xzw : float3(0.0, 0.0, 1.0);
    ps = r4.y * r4.y;
    r6.x = dot(r3.zxy, r3.zxy);
    r6.z = ps;
    ps = rsqrt(abs(r6.x));
    r4.xyz = r6.zzz * r1.xyz;
    r6.x = ps;
    r3.xyz = r3.xyz * r6.xxx;
    r6.x = dot(r3.zxy, r9.zxy);
    r6.xzw = r3.xyz * r6.xxx;
    r6.xzw = r6.xzw * 2.0 - r9.xyz;
    r6.x = saturate(dot(r2.zxy, r6.wxz));
    ps = log2(r6.x);
    r1.xyz = r4.xyz * r1.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r7.w = saturate(dot(r3.zyx, r2.zyx));
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
