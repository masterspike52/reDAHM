// ps_980e21fcafa7f952.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000618 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c15); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_13 : register(c14); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
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
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_8, r0.xy);
    r5.x = r9.w - 0.5;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r13 = tex2D(Texture2D_5, r0.xy);
    r14 = tex2D(Texture2D_4, r0.xy);
    r6.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    ps = r0.w;
    r11.xy = r0.wz * 6.0;
    ps = UniformVector_2.x * ps;
    r10.zw = r0.wz * UniformVector_7.xy;
    r12.x = ps;
    ps = -r0.z;
    r16.yz = r4.xy * ScreenPositionScaleBias.xy;
    ps = 1.0 + ps;
    r20.yzw = -ModShadowColor.xyz + 1.0;
    r12.z = ps;
    ps = r0.w;
    r15.yzw = UniformVector_5.xzy * 2e+01;
    ps = UniformVector_1.x * ps;
    r17.xyz = UniformVector_6.xzy * 2e+01;
    r10.x = ps;
    ps = r0.z;
    r5.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = UniformVector_1.y * ps;
    r5.x = r4.w - 4e+02;
    r10.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r1.z + 0.1;
    r8.x = ps;
    ps = r6.x + r6.x;
    r6.w = dot(r3.zxy, r3.zxy);
    r15.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r14.xyz = r14.xzy * r14.www;
    r8.y = ps;
    ps = 0.00022222222 * r5.x;
    r13.xyz = r13.xzy * r13.www;
    r5.z = saturate(ps);
    ps = rsqrt(abs(r6.w));
    r11.zw = r8.xy * abs(r7.xy);
    r6.w = ps;
    ps = 5.0 * r5.y;
    r8.xyz = r6.www * r3.xyz;
    r5.y = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    r13.xyz = r17.xyz * r13.xyz;
    r12.w = ps;
    ps = (-0.025) * r5.z;
    r14.xyz = r15.yzw * r14.xyz;
    r5.x = ps;
    r3.xyz = (-abs(r5.www) >= 0.0) ? r13.yxz : r14.yxz;
    ps = 1.0 / UniformVector_1.y;
    r13.w = saturate(dot(r3.zxy, float3(0.59, 0.11, 0.3)));
    r20.x = ps;
    r10.xy = r8.xy * r5.xx + r10.xy;
    r12.y = -r10.y * r20.x + 1.0;
    ps = r6.y + r6.y;
    r12.yzw = r12.zyw * UniformVector_2.yyx;
    r15.y = ps;
    ps = r6.z + r6.z;
    r3.xyz = r12.zxy - 0.5;
    r15.z = ps;
    ps = r12.w;
    r6.yzw = float3((r12.xzy >= 0.5));
    ps = r10.x * ps;
    r7.xyz = r3.xzy - r12.zyx;
    r15.w = ps;
    r3 = r15 + float4(-1.0, -1.0, -1.0, -0.5);
    r12.yzw = r7.xzy * r6.zyw + r12.zxy;
    ps = r3.w;
    r19.x = float((r15.w >= 0.5));
    ps = -r15.w + ps;
    r3.xzw = r3.zxy * UniformVector_4.zxy;
    r16.x = ps;
    ps = 1.0 / r4.w;
    r19.yz = -r3.zw * r13.ww;
    r19.w = ps;
    r7.xy = r16.yz * r19.ww + ScreenPositionScaleBias.wz;
    r12.x = r16.x * r19.x + r15.w;
    r12 = r12.zwxy + r12.zwxy;
    r7.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r15.xyz = tex2D(Texture2D_6, r10.xy).xyz;
    r18 = tex2D(Texture2D_1, r12.zw);
    r12 = tex2D(Texture2D_1, r12.xy);
    r16.xy = tex2D(ModShadowAccumTexture, r11.zw).xy;
    r22.xyz = tex2D(Texture2D_7, r10.zw).xyz;
    r10.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r11.xyw = tex2D(Texture2D_2, r11.xy).xyw;
    r0.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r0.w = float((UniformScalar_11.x >= 1.0));
    r1.w = float((UniformScalar_11.x > 1.0));
    r5.x = dot(r2.zxy, r2.zxy);
    r6.x = dot(r1.zxy, r1.zxy);
    r16.zw = r11.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r17.xyz = r10.xyw + r10.xyw;
    r6.x = ps;
    ps = 1.0 - r5.x;
    r21.xyz = r9.xyz * UniformScalar_12.xxx;
    r5.x = saturate(ps);
    r2.xyz = (-abs(r1.www) >= 0.0) ? r22.xyz : 1.0;
    r10.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r2.xyz;
    ps = log2(r5.x);
    r2.xyz = r6.xxx * r1.xyz;
    r6.x = ps;
    r16 = r16 * float4(0.875, 0.875, 0.5, 0.5);
    r1.xyz = r21.xyz * r10.xyz + UniformScalar_13.xxx;
    r11.xyz = (abs(r5.www) > 0.0) ? r14.xzy : r13.xzy;
    r5.x = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r5.x = r5.x - r11.x;
    ps = r4.w;
    r5.x = saturate(r5.x + r11.x);
    ps = 0.0001 * ps;
    r5.xy = -r5.yx + 1.0;
    r5.z = saturate(ps);
    ps = r0.x + r0.x;
    r1.xyz = r1.xyz * r5.yyy;
    r4.z = ps;
    r5.xy = -r5.xx * ModShadowGroupColor.xy + 1.0;
    ps = r0.y + r0.y;
    r4.xy = r16.xy * r5.xy;
    r4.w = ps;
    ps = r11.w;
    r14.y = dot(r6.yww, float3(1.0, 1.0, 1.0));
    r5.x = (r14.y == 0.0) ? r12.x : r12.y;
    ps = r0.z * ps;
    r4 = r4 + float4(0.125, 0.125, -1.0, -1.0);
    r5.w = ps;
    ps = r6.z + r6.z;
    r5.y = r4.x * r4.y;
    r3.y = ps;
    r6.yzw = r5.yyy * r20.yzw + ModShadowColor.xyz;
    ps = (-1.0) - -r5.w;
    r14.xzw = r3.yzw + r19.xyz;
    r13.x = ps;
    r5.y = (r14.x == 0.0) ? r18.x : r18.y;
    ps = 1.0 - r3.x;
    r0 = r14.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r4.x = ps;
    r5.x = (r0.z == 0.0) ? r12.z : r5.x;
    r5.y = (r0.y == 0.0) ? r18.z : r5.y;
    r17.w = (r0.x == 0.0) ? r18.w : r5.y;
    r5.x = (r0.w == 0.0) ? r12.w : r5.x;
    ps = 1.0 - r5.x;
    r5.y = max(r5.x, 0.0);
    r0.x = ps;
    ps = 1.0 - r5.z;
    r5.y = min(r5.y, 0.3);
    r0.w = ps;
    ps = 2.5 * r0.x;
    r12 = r17 + float4(-1.0, -1.0, -1.0, 0.25);
    r0.z = ps;
    ps = 3.3333333 * r5.y;
    r5.x = r12.w + r17.w;
    r4.y = ps;
    ps = r5.x;
    r13.yz = r4.zw + r16.zw;
    ps = -r5.w + ps;
    r13 = r4.xyyy * r13.wxyz;
    r5.x = saturate(ps);
    ps = r3.x;
    r4.xyz = r5.xxx * r15.xyz;
    ps = r13.x + ps;
    r0.y = r13.y + 1.0;
    r5.w = ps;
    ps = r0.y * r0.x;
    r5.xz = r14.zw + r13.zw;
    r5.y = ps;
    ps = r0.z * r0.y;
    r3.xyw = -r12.xyz + r5.xzw;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r5.w = float((r5.y > 0.9));
    r5.z = saturate(ps);
    r5.xy = r3.xy * r5.zz + r12.xy;
    r3.xyz = r5.www * r11.xyz - r4.xyz;
    r5.w = r3.w * r5.z - 2.0;
    r5.w = r10.w * 2.0 + r5.w;
    r3.xyz = r10.xyz * r9.xyz + r3.xyz;
    r4.xyz = r3.xyz * r5.zzz + r4.xyz;
    r3.xyw = r5.xyw * r0.www;
    ps = -UniformVector_0.x;
    r3.z = r3.w + 1.0;
    r5.xyw = (r0.www > 0.0) ? r3.xyz : float3(0.0, 0.0, 1.0);
    r0.xyz = (r0.www >= 0.0) ? r5.xyw : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.x = dot(r0.zxy, r0.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r1.xyz * r5.zzz;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r3.xyz = r0.xyz * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r3.zxy, r8.zxy);
    r5.z = ps;
    ps = -UniformVector_0.z;
    r0.xyz = r3.xyz * r5.xxx;
    r0.xyz = r0.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r2.zxy, r0.zxy));
    r5.w = ps;
    ps = log2(r5.x);
    r0.xyz = r4.xyz * r5.yzw;
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
