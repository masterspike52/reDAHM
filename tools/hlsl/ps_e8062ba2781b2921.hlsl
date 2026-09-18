// ps_e8062ba2781b2921.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 294 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000498 10040F00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

    r13 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r13.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r11.x = ps;
    r5.xyz = tex2D(Texture2D_2, r5.xy).xyw;
    r9.xy = r0.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = r4.w - 4e+02;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    r10.yz = r5.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r10.x = saturate(r6.z * 0.00022222222);
    r5.w = ps;
    ps = -r0.z;
    r8.xyz = r5.www * r3.xyz;
    ps = 1.0 + ps;
    r10.xyz = r10.xyz * float3(-0.025, 0.5, 0.5);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r11.zw = r8.xy * r10.xx;
    r11.y = ps;
    r6.zw = r11.xy - 0.5;
    r12.xy = float2((r11.xy >= 0.5));
    ps = r6.x;
    r6.zw = r6.zw - r11.xy;
    ps = abs(r7.x) * ps;
    r9.zw = r6.zw * r12.xy;
    r6.z = ps;
    ps = r6.y;
    r9 = r11.zwxy + r9;
    ps = abs(r7.y) * ps;
    r6.xy = r9.zw + r9.zw;
    r6.w = ps;
    r14.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r15 = tex2D(Texture2D_1, r6.xy);
    r3.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r6.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r5.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    r7.xy = r0.wz * UniformVector_6.xy;
    r11.xyz = r5.xyw * 2.0 - 1.0;
    r6.xyw = r6.xyz * 2.0 - 1.0;
    ps = r3.x + r3.x;
    r12.zw = r4.xy * ScreenPositionScaleBias.xy;
    r0.y = ps;
    ps = r3.y + r3.y;
    r0.x = dot(r12.xyy, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    r6.z = (r0.x == 0.0) ? r15.x : r15.y;
    r0 = r0.xzxy + float4(-3.0, -1.0, -2.0, -1.0);
    ps = r0.w;
    r6.xyw = r6.xyw * UniformVector_4.xyz;
    r6.z = (r0.z == 0.0) ? r15.z : r6.z;
    r7.z = (r0.x == 0.0) ? r15.w : r6.z;
    ps = r10.y + ps;
    r6.z = max(r7.z, 0.0);
    r0.x = ps;
    ps = r0.y;
    r14.x = min(r6.z, 0.3);
    ps = r10.z + ps;
    r14.xyz = r14.yxz * float3(0.875, 3.3333333, 0.875);
    r0.y = ps;
    r0.xy = r14.yy * r0.xy + r6.xy;
    ps = 1.0 / r4.w;
    r12.xy = r0.xy - r11.xy;
    r6.z = ps;
    r0.xy = r12.zw * r6.zz + ScreenPositionScaleBias.wz;
    r10.xyz = tex2D(Texture2D_4, r9.xy).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r0.xy).xyz;
    r3.xyz = tex2D(Texture2D_6, r7.xy).xyz;
    r7.y = saturate(r4.w * 0.0001);
    r4.xyz = UniformVector_5.xyz * UniformVector_5.www;
    ps = r1.z;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.1 + ps;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.y = ps;
    r7.x = r5.z * r3.w - 1.0;
    ps = 5.0 * r5.y;
    r5.x = dot(r2.zxy, r2.zxy);
    r7.w = saturate(ps);
    ps = 1.0 - r5.x;
    r0.w = dot(r1.zxy, r1.zxy);
    r5.z = saturate(ps);
    ps = rsqrt(abs(r0.w));
    r4.xyz = r4.xyz * r13.xyz;
    r0.w = ps;
    ps = log2(r5.z);
    r13.xyz = r4.xyz * r3.xyz;
    r5.x = ps;
    r4.xyz = r13.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.xyz = r0.xyz * r2.www;
    r5.z = ps;
    ps = -r11.z;
    r3.xyz = r0.www * r1.xyz;
    ps = r6.w + ps;
    r5.xy = -r7.zw + 1.0;
    r1.w = ps;
    ps = 2.5 * r5.x;
    r7.zw = r5.yy * ModShadowGroupColor.xy;
    r13.w = ps;
    ps = pow(2.0, r5.z);
    r7.yzw = -r7.wzy + 1.0;
    r5.z = ps;
    r2.yzw = r14.yxz * r7.xzy + float3(1.0, 0.125, 0.125);
    r1.xyz = r13.xyz * r2.yyy - r10.xyz;
    ps = abs(r2.y) * abs(r2.y);
    r0.xyz = r0.xzy * r5.zzz;
    r0.w = ps;
    r6.w = saturate(r13.w * r2.y - 0.5);
    r5.xy = r12.xy * r6.ww + r11.xy;
    r5.z = r1.w * r6.w - 2.0;
    r1.xyz = r1.xyz * r6.www + r10.xyz;
    ps = r0.w * r0.w;
    r1.xyz = r1.xyz * r9.xyz;
    r2.x = ps;
    r5.z = r5.w * 2.0 + r5.z;
    r2.xy = r2.xz * r2.xw;
    r6.xyz = r2.yyy * r6.xyz + ModShadowColor.xyz;
    r5.xyz = r5.zxy * r7.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r7.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r7.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r2.xyz = r2.xxx * r4.xyz;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r4.xyz = r5.yzw * r5.xxx;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r4.zxy));
    ps = log2(r5.x);
    r2.xyz = r2.xyz * r6.www;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r3.zyx));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r0.xzy * r5.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
