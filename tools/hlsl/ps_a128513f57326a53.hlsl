// ps_a128513f57326a53.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 312 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004E0 10040F00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_7 : register(c9); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_6 : register(c7); // float4
float4 UniformVector_7 : register(c8); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D Texture2D_7 : register(s8);
sampler2D Texture2D_8 : register(s9);
sampler2D ModShadowAccumTexture : register(s10);

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

    r12 = tex2D(Texture2D_5, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r12.w - 0.5;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    ps = UniformVector_2.x * r0.w;
    r5.xy = r5.xy * abs(r8.xy);
    r10.x = ps;
    r5.yz = tex2D(ModShadowAccumTexture, r5.xy).xy;
    ps = r4.w;
    r6.xy = r0.wz * 6.0;
    ps = (-4e+02) + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.w));
    r5.x = saturate(r5.x * 0.00022222222);
    r5.w = ps;
    ps = -r0.z;
    r8.xyz = r5.www * r3.xyz;
    ps = 1.0 + ps;
    r11.xyz = r5.yzx * float3(0.875, 0.875, -0.025);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r10.zw = r8.xy * r11.zz;
    r10.y = ps;
    ps = r0.w;
    r5.xz = r10.xy - 0.5;
    ps = UniformVector_1.x * ps;
    r5.yw = float2((r10.xy >= 0.5));
    r7.x = ps;
    ps = r0.z;
    r5.xz = r5.xz - r10.xy;
    ps = UniformVector_1.y * ps;
    r7.zw = r5.xz * r5.yw;
    r7.y = ps;
    r13 = r10.zwxy + r7;
    r5.xz = r13.zw + r13.zw;
    r14 = tex2D(Texture2D_1, r5.xz).xzwy;
    r15.xzw = tex2D(Texture2D_3, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_2, r6.xy).wxy;
    r3.xyw = tex2D(Texture2D_2, r0.wz).xwy;
    r7.xyw = tex2D(Texture2D_0, r13.xy).xyz;
    ps = r4.w;
    r5.z = r1.z + 0.1;
    ps = 0.0001 * ps;
    r6.xy = r0.wz * UniformVector_7.xy;
    r5.x = saturate(ps);
    r7.xyz = r7.xyw * 2.0 - 1.0;
    r10.x = r10.x * r3.y - 1.0;
    ps = r3.x + r3.x;
    r11.zw = r4.xy * ScreenPositionScaleBias.xy;
    r15.y = ps;
    r3.xyz = r15.xzw * 2.0 - 1.0;
    ps = r3.w + r3.w;
    r5.z = saturate(r5.z * 5.0);
    r15.z = ps;
    ps = 1.0 - r5.z;
    r3.xyw = r3.xyz * UniformVector_4.xyz;
    r5.z = ps;
    ps = 1.0 - r5.x;
    r15.x = dot(r5.yww, float3(1.0, 1.0, 1.0));
    r6.w = ps;
    r5.x = (r15.x == 0.0) ? r14.x : r14.w;
    ps = ModShadowGroupColor.x * r5.z;
    r15 = r15.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r14.x = ps;
    r5.x = (r15.y == 0.0) ? r14.y : r5.x;
    r14.z = (r15.x == 0.0) ? r14.z : r5.x;
    ps = ModShadowGroupColor.y * r5.z;
    r5.y = max(r14.z, 0.0);
    r14.y = ps;
    r5.xzw = -r14.xyz + 1.0;
    ps = r10.y + r10.y;
    r5.y = min(r5.y, 0.3);
    r14.z = ps;
    ps = r10.z + r10.z;
    r14.xy = r11.xy * r5.xz;
    r14.w = ps;
    ps = 3.3333333 * r5.y;
    r14 = r14 + float4(0.125, 0.125, -1.0, -1.0);
    r1.w = ps;
    r10.yz = r14.zw * 0.5 + r15.zw;
    r5.xy = r1.ww * r10.yz + r3.xy;
    ps = 1.0 / r4.w;
    r11.xy = r5.xy - r7.xy;
    r5.x = ps;
    r5.xy = r11.zw * r5.xx + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r4.z = tex2D(Texture2D_4, r0.xy).x;
    r4.xyw = tex2D(Texture2D_7, r13.xy).xyz;
    r6.xyz = tex2D(Texture2D_6, r6.xy).yxz;
    r0.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    ps = UniformVector_6.x * UniformVector_6.w;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r15.x = ps;
    ps = UniformVector_6.y * UniformVector_6.w;
    r5.y = dot(r1.zxy, r1.zxy);
    r15.y = ps;
    ps = UniformVector_6.z * UniformVector_6.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r15.z = ps;
    r0.yzw = r0.xyz * UniformScalar_11.xxx + UniformScalar_12.xxx;
    ps = rsqrt(abs(r5.y));
    r12.xyz = r15.xyz * r12.xyz;
    r5.y = ps;
    ps = 1.0 - r5.x;
    r2.xyz = r5.yyy * r1.xyz;
    r5.x = saturate(ps);
    ps = log2(r5.x);
    r12.xyz = r12.xyz * r6.yxz;
    r5.x = ps;
    r10.w = -r7.z + r3.w;
    ps = 2.5 * r5.w;
    r5.y = r14.x * r14.y;
    r12.w = ps;
    r5.yzw = r5.yyy * r13.xyz + ModShadowColor.xyz;
    r1.x = r1.w * r10.x + 1.0;
    r0.x = saturate(r12.w * r1.x - 0.5);
    r10.xyz = r12.xyz * r1.xxx - r4.xyw;
    r4.xyw = r10.xyz * r0.xxx + r4.xyw;
    r7.xy = r11.xy * r0.xx + r7.xy;
    r7.z = r10.w * r0.x - 2.0;
    r7.z = r7.w * 2.0 + r7.z;
    r7.xyz = r7.zxy * r6.www;
    ps = 1.0 + r7.x;
    r7.w = ps;
    r7.xyz = (r6.www > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r1.yzw = (r6.www >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.w = dot(r1.wyz, r1.wyz);
    ps = rsqrt(abs(r6.w));
    r7.xyz = r4.xyw * r9.xyz;
    r6.w = ps;
    r4.xyw = r1.yzw * r6.www;
    r6.w = dot(r4.wxy, r8.zxy);
    r1.yzw = r4.xyw * r6.www;
    r1.yzw = r1.yzw * 2.0 - r8.xyz;
    ps = UniformScalar_8.x * r6.y;
    r7.w = saturate(dot(r2.zxy, r1.wyz));
    r1.y = ps;
    ps = log2(r7.w);
    r6.w = saturate(dot(r4.wyx, r2.zyx));
    r6.x = ps;
    ps = abs(r1.x) * abs(r1.x);
    r6.y = r6.x * UniformScalar_7.x;
    r1.x = ps;
    ps = pow(2.0, r6.y);
    r6.x = r6.x * 15.0;
    r1.z = ps;
    r4.xy = r1.yx * r1.zx;
    r6.yz = r4.xy * r4.zy;
    r0.yzw = r0.yzw + r6.yyy;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.yzw = r6.zzz * r0.yzw;
    r5.x = ps;
    ps = pow(2.0, r6.x);
    r0.xyz = r0.yzw * r0.xxx;
    r6.x = ps;
    ps = pow(2.0, r5.x);
    r6.xyz = r0.xyz * r6.xxx;
    r5.x = ps;
    r6.xy = r7.xy * r6.ww + r6.xy;
    r6.z = r7.z * r6.w + r6.z;
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
