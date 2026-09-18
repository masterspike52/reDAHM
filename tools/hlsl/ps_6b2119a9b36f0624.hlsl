// ps_6b2119a9b36f0624.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 402 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000648 10041400 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6 = r1.wzwz * float4(6.0, 6.0, 0.5, 0.5);
    r14.x = tex2D(ShadowTexture, r0.xy).x;
    r0.xw = tex2D(Texture2D_3, r6.zw).xy;
    r7.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    ps = r1.w;
    r8.xy = r1.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r6.z = -r1.z + 1.0;
    r12.y = ps;
    ps = r5.w;
    r8.zw = r1.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.x = r2.z + 0.1;
    r6.y = ps;
    ps = 5.0 * r6.x;
    r6.w = dot(r4.zxy, r4.zxy);
    r17.x = saturate(ps);
    r0.yz = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r12.zw = r0.xw + r0.xw;
    r6.x = ps;
    ps = 0.00022222222 * r6.y;
    r4.xyz = r6.xxx * r4.xyz;
    r0.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r16.xyw = r0.yxz * float3(0.5, -0.025, 0.5);
    r14.w = ps;
    r14.yz = r4.xy * r16.yy + r8.zw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r17.yz = r14.zx * r14.wx;
    r8.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.xw = -r17.yx + 1.0;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xyz = r6.yxz * UniformVector_2.xyy;
    r8.w = ps;
    ps = r7.x;
    r8.zw = r8.zw * abs(r9.xy);
    ps = r14.y * ps;
    r9.xy = r7.yz - 0.5;
    r12.x = ps;
    ps = r9.x;
    r10.xy = float2((r7.yz >= 0.5));
    ps = -r7.y + ps;
    r0 = r12.zwxy + float4(-1.0, -1.0, -0.5, -0.5);
    r11.x = ps;
    ps = r9.y;
    r10.zw = float2((r12.xy >= 0.5));
    ps = -r7.z + ps;
    r11.zw = r0.zw - r12.xy;
    r11.y = ps;
    r9.xz = r11.zw * r10.zw + r12.xy;
    r9.yw = r11.xy * r10.xy + r7.yz;
    r11 = r9.zxyw + r9.zxyw;
    r16.yz = tex2D(ModShadowAccumTexture, r8.zw).xy;
    r18 = tex2D(Texture2D_1, r11.xw);
    r20.xyz = tex2D(Texture2D_2, r1.wz).xyw;
    r19 = tex2D(Texture2D_6, r1.xy);
    r12.xyw = tex2D(Texture2D_4, r8.xy).xyw;
    r15.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r9.xyz = tex2D(Texture2D_0, r14.yz).xyz;
    ps = r5.w;
    r8.xz = r1.wz * UniformVector_7.xy;
    ps = 0.0001 * ps;
    r0.zw = r5.xy * ScreenPositionScaleBias.xy;
    r1.x = saturate(ps);
    r13.xyz = r9.xyz * 2.0 - 1.0;
    r7.xyz = r15.zxy * 2.0 - 1.0;
    ps = r12.x + r12.x;
    r8.y = float((r19.w >= 0.5));
    r15.x = ps;
    ps = r12.y + r12.y;
    r15.zw = r20.xy + r20.xy;
    r15.y = ps;
    ps = r7.w;
    r15 = r15.zwxy - 1.0;
    ps = r20.z * ps;
    r15.xy = r15.xy + r16.xw;
    r6.z = ps;
    r11.xw = r10.yx * 2.0 + r10.wz;
    r7.w = (r11.x == 0.0) ? r18.x : r18.y;
    ps = ModShadowGroupColor.x * r6.w;
    r10 = r11.wwxx + float4(-3.0, -2.0, -2.0, -3.0);
    r1.y = ps;
    r7.w = (r10.z == 0.0) ? r18.z : r7.w;
    r1.w = (r10.w == 0.0) ? r18.w : r7.w;
    ps = ModShadowGroupColor.y * r6.w;
    r7.w = max(r1.w, 0.0);
    r1.z = ps;
    ps = r7.w;
    r6.xw = r0.xy * 0.012;
    r0.x = ps;
    ps = 0.3;
    r1 = -r1.wyzx + 1.0;
    r0.y = ps;
    ps = min(r0.x, r0.y);
    r6.y = r1.w * UniformScalar_1.x;
    r16.x = ps;
    r0.xy = r6.yy * r15.zw + r7.yz;
    ps = (-1.0) - -r6.z;
    r16.xyz = r16.xyz * float3(3.3333333, 0.875, 0.875);
    r15.z = ps;
    r18.yzw = r16.xxx * r15.xyz;
    r0.xy = r0.xy * UniformVector_4.xy - r6.xw;
    r6.xw = r0.xy * r8.yy + r6.xw;
    r6.xw = r6.xw + r18.yz;
    ps = 1.0 / r5.w;
    r0.xy = -r13.xy + r6.xw;
    r6.x = ps;
    r6.xw = r0.zw * r6.xx + ScreenPositionScaleBias.wz;
    r14.xyz = tex2D(Texture2D_8, r14.yz).xyz;
    r12.xyz = tex2D(LightAttenuationTexture, r6.xw).xyz;
    r5 = tex2D(Texture2D_1, r11.yz);
    r8.xzw = tex2D(Texture2D_9, r8.xz).xyz;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    ps = UniformVector_6.x * UniformVector_6.w;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    r20.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r6.x = dot(r3.zxy, r3.zxy);
    r20.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r6.w = dot(r2.zxy, r2.zxy);
    r20.z = ps;
    ps = rsqrt(abs(r6.w));
    r3.x = r12.w - 1.0;
    r7.w = ps;
    ps = 1.0 - r6.x;
    r6.w = float((UniformScalar_5.x > 1.0));
    r6.x = saturate(ps);
    r8.xzw = (-abs(r6.www) >= 0.0) ? r8.xzw : 1.0;
    ps = UniformScalar_6.x * r8.y;
    r6.w = float((UniformScalar_5.x >= 1.0));
    r9.w = ps;
    ps = UniformVector_4.z * r7.x;
    r3.yzw = r20.xyz * r19.xyz;
    r18.x = ps;
    r8.xzw = (-abs(r6.www) >= 0.0) ? 1.0 : r8.xzw;
    ps = log2(r6.x);
    r6.w = -r8.y + 1.0;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r2.xyz = r7.www * r2.xyz;
    r7.w = ps;
    r6.x = (r11.w == 0.0) ? r5.x : r5.y;
    r6.x = (r10.y == 0.0) ? r5.z : r6.x;
    r7.z = (r10.x == 0.0) ? r5.w : r6.x;
    ps = r1.x;
    r10.yzw = r6.www * UniformVector_5.xyz;
    r6.x = ps;
    ps = 2.5 * r6.x;
    r7.xy = r16.yz * r1.yz;
    r6.x = ps;
    ps = 0.125 + r7.x;
    r5.xyz = r3.yzw * r8.xzw;
    r16.x = ps;
    ps = 0.125 + r7.y;
    r8.xw = r18.xw + float2(-1.0, 1.0);
    r16.y = ps;
    r6.w = saturate(r6.x * r8.w - 0.5);
    ps = 0.25 + r7.z;
    r6.x = abs(r8.w) * abs(r8.w);
    r16.z = ps;
    ps = r6.x * r6.x;
    r12.xyz = r17.zzz * r12.xyz;
    r16.w = ps;
    r3.yz = r0.xy * r6.ww + r13.xy;
    ps = r16.z;
    r0.xw = r16.xw * r16.yw;
    r0.xyz = r0.xxx * r15.xyz + ModShadowColor.xyz;
    ps = r7.z + ps;
    r3.xyw = r3.yzx * r1.www;
    r7.x = ps;
    ps = r7.x;
    r6.x = r3.w + 1.0;
    r6.x = (r6.y > 0.0) ? r6.x : 1.0;
    r8.z = (r6.y >= 0.0) ? r6.x : 1.0;
    ps = -r6.z + ps;
    r7.xy = r8.yx * r8.zy;
    r6.x = saturate(ps);
    ps = -r13.z;
    r6.xyz = r6.xxx * r14.xyz;
    ps = r7.y + ps;
    r5.xyz = r5.xyz * r7.xxx;
    r7.x = ps;
    r8.yzw = r5.xyz * r8.www - r6.xyz;
    ps = pow(2.0, r7.w);
    r8.x = r7.x + 1.0;
    r7.x = ps;
    r6.xyz = r8.yzw * r6.www + r6.xyz;
    r6.w = r8.x * r6.w - 2.0;
    ps = r6.w;
    r7.xyz = r12.xzy * r7.xxx;
    ps = r9.z + ps;
    r8.xyz = r6.xyz * r11.xyz;
    r10.x = ps;
    r6 = r10 + r9.zwww;
    r1.xyz = r5.xyz * UniformScalar_7.xxx + r6.yzw;
    r3.z = r6.x * r1.w + 1.0;
    r6.xyz = (r1.www > 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r1.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r3.xyz = r0.www * r1.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r4.zxy);
    r5.xyz = r6.yzw * r6.xxx;
    r4.xyz = r5.xyz * 2.0 - r4.xyz;
    r6.x = saturate(dot(r2.zxy, r4.zxy));
    ps = log2(r6.x);
    r1.xyz = r3.xyz * r1.xyz;
    r6.x = ps;
    ps = 15.0 * r6.x;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r2.zyx));
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r8.xy * r6.ww + r6.xy;
    r6.z = r8.z * r6.w + r6.z;
    r6.xyz = r7.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r0.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
