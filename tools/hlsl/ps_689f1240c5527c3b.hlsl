// ps_689f1240c5527c3b.bin
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

    ps = UniformScalar_4.x - r6.w;
    r11.w = ps;
    ps = UniformScalar_8.x;
    r5.y = r4.w - 4e+02;
    ps = 0.05 * ps;
    r5.z = dot(r3.zxy, r3.zxy);
    r5.w = ps;
    ps = rsqrt(abs(r5.z));
    r5.x = r1.z + 0.1;
    r1.w = ps;
    ps = 0.00022222222 * r5.y;
    r8 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r5.z = saturate(ps);
    ps = 5.0 * r5.x;
    r11.xyz = r1.www * r3.xyz;
    r5.x = saturate(ps);
    ps = -r0.z;
    r5.y = r5.w * r5.z;
    r13.xy = r11.xy * r5.yy + r0.wz;
    ps = 1.0 + ps;
    r13.z = -r13.y + 1.0;
    r13.w = ps;
    r12.yzw = r13.wxz * UniformVector_1.yxy;
    ps = UniformVector_1.x * r0.w;
    r22.xyz = UniformVector_4.xyz * 2e+01;
    r12.x = ps;
    r3 = r12.wzxy - 0.5;
    r10 = float4((r12.wzxy >= 0.5));
    ps = r0.w + r0.w;
    r3 = r3 - r12.wzxy;
    r9.x = ps;
    r3 = r3.yxzw * r10.yxzw + r12.zwxy;
    ps = r0.z + r0.z;
    r12 = r3 + r3;
    r9.y = ps;
    r19 = tex2D(Texture2D_8, r0.xy);
    r23 = tex2D(Texture2D_4, r8.xy);
    r21.yzw = tex2D(Texture2D_4, r8.zw).xyw;
    r8 = tex2D(Texture2D_3, r12.zw);
    r16.xyw = tex2D(Texture2D_1, r9.xy).yxz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15.w = saturate(r6.w * 15.0);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = float((UniformScalar_3.x >= 1.0));
    r0.w = ps;
    ps = 1.0 / r4.w;
    r3.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r3.xy = r3.xy * r5.ww + ScreenPositionScaleBias.wz;
    r5.y = r11.w * r5.y + r6.w;
    ps = -r5.y;
    r7.xy = r0.zw * abs(r7.xy);
    ps = r6.z + ps;
    r14.x = dot(r10.yxx, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    ps = r5.y;
    r14.y = dot(r10.zww, float3(1.0, 1.0, 1.0));
    r3.z = ps;
    r5.y = (r14.y == 0.0) ? r8.x : r8.y;
    ps = UniformScalar_5.x;
    r10 = r14.yyxx + float4(-2.0, -3.0, -3.0, -2.0);
    r3.w = ps;
    r5.y = (r10.x == 0.0) ? r8.z : r5.y;
    r5.y = (r10.y == 0.0) ? r8.w : r5.y;
    ps = max(r3.z, r3.w);
    r0.w = max(r5.y, 0.0);
    r0.z = ps;
    ps = 1.0 / UniformScalar_6.x;
    r5.zw = min(r0.zw, float2(1.0, 0.3));
    r0.z = ps;
    ps = r16.y + r16.y;
    r0.z = saturate(r5.z * r0.z);
    r16.y = ps;
    ps = 1.0 - r5.x;
    r0.z = -r0.z + 1.0;
    r0.w = ps;
    ps = 1.0 - r5.y;
    r21.x = r0.z * r6.w;
    r0.z = ps;
    ps = ModShadowGroupColor.x * r0.w;
    r6.xy = r21.xw * r23.zw;
    r15.y = ps;
    ps = ModShadowGroupColor.y * r0.w;
    r15.x = float((r6.x >= 0.05));
    r15.z = ps;
    ps = r16.x + r16.x;
    r8 = -r15.wxyz + 1.0;
    r16.z = ps;
    r5.x = (UniformScalar_4.x > 0.0) ? r8.y : 1.0;
    r5.x = (UniformScalar_4.x >= 0.0) ? r5.x : r8.y;
    ps = r16.w + r16.w;
    r16.x = r5.x * r19.w;
    r16.w = ps;
    ps = r13.x + r13.x;
    r18 = r16.yxzw + float4(-1.0, -0.5, -1.0, -1.0);
    r5.x = ps;
    ps = r13.y + r13.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r18.yyyy)) clip(-1.0);
    r5.y = ps;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r10.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r17 = tex2D(Texture2D_2, r9.xy);
    r7.xyz = tex2D(Texture2D_7, r5.xy).xyz;
    r9.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r16 = tex2D(Texture2D_3, r12.xy);
    r20 = tex2D(Texture2D_6, r0.xy);
    r6.xzw = tex2D(Texture2D_0, r5.xy).xyz;
    r5.y = dot(r2.zxy, r2.zxy);
    r12.xyz = r19.xyz * UniformScalar_1.xxx + UniformScalar_2.xxx;
    r13.xyz = r6.xzw * 2.0 - 1.0;
    r14.zw = r23.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r20.xyz = r20.xyz * r20.www;
    r0.x = ps;
    r5.xz = r21.yz * 2.0 - 1.0;
    ps = 1.0 - r5.y;
    r21.xyz = r0.xxx * -SpotDirection.xyz;
    r5.y = saturate(ps);
    ps = log2(r5.y);
    r20.xyz = r22.xyz * r20.xyz;
    r6.x = ps;
    r0.x = dot(r20.zxy, float3(0.11, 0.3, 0.59));
    r5.y = dot(r21.zxy, r2.zxy);
    r0.x = r0.x - r20.x;
    r2.x = saturate(r0.x + r20.x);
    r0.x = (r14.x == 0.0) ? r16.x : r16.y;
    r0.x = (r10.w == 0.0) ? r16.z : r0.x;
    r14.x = (r10.z == 0.0) ? r16.w : r0.x;
    ps = 3.3333333 * r5.w;
    r16.w = saturate(r4.w * 0.0001);
    r14.y = ps;
    ps = 0.5 * r5.x;
    r0.xy = -r14.xy + 1.0;
    r2.y = ps;
    ps = 0.5 * r5.z;
    r2.w = r15.w * r0.y;
    r2.z = ps;
    r5.x = dot(r15.ww, r0.xx) + r14.x;
    ps = r5.x;
    r9.xyz = r9.xyz + r9.xyz;
    ps = r14.x + ps;
    r4.xyz = r14.zyw + r2.ywz;
    r9.w = ps;
    ps = (-1.0) - -r6.y;
    r9 = r9 + float4(-1.0, -1.0, -1.0, 0.25);
    r4.w = ps;
    r0.x = r4.w * r4.y + 1.0;
    ps = r9.w;
    r5.x = dot(r1.zxy, r1.zxy);
    ps = -r6.y + ps;
    r16.xyz = r9.xyz * UniformVector_3.xyz;
    r5.z = saturate(ps);
    r15.xyz = r5.zzz * r7.xyz;
    r5.zw = -r16.xy * r2.xx + r16.xy;
    r14.xy = r4.xy * r4.yz + r5.zw;
    ps = rsqrt(abs(r5.x));
    r18.y = -r15.z + r17.z;
    r5.z = ps;
    ps = -SpotAngles.x - -r5.y;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = 2.5 * r0.z;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r0.y = ps;
    ps = r0.x * r0.z;
    r7.xyz = r5.zzz * r1.xyz;
    r5.y = ps;
    ps = r0.y * r0.x;
    r1.xy = -r15.xy + r17.xy;
    r5.z = ps;
    r0.xy = r1.xy * r17.ww + r15.xy;
    ps = SpotAngles.y * r5.x;
    r5.yz = r5.zy * r8.xx;
    r2.z = saturate(ps);
    ps = (-0.5) + r5.y;
    r2.yw = -r16.zw + 1.0;
    r6.z = saturate(ps);
    ps = r2.y * r2.x;
    r5.x = float((r5.z >= 0.9));
    r0.w = ps;
    r1.xyz = r20.xyz * r5.xxx + r19.xyz;
    ps = r2.z * r2.z;
    r18.xzw = r18.wxz - r13.zxy;
    r6.y = ps;
    ps = r16.z;
    r5 = r18.zwxy * r17.wwww;
    ps = r0.w + ps;
    r0.z = r15.z + r5.w;
    r14.z = ps;
    ps = r5.z;
    r13.xyz = r13.xyz + r5.xyz;
    r5.x = ps;
    ps = (-2.0) + r5.x;
    r5.yzw = -r13.xyz + r14.xyz;
    r13.w = ps;
    r5.xyz = r5.yzw * r6.zzz + r13.xyw;
    r1.xyz = r1.xyz - r0.xyz;
    r0.xyz = r1.xyz * r6.zzz + r0.xyz;
    r5.w = r6.w * 2.0 + r5.z;
    r5.xyz = r5.wxy * r2.www;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r2.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r2.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 - r2.x;
    r5.x = dot(r1.zxy, r1.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r5.yzw = r12.xyz * r5.yyy;
    r5.x = ps;
    r2.xyz = r1.xyz * r5.xxx;
    r5.x = dot(r2.zxy, r11.zxy);
    r1.xyz = r2.xyz * r5.xxx;
    r1.xyz = r1.xyz * 2.0 - r11.xyz;
    r5.x = saturate(dot(r7.zxy, r1.zxy));
    ps = log2(r5.x);
    r1.xyz = r5.yzw * r6.zzz;
    r10.z = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r5.xzw = r10.xzy * float3(0.875, 15.0, 0.875);
    r5.y = ps;
    ps = pow(2.0, r5.z);
    r0.yzw = r0.xyz * r9.xyz;
    r5.z = ps;
    r5.xw = r5.xw * r8.zw + 0.125;
    ps = r5.x * r5.w;
    r0.x = saturate(dot(r2.zyx, r7.zyx));
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.xzw = r1.xyz * r5.zzz;
    r5.w = ps;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r6.xz = r0.yz * r0.xx + r6.xz;
    r6.w = r0.w * r0.x + r6.w;
    r6.xzw = r6.xzw * r5.www;
    r6.xzw = r6.xzw * r3.xyz;
    r6.xzw = r6.xzw * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xwz * r6.yyy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
