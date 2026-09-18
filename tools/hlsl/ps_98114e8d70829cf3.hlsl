// ps_98114e8d70829cf3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 288 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000480 10040F00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c11); // float4
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r14 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r14.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r9.x = ps;
    r8.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    r6.xy = r0.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = r4.w - 4e+02;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r9.zw = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r9.y = saturate(r5.z * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r8.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r10.xyw = r9.zyw * float3(0.5, -0.025, 0.5);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r9.zw = r8.xy * r10.yy;
    r9.y = ps;
    r5.xz = r9.xy - 0.5;
    r12.xy = float2((r9.xy >= 0.5));
    ps = r5.y;
    r5.xz = r5.xz - r9.xy;
    ps = abs(r7.x) * ps;
    r6.zw = r5.xz * r12.xy;
    r5.z = ps;
    ps = r5.w;
    r9 = r9.zwxy + r6;
    ps = abs(r7.y) * ps;
    r5.xy = r9.zw + r9.zw;
    r5.w = ps;
    r10.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r11 = tex2D(Texture2D_1, r5.xy);
    r3.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r6.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    r5.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r5.xyz = r5.xyz * 2.0 - 1.0;
    r6.xyz = r6.xyw * 2.0 - 1.0;
    ps = r3.x + r3.x;
    r13.xy = r4.xy * ScreenPositionScaleBias.xy;
    r7.y = ps;
    ps = r3.y + r3.y;
    r7.x = dot(r12.xyy, float3(1.0, 1.0, 1.0));
    r7.z = ps;
    r5.w = (r7.x == 0.0) ? r11.x : r11.y;
    ps = r0.w;
    r12 = r7.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    ps = UniformVector_6.x * ps;
    r7.zw = r12.zw + r10.xw;
    r7.x = ps;
    r5.w = (r12.y == 0.0) ? r11.z : r5.w;
    r11.x = (r12.x == 0.0) ? r11.w : r5.w;
    ps = r0.z;
    r5.w = max(r11.x, 0.0);
    ps = UniformVector_6.y * ps;
    r10.x = min(r5.w, 0.3);
    r7.y = ps;
    ps = 1.0 / r4.w;
    r3.xyz = r10.yxz * float3(0.875, 3.3333333, 0.875);
    r5.w = ps;
    r0.xy = r3.yy * r7.zw - r6.xy;
    r13.zw = r5.xy * UniformVector_4.xy + r0.xy;
    r0.xy = r13.xy * r5.ww + ScreenPositionScaleBias.wz;
    r0.xyz = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_4, r9.xy).xyz;
    r12.xyz = tex2D(Texture2D_6, r7.xy).xyz;
    r4.y = saturate(r4.w * 0.0001);
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    ps = r1.z;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r15.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r5.y = ps;
    r4.x = r8.w * r3.w - 1.0;
    ps = 5.0 * r5.y;
    r5.x = dot(r2.zxy, r2.zxy);
    r11.y = saturate(ps);
    ps = 1.0 - r5.x;
    r2.xyz = r15.xyz * r14.xyz;
    r5.x = saturate(ps);
    r12.w = r5.z * UniformVector_4.z - r6.z;
    ps = log2(r5.x);
    r14.xyz = r2.xyz * r12.xyz;
    r5.x = ps;
    r2.xyz = r14.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r5.yz = -r11.xy + 1.0;
    ps = 2.5 * r5.y;
    r4.zw = r5.zz * ModShadowGroupColor.xy;
    r14.w = ps;
    ps = rsqrt(abs(r5.w));
    r4.yzw = -r4.wzy + 1.0;
    r5.y = ps;
    r11.yzw = r3.yxz * r4.xzy + float3(1.0, 0.125, 0.125);
    ps = abs(r11.y) * abs(r11.y);
    r3.xyz = r5.yyy * r1.xyz;
    r11.x = ps;
    r12.xyz = r14.xyz * r11.yyy - r9.xyz;
    r0.w = saturate(r14.w * r11.y - 0.5);
    r6.xy = r13.zw * r0.ww + r6.xy;
    r6.z = r12.w * r0.w - 2.0;
    r9.xyz = r12.xyz * r0.www + r9.xyz;
    r1.xw = r11.zx * r11.wx;
    r5.yzw = r1.xxx * r10.xyz + ModShadowColor.xyz;
    r6.z = r6.w * 2.0 + r6.z;
    r6.xyz = r6.zxy * r4.www;
    ps = 1.0 + r6.x;
    r1.xyz = r9.xyz * r7.xyz;
    r6.w = ps;
    r6.xyz = (r4.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r4.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r1.w * r1.w;
    r6.x = dot(r6.wyz, r6.wyz);
    r1.w = ps;
    ps = rsqrt(abs(r6.x));
    r2.xyz = r1.www * r2.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r8.zxy);
    r4.xyz = r6.yzw * r6.xxx;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    r6.x = saturate(dot(r3.zxy, r4.zxy));
    ps = log2(r6.x);
    r2.xyz = r2.xyz * r0.www;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.x = r6.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r3.zyx));
    r6.x = ps;
    ps = pow(2.0, r5.x);
    r6.xyz = r2.xyz * r6.xxx;
    r5.x = ps;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r6.xyz * r5.xxx;
    r6.xyz = r6.xyz * r0.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.ywz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
