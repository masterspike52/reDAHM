// ps_a6263a94e49e51e2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 312 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004E0 10041200 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_3 : register(c10); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
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

    r13 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = -r0.z + 1.0;
    r10.z = ps;
    r9.xy = r0.wz * 6.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = r4.w - 4e+02;
    r10.w = ps;
    ps = r1.z;
    r11.xy = r0.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    ps = 1.0 / r4.w;
    r6.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r9.zw = r6.yz * r5.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.x));
    r5.w = r13.w - 0.5;
    r6.x = ps;
    ps = 5.0 * r5.x;
    r8.xyz = r6.xxx * r3.xyz;
    r6.y = saturate(ps);
    ps = 0.00022222222 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r6.x = saturate(ps);
    ps = (-0.025) * r6.x;
    r12.x = r0.w * UniformVector_2.x;
    r5.x = ps;
    ps = UniformVector_2.y * r5.z;
    r12.zw = r8.xy * r5.xx;
    r12.y = ps;
    r5.xy = r12.xy - 0.5;
    r6.zw = float2((r12.xy >= 0.5));
    ps = r10.z;
    r5.xy = r5.xy - r12.xy;
    ps = abs(r7.x) * ps;
    r11.zw = r5.xy * r6.zw;
    r3.z = ps;
    ps = r10.w;
    r5 = r12.zwxy + r11;
    ps = abs(r7.y) * ps;
    r3.xy = r5.zw + r5.zw;
    r3.w = ps;
    r12.xyz = tex2D(Texture2D_5, r5.xy).xyz;
    r5.zw = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r15 = tex2D(Texture2D_1, r3.xy);
    r11.xyz = tex2D(Texture2D_0, r5.xy).xyz;
    r17.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r18.xyz = tex2D(LightAttenuationTexture, r9.zw).xyz;
    r16.xyz = tex2D(Texture2D_2, r9.xy).xyw;
    r9.xzw = tex2D(Texture2D_2, r0.wz).wxy;
    ps = 0.0001 * r4.w;
    r10.xy = r0.xy * UniformScalar_0.xx;
    r9.y = saturate(ps);
    r3.xyz = tex2D(Texture2D_3, r10.xy).wxy;
    r7.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.y = dot(r1.zxy, r1.zxy);
    r0.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r7.xyz = r7.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r13.xyz = r0.xyz * r13.xyz;
    r9.x = r16.z * r9.x - 1.0;
    r16.xy = r16.xy + r16.xy;
    ps = rsqrt(abs(r5.y));
    r16.zw = r3.yz + r3.yz;
    r5.y = ps;
    ps = 1.0 - r5.x;
    r0.xyz = r18.xyz * r2.www;
    r5.x = saturate(ps);
    r2.xzw = r17.zxy * 2.0 - 1.0;
    r11.xyw = r11.xyz * 2.0 - 1.0;
    r13.w = r2.x * UniformVector_4.z - r11.w;
    ps = log2(r5.x);
    r4.xyz = r5.yyy * r1.xyz;
    r5.x = ps;
    ps = r9.z + r9.z;
    r1 = r16.zwyx - 1.0;
    r16.y = ps;
    ps = r9.w + r9.w;
    r16.x = dot(r6.zww, float3(1.0, 1.0, 1.0));
    r16.z = ps;
    r5.y = (r16.x == 0.0) ? r15.x : r15.y;
    r16 = r16.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r2.xy = r1.wz * 0.5 + r16.zw;
    r5.y = (r16.y == 0.0) ? r15.z : r5.y;
    r6.z = (r16.x == 0.0) ? r15.w : r5.y;
    ps = (-1.0) + r3.x;
    r5.y = max(r6.z, 0.0);
    r3.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r6.xy = -r6.zy + 1.0;
    r5.x = ps;
    ps = 2.5 * r6.x;
    r5.y = min(r5.y, 0.3);
    r1.w = ps;
    ps = pow(2.0, r5.x);
    r9.zw = r6.yy * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = 3.3333333 * r5.y;
    r0.xyz = r0.xzy * r5.xxx;
    r3.y = ps;
    ps = 0.875 * r5.z;
    r9.yzw = -r9.wzy + 1.0;
    r3.z = ps;
    ps = 0.875 * r5.w;
    r5.x = r9.w * UniformScalar_1.x;
    r3.w = ps;
    r6.xy = r5.xx * r1.xy + r2.zw;
    r5 = r3 * r9.wxzy + float4(1.0, 1.0, 0.125, 0.125);
    r1.xy = r6.xy * UniformVector_4.xy - r11.xy;
    ps = abs(r5.y) * abs(r5.y);
    r6.x = r5.z * r5.w;
    r6.w = ps;
    r6.xyz = r6.xxx * r14.xyz + ModShadowColor.xyz;
    r2.yz = r3.yy * r2.xy + r1.xy;
    ps = r6.w * r6.w;
    r1.xyz = r13.xyz * r5.xxx;
    r2.x = ps;
    r2.w = saturate(r1.w * r5.y - 0.5);
    r13.xyz = r1.xyz * r5.yyy - r12.xyz;
    r5.z = r13.w * r2.w - 2.0;
    r3.xyz = r13.xyz * r2.www + r12.xyz;
    r1.xyw = r2.yzx * r2.wwx;
    r5.xy = r11.xy + r1.xy;
    r5.z = r11.z * 2.0 + r5.z;
    r5.xyz = r5.zxy * r9.www;
    ps = 1.0 + r5.x;
    r1.xyz = r3.xyz * r10.xyz;
    r5.w = ps;
    r5.xyz = (r9.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r9.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r3.xyz = r1.www * r7.xyz;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r7.xyz = r5.yzw * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r4.zxy, r7.zxy));
    ps = log2(r5.x);
    r2.xyz = r3.xyz * r2.www;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r4.zyx));
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
