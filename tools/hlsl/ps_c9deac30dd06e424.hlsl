// ps_c9deac30dd06e424.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 237 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003B4 10040E00 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ShadowTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.y = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r7.zw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r8.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    ps = 1.0 / r5.w;
    r6.x = -r1.z + 1.0;
    r0.z = ps;
    r12.zw = r1.xy * UniformVector_3.xy;
    r6.zw = r1.xy + 0.5;
    r7.x = dot(r4.zxy, r4.zxy);
    r8.xyz = r8.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.y));
    r0.zw = r0.zz * ScreenPositionScaleBias.xy;
    r7.y = ps;
    r13.zw = r0.zw * r5.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r7.x));
    r5.xyz = r7.yyy * r2.xyz;
    r7.x = ps;
    ps = UniformVector_2.y * r6.x;
    r7.y = dot(r8.zxy, r8.zxy);
    r6.x = ps;
    ps = UniformVector_2.x * r1.w;
    r10.xzw = r7.xxx * r4.zxy;
    r6.y = ps;
    ps = (-0.5) + r6.y;
    r0.zw = float2((r6.xy >= 0.5));
    r11.y = ps;
    ps = (-0.5) + r6.x;
    r11.x = dot(r0.wzz, float3(1.0, 1.0, 1.0));
    r11.z = ps;
    ps = rsqrt(abs(r7.y));
    r11.yz = r11.yz - r6.yx;
    r7.y = ps;
    r8.xyz = r8.xyz * r7.yyy;
    r0.zw = r11.yz * r0.wz + r6.yx;
    r6.x = dot(r8.zxy, r10.xzw);
    r11.yzw = r8.xzy * r6.xxx;
    r11.yzw = r11.yzw * 2.0 - r10.zxw;
    r6.x = saturate(dot(r5.zxy, r11.zyw));
    ps = log2(r6.x);
    r0.zw = r0.zw + r0.zw;
    r7.y = ps;
    r7 = r7.xzwy * float4(-0.05, 0.875, 0.875, 15.0);
    r11.yz = r7.xx * r4.xy;
    r13.xy = r6.zw + r11.yz;
    r6 = r11.yzxx + float4(0.5, 0.5, -3.0, -2.0);
    r12.xy = r6.xy + r1.xy;
    r4.xyz = tex2D(LightAttenuationTexture, r13.zw).xyz;
    r10.z = tex2D(ShadowTexture, r0.xy).x;
    r10.w = tex2D(Texture2D_3, r12.zw).x;
    r0 = tex2D(Texture2D_2, r0.zw).xzwy;
    r2.w = tex2D(Texture2D_1, r12.xy).w;
    r12 = tex2D(Texture2D_1, r1.xy);
    r14.xyz = tex2D(Texture2D_1, r13.xy).xyz;
    ps = UniformVector_1.x * UniformVector_1.w;
    r1.yzw = -UniformVector_0.xyz + 1.0;
    r13.x = ps;
    ps = UniformVector_1.y * UniformVector_1.w;
    r6.x = dot(r3.zxy, r3.zxy);
    r13.y = ps;
    ps = UniformVector_1.z * UniformVector_1.w;
    r6.y = r2.z + 0.1;
    r13.z = ps;
    ps = 1.0 - r6.x;
    r2.xyz = r14.xyz * 0.15;
    r1.x = saturate(ps);
    r3.yzw = r13.xyz * r12.xyz - r2.xyz;
    ps = log2(r1.x);
    r3.x = -r2.w + 1.0;
    r6.x = ps;
    ps = 5.0 * r6.y;
    r10.y = max(r10.x, 0.0);
    r10.x = saturate(ps);
    r7.x = r3.x * r12.w + r2.w;
    r2.xyz = r3.yzw * r12.www + r2.xyz;
    r3.xyz = r2.xyz * UniformScalar_0.xxx + UniformScalar_1.xxx;
    r1.x = (r11.x == 0.0) ? r0.x : r0.w;
    r0.xw = -r10.xy + 1.0;
    ps = log2(abs(r0.w));
    r2.xyz = r2.xyz * r1.yzw;
    r6.y = ps;
    ps = UniformScalar_4.x * r6.y;
    r1.y = ps;
    ps = pow(2.0, r1.y);
    r11.xy = r0.xx * ModShadowGroupColor.xy;
    r11.z = ps;
    r1.yzw = -r11.xyz + 1.0;
    r10.xy = r7.yz * r1.yz;
    r10.xyw = r10.xyw + float3(0.125, 0.125, 1.0);
    ps = LightColorAndFalloffExponent.w * r6.x;
    r3.w = r10.w - r11.z;
    r0.x = ps;
    r6.x = (r6.w == 0.0) ? r0.y : r1.x;
    r6.x = (r6.z == 0.0) ? r0.z : r6.x;
    ps = pow(2.0, r7.w);
    r7.yz = r10.zx * r10.zy;
    r1.x = ps;
    r6.yzw = r7.zzz * r9.xyz + ModShadowColor.xyz;
    ps = 1.0 - r6.x;
    r7.z = saturate(dot(r8.zxy, r5.zxy));
    r7.w = ps;
    ps = pow(2.0, r0.x);
    r1 = r3 * r1.xxxw;
    r6.x = ps;
    ps = r1.w;
    r0.xyz = r7.yyy * r4.xyz;
    ps = r7.x * ps;
    r0.xyz = r0.xzy * r6.xxx;
    r0.w = ps;
    r7.xy = r2.xy * r7.zz + r1.xy;
    r7.z = r2.z * r7.z + r1.z;
    r7 = r0.xzyw * r7;
    ps = r7.w;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.x = ps;
    ps = (-0.5) - -r6.x;
    r6.yzw = r7.xzy * r6.ywz;
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    oC0.xyz = r6.ywz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
