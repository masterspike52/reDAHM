// ps_5123d4f396734f7c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 441 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006E4 10041A00 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c24); // float2
float4 ModShadowColor : register(c22); // float3
float4 ModShadowGroupColor : register(c23); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c21); // float2
float4 SpotDirection : register(c20); // float3
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_11 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
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
sampler2D Texture2D_8 : register(s9);
sampler2D Texture2D_9 : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

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
    float4 r24 = 0.0;
    float4 r25 = 0.0;
    float4 r26 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformVector_1.x * r0.w;
    r10.xy = r0.wz + r0.wz;
    r11.x = ps;
    ps = -r0.z;
    r9.y = UniformScalar_2.x * UniformVector_5.y;
    ps = 1.0 + ps;
    r12.y = UniformVector_5.y * UniformScalar_5.x;
    r11.z = ps;
    ps = UniformScalar_13.x;
    r5.x = r1.z + 0.1;
    ps = 0.05 * ps;
    r5.y = r4.w - 4e+02;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = UniformVector_3.x * UniformScalar_4.x;
    r9.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = UniformScalar_1.x * UniformVector_3.x;
    r9.w = ps;
    ps = UniformVector_5.x * r5.w;
    r8 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r9.x = ps;
    ps = 5.0 * r5.x;
    r5.w = dot(r3.zxy, r3.zxy);
    r7.z = saturate(ps);
    ps = rsqrt(abs(r5.w));
    r10.zw = r9.zw * abs(r7.xy);
    r5.w = ps;
    ps = 0.00022222222 * r5.y;
    r15.xyz = r5.www * r3.xyz;
    r7.y = saturate(ps);
    ps = UniformVector_5.x * r5.z;
    r5.x = r6.x * r7.y;
    r12.x = ps;
    ps = r12.x;
    r9.zw = r15.xy * r5.xx;
    ps = r0.x + ps;
    r9 = r9.zxyw + r0.wxyz;
    r5.x = ps;
    ps = r9.x;
    r11.y = -r9.w + 1.0;
    r5.y = ps;
    ps = UniformVector_1.x * r5.y;
    r11.yz = r11.zy * UniformVector_1.yy;
    r11.w = ps;
    ps = r12.y;
    r3 = r11.wzxy - 0.5;
    ps = r0.y + ps;
    r22 = float4((r11.wzxy >= 0.5));
    r5.z = ps;
    ps = r9.x + r9.x;
    r3 = r3 - r11.wzxy;
    r7.x = ps;
    r3 = r3 * r22 + r11.wzxy;
    ps = r9.w + r9.w;
    r11 = r3 + r3;
    r7.w = ps;
    r14.xy = tex2D(ModShadowAccumTexture, r10.zw).xy;
    r3 = tex2D(Texture2D_2, r10.xy);
    r19.xyz = tex2D(Texture2D_8, r7.xw).xyz;
    r21 = tex2D(Texture2D_3, r11.zw);
    r23 = tex2D(Texture2D_3, r11.xy);
    r25 = tex2D(Texture2D_6, r9.yz);
    r26 = tex2D(Texture2D_7, r5.xz);
    r5.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r9 = tex2D(Texture2D_9, r0.xy);
    r13 = tex2D(Texture2D_4, r8.xy);
    r20.yzw = tex2D(Texture2D_4, r8.zw).xyw;
    r8.xyw = tex2D(Texture2D_0, r7.xw).xyz;
    r0.xyz = tex2D(Texture2D_1, r10.xy).xyz;
    ps = r4.w;
    r10.xyz = UniformVector_4.xyz * 2e+01;
    ps = 0.0001 * ps;
    r6.x = dot(r2.zxy, r2.zxy);
    r24.w = saturate(ps);
    ps = 1.0 / r4.w;
    r7.xw = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r12.zw = r7.xw * r5.ww + ScreenPositionScaleBias.wz;
    r16.xyw = r0.xyz * 2.0 - 1.0;
    r17.xyz = r8.xyw * 2.0 - 1.0;
    r18.zw = r13.xy * 2.0 - 1.0;
    r11.xyz = r9.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r26.xyz * r26.www;
    r5.w = ps;
    r4.xyz = r25.xyz * r25.www + r0.xyz;
    ps = UniformVector_3.x * r5.y;
    r0.xzw = r5.www * -SpotDirection.xyz;
    r0.y = ps;
    ps = UniformVector_3.y * r5.z;
    r5.y = dot(r0.wxz, r2.zxy);
    r0.z = ps;
    ps = UniformVector_3.z * r5.x;
    r10.xyz = r10.xyz * r4.xyz;
    r0.x = ps;
    ps = 1.0 - r0.x;
    r5.x = dot(r10.zxy, float3(0.11, 0.3, 0.59));
    r24.x = ps;
    ps = -SpotAngles.x - -r5.y;
    r5.z = r5.x - r10.x;
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r24.z = saturate(r5.z + r10.x);
    r24.y = saturate(ps);
    r12.xy = -r0.yz * r24.zz + r0.yz;
    r2.xy = r24.xy * r24.zy;
    r16.z = r0.x + r2.x;
    ps = -r6.w;
    r4.z = float((UniformScalar_8.x >= 1.0));
    ps = UniformScalar_9.x + ps;
    r4.xy = -r24.zw + 1.0;
    r11.w = ps;
    r11 = r11 * r4.xxxz;
    ps = r11.w;
    r0.z = dot(r22.zww, float3(1.0, 1.0, 1.0));
    ps = r6.w + ps;
    r0.y = dot(r22.xyy, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    r5.x = -r5.x + r6.z;
    ps = r20.y + r20.y;
    r5.x = max(r5.x, UniformScalar_10.x);
    r0.x = ps;
    r5.z = (r0.y == 0.0) ? r23.x : r23.y;
    r5.y = (r0.z == 0.0) ? r21.x : r21.y;
    ps = r20.z + r20.z;
    r22 = r0.yzzy + float4(-3.0, -2.0, -3.0, -2.0);
    r0.y = ps;
    r5.y = (r22.y == 0.0) ? r21.z : r5.y;
    r5.z = (r22.w == 0.0) ? r23.z : r5.z;
    r18.x = (r22.x == 0.0) ? r23.w : r5.z;
    r7.x = (r22.z == 0.0) ? r21.w : r5.y;
    ps = 1.0 - r7.x;
    r5.y = max(r7.x, 0.0);
    r5.w = ps;
    ps = 1.0 / UniformScalar_11.x;
    r5.xy = min(r5.xy, float2(1.0, 0.3));
    r5.z = ps;
    ps = 1.0 - r7.z;
    r0.z = saturate(r5.x * r5.z);
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r0.z = -r0.z + 1.0;
    r7.y = ps;
    ps = 3.3333333 * r5.y;
    r20.x = r0.z * r6.w;
    r18.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r0.zw = -r18.yx + 1.0;
    r7.z = ps;
    ps = 1.0 - r6.x;
    r7.w = saturate(r6.w * 15.0);
    r1.w = saturate(ps);
    r5.x = dot(r7.ww, r0.ww) + r18.x;
    ps = r7.w;
    r0.w = r5.x + r18.x;
    ps = r0.z * ps;
    r5.xy = r20.xw * r13.zw;
    r0.z = ps;
    ps = (-1.0) - -r5.y;
    r6.xyz = r0.xwy + float3(-1.0, 0.25, -1.0);
    r0.w = ps;
    ps = 0.5 * r6.x;
    r2.w = dot(r1.zxy, r1.zxy);
    r0.x = ps;
    ps = r6.y;
    r7.x = float((r5.x >= 0.05));
    ps = -r5.y + ps;
    r13 = -r7.wxyz + 1.0;
    r5.x = saturate(ps);
    ps = 0.5 * r6.z;
    r8.xyz = r5.xxx * r19.xyz;
    r0.y = ps;
    r5.x = (UniformScalar_9.x > 0.0) ? r13.y : 1.0;
    r2.z = (UniformScalar_9.x >= 0.0) ? r5.x : r13.y;
    ps = -r8.z;
    r6.xzw = r16.wxy - r17.zxy;
    ps = r3.z + ps;
    r0.xyz = r18.zyw + r0.xzy;
    r6.y = ps;
    r16.xy = r0.xy * r0.yz + r12.xy;
    r5.x = r0.w * r0.y + 1.0;
    r0 = r6.zwxy * r3.wwww;
    ps = 2.5 * r5.w;
    r6.xyz = r17.xyz + r0.xyz;
    r5.y = ps;
    ps = r0.z;
    r5.yz = r5.xy * r5.wx;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r5.yz = r5.yz * r13.xx;
    r6.w = ps;
    ps = (-0.5) + r5.z;
    r7.xyz = -r6.xyz + r16.xyz;
    r5.w = saturate(ps);
    r6.xyz = r7.xyz * r5.www + r6.xyw;
    r6.w = r8.w * 2.0 + r6.z;
    r6.xyz = r6.wxy * r4.yyy;
    ps = 1.0 + r6.x;
    r12.xy = -r8.xy + r3.xy;
    r6.w = ps;
    r6.xyz = (r4.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r4.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r2.w));
    r5.x = dot(r6.zxy, r6.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r5.x));
    r4.xyz = r6.www * r1.xyz;
    r5.x = ps;
    r7.xyz = r6.xyz * r5.xxx;
    r5.x = dot(r7.zxy, r15.zxy);
    r6.xyz = r7.xyz * r5.xxx;
    r6.xyz = r6.xyz * 2.0 - r15.xyz;
    r5.x = saturate(dot(r4.zxy, r6.zxy));
    ps = log2(r5.x);
    r1.z = r2.z * r9.w;
    r14.z = ps;
    r6.xyw = r14.xyz * float3(0.875, 0.875, 15.0);
    r1.xy = r6.xy * r13.zw;
    r2.xzw = r1.xyz + float3(0.125, 0.125, -0.5);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.wwww)) clip(-1.0);
    r6.xyz = tex2D(LightAttenuationTexture, r12.zw).xyz;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    ps = log2(r1.w);
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    r8.xy = r12.xy * r3.ww + r8.xy;
    ps = r8.z;
    r5.y = float((r5.y >= 0.9));
    ps = r0.w + ps;
    r0.xyz = r11.xyz * r5.www;
    r8.z = ps;
    r9.xyz = r10.xyz * r5.yyy + r9.xyz;
    r9.xyz = r9.xyz - r8.xyz;
    r5.yzw = r9.xyz * r5.www + r8.xyz;
    r3.xyz = r5.yzw * r3.xyz;
    ps = pow(2.0, r6.w);
    r5.z = saturate(dot(r7.zyx, r4.zyx));
    r5.y = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r0.xyz = r0.xyz * r5.yyy;
    r5.y = ps;
    r0.xy = r3.xy * r5.zz + r0.xy;
    r0.z = r3.z * r5.z + r0.z;
    ps = pow(2.0, r5.y);
    r5.x = r2.x * r2.z;
    r5.w = ps;
    r5.xyz = r5.xxx * r1.xyz + ModShadowColor.xyz;
    r0.xyz = r0.xyz * r5.www;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r2.yyy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
