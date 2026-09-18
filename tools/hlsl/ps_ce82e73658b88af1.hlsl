// ps_ce82e73658b88af1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 297 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004A4 10040F00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color1;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_5, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.w = -r0.z + 1.0;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = r4.w - 4e+02;
    r7.z = ps;
    ps = r1.z;
    r10.xy = r0.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r5.z = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.z));
    r6.z = r11.w - 0.5;
    r5.z = ps;
    ps = 5.0 * r5.x;
    r9.xyz = r5.zzz * r3.xyz;
    r5.z = saturate(ps);
    ps = 0.00022222222 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r5.x = saturate(ps);
    ps = (-0.025) * r5.x;
    r3.x = r0.w * UniformVector_2.x;
    r5.x = ps;
    ps = UniformVector_2.y * r5.w;
    r3.zw = r9.xy * r5.xx;
    r3.y = ps;
    r5.xy = r3.xy - 0.5;
    r7.xw = float2((r3.xy >= 0.5));
    ps = r7.y;
    r5.xy = r5.xy - r3.xy;
    ps = abs(r8.x) * ps;
    r10.zw = r5.xy * r7.xw;
    r6.z = ps;
    ps = r7.z;
    r10 = r3.zwxy + r10;
    ps = abs(r8.y) * ps;
    r5.xy = r10.zw + r10.zw;
    r6.w = ps;
    r7.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r15 = tex2D(Texture2D_1, r5.xy);
    r5.xyw = tex2D(Texture2D_3, r0.xy).xyz;
    ps = 0.0001 * r4.w;
    r6.xy = r0.wz * 6.0;
    r3.w = saturate(ps);
    r8.xyz = tex2D(Texture2D_2, r6.xy).xyw;
    r3.xyz = tex2D(Texture2D_2, r0.wz).xwy;
    r6.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r6.xyz = r6.xyw * 2.0 - 1.0;
    r12.x = r8.z * r3.y - 1.0;
    r13.zw = r8.xy + r8.xy;
    ps = r3.x + r3.x;
    r8.zw = r4.xy * ScreenPositionScaleBias.xy;
    r3.y = ps;
    r5.xyw = r5.yxw * 2.0 - 1.0;
    ps = r3.z + r3.z;
    r3.x = dot(r7.xww, float3(1.0, 1.0, 1.0));
    r3.z = ps;
    r7.x = (r3.x == 0.0) ? r15.x : r15.y;
    ps = 1.0 - r5.z;
    r14 = r3.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r5.z = ps;
    r7.x = (r14.y == 0.0) ? r15.z : r7.x;
    r3.x = (r14.x == 0.0) ? r15.w : r7.x;
    ps = ModShadowGroupColor.x * r5.z;
    r7.x = max(r3.x, 0.0);
    r3.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r7.x = min(r7.x, 0.3);
    r3.z = ps;
    r3 = -r3 + 1.0;
    ps = UniformVector_4.x * r5.y;
    r7.xyw = r7.yzx * float3(0.875, 0.875, 3.3333333);
    r15.x = ps;
    ps = UniformVector_4.y * r5.x;
    r13.xy = r7.xy * r3.yz;
    r15.y = ps;
    ps = UniformVector_4.z * r5.w;
    r13 = r13 + float4(0.125, 0.125, -1.0, -1.0);
    r15.z = ps;
    r12.yz = r13.zw * 0.5 + r14.zw;
    r5.xy = r7.ww * r12.yz + r15.xy;
    ps = 1.0 / r4.w;
    r8.xy = r5.xy - r6.xy;
    r5.x = ps;
    r5.xy = r8.zw * r5.xx + ScreenPositionScaleBias.wz;
    r10.xyz = tex2D(Texture2D_6, r10.xy).xyz;
    r14.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r5.y = tex2D(Texture2D_4, r0.xy).x;
    ps = UniformVector_6.x * UniformVector_6.w;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r0.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r5.z = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    ps = 1.0 - r5.x;
    r14.xyz = r14.xyz * r2.www;
    r5.x = saturate(ps);
    ps = rsqrt(abs(r5.z));
    r11.xyz = r0.xyz * r11.xyz;
    r5.z = ps;
    r2.xyz = r11.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = log2(r5.x);
    r1.xyz = r5.zzz * r1.xyz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r4.w = -r6.z + r15.z;
    r5.x = ps;
    ps = r3.x;
    r7.xyz = r14.xyz * r5.xxx;
    r5.x = ps;
    ps = 2.5 * r5.x;
    r5.z = r13.x * r13.y;
    r11.w = ps;
    r5.xzw = r5.zzz * r4.xyz + ModShadowColor.xyz;
    r0.w = r7.w * r12.x + 1.0;
    r7.w = saturate(r11.w * r0.w - 0.5);
    r4.xyz = r11.xyz * r0.www - r10.xyz;
    r3.xyz = r4.xyz * r7.www + r10.xyz;
    r6.xy = r8.xy * r7.ww + r6.xy;
    r6.z = r4.w * r7.w - 2.0;
    r6.z = r6.w * 2.0 + r6.z;
    r6.xyz = r6.zxy * r3.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r3.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r3.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r0.xyz = r3.xyz * r0.xyz;
    r6.x = ps;
    r3.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r3.zxy, r9.zxy);
    ps = UniformScalar_8.x * r5.y;
    r6.xzw = r3.xyz * r6.xxx;
    r6.y = ps;
    r6.xzw = r6.xzw * 2.0 - r9.xyz;
    ps = abs(r0.w) * abs(r0.w);
    r6.x = saturate(dot(r1.zxy, r6.wxz));
    r6.z = ps;
    ps = log2(r6.x);
    r5.y = saturate(dot(r3.zyx, r1.zyx));
    r6.x = ps;
    ps = r6.z * r6.z;
    r6.w = r6.x * UniformScalar_7.x;
    r6.z = ps;
    ps = pow(2.0, r6.w);
    r6.x = r6.x * 15.0;
    r6.w = ps;
    r1.xy = r6.yz * r6.wz;
    r6.yzw = r2.xyz + r1.xxx;
    r6.yzw = r1.yyy * r6.yzw;
    ps = pow(2.0, r6.x);
    r6.yzw = r6.yzw * r7.www;
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r0.xy * r5.yy + r6.xy;
    r6.z = r0.z * r5.y + r6.z;
    r6.xyz = r7.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xyz * r5.xzw;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
