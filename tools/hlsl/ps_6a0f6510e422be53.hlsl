// ps_6a0f6510e422be53.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 294 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000498 10041000 0000080A 00000000 00006908 003F00FF 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
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

    r12 = tex2D(Texture2D_5, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = -r1.y + 1.0;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = r5.w - 4e+02;
    r1.w = ps;
    ps = r2.z;
    r10.xy = r1.xy * UniformVector_1.xy;
    ps = 0.1 + ps;
    r7.z = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r7.z));
    r6.w = r12.w - 0.5;
    r7.z = ps;
    ps = 5.0 * r6.x;
    r9.xyz = r7.zzz * r4.xyz;
    r6.x = saturate(ps);
    ps = 0.00022222222 * r6.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.wwww)) clip(-1.0);
    r6.y = saturate(ps);
    ps = (-0.025) * r6.y;
    r4.x = r1.x * UniformVector_2.x;
    r6.w = ps;
    ps = UniformVector_2.y * r6.z;
    r4.zw = r9.xy * r6.ww;
    r4.y = ps;
    r6.zw = r4.xy - 0.5;
    r0.zw = float2((r4.xy >= 0.5));
    ps = r1.z;
    r6.zw = r6.zw - r4.xy;
    ps = abs(r8.x) * ps;
    r10.zw = r6.zw * r0.zw;
    r7.z = ps;
    ps = r1.w;
    r15 = r4.zwxy + r10;
    ps = abs(r8.y) * ps;
    r6.zw = r15.zw + r15.zw;
    r7.w = ps;
    r4.zw = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r16 = tex2D(Texture2D_1, r6.zw);
    r8.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    ps = 0.0001 * r5.w;
    r7.xy = r1.xy * 6.0;
    r6.z = saturate(ps);
    r11.xzw = tex2D(Texture2D_2, r7.xy).wxy;
    r1.xyz = tex2D(Texture2D_2, r1.xy).xyw;
    r7.xyw = tex2D(Texture2D_0, r15.xy).xyz;
    r10.xyz = r7.xyw * 2.0 - 1.0;
    r4.x = r11.x * r1.z - 1.0;
    ps = r11.z + r11.z;
    r11.xy = r5.xy * ScreenPositionScaleBias.xy;
    r13.z = ps;
    ps = r11.w + r11.w;
    r1.yz = r1.xy + r1.xy;
    r13.w = ps;
    r7.xyz = r8.zxy * 2.0 - 1.0;
    ps = UniformVector_4.x * r7.y;
    r6.yz = -r6.zx + 1.0;
    r14.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r1.x = dot(r0.zww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r6.w = (r1.x == 0.0) ? r16.x : r16.y;
    ps = ModShadowGroupColor.y * r6.z;
    r8 = r1.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r6.z = ps;
    r6.w = (r8.y == 0.0) ? r16.z : r6.w;
    r6.w = (r8.x == 0.0) ? r16.w : r6.w;
    ps = 1.0 - r6.x;
    r0.z = max(r6.w, 0.0);
    r6.x = ps;
    ps = 1.0 - r6.z;
    r4.y = min(r0.z, 0.3);
    r6.z = ps;
    ps = 1.0 - r6.w;
    r1.xyw = r4.zwy * float3(0.875, 0.875, 3.3333333);
    r6.w = ps;
    ps = UniformVector_4.y * r7.z;
    r13.xy = r1.xy * r6.xz;
    r14.y = ps;
    ps = UniformVector_4.z * r7.x;
    r13 = r13 + float4(0.125, 0.125, -1.0, -1.0);
    r14.z = ps;
    r4.yz = r13.zw * 0.5 + r8.zw;
    r6.xz = r1.ww * r4.yz + r14.xy;
    ps = 1.0 / r5.w;
    r11.zw = r6.xz - r10.xy;
    r6.x = ps;
    r6.xz = r11.xy * r6.xx + ScreenPositionScaleBias.wz;
    r1.xyz = tex2D(LightAttenuationTexture, r6.xz).xyz;
    r8.xyz = tex2D(Texture2D_6, r15.xy).xyz;
    r6.z = tex2D(Texture2D_4, r0.xy).x;
    ps = UniformVector_6.x * UniformVector_6.w;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r15.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r15.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r6.x = dot(r3.zxy, r3.zxy);
    r15.z = ps;
    ps = 1.0 - r6.x;
    r7.z = dot(r2.zxy, r2.zxy);
    r6.x = saturate(ps);
    ps = rsqrt(abs(r7.z));
    r12.xyz = r15.xyz * r12.xyz;
    r7.z = ps;
    r3.xyz = r12.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = log2(r6.x);
    r2.yzw = r7.zzz * r2.xyz;
    r6.x = ps;
    r4.w = -r10.z + r14.z;
    ps = 2.5 * r6.w;
    r7.z = r13.x * r13.y;
    r12.w = ps;
    r0.xyz = r7.zzz * r0.xyz + ModShadowColor.xyz;
    r0.w = r1.w * r4.x + 1.0;
    r6.w = saturate(r12.w * r0.w - 0.5);
    r4.xyz = r12.xyz * r0.www - r8.xyz;
    r8.xyz = r4.xyz * r6.www + r8.xyz;
    r7.xy = r11.zw * r6.ww + r10.xy;
    r7.z = r4.w * r6.w - 2.0;
    r7.z = r7.w * 2.0 + r7.z;
    r7.xyz = r7.zxy * r6.yyy;
    ps = 1.0 + r7.x;
    r7.w = ps;
    r7.xyz = (r6.yyy > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r4.xyz = (r6.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.y = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r6.y));
    r7.yzw = r8.xyz * r5.xyz;
    r6.y = ps;
    r4.xyz = r4.xyz * r6.yyy;
    r6.y = dot(r4.zxy, r9.zxy);
    ps = UniformScalar_8.x * r6.z;
    r5.xyz = r4.xyz * r6.yyy;
    r2.x = ps;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    ps = abs(r0.w) * abs(r0.w);
    r6.y = saturate(dot(r2.wyz, r5.zxy));
    r0.w = ps;
    ps = log2(r6.y);
    r7.x = saturate(dot(r4.zyx, r2.wzy));
    r6.y = ps;
    ps = r0.w * r0.w;
    r6.z = r6.y * UniformScalar_7.x;
    r2.y = ps;
    ps = pow(2.0, r6.z);
    r6.y = r6.y * 15.0;
    r2.z = ps;
    r2.xw = r2.xy * r2.zy;
    r2.xyz = r3.xyz + r2.xxx;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r2.xyz = r2.www * r2.xyz;
    r6.x = ps;
    ps = pow(2.0, r6.y);
    r2.xyz = r2.xyz * r6.www;
    r6.y = ps;
    ps = pow(2.0, r6.x);
    r6.yzw = r2.xyz * r6.yyy;
    r6.x = ps;
    r6.yz = r7.yz * r7.xx + r6.yz;
    r6.w = r7.w * r7.x + r6.w;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r1.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r0.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
