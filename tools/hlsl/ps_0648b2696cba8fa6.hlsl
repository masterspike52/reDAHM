// ps_0648b2696cba8fa6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 312 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004E0 10041400 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r17 = tex2D(Texture2D_6, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = -r0.z + 1.0;
    r10.z = ps;
    r9.xy = r0.wz * 6.0;
    r9.zw = r0.wz * UniformVector_6.xy;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r1.z + 0.1;
    r10.w = ps;
    ps = r4.w;
    r11.xy = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.z = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = 1.0 / r4.w;
    r8.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r10.xy = r8.xy * r5.ww + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.z));
    r5.w = r17.w - 0.5;
    r6.z = ps;
    ps = 0.00022222222 * r5.y;
    r8.xyz = r6.zzz * r3.xyz;
    r5.y = saturate(ps);
    ps = 5.0 * r5.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r5.x = saturate(ps);
    ps = (-0.025) * r5.y;
    r3.x = r0.w * UniformVector_2.x;
    r5.w = ps;
    ps = UniformVector_2.y * r5.z;
    r3.zw = r8.xy * r5.ww;
    r3.y = ps;
    r5.zw = r3.xy - 0.5;
    r19.xy = float2((r3.xy >= 0.5));
    ps = r10.z;
    r5.zw = r5.zw - r3.xy;
    ps = abs(r7.x) * ps;
    r11.zw = r5.zw * r19.xy;
    r6.z = ps;
    ps = r10.w;
    r3 = r3.zwxy + r11;
    ps = abs(r7.y) * ps;
    r5.zw = r3.zw + r3.zw;
    r6.w = ps;
    r7.xyz = tex2D(LightAttenuationTexture, r10.xy).xyz;
    r12.xyz = tex2D(Texture2D_5, r3.xy).xyz;
    r14.xyz = tex2D(Texture2D_7, r9.zw).xyz;
    r6.zw = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r18 = tex2D(Texture2D_1, r5.zw);
    r11.xyz = tex2D(Texture2D_0, r3.xy).xyz;
    r13.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r16.xyz = tex2D(Texture2D_2, r9.xy).xyw;
    r9.xzw = tex2D(Texture2D_2, r0.wz).wxy;
    ps = 0.0001 * r4.w;
    r6.xy = r0.xy * UniformScalar_0.xx;
    r9.y = saturate(ps);
    r3.xyz = tex2D(Texture2D_3, r6.xy).wxy;
    r20.xyz = tex2D(Texture2D_8, r0.xy).xyz;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformVector_5.x * UniformVector_5.w;
    r5.z = dot(r2.zxy, r2.zxy);
    r0.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r5.w = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    r4.xyz = r20.xyz * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r9.x = r16.z * r9.x - 1.0;
    ps = UniformVector_5.z * UniformVector_5.w;
    r16.xy = r16.xy + r16.xy;
    r0.z = ps;
    ps = rsqrt(abs(r5.w));
    r16.zw = r3.yz + r3.yz;
    r5.w = ps;
    ps = 1.0 - r5.z;
    r17.xyz = r0.xyz * r17.xyz;
    r5.z = saturate(ps);
    r13.xyz = r13.xyz * 2.0 - 1.0;
    r11.xyw = r11.xyz * 2.0 - 1.0;
    r0.w = r13.z * UniformVector_4.z - r11.w;
    ps = log2(r5.z);
    r2.xyz = r5.www * r1.xyz;
    r6.x = ps;
    ps = r9.z + r9.z;
    r16 = r16 - 1.0;
    r0.y = ps;
    ps = r9.w + r9.w;
    r0.x = dot(r19.xyy, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    r5.z = (r0.x == 0.0) ? r18.x : r18.y;
    r1 = r0.xxyz + float4(-3.0, -2.0, -1.0, -1.0);
    r0.xy = r16.xy * 0.5 + r1.zw;
    r5.z = (r1.y == 0.0) ? r18.z : r5.z;
    r5.z = (r1.x == 0.0) ? r18.w : r5.z;
    ps = 1.0 - r5.x;
    r5.w = max(r5.z, 0.0);
    r5.y = ps;
    ps = 1.0 - r5.z;
    r6.y = min(r5.w, 0.3);
    r5.x = ps;
    ps = (-1.0) + r3.x;
    r9.zw = r5.yy * ModShadowGroupColor.xy;
    r14.w = ps;
    ps = 3.3333333 * r6.y;
    r1.xyz = r17.xyz * r14.xyz;
    r14.x = ps;
    ps = 0.875 * r6.z;
    r9.yzw = -r9.wzy + 1.0;
    r14.y = ps;
    ps = 0.875 * r6.w;
    r5.y = r9.w * UniformScalar_1.x;
    r14.z = ps;
    r5.yz = r5.yy * r16.zw + r13.xy;
    r3 = r14 * r9.xzyw + float4(1.0, 0.125, 0.125, 1.0);
    ps = 2.5 * r5.x;
    r13.xyz = r1.xyz * r3.www;
    r13.w = ps;
    r5.xy = r5.yz * UniformVector_4.xy - r11.xy;
    ps = abs(r3.x) * abs(r3.x);
    r5.z = r3.y * r3.z;
    r1.x = ps;
    r6.yzw = r5.zzz * r15.xyz + ModShadowColor.xyz;
    r1.yz = r14.xx * r0.xy + r5.xy;
    r1.w = saturate(r13.w * r3.x - 0.5);
    r0.xyz = r13.xyz * r3.xxx - r12.xyz;
    r5.z = r0.w * r1.w - 2.0;
    r3.xyz = r0.xyz * r1.www + r12.xyz;
    r0.xyw = r1.yzx * r1.wwx;
    r5.xy = r11.xy + r0.xy;
    r5.z = r11.z * 2.0 + r5.z;
    r5.xyz = r5.zxy * r9.www;
    ps = 1.0 + r5.x;
    r0.xyz = r3.xyz * r10.xyz;
    r5.w = ps;
    r5.xyz = (r9.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r3.xyz = (r9.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = r0.w * r0.w;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r5.yzw = r5.yyy * r4.xyz;
    r5.x = ps;
    r3.xyz = r3.xyz * r5.xxx;
    r5.x = dot(r3.zxy, r8.zxy);
    r4.xyz = r3.xyz * r5.xxx;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r2.zxy, r4.zxy));
    ps = log2(r5.x);
    r1.xyz = r5.yzw * r1.www;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r5.y = r5.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.x = saturate(dot(r3.zyx, r2.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r1.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r0.xy * r6.xx + r5.yz;
    r5.w = r0.z * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r7.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r6.ywz;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
