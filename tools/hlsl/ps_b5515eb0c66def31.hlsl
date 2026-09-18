// ps_b5515eb0c66def31.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 309 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004D4 10041200 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
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
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r16 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = -r0.z + 1.0;
    r9.z = ps;
    r9.xy = r0.wz * 6.0;
    r10.zw = r0.wz * UniformVector_6.xy;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = r1.z + 0.1;
    r9.w = ps;
    ps = r4.w;
    r12.xy = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = 1.0 / r4.w;
    r8.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r11.xy = r8.xy * r5.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.x));
    r5.w = r16.w - 0.5;
    r6.x = ps;
    ps = 0.00022222222 * r5.y;
    r8.xyz = r6.xxx * r3.xyz;
    r6.x = saturate(ps);
    ps = 5.0 * r5.z;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r6.y = saturate(ps);
    ps = (-0.025) * r6.x;
    r3.x = r0.w * UniformVector_2.x;
    r5.y = ps;
    ps = UniformVector_2.y * r5.x;
    r3.zw = r8.xy * r5.yy;
    r3.y = ps;
    r5.xy = r3.xy - 0.5;
    r13.xy = float2((r3.xy >= 0.5));
    ps = r9.z;
    r5.xy = r5.xy - r3.xy;
    ps = abs(r7.x) * ps;
    r12.zw = r5.xy * r13.xy;
    r10.x = ps;
    ps = r9.w;
    r5 = r3.zwxy + r12;
    ps = abs(r7.y) * ps;
    r9.zw = r5.zw + r5.zw;
    r10.y = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r11.xy).xyz;
    r12.xyz = tex2D(Texture2D_5, r5.xy).xyz;
    r15.xyz = tex2D(Texture2D_7, r10.zw).xyz;
    r5.zw = tex2D(ModShadowAccumTexture, r10.xy).xy;
    r14 = tex2D(Texture2D_1, r9.zw);
    r10.xyw = tex2D(Texture2D_0, r5.xy).xyz;
    r11.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r17.xyz = tex2D(Texture2D_2, r9.xy).xyw;
    r7.xzw = tex2D(Texture2D_2, r0.wz).wxy;
    ps = 0.0001 * r4.w;
    r6.zw = r0.xy * UniformScalar_0.xx;
    r7.y = saturate(ps);
    r0.xyz = tex2D(Texture2D_3, r6.zw).wxy;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    ps = -ModShadowColor.x;
    r6.w = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r2.zxy);
    r4.x = ps;
    ps = -ModShadowColor.y;
    r2.xyz = UniformVector_5.xyz * UniformVector_5.www;
    ps = 1.0 + ps;
    r16.xyz = r2.xyz * r16.xyz;
    r4.y = ps;
    r7.x = r17.z * r7.x - 1.0;
    ps = 1.0 - r5.x;
    r2.xy = r17.xy + r17.xy;
    r5.x = saturate(ps);
    r17.xyz = r11.xyz * 2.0 - 1.0;
    r11.xyz = r10.xyw * 2.0 - 1.0;
    r13.w = r17.z * UniformVector_4.z - r11.z;
    ps = log2(r5.x);
    r2.zw = r0.yz + r0.yz;
    r5.x = ps;
    ps = r7.z + r7.z;
    r18 = r2 - 1.0;
    r2.y = ps;
    ps = r7.w + r7.w;
    r2.x = dot(r13.xyy, float3(1.0, 1.0, 1.0));
    r2.z = ps;
    r5.y = (r2.x == 0.0) ? r14.x : r14.y;
    ps = -ModShadowColor.z;
    r2 = r2.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r13.xy = r18.xy * 0.5 + r2.zw;
    r5.y = (r2.y == 0.0) ? r14.z : r5.y;
    r6.z = (r2.x == 0.0) ? r14.w : r5.y;
    ps = 1.0 + ps;
    r5.y = max(r6.z, 0.0);
    r4.z = ps;
    ps = (-1.0) + r0.x;
    r6.xy = -r6.zy + 1.0;
    r14.w = ps;
    ps = 2.5 * r6.x;
    r5.y = min(r5.y, 0.3);
    r0.w = ps;
    ps = rsqrt(abs(r6.w));
    r7.zw = r6.yy * ModShadowGroupColor.xy;
    r6.x = ps;
    ps = 3.3333333 * r5.y;
    r2.xyz = r6.xxx * r1.xyz;
    r14.x = ps;
    ps = 0.875 * r5.z;
    r7.yzw = -r7.wzy + 1.0;
    r14.y = ps;
    ps = 0.875 * r5.w;
    r6.x = r7.w * UniformScalar_1.x;
    r14.z = ps;
    r0.xy = r6.xx * r18.zw + r17.xy;
    r6 = r14 * r7.xzyw + float4(1.0, 0.125, 0.125, 1.0);
    ps = abs(r6.x) * abs(r6.x);
    r5.yzw = r16.xyz * r15.xyz;
    r1.x = ps;
    r1.yz = r0.xy * UniformVector_4.xy - r11.xy;
    ps = r6.y * r6.z;
    r0.xyz = r5.yzw * r6.www;
    r5.y = ps;
    r5.yzw = r5.yyy * r4.xyz + ModShadowColor.xyz;
    r4.xyz = r0.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r1.yz = r14.xx * r13.xy + r1.yz;
    r1.w = saturate(r0.w * r6.x - 0.5);
    r13.xyz = r0.xyz * r6.xxx - r12.xyz;
    r6.z = r13.w * r1.w - 2.0;
    r10.xyz = r13.xyz * r1.www + r12.xyz;
    r0.xyw = r1.yzx * r1.wwx;
    r6.xy = r11.xy + r0.xy;
    r6.z = r10.w * 2.0 + r6.z;
    r6.xyz = r6.zxy * r7.www;
    ps = 1.0 + r6.x;
    r0.xyz = r10.xyz * r9.xyz;
    r6.w = ps;
    r6.xyz = (r7.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r7.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r0.w * r0.w;
    r6.x = dot(r6.wyz, r6.wyz);
    r0.w = ps;
    ps = rsqrt(abs(r6.x));
    r4.xyz = r0.www * r4.xyz;
    r6.x = ps;
    r6.yzw = r6.yzw * r6.xxx;
    r6.x = dot(r6.wyz, r8.zxy);
    r7.xyz = r6.yzw * r6.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    r6.x = saturate(dot(r2.zxy, r7.zxy));
    ps = log2(r6.x);
    r1.xyz = r4.xyz * r1.www;
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
