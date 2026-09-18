// ps_06a781db5cadabda.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 420 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000690 10041700 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c16); // float2
float4 SpotDirection : register(c15); // float3
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
    float4 r23 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_8.x;
    r5.y = r4.w - 4e+02;
    ps = 0.05 * ps;
    r5.z = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    ps = 1.0 / r4.w;
    r8.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r11.xy = r8.xy * r5.xx + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r5.z));
    r5.x = r1.z + 0.1;
    r6.x = ps;
    ps = 0.00022222222 * r5.y;
    r8 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r5.z = saturate(ps);
    ps = 5.0 * r5.x;
    r10.xyz = r6.xxx * r3.xyz;
    r5.y = saturate(ps);
    ps = -r0.z;
    r5.x = r5.w * r5.z;
    r15.xy = r10.xy * r5.xx + r0.wz;
    ps = 1.0 + ps;
    r15.z = -r15.y + 1.0;
    r15.w = ps;
    r9.yzw = r15.wxz * UniformVector_1.yxy;
    ps = UniformVector_1.x * r0.w;
    r23.xyz = UniformVector_4.xyz * 2e+01;
    r9.x = ps;
    r12 = r9.wzxy - 0.5;
    r3 = float4((r9.wzxy >= 0.5));
    r12 = r12 - r9.wzxy;
    r9 = r12.yxzw * r3.yxzw + r9.zwxy;
    r14 = r9 + r9;
    r13 = tex2D(Texture2D_8, r0.xy);
    r9 = tex2D(Texture2D_4, r8.xy).zwxy;
    r18 = tex2D(Texture2D_3, r14.zw);
    r11.xyz = tex2D(LightAttenuationTexture, r11.xy).xyz;
    r16.yzw = tex2D(Texture2D_4, r8.zw).xyw;
    r8.z = float((UniformScalar_3.x >= 1.0));
    r6.x = dot(r2.zxy, r2.zxy);
    ps = 1.0 - r6.x;
    r8.x = saturate(r4.w * 0.0001);
    r5.x = saturate(ps);
    ps = log2(r5.x);
    r12.xy = r16.yz + r16.yz;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r4.w = -r6.w + UniformScalar_4.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r4.xyz = r11.xyz * r2.www;
    r8.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4 = r4.xzyw * r8.yyyz;
    r8.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r4.w + r6.w;
    r8.z = ps;
    ps = -r5.x;
    r11.xy = r8.yz * abs(r7.xy);
    ps = r6.z + ps;
    r22.x = dot(r3.yxx, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r22.y = dot(r3.zww, float3(1.0, 1.0, 1.0));
    r3.y = ps;
    r5.x = (r22.y == 0.0) ? r18.x : r18.y;
    ps = UniformScalar_5.x;
    r17 = r22.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r3.z = ps;
    r5.x = (r17.z == 0.0) ? r18.z : r5.x;
    r5.x = (r17.w == 0.0) ? r18.w : r5.x;
    ps = max(r3.y, r3.z);
    r3.x = max(r5.x, 0.0);
    r3.y = ps;
    ps = 1.0 / UniformScalar_6.x;
    r3.xy = min(r3.yx, float2(1.0, 0.3));
    r5.w = ps;
    r5.w = saturate(r3.x * r5.w);
    ps = 1.0 - r5.y;
    r5.w = -r5.w + 1.0;
    r3.z = ps;
    ps = 1.0 - r5.x;
    r16.x = r5.w * r6.w;
    r3.x = ps;
    ps = ModShadowGroupColor.x * r3.z;
    r6.yz = r16.xw * r9.xy;
    r8.y = ps;
    ps = ModShadowGroupColor.y * r3.z;
    r8.w = float((r6.y >= 0.05));
    r8.z = ps;
    ps = r0.w + r0.w;
    r8 = -r8.wxyz + 1.0;
    r7.x = ps;
    r5.x = (UniformScalar_4.x > 0.0) ? r8.x : 1.0;
    r5.x = (UniformScalar_4.x >= 0.0) ? r5.x : r8.x;
    ps = r0.z + r0.z;
    r12.z = r5.x * r13.w;
    r7.y = ps;
    ps = r15.x + r15.x;
    r12.xyz = r12.xyz + float3(-1.0, -1.0, -0.5);
    r7.z = ps;
    ps = r15.y + r15.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r12.zzzz)) clip(-1.0);
    r7.w = ps;
    r9.xy = tex2D(ModShadowAccumTexture, r11.xy).xy;
    r11 = tex2D(Texture2D_2, r7.xy);
    r19.xyz = tex2D(Texture2D_7, r7.zw).xyz;
    r21 = tex2D(Texture2D_3, r14.xy);
    r5.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r14 = tex2D(Texture2D_6, r0.xy);
    r0.xyw = tex2D(Texture2D_0, r7.zw).xyz;
    r15.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = r6.w;
    r5.w = dot(r1.zxy, r1.zxy);
    r16.xyz = r13.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    r18.xyz = r15.xyz * 2.0 - 1.0;
    ps = 15.0 * ps;
    r15.xyz = r0.xyw + r0.xyw;
    r20.w = saturate(ps);
    r17.zw = r9.zw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r14.xyz = r14.xyz * r14.www;
    r5.w = ps;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r1.xyz = r5.www * r1.xyz;
    r5.w = ps;
    ps = UniformVector_3.x * r5.y;
    r20.xyz = r5.www * -SpotDirection.xyz;
    r6.y = ps;
    ps = UniformVector_3.y * r5.z;
    r14.xyz = r23.xyz * r14.xyz;
    r6.w = ps;
    ps = UniformVector_3.z * r5.x;
    r5.w = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    r6.x = ps;
    ps = 1.0 - r6.x;
    r5.y = dot(r20.zxy, r2.zxy);
    r20.x = ps;
    ps = -SpotAngles.x - -r5.y;
    r5.z = r5.w - r14.x;
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r20.z = saturate(r5.z + r14.x);
    r20.y = saturate(ps);
    r9.zw = -r6.yw * r20.zz + r6.yw;
    ps = r20.x * r20.z;
    r5.xy = -r20.zw + 1.0;
    r5.z = ps;
    r5.w = (r22.x == 0.0) ? r21.x : r21.y;
    r5.w = (r17.y == 0.0) ? r21.z : r5.w;
    r17.x = (r17.x == 0.0) ? r21.w : r5.w;
    ps = r20.y * r20.y;
    r17.y = r3.y * 3.3333333;
    r5.w = ps;
    ps = r6.x;
    r2.xy = -r17.xy + 1.0;
    r6.x = dot(r20.ww, r2.xx) + r17.x;
    ps = r5.z + ps;
    r15.w = r6.x + r17.x;
    r12.z = ps;
    ps = 2.5 * r3.x;
    r15 = r15 + float4(-1.0, -1.0, -1.0, 0.25);
    r3.w = ps;
    ps = r20.w;
    r5.z = saturate(r15.w - r6.z);
    ps = r2.y * ps;
    r0.xyz = r5.zzz * r19.xyz;
    r12.w = ps;
    ps = -r0.z;
    r18.xzw = r18.zxy - r15.zxy;
    ps = r11.z + ps;
    r6.xw = -r0.xy + r11.xy;
    r18.y = ps;
    r2.xy = r6.xw * r11.ww + r0.xy;
    ps = (-1.0) - -r6.z;
    r11 = r18.zwxy * r11.wwww;
    r16.w = ps;
    ps = r0.z;
    r6.xyz = r16.xyz * r5.xxx;
    ps = r11.w + ps;
    r12.xy = r12.xy * 0.5;
    r2.z = ps;
    ps = r11.z;
    r16.xyz = r17.zyw + r12.xwy;
    r5.x = ps;
    r12.xy = r16.xy * r16.yz + r9.zw;
    r3.y = r16.w * r16.y + 1.0;
    ps = r3.y * r3.x;
    r11.xyz = r15.xyz + r11.xyz;
    r9.z = ps;
    ps = r3.w * r3.y;
    r12.xyz = -r11.xyz + r12.xyz;
    r9.w = ps;
    ps = (-2.0) + r5.x;
    r5.yz = r9.zw * r5.yy;
    r11.w = ps;
    ps = (-0.5) + r5.z;
    r5.x = float((r5.y >= 0.9));
    r5.y = saturate(ps);
    r3.xyz = r14.xyz * r5.xxx + r13.xyz;
    r0.xyz = r12.xyz * r5.yyy + r11.xyw;
    r0.w = r0.w * 2.0 + r0.z;
    r3.xyz = r3.xyz - r2.xyz;
    r3.xyz = r3.xyz * r5.yyy + r2.xyz;
    r0.xyw = r0.xyw * r8.yyy;
    ps = -UniformVector_0.x;
    r0.z = r0.w + 1.0;
    r0.xyz = (r8.yyy > 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r0.yzw = (r8.yyy >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.x = dot(r0.wyz, r0.wyz);
    r0.x = ps;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r6.xyz * r5.yyy;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r2.xyz = r0.yzw * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r10.zxy);
    r0.y = ps;
    ps = -UniformVector_0.z;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r10.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r1.zxy, r5.zxy));
    r0.z = ps;
    ps = log2(r5.x);
    r0.xyz = r3.xyz * r0.xyz;
    r9.z = ps;
    r5.xyz = r9.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r5.z);
    r6.w = saturate(dot(r2.zyx, r1.zyx));
    r5.z = ps;
    r5.xy = r5.xy * r8.zw + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r7.xyz + ModShadowColor.xyz;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r4.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
