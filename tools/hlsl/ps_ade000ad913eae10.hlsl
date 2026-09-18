// ps_ade000ad913eae10.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 288 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000480 10041000 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
sampler2D Texture2D_7 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_5, r0.xy).wxyz;
    ps = (-0.5) + r9.x;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r10.x = ps;
    r8.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    r6.xy = r0.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = r4.w - 4e+02;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    r10.zw = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r10.y = saturate(r5.z * 0.00022222222);
    r5.x = ps;
    ps = -r0.z;
    r8.xyz = r5.xxx * r3.xyz;
    ps = 1.0 + ps;
    r12.xyw = r10.zyw * float3(0.5, -0.025, 0.5);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r10.zw = r8.xy * r12.yy;
    r10.y = ps;
    r5.xz = r10.xy - 0.5;
    r11.xz = float2((r10.xy >= 0.5));
    ps = r5.y;
    r5.xz = r5.xz - r10.xy;
    ps = abs(r7.x) * ps;
    r6.zw = r5.xz * r11.xz;
    r5.z = ps;
    ps = r5.w;
    r10 = r10.zwxy + r6;
    ps = abs(r7.y) * ps;
    r5.xy = r10.zw + r10.zw;
    r5.w = ps;
    r12.yz = tex2D(ModShadowAccumTexture, r5.zw).xy;
    r5 = tex2D(Texture2D_1, r5.xy).xzwy;
    r7.xyw = tex2D(Texture2D_2, r0.wz).xyw;
    r6.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r3.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r3.xyw = r3.xyz * 2.0 - 1.0;
    r6.xyz = r6.xyw * 2.0 - 1.0;
    ps = r7.x + r7.x;
    r13.xy = r4.xy * ScreenPositionScaleBias.xy;
    r11.y = ps;
    ps = r7.y + r7.y;
    r11.x = dot(r11.xzz, float3(1.0, 1.0, 1.0));
    r11.z = ps;
    r1.w = (r11.x == 0.0) ? r5.x : r5.w;
    ps = r0.w;
    r11 = r11.yzxx + float4(-1.0, -1.0, -3.0, -2.0);
    ps = UniformVector_6.x * ps;
    r11.xy = r11.xy + r12.xw;
    r5.x = ps;
    r5.y = (r11.w == 0.0) ? r5.y : r1.w;
    r5.y = (r11.z == 0.0) ? r5.z : r5.y;
    ps = r0.z;
    r5.z = max(r5.y, 0.0);
    ps = UniformVector_6.y * ps;
    r12.x = min(r5.z, 0.3);
    r5.z = ps;
    ps = 1.0 / r4.w;
    r15.xyz = r12.yxz * float3(0.875, 3.3333333, 0.875);
    r5.w = ps;
    r11.xy = r15.yy * r11.xy - r6.xy;
    r13.zw = r3.xy * UniformVector_4.xy + r11.xy;
    r11.xy = r13.xy * r5.ww + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r11.xy).xyz;
    r11.xyz = tex2D(Texture2D_4, r10.xy).xyz;
    r12.xyz = tex2D(Texture2D_6, r5.xz).xyz;
    r16.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    ps = UniformVector_5.x * UniformVector_5.w;
    r10.xyz = -ModShadowColor.xyz + 1.0;
    r14.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r14.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r5.w = dot(r1.zxy, r1.zxy);
    r14.z = ps;
    r7.xyz = r16.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r9.x = r8.w * r7.w - 1.0;
    ps = 0.1 - -r1.z;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r5.z = ps;
    ps = rsqrt(abs(r5.w));
    r5.z = saturate(r5.z * 5.0);
    r5.w = ps;
    ps = 1.0 - r5.x;
    r14.xyz = r14.xyz * r9.yzw;
    r5.x = saturate(ps);
    r12.w = r3.w * UniformVector_4.z - r6.z;
    ps = log2(r5.x);
    r2.xyz = r5.www * r1.xyz;
    r5.x = ps;
    ps = r4.w;
    r5.yz = -r5.yz + 1.0;
    ps = 0.0001 * ps;
    r1.yz = r5.zz * ModShadowGroupColor.xy;
    r1.x = saturate(ps);
    ps = 2.5 * r5.y;
    r9.yzw = -r1.zyx + 1.0;
    r4.w = ps;
    r1.yzw = r15.yxz * r9.xzy + float3(1.0, 0.125, 0.125);
    ps = abs(r1.y) * abs(r1.y);
    r4.xyz = r14.xyz * r12.xyz;
    r1.x = ps;
    r12.xyz = r4.xyz * r1.yyy - r11.xyz;
    r0.w = saturate(r4.w * r1.y - 0.5);
    r6.xy = r13.zw * r0.ww + r6.xy;
    r6.z = r12.w * r0.w - 2.0;
    r4.xyz = r12.xyz * r0.www + r11.xyz;
    r1.xy = r1.xz * r1.xw;
    r5.yzw = r1.yyy * r10.xyz + ModShadowColor.xyz;
    r6.z = r6.w * 2.0 + r6.z;
    r6.xyz = r6.zxy * r9.www;
    ps = 1.0 + r6.x;
    r0.xyz = r4.xyz * r0.xyz;
    r6.w = ps;
    r6.xyz = (r9.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r9.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r1.x * r1.x;
    r6.x = dot(r6.wyz, r6.wyz);
    r1.x = ps;
    ps = rsqrt(abs(r6.x));
    r1.xyz = r1.xxx * r7.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r8.zxy);
    r4.xyz = r6.yzw * r6.xxx;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    r6.x = saturate(dot(r2.zxy, r4.zxy));
    ps = log2(r6.x);
    r1.xyz = r1.xyz * r0.www;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.x = r6.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r6.wzy, r2.zyx));
    r6.x = ps;
    ps = pow(2.0, r5.x);
    r6.xyz = r1.xyz * r6.xxx;
    r5.x = ps;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r6.xyz * r5.xxx;
    r6.xyz = r6.xyz * r3.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.ywz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
