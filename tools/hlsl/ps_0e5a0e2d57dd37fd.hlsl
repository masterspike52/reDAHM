// ps_0e5a0e2d57dd37fd.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 381 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005F4 10041300 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c17); // float4
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_5 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_8, r0.xy);
    ps = r1.z;
    r5.zw = r0.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r6.y = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = r11.w - 0.5;
    r6.y = ps;
    ps = UniformVector_2.x * r0.w;
    r5.x = r4.w - 4e+02;
    r17.x = ps;
    ps = 0.00022222222 * r5.x;
    r9.xyz = r6.yyy * r3.xyz;
    r6.w = saturate(ps);
    ps = 5.0 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r6.z = saturate(ps);
    ps = (-0.025) * r6.w;
    r6.x = float((UniformScalar_8.x >= 1.0));
    r5.x = ps;
    r16.xy = r9.xy * r5.xx + r5.zw;
    r3.xyw = tex2D(Texture2D_0, r16.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = UniformScalar_1.x * UniformVector_4.x;
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = UniformVector_4.x * UniformScalar_4.x;
    r8.y = ps;
    ps = 1.0 / r4.w;
    r7.xy = r8.xy * abs(r7.xy);
    r7.w = ps;
    ps = UniformVector_6.y;
    r8.zw = r0.wz * 6.0;
    ps = UniformScalar_5.x * ps;
    r12.xy = r0.wz * UniformVector_7.xy;
    r14.w = ps;
    ps = UniformVector_6.x * r5.y;
    r16.zw = r4.xy * ScreenPositionScaleBias.xy;
    r14.x = ps;
    ps = UniformVector_6.x * r5.z;
    r13.xyz = r3.xyw + r3.xyw;
    r14.z = ps;
    ps = 0.0001 * r4.w;
    r14.y = UniformScalar_2.x * UniformVector_6.y;
    r5.x = saturate(ps);
    ps = 1.0 / UniformVector_1.y;
    r4 = r14 + r0.xyxy;
    r7.z = ps;
    ps = 1.0 - r0.z;
    r5.yzw = r16.zyw * r7.wzw;
    r10.y = ps;
    ps = 1.0 / UniformVector_1.x;
    r10.xw = -r5.zx + 1.0;
    r10.z = ps;
    r17.yzw = r10.yxz * UniformVector_2.yyx;
    ps = r17.w;
    r14.xyz = r17.zxy - 0.5;
    ps = r16.x * ps;
    r15.xyz = float3((r17.xzy >= 0.5));
    r13.w = ps;
    r15.w = float((r13.w >= 0.5));
    r18.xyz = r14.xzy - r17.zyx;
    r14 = r13 + float4(-1.0, -1.0, -1.0, -0.5);
    ps = ScreenPositionScaleBias.w + r5.y;
    r18.w = r14.w - r13.w;
    r7.z = ps;
    r13.x = r18.w * r15.w + r13.w;
    r13.yzw = r18.xzy * r15.yxz + r17.zxy;
    ps = ScreenPositionScaleBias.z + r5.w;
    r13 = r13.zwxy + r13.zwxy;
    r7.w = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r7.zw).xyz;
    r16.xyz = tex2D(Texture2D_6, r16.xy).xyz;
    r8.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r7 = tex2D(Texture2D_1, r13.xy);
    r17 = tex2D(Texture2D_1, r13.zw);
    r13 = tex2D(Texture2D_4, r4.xy);
    r19 = tex2D(Texture2D_5, r4.zw);
    r12.xyz = tex2D(Texture2D_7, r12.xy).xyz;
    r18.xyw = tex2D(Texture2D_3, r0.xy).xyz;
    r5.yzw = tex2D(Texture2D_2, r8.zw).xyw;
    r4.xyw = tex2D(Texture2D_2, r0.wz).xwy;
    r0.xzw = UniformVector_5.xyz * 2e+01;
    ps = r4.x + r4.x;
    r5.x = dot(r2.zxy, r2.zxy);
    r18.z = ps;
    r8.zw = r5.yz * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r5.y = float((UniformScalar_8.x > 1.0));
    r5.z = saturate(ps);
    ps = r5.w;
    r2.xyz = r11.xyz * UniformScalar_9.xxx;
    r12.xyz = (-abs(r5.yyy) >= 0.0) ? r12.xyz : 1.0;
    ps = r4.y * ps;
    r5.xyw = r19.xyz * r19.www;
    r6.y = ps;
    r5.xyw = r13.xyz * r13.www + r5.xyw;
    r12.xyz = (-abs(r6.xxx) >= 0.0) ? 1.0 : r12.xyz;
    ps = log2(r5.z);
    r0.y = r6.y - 1.0;
    r5.z = ps;
    r4.xyz = r2.xyz * r12.xyz + UniformScalar_10.xxx;
    ps = r18.x + r18.x;
    r13.xyz = r0.xzw * r5.xyw;
    r2.x = ps;
    ps = r18.y + r18.y;
    r5.x = dot(r13.zxy, float3(0.11, 0.3, 0.59));
    r2.y = ps;
    ps = r18.w + r18.w;
    r5.x = r5.x - r13.x;
    r2.z = ps;
    ps = r5.x;
    r0.z = dot(r15.xzz, float3(1.0, 1.0, 1.0));
    r0.x = r15.y * 2.0 + r15.w;
    r5.y = (r0.x == 0.0) ? r17.x : r17.y;
    r5.x = (r0.z == 0.0) ? r7.x : r7.y;
    ps = r13.x + ps;
    r15 = r0.xxzz + float4(-3.0, -2.0, -2.0, -3.0);
    r0.x = saturate(ps);
    r5.x = (r15.z == 0.0) ? r7.z : r5.x;
    r5.y = (r15.y == 0.0) ? r17.z : r5.y;
    r2.w = (r15.x == 0.0) ? r17.w : r5.y;
    r6.x = (r15.w == 0.0) ? r7.w : r5.x;
    ps = 1.0 - r6.x;
    r1.w = max(r6.x, 0.0);
    r6.x = ps;
    ps = 1.0 - r6.z;
    r7 = r2 + float4(-1.0, -1.0, -1.0, 0.25);
    r6.w = ps;
    r0.zw = -r6.ww * ModShadowGroupColor.xy + 1.0;
    ps = r7.w;
    r6.z = dot(r1.zxy, r1.zxy);
    ps = r2.w + ps;
    r5.xyw = r7.zxy * UniformVector_4.zxy;
    r2.x = ps;
    r15.xy = -r5.yw * r0.xx + r5.yw;
    ps = rsqrt(abs(r6.z));
    r6.y = saturate(r2.x - r6.y);
    r6.z = ps;
    ps = r4.w + r4.w;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r18.w = ps;
    ps = 1.0 - r0.x;
    r17.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    ps = r1.w;
    r2.xyz = r6.zzz * r1.xyz;
    r1.x = ps;
    ps = 0.3;
    r8 = r8 * float4(0.875, 0.875, 0.5, 0.5);
    r1.y = ps;
    ps = min(r1.x, r1.y);
    r4.xyz = r4.xyz * r5.yyy;
    r5.y = ps;
    ps = 3.3333333 * r5.y;
    r18.xy = r8.xy * r0.zw;
    r8.y = ps;
    ps = 1.0 - r5.x;
    r1 = r18 + float4(0.125, 0.125, -1.0, -1.0);
    r8.x = ps;
    ps = r1.x * r1.y;
    r0.zw = r1.zw + r8.zw;
    r6.z = ps;
    r1.xyz = r6.zzz * r17.xyz + ModShadowColor.xyz;
    ps = 2.5 * r6.x;
    r8 = r8.yyxy * r0.zwxy;
    r6.z = ps;
    ps = r5.x;
    r0.xyz = r6.yyy * r16.xyz;
    ps = r8.z + ps;
    r6.y = r8.w + 1.0;
    r8.z = ps;
    ps = r6.y * r6.x;
    r8.xy = r15.xy + r8.xy;
    r5.y = ps;
    ps = r6.z * r6.y;
    r8.xyw = -r14.xyz + r8.xyz;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r5.w = float((r5.y > 0.9));
    r5.y = saturate(ps);
    r6.xy = r8.xy * r5.yy + r14.xy;
    r8.xyz = r13.xyz * r5.www - r0.xyz;
    r5.x = r8.w * r5.y - 2.0;
    r6.z = r3.w * 2.0 + r5.x;
    r8.xyz = r12.xyz * r11.xyz + r8.xyz;
    r8.xyz = r8.xyz * r5.yyy + r0.xyz;
    r6.xyz = r6.zxy * r10.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r10.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r10.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.x));
    r0.xyz = r4.xyz * r5.yyy;
    r5.x = ps;
    r4.xyz = r6.xyz * r5.xxx;
    r5.x = dot(r4.zxy, r9.zxy);
    r5.xyw = r4.xyz * r5.xxx;
    r5.xyw = r5.xyw * 2.0 - r9.xyz;
    r5.x = saturate(dot(r2.zxy, r5.wxy));
    ps = log2(r5.x);
    r6.yzw = r8.xyz * r7.xyz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.z;
    r5.y = r5.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.x = saturate(dot(r4.zyx, r2.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r0.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r3.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r1.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
