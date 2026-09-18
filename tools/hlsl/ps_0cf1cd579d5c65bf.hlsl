// ps_0cf1cd579d5c65bf.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 294 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000498 10041000 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r12 = tex2D(Texture2D_5, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = -r0.z + 1.0;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = r4.w - 4e+02;
    r7.z = ps;
    ps = r1.z;
    r10.xy = r0.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r6.z = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r6.z));
    r5.w = r12.w - 0.5;
    r6.z = ps;
    ps = 5.0 * r5.x;
    r9.xyz = r6.zzz * r3.xyz;
    r5.x = saturate(ps);
    ps = 0.00022222222 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r5.y = saturate(ps);
    ps = (-0.025) * r5.y;
    r3.x = r0.w * UniformVector_2.x;
    r5.w = ps;
    ps = UniformVector_2.y * r5.z;
    r3.zw = r9.xy * r5.ww;
    r3.y = ps;
    r5.zw = r3.xy - 0.5;
    r7.xw = float2((r3.xy >= 0.5));
    ps = r7.y;
    r5.zw = r5.zw - r3.xy;
    ps = abs(r8.x) * ps;
    r10.zw = r5.zw * r7.xw;
    r6.z = ps;
    ps = r7.z;
    r14 = r3.zwxy + r10;
    ps = abs(r8.y) * ps;
    r5.zw = r14.zw + r14.zw;
    r6.w = ps;
    r7.yz = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r15 = tex2D(Texture2D_1, r5.zw);
    r13.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    ps = 0.0001 * r4.w;
    r6.xy = r0.wz * 6.0;
    r5.z = saturate(ps);
    r3.xyz = tex2D(Texture2D_2, r6.xy).yxw;
    r8.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r6.xyw = tex2D(Texture2D_0, r14.xy).xyz;
    r10.xyz = r6.xyw * 2.0 - 1.0;
    r13.x = r3.z * r8.z - 1.0;
    ps = r3.y + r3.y;
    r11.xy = r4.xy * ScreenPositionScaleBias.xy;
    r8.z = ps;
    ps = r3.x + r3.x;
    r3.yz = r8.xy + r8.xy;
    r8.w = ps;
    r6.xyz = r13.wyz * 2.0 - 1.0;
    ps = UniformVector_4.x * r6.y;
    r5.yz = -r5.zx + 1.0;
    r16.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r3.x = dot(r7.xww, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    r5.w = (r3.x == 0.0) ? r15.x : r15.y;
    ps = ModShadowGroupColor.y * r5.z;
    r3 = r3.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r5.z = ps;
    r5.w = (r3.y == 0.0) ? r15.z : r5.w;
    r5.w = (r3.x == 0.0) ? r15.w : r5.w;
    ps = 1.0 - r5.x;
    r7.x = max(r5.w, 0.0);
    r5.x = ps;
    ps = 1.0 - r5.z;
    r7.x = min(r7.x, 0.3);
    r5.z = ps;
    ps = 1.0 - r5.w;
    r7.xyw = r7.yzx * float3(0.875, 0.875, 3.3333333);
    r5.w = ps;
    ps = UniformVector_4.y * r6.z;
    r8.xy = r7.xy * r5.xz;
    r16.y = ps;
    ps = UniformVector_4.z * r6.x;
    r15 = r8 + float4(0.125, 0.125, -1.0, -1.0);
    r16.z = ps;
    r13.yz = r15.zw * 0.5 + r3.zw;
    r5.xz = r7.ww * r13.yz + r16.xy;
    ps = 1.0 / r4.w;
    r11.zw = r5.xz - r10.xy;
    r5.x = ps;
    r5.xz = r11.xy * r5.xx + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r5.xz).xyz;
    r8.xyz = tex2D(Texture2D_6, r14.xy).xyz;
    r5.z = tex2D(Texture2D_4, r0.xy).x;
    ps = UniformVector_6.x * UniformVector_6.w;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r0.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r0.z = ps;
    ps = 1.0 - r5.x;
    r6.z = dot(r1.zxy, r1.zxy);
    r5.x = saturate(ps);
    ps = rsqrt(abs(r6.z));
    r12.xyz = r0.xyz * r12.xyz;
    r6.z = ps;
    r2.xyz = r12.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = log2(r5.x);
    r0.yzw = r6.zzz * r1.xyz;
    r5.x = ps;
    r1.w = -r10.z + r16.z;
    ps = 2.5 * r5.w;
    r6.z = r15.x * r15.y;
    r12.w = ps;
    r7.xyz = r6.zzz * r14.xyz + ModShadowColor.xyz;
    r7.w = r7.w * r13.x + 1.0;
    r5.w = saturate(r12.w * r7.w - 0.5);
    r1.xyz = r12.xyz * r7.www - r8.xyz;
    r8.xyz = r1.xyz * r5.www + r8.xyz;
    r6.xy = r11.zw * r5.ww + r10.xy;
    r6.z = r1.w * r5.w - 2.0;
    r6.z = r6.w * 2.0 + r6.z;
    r6.xyz = r6.zxy * r5.yyy;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r5.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r5.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.y = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r5.y));
    r6.yzw = r8.xyz * r4.xyz;
    r5.y = ps;
    r1.xyz = r1.xyz * r5.yyy;
    r5.y = dot(r1.zxy, r9.zxy);
    ps = UniformScalar_8.x * r5.z;
    r4.xyz = r1.xyz * r5.yyy;
    r0.x = ps;
    r4.xyz = r4.xyz * 2.0 - r9.xyz;
    ps = abs(r7.w) * abs(r7.w);
    r5.y = saturate(dot(r0.wyz, r4.zxy));
    r7.w = ps;
    ps = log2(r5.y);
    r6.x = saturate(dot(r1.zyx, r0.wzy));
    r5.y = ps;
    ps = r7.w * r7.w;
    r5.z = r5.y * UniformScalar_7.x;
    r0.y = ps;
    ps = pow(2.0, r5.z);
    r5.y = r5.y * 15.0;
    r0.z = ps;
    r0.xw = r0.xy * r0.zy;
    r0.xyz = r2.xyz + r0.xxx;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.xyz = r0.www * r0.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r0.xyz = r0.xyz * r5.www;
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r0.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r7.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
