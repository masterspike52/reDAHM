// ps_d26aec09a4cc7a3e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 450 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000708 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c20); // float4
float4 ModShadowAccumResolution : register(c25); // float2
float4 ModShadowColor : register(c23); // float3
float4 ModShadowGroupColor : register(c24); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c22); // float2
float4 SpotDirection : register(c21); // float3
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_15 : register(c13); // float
float4 UniformScalar_16 : register(c14); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_20 : register(c18); // float
float4 UniformScalar_22 : register(c19); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
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
    float4 r21 = 0.0;
    float4 r22 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 0.1 - -r1.z;
    r1.w = UniformScalar_22.x * 0.05;
    r5.x = ps;
    ps = r4.w;
    r8.xz = r0.wz - r0.xy;
    ps = (-4e+02) + ps;
    r3.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = 1.0 / r4.w;
    r9.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    r5.zw = r9.xy * r5.zz + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r3.w));
    r9.zw = r8.xz * UniformScalar_6.xx;
    r3.w = ps;
    ps = 5.0 * r5.x;
    r12 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r21.z = saturate(ps);
    ps = 0.00022222222 * r5.y;
    r10.xyz = r3.www * r3.xyz;
    r21.w = saturate(ps);
    r5.x = r1.w * r21.w;
    ps = -r0.z;
    r9.xy = r10.xy * r5.xx;
    ps = 1.0 + ps;
    r3 = r9.wxzy + r0.ywxz;
    r8.z = ps;
    ps = r3.y;
    r8.x = -r3.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r8.zw = r8.xz * UniformVector_1.yy;
    r8.x = ps;
    ps = UniformVector_1.x * r0.w;
    r21.x = saturate(r4.w * 0.0001);
    r8.y = ps;
    r9 = r8.xzwy - 0.5;
    r11 = float4((r8.wyzx >= 0.5));
    r9 = r9 - r8.xzwy;
    r8 = r9 * r11.wzxy + r8.xzwy;
    r9 = r8.xywz + r8.xywz;
    r15 = tex2D(Texture2D_4, r12.xy).zwxy;
    r16 = tex2D(Texture2D_3, r9.zw);
    r8.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    r14.yzw = tex2D(Texture2D_4, r12.zw).xyw;
    r5.z = dot(r2.zxy, r2.zxy);
    ps = 1.0 - r5.z;
    r8.w = -r6.w + UniformScalar_18.x;
    r5.x = saturate(ps);
    ps = log2(r5.x);
    r12.xy = r14.yz + r14.yz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r5.w = float((UniformScalar_17.x >= 1.0));
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r8.xyz = r8.xyz * r2.www;
    r5.y = ps;
    r8 = r8.xzyw * r5.yyyw;
    r5.x = r8.w + r6.w;
    r5.x = -r5.x + r6.z;
    r11.z = dot(r11.wzz, float3(1.0, 1.0, 1.0));
    ps = r5.x;
    r11.w = dot(r11.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    r5.y = (r11.w == 0.0) ? r16.x : r16.y;
    ps = UniformScalar_19.x;
    r13 = r11.wwzz + float4(-2.0, -3.0, -3.0, -2.0);
    r5.w = ps;
    r5.y = (r13.x == 0.0) ? r16.z : r5.y;
    r21.y = (r13.y == 0.0) ? r16.w : r5.y;
    ps = max(r5.x, r5.w);
    r5.y = max(r21.y, 0.0);
    r5.x = ps;
    ps = 1.0 / UniformScalar_20.x;
    r5.xy = min(r5.xy, float2(1.0, 0.3));
    r5.w = ps;
    r5.x = saturate(r5.x * r5.w);
    ps = 1.0 - r5.x;
    r1.w = dot(r1.zxy, r1.zxy);
    r5.w = ps;
    r14.x = r5.w * r6.w;
    r5.xw = r14.xw * r15.xy;
    r5.x = float((r5.x >= 0.05));
    ps = 1.0 - r5.x;
    r19.xyz = UniformVector_4.xyz * 2e+01;
    r6.x = ps;
    r6.y = (UniformScalar_18.x > 0.0) ? r6.x : 1.0;
    r12.z = (UniformScalar_18.x >= 0.0) ? r6.y : r6.x;
    ps = r3.y + r3.y;
    r6.xyz = r12.xyz + float3(-1.0, -1.0, -0.5);
    r11.x = ps;
    ps = r3.w + r3.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r11.y = ps;
    r14.xyz = tex2D(Texture2D_8, r11.xy).xyz;
    r9 = tex2D(Texture2D_3, r9.xy);
    r12.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r13.xy = r0.wz + r0.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r22.x = saturate(r6.w * 15.0);
    r15.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r12.xyz = r12.xyz + r12.xyz;
    r15.y = ps;
    r18.zw = r15.zw * 2.0 - 1.0;
    ps = UniformScalar_1.x;
    r7.xy = r15.xy * abs(r7.xy);
    r6.w = (r11.z == 0.0) ? r9.x : r9.y;
    r6.w = (r13.w == 0.0) ? r9.z : r6.w;
    r18.x = (r13.z == 0.0) ? r9.w : r6.w;
    ps = UniformVector_3.x * ps;
    r18.y = r5.y * 3.3333333;
    r7.w = ps;
    ps = r3.z;
    r9.xz = -r18.xy + 1.0;
    r5.y = ps;
    r5.x = dot(r22.xx, r9.xx) + r18.x;
    ps = UniformVector_5.x * r5.y;
    r12.w = r5.x + r18.x;
    r5.y = ps;
    ps = UniformVector_5.y * r3.x;
    r12 = r12 + float4(-1.0, -1.0, -1.0, 0.25);
    r5.x = ps;
    ps = 1.0 / UniformScalar_2.x;
    r7.z = saturate(r12.w - r5.w);
    r14.w = ps;
    ps = UniformVector_6.y + r5.x;
    r17 = r7.zzzw * r14;
    r3.y = ps;
    r3.x = r17.w * UniformScalar_3.x + r5.y;
    r9.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r15 = tex2D(Texture2D_2, r13.xy);
    r7 = tex2D(Texture2D_7, r3.xy);
    r11.xyw = tex2D(Texture2D_0, r11.xy).xyz;
    r14.xyz = tex2D(Texture2D_1, r13.xy).xyz;
    r13 = tex2D(Texture2D_6, r0.xy);
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r20.xyz = r13.xyz * UniformScalar_15.xxx + UniformScalar_16.xxx;
    r0.xyz = r14.xyz * 2.0 - 1.0;
    r16.xyz = r11.xyw * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r14.xyz = r7.xyz * r7.www;
    r5.x = ps;
    ps = rsqrt(abs(r5.z));
    r4.xyz = r5.xxx * r1.xyz;
    r5.x = ps;
    r7.xyz = r5.xxx * -SpotDirection.xyz;
    r5.xyz = r19.xyz * r14.xyz;
    ps = r13.w;
    r1 = r5.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r5.x = ps;
    ps = 1.0 - r5.x;
    r5.y = dot(r7.zxy, r2.zxy);
    r6.w = ps;
    r14.xyz = r1.yzw * r6.www;
    r5.z = dot(r14.zy, float2(0.11, 0.59)) + 0.0;
    r5.z = dot(r1.yx, r6.ww) + r5.z;
    ps = r5.z;
    r19.xzw = r0.zxy - r16.zxy;
    ps = -r14.x + ps;
    r0.xw = -r21.yz + 1.0;
    r22.w = saturate(ps);
    ps = 2.5 * r0.x;
    r22.yz = r0.ww * ModShadowGroupColor.xy;
    r0.z = ps;
    ps = r22.x;
    r7 = -r22.wxyz + 1.0;
    ps = r9.z * ps;
    r21.yzw = r12.xyz * UniformVector_3.xyz;
    r12.w = ps;
    r1.yz = -r21.yz * r22.ww + r21.yz;
    ps = (-1.0) - -r5.w;
    r1.xw = -r21.wx + 1.0;
    r17.w = ps;
    r12.z = r1.x * r22.w + r21.w;
    ps = -r17.z;
    r2.xyz = r20.xyz * r7.xxx;
    ps = r15.z + ps;
    r5.xz = -r17.xy + r15.xy;
    r19.y = ps;
    r11.xy = r5.xz * r15.ww + r17.xy;
    ps = 0.5 * r6.x;
    r15 = r19.zwxy * r15.wwww;
    r12.x = ps;
    ps = 0.5 * r6.y;
    r11.z = r17.z + r15.w;
    r12.y = ps;
    ps = r15.z;
    r17.xyz = r18.zyw + r12.xwy;
    r5.x = ps;
    r12.xy = r17.xy * r17.yz + r1.yz;
    r0.y = r17.w * r17.y + 1.0;
    ps = r0.y * r0.x;
    r6.xyz = r16.xyz + r15.xyz;
    r5.z = ps;
    ps = r0.z * r0.y;
    r12.xyz = -r6.xyz + r12.xyz;
    r5.w = ps;
    ps = (-2.0) + r5.x;
    r5.zw = r5.wz * r7.yy;
    r6.w = ps;
    ps = (-0.5) + r5.z;
    r5.x = float((r5.w >= 0.9));
    r5.z = saturate(ps);
    r0.xyz = r14.xyz * r5.xxx + r13.xyz;
    r6.xyz = r12.xyz * r5.zzz + r6.xyw;
    r6.w = r11.w * 2.0 + r6.z;
    r0.xyz = r0.xyz - r11.xyz;
    r1.xyz = r0.xyz * r5.zzz + r11.xyz;
    r6.xyw = r6.xyw * r1.www;
    ps = -UniformVector_0.x;
    r6.z = r6.w + 1.0;
    r6.xyz = (r1.www > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r0.yzw = (r1.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.x = dot(r0.wyz, r0.wyz);
    r0.x = ps;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r2.xyz * r5.zzz;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r2.xyz = r0.yzw * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r10.zxy);
    r0.y = ps;
    ps = -UniformVector_0.z;
    r5.xzw = r2.xyz * r5.xxx;
    r5.xzw = r5.xzw * 2.0 - r10.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r4.zxy, r5.wxz));
    r0.z = ps;
    ps = log2(r5.x);
    r0.xyz = r1.xyz * r0.xyz;
    r9.z = ps;
    ps = -SpotAngles.x - -r5.y;
    r1.xyz = r9.xyz * float3(0.875, 0.875, 15.0);
    r5.x = ps;
    r5.zw = r1.xy * r7.zw + 0.125;
    ps = pow(2.0, r1.z);
    r6.w = saturate(dot(r2.zyx, r4.zyx));
    r5.y = ps;
    ps = SpotAngles.y * r5.x;
    r6.xyz = r6.xyz * r5.yyy;
    r5.y = saturate(ps);
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r5.xw = r5.zy * r5.wy;
    r5.xyz = r5.xxx * r3.xyz + ModShadowColor.xyz;
    r6.xyz = r8.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
