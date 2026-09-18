// ps_1d2f2f168907957c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 411 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000066C 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c14); // float4
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
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

    ps = UniformScalar_4.x - r6.w;
    r9.w = ps;
    ps = UniformScalar_8.x;
    r5.x = r1.z + 0.1;
    ps = 0.05 * ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r5.w));
    r5.y = r4.w - 4e+02;
    r5.w = ps;
    ps = 5.0 * r5.x;
    r10 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r15.x = saturate(ps);
    ps = 0.00022222222 * r5.y;
    r9.xyz = r5.www * r3.xyz;
    r15.z = saturate(ps);
    ps = -r0.z;
    r5.x = r5.z * r15.z;
    r14.xy = r9.xy * r5.xx + r0.wz;
    ps = 1.0 + ps;
    r14.z = -r14.y + 1.0;
    r14.w = ps;
    ps = UniformVector_1.x * r0.w;
    r8.yzw = r14.wxz * UniformVector_1.yxy;
    r8.x = ps;
    r5 = r8.wzxy - 0.5;
    r3 = float4((r8.wzxy >= 0.5));
    r5 = r5 - r8.wzxy;
    r5 = r5.yxzw * r3.yxzw + r8.zwxy;
    r8 = r5 + r5;
    r13 = tex2D(Texture2D_8, r0.xy);
    r22 = tex2D(Texture2D_4, r10.xy);
    r16 = tex2D(Texture2D_3, r8.zw);
    r10.yzw = tex2D(Texture2D_4, r10.zw).xyw;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.xy = r0.wz + r0.wz;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = float((UniformScalar_3.x >= 1.0));
    r5.y = ps;
    ps = 1.0 / r4.w;
    r0.zw = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r11.xy = r0.zw * r5.ww + ScreenPositionScaleBias.wz;
    r5.z = r9.w * r5.z + r6.w;
    ps = -r5.z;
    r5.xy = r5.xy * abs(r7.xy);
    ps = r6.z + ps;
    r20.x = dot(r3.yxx, float3(1.0, 1.0, 1.0));
    r5.z = ps;
    ps = r5.z;
    r20.y = dot(r3.zww, float3(1.0, 1.0, 1.0));
    r3.x = ps;
    r5.z = (r20.y == 0.0) ? r16.x : r16.y;
    ps = UniformScalar_5.x;
    r19 = r20.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r3.y = ps;
    r5.z = (r19.z == 0.0) ? r16.z : r5.z;
    r5.z = (r19.w == 0.0) ? r16.w : r5.z;
    ps = max(r3.x, r3.y);
    r0.z = max(r5.z, 0.0);
    r0.w = ps;
    ps = 1.0 / UniformScalar_6.x;
    r3.xz = min(r0.wz, float2(1.0, 0.3));
    r5.w = ps;
    r15.y = saturate(r3.x * r5.w);
    r3.xy = -r15.yx + 1.0;
    r10.x = r3.x * r6.w;
    r0.zw = r10.wx * r22.wz;
    r5.w = float((r0.w >= 0.05));
    ps = r10.y + r10.y;
    r3.xw = -r5.zw + 1.0;
    r6.x = ps;
    r5.z = (UniformScalar_4.x > 0.0) ? r3.w : 1.0;
    r5.z = (UniformScalar_4.x >= 0.0) ? r5.z : r3.w;
    ps = r10.z + r10.z;
    r6.z = r5.z * r13.w;
    r6.y = ps;
    ps = r14.x + r14.x;
    r10.xzw = r6.zxy + float3(-0.5, -1.0, -1.0);
    r5.z = ps;
    ps = r14.y + r14.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r10.xxxx)) clip(-1.0);
    r5.w = ps;
    r7.xyz = tex2D(LightAttenuationTexture, r11.xy).xyz;
    r11 = tex2D(Texture2D_2, r12.xy);
    r17.yzw = tex2D(Texture2D_7, r5.zw).xyz;
    r12.xyz = tex2D(Texture2D_1, r12.xy).xyz;
    r14 = tex2D(Texture2D_3, r8.xy);
    r6.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r21 = tex2D(Texture2D_6, r0.xy);
    r8.xyw = tex2D(Texture2D_0, r5.zw).xyz;
    r5.zw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r0.y = dot(r1.zxy, r1.zxy);
    r16.xyz = UniformVector_4.xyz * 2e+01;
    r5.x = dot(r2.zxy, r2.zxy);
    r15.xyz = r8.xyw * 2.0 - 1.0;
    r18.xyw = r13.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    r19.zw = r22.xy * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r2.xyz = r21.xyz * r21.www;
    r5.x = saturate(ps);
    r6.xyz = r6.zxy * 2.0 - 1.0;
    ps = log2(r5.x);
    r16.xyz = r16.xyz * r2.xyz;
    r5.y = ps;
    ps = UniformVector_3.x * r6.y;
    r5.x = dot(r16.zxy, float3(0.11, 0.3, 0.59));
    r6.y = ps;
    ps = UniformVector_3.y * r6.z;
    r5.x = r5.x - r16.x;
    r6.z = ps;
    ps = UniformVector_3.z * r6.x;
    r0.x = saturate(r5.x + r16.x);
    r6.x = ps;
    r10.xy = -r6.yz * r0.xx + r6.yz;
    r5.x = (r20.x == 0.0) ? r14.x : r14.y;
    r5.x = (r19.y == 0.0) ? r14.z : r5.x;
    r19.x = (r19.x == 0.0) ? r14.w : r5.x;
    ps = r6.w;
    r19.y = r3.z * 3.3333333;
    ps = 15.0 * ps;
    r2.xw = -r19.yx + 1.0;
    r20.x = saturate(ps);
    ps = rsqrt(abs(r0.y));
    r18.z = r20.x * r2.x;
    r5.x = ps;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    ps = r4.w;
    r12.xyz = r12.xyz + r12.xyz;
    ps = 0.0001 * ps;
    r2.xyz = r5.xxx * r1.xyz;
    r20.w = saturate(ps);
    ps = 1.0 - r0.x;
    r20.yz = r3.yy * ModShadowGroupColor.xy;
    r6.w = ps;
    r5.x = dot(r20.xx, r2.ww) + r19.x;
    ps = r5.x;
    r1.xyz = r18.xyw * r6.www;
    ps = r19.x + ps;
    r4 = -r20 + 1.0;
    r12.w = ps;
    r12 = r12 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = 0.875 * r5.z;
    r5.x = saturate(r12.w - r0.z);
    r17.x = ps;
    ps = 0.875 * r5.w;
    r8.xyz = r5.xxx * r17.yzw;
    r17.y = ps;
    ps = -r8.z;
    r20.xzw = r12.zxy - r15.zxy;
    ps = r11.z + ps;
    r5.xz = -r8.xy + r11.xy;
    r20.y = ps;
    r12.xy = r5.xz * r11.ww + r8.xy;
    ps = 1.0 - r6.x;
    r11 = r20.zwxy * r11.wwww;
    r0.y = ps;
    ps = (-1.0) - -r0.z;
    r18.xy = r10.zw * 0.5;
    r18.w = ps;
    ps = 2.5 * r3.x;
    r18.xyz = r19.zyw + r18.xzy;
    r3.z = ps;
    r10.xy = r18.xy * r18.yz + r10.xy;
    r3.y = r18.w * r18.y + 1.0;
    ps = r8.z;
    r17.zw = r3.yz * r3.xy;
    ps = r11.w + ps;
    r3 = r17 * r4.yzxx;
    r12.z = ps;
    ps = r3.w;
    r0.zw = r3.xy + 0.125;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r5.w = float((r3.z >= 0.9));
    r5.z = saturate(ps);
    r13.xyz = r16.xyz * r5.www + r13.xyz;
    ps = r0.y * r0.x;
    r3.xyz = r15.xyz + r11.xyz;
    r5.x = ps;
    ps = r0.z * r0.w;
    r13.xyz = r13.xyz - r12.xyz;
    r5.w = ps;
    r0.xyz = r5.www * r14.xyz + ModShadowColor.xyz;
    r8.xyz = r13.xyz * r5.zzz + r12.xyz;
    ps = r11.z;
    r10.z = r6.x + r5.x;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r6.xyz = -r3.xyz + r10.xyz;
    r3.w = ps;
    r6.xyz = r6.xyz * r5.zzz + r3.xyw;
    r6.w = r8.w * 2.0 + r6.z;
    r6.xyz = r6.wxy * r4.www;
    ps = 1.0 + r6.x;
    r4.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r4.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r4.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.x));
    r1.xyz = r1.xyz * r5.zzz;
    r5.x = ps;
    r3.xyz = r6.xyz * r5.xxx;
    r5.x = dot(r3.zxy, r9.zxy);
    r5.xzw = r3.xyz * r5.xxx;
    r5.xzw = r5.xzw * 2.0 - r9.xyz;
    r5.x = saturate(dot(r2.zxy, r5.wxz));
    ps = log2(r5.x);
    r6.yzw = r8.xyz * r4.xyz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r5.z = r5.x * 15.0;
    r5.x = ps;
    ps = pow(2.0, r5.z);
    r6.x = saturate(dot(r3.zyx, r2.zyx));
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r5.yzw = r1.xyz * r5.yyy;
    r5.x = ps;
    r5.yz = r6.yz * r6.xx + r5.yz;
    r5.w = r6.w * r6.x + r5.w;
    r5.xyz = r5.yzw * r5.xxx;
    r5.xyz = r5.xyz * r7.xyz;
    r5.xyz = r5.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
