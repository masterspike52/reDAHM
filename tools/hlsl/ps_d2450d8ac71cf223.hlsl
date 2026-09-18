// ps_d2450d8ac71cf223.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 297 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004A4 10040F00 0000090A 00000000 00008129 003F01FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
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

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_7 : register(c8); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ShadowTexture : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_5, r1.xy);
    ps = (-0.5) + r12.w;
    r6.xy = r1.wz * 6.0;
    r6.z = ps;
    ps = UniformVector_2.x * r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r11.x = ps;
    r10.x = tex2D(ShadowTexture, r0.xy).x;
    r8.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    r0.xy = r1.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.x = r5.w - 4e+02;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = -r1.z + 1.0;
    r7.z = ps;
    ps = 1.0 / r5.w;
    r10.yz = r5.xy * ScreenPositionScaleBias.xy;
    r10.w = ps;
    ps = UniformVector_2.y * r6.x;
    r6.w = dot(r4.zxy, r4.zxy);
    r11.y = ps;
    r6.yz = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r6.x = saturate(r7.x * 0.00022222222);
    r6.w = ps;
    ps = r10.x * r10.x;
    r4.xyz = r6.www * r4.xyz;
    r7.x = ps;
    ps = r10.y * r10.w;
    r14.xyw = r6.yxz * float3(0.5, -0.025, 0.5);
    r6.y = ps;
    ps = r10.z * r10.w;
    r11.zw = r4.xy * r14.yy;
    r6.x = ps;
    ps = r7.y;
    r6.zw = r11.xy - 0.5;
    ps = abs(r9.x) * ps;
    r15.xy = float2((r11.xy >= 0.5));
    r10.x = ps;
    ps = r7.z;
    r6.zw = r6.zw - r11.xy;
    ps = abs(r9.y) * ps;
    r0.zw = r6.zw * r15.xy;
    r10.y = ps;
    ps = ScreenPositionScaleBias.w + r6.y;
    r0 = r11.zwxy + r0;
    r6.y = ps;
    ps = ScreenPositionScaleBias.z + r6.x;
    r7.yz = r0.zw + r0.zw;
    r6.z = ps;
    r11.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r14.yz = tex2D(ModShadowAccumTexture, r10.xy).xy;
    r13 = tex2D(Texture2D_1, r7.yz);
    r8.xyz = tex2D(LightAttenuationTexture, r6.yz).xyz;
    r7.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r9.xzw = tex2D(Texture2D_2, r1.wz).wxy;
    r6.w = tex2D(Texture2D_4, r1.xy).x;
    ps = 0.1 - -r2.z;
    r9.y = saturate(r5.w * 0.0001);
    r6.z = ps;
    r1.xyz = UniformVector_6.xyz * UniformVector_6.www;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = dot(r3.zxy, r3.zxy);
    r9.x = r8.w * r9.x - 1.0;
    ps = 1.0 - r6.x;
    r6.y = dot(r2.zxy, r2.zxy);
    r6.x = saturate(ps);
    r10.xyw = r10.xyz * 2.0 - 1.0;
    r5.xyz = r7.yzw * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r12.xyz = r1.xyz * r12.xyz;
    r6.y = ps;
    r3.xyz = r12.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r10.w = r10.w * UniformVector_4.z - r5.z;
    ps = log2(r6.x);
    r2.xyz = r6.yyy * r2.xyz;
    r6.y = ps;
    ps = r9.z + r9.z;
    r8.xyz = r7.xxx * r8.xyz;
    r1.y = ps;
    ps = r9.w + r9.w;
    r1.x = dot(r15.xyy, float3(1.0, 1.0, 1.0));
    r1.z = ps;
    r6.x = (r1.x == 0.0) ? r13.x : r13.y;
    r1 = r1.yxxz + float4(-1.0, -3.0, -2.0, -1.0);
    ps = 5.0 * r6.z;
    r13.xy = r1.xw + r14.xw;
    r1.x = saturate(ps);
    r6.x = (r1.z == 0.0) ? r13.z : r6.x;
    r1.y = (r1.y == 0.0) ? r13.w : r6.x;
    ps = LightColorAndFalloffExponent.w * r6.y;
    r6.xz = -r1.yx + 1.0;
    r6.y = ps;
    ps = 2.5 * r6.x;
    r7.x = max(r1.y, 0.0);
    r12.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r14.x = min(r7.x, 0.3);
    r9.z = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r1.xyz = r14.yxz * float3(0.875, 3.3333333, 0.875);
    r9.w = ps;
    ps = pow(2.0, r6.y);
    r9.yzw = -r9.wzy + 1.0;
    r6.z = ps;
    r6.xy = r1.yy * r13.xy - r5.xy;
    r6.xy = r10.xy * UniformVector_4.xy + r6.xy;
    r1.xyz = r1.yxz * r9.xzy + float3(1.0, 0.125, 0.125);
    ps = abs(r1.x) * abs(r1.x);
    r8.xyz = r8.xzy * r6.zzz;
    r1.w = ps;
    r10.xyz = r12.xyz * r1.xxx - r11.xyz;
    r8.w = saturate(r12.w * r1.x - 0.5);
    r7.xy = r6.xy * r8.ww + r5.xy;
    r5.xyz = r10.xyz * r8.www + r11.xyz;
    r7.z = r10.w * r8.w - 2.0;
    r1.yw = r1.wy * r1.wz;
    r6.xyz = r1.www * r0.xyz + ModShadowColor.xyz;
    r7.z = r7.w * 2.0 + r7.z;
    r7.xyz = r7.zxy * r9.www;
    ps = 1.0 + r7.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r7.w = ps;
    r7.xyz = (r9.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r7.yzw = (r9.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r7.x = dot(r7.wyz, r7.wyz);
    ps = rsqrt(abs(r7.x));
    r0.xyz = r5.xyz * r0.xyz;
    r7.x = ps;
    r7.yzw = r7.yzw * r7.xxx;
    r7.x = dot(r7.wyz, r4.zxy);
    r5.xyz = r7.yzw * r7.xxx;
    r4.xyz = r5.xyz * 2.0 - r4.xyz;
    r7.x = saturate(dot(r2.zxy, r4.zxy));
    ps = log2(r7.x);
    r7.w = saturate(dot(r7.wzy, r2.zyx));
    r7.y = ps;
    ps = UniformScalar_8.x * r6.w;
    r7.x = r7.y * UniformScalar_7.x;
    r1.x = ps;
    ps = pow(2.0, r7.x);
    r6.w = r7.y * 15.0;
    r1.z = ps;
    r1.xy = r1.xy * r1.zy;
    r7.xyz = r3.xyz + r1.xxx;
    r7.xyz = r1.yyy * r7.xyz;
    ps = pow(2.0, r6.w);
    r7.xyz = r7.xyz * r8.www;
    r6.w = ps;
    r7.xyz = r7.xyz * r6.www;
    r7.xy = r0.xy * r7.ww + r7.xy;
    r7.z = r0.z * r7.w + r7.z;
    r7.xyz = r8.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
