// ps_c9307eabb1451c80.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 441 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006E4 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

    r9.z = UniformScalar_1.x * UniformVector_3.x;
    ps = UniformScalar_22.x;
    r9.xy = r4.xy * ScreenPositionScaleBias.xy;
    ps = 0.05 * ps;
    r5.zw = r0.wz - r0.xy;
    r9.w = ps;
    ps = 1.0 / r4.w;
    r5.x = r4.w - 4e+02;
    r8.x = ps;
    ps = 0.00022222222 * r5.x;
    r5.y = dot(r3.zxy, r3.zxy);
    r8.z = saturate(ps);
    ps = rsqrt(abs(r5.y));
    r5.zw = r5.zw * UniformScalar_6.xx;
    r5.x = ps;
    ps = 1.0 / UniformScalar_2.x;
    r10.xyz = r5.xxx * r3.xyz;
    r8.y = ps;
    r8 = r9 * r8.xxyz;
    r5.xy = r10.xy * r8.ww;
    ps = -r0.z;
    r14 = r5.xzwy + r0.wxyz;
    ps = 1.0 + ps;
    r11.w = r14.x * UniformVector_1.x;
    r3.y = ps;
    ps = r14.w;
    r12 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r5.x = ps;
    ps = 1.0 - r5.x;
    r5.yz = r14.yz * UniformVector_5.xy;
    r3.x = ps;
    r9.x = r8.z * UniformScalar_3.x + r5.y;
    r11.yz = r3.yx * UniformVector_1.yy;
    ps = UniformVector_1.x * r0.w;
    r15.x = -r6.w + UniformScalar_18.x;
    r11.x = ps;
    r13 = r11.wzxy - 0.5;
    r3 = float4((r11.wzxy >= 0.5));
    r13 = r13 - r11.wzxy;
    r11 = r13 * r3 + r11.wzxy;
    ps = UniformVector_6.y + r5.z;
    r11 = r11 + r11;
    r9.y = ps;
    r5 = tex2D(Texture2D_4, r12.xy).zxwy;
    r22.yzw = tex2D(Texture2D_4, r12.zw).xyw;
    r16 = tex2D(Texture2D_3, r11.zw);
    r17 = tex2D(Texture2D_7, r9.xy);
    r12.xyz = tex2D(Texture2D_5, r0.xy).yzx;
    ps = r0.w + r0.w;
    r15.yzw = UniformVector_4.xyz * 2e+01;
    r9.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r13.x = float((UniformScalar_17.x >= 1.0));
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r13.yzw = r17.xyz * r17.www;
    r9.y = ps;
    ps = r0.z + r0.z;
    r13 = r15 * r13;
    r9.w = ps;
    ps = r12.z + r12.z;
    r1.w = r13.x + r6.w;
    r15.x = ps;
    ps = -r1.w;
    r12.zw = r8.xy + ScreenPositionScaleBias.wz;
    ps = r6.z + ps;
    r17.x = dot(r3.xyy, float3(1.0, 1.0, 1.0));
    r1.w = ps;
    ps = r1.w;
    r17.y = dot(r3.zww, float3(1.0, 1.0, 1.0));
    r3.x = ps;
    r1.w = (r17.y == 0.0) ? r16.x : r16.y;
    ps = UniformScalar_19.x;
    r8 = r17.yyxx + float4(-2.0, -3.0, -3.0, -2.0);
    r3.w = ps;
    r1.w = (r8.x == 0.0) ? r16.z : r1.w;
    r3.z = (r8.y == 0.0) ? r16.w : r1.w;
    ps = max(r3.x, r3.w);
    r3.y = max(r3.z, 0.0);
    r3.x = ps;
    ps = 1.0 / UniformScalar_20.x;
    r3.xy = min(r3.xy, float2(1.0, 0.3));
    r1.w = ps;
    ps = r12.x + r12.x;
    r1.w = saturate(r3.x * r1.w);
    r15.y = ps;
    ps = r12.y + r12.y;
    r1.w = -r1.w + 1.0;
    r15.z = ps;
    ps = r9.x;
    r22.x = r1.w * r6.w;
    ps = abs(r7.x) * ps;
    r6.xz = r22.xw * r5.xz;
    r12.x = ps;
    ps = r9.y;
    r3.w = float((r6.x >= 0.05));
    ps = abs(r7.y) * ps;
    r3.xw = -r3.zw + 1.0;
    r12.y = ps;
    r1.w = (UniformScalar_18.x > 0.0) ? r3.w : 1.0;
    r15.w = (UniformScalar_18.x >= 0.0) ? r1.w : r3.w;
    ps = r14.x + r14.x;
    r18 = r15 + float4(-1.0, -1.0, -1.0, -0.5);
    r9.x = ps;
    ps = r14.w + r14.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r18.wwww)) clip(-1.0);
    r9.y = ps;
    r7.xyz = tex2D(LightAttenuationTexture, r12.zw).xyz;
    r8.xy = tex2D(ModShadowAccumTexture, r12.xy).xy;
    r12 = tex2D(Texture2D_2, r9.zw);
    r16.xyz = tex2D(Texture2D_8, r9.xy).xyz;
    r19.xyz = tex2D(Texture2D_1, r9.zw).xyz;
    r21 = tex2D(Texture2D_3, r11.xy);
    r11.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    r15 = tex2D(Texture2D_6, r0.xy).wxyz;
    ps = r4.w;
    r6.x = saturate(r6.w * 15.0);
    ps = 0.0001 * ps;
    r5.z = r1.z + 0.1;
    r14.x = saturate(ps);
    r9.xyz = r15.yzw * UniformScalar_15.xxx + UniformScalar_16.xxx;
    ps = 5.0 * r5.z;
    r5.x = dot(r2.zxy, r2.zxy);
    r0.x = saturate(ps);
    r14.yzw = r11.xyw * 2.0 - 1.0;
    r20.zw = r5.yw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r6.y = -r15.x + 1.0;
    r5.z = ps;
    ps = 1.0 - r5.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = saturate(ps);
    r5.yw = r22.yz * 2.0 - 1.0;
    ps = log2(r5.x);
    r0.yzw = r5.zzz * -SpotDirection.xyz;
    r5.x = ps;
    ps = 1.0 - r6.x;
    r5.z = dot(r0.wyz, r2.zxy);
    r17.w = ps;
    ps = 0.5 * r5.y;
    r2 = r13.yyzw * float4(0.3, 1.0, 1.0, 1.0);
    r0.y = ps;
    r16.w = dot(r2.yx, r6.yy) + 0.0;
    ps = 0.5 * r5.w;
    r13.xyz = r2.yzw * r6.yyy;
    r0.z = ps;
    r15.x = dot(r13.zy, float2(0.11, 0.59)) + 0.0;
    r5.y = (r17.x == 0.0) ? r21.x : r21.y;
    r5.y = (r8.w == 0.0) ? r21.z : r5.y;
    r20.x = (r8.z == 0.0) ? r21.w : r5.y;
    ps = -SpotAngles.x - -r5.z;
    r20.y = r3.y * 3.3333333;
    r5.z = ps;
    ps = SpotAngles.y * r5.z;
    r5.yw = -r20.xy + 1.0;
    r17.z = saturate(ps);
    ps = r6.x;
    r2.xyz = r19.xyz + r19.xyz;
    r5.z = dot(r6.xx, r5.yy) + r20.x;
    ps = r5.w * ps;
    r2.w = r5.z + r20.x;
    r0.w = ps;
    ps = (-1.0) - -r6.z;
    r2 = r2.xwyz + float4(-1.0, 0.25, -1.0, -1.0);
    r19.w = ps;
    ps = r2.y;
    r19.xyz = r20.zyw + r0.ywz;
    ps = -r6.z + ps;
    r6.xyw = r19.wxy * r19.yyz;
    r5.y = saturate(ps);
    ps = 1.0 + r6.x;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r3.y = ps;
    ps = 2.5 * r3.x;
    r0.yzw = r5.yyy * r16.xyz;
    r3.z = ps;
    ps = -r0.w;
    r5.y = dot(r1.zxy, r1.zxy);
    ps = r12.z + ps;
    r5.zw = -r0.yz + r12.xy;
    r2.y = ps;
    r16.xy = r5.zw * r12.ww + r0.yz;
    ps = r3.y * r3.x;
    r2.xzw = r2.wxz - r14.wyz;
    r17.x = ps;
    ps = r3.z * r3.y;
    r12 = r2.zwyx * r12.wwww;
    r17.y = ps;
    ps = rsqrt(abs(r5.y));
    r16.z = r0.w + r12.z;
    r5.y = ps;
    ps = r17.x * r17.w;
    r2.xyz = r5.yyy * r1.xyz;
    r5.z = ps;
    ps = r17.y * r17.w;
    r0.yzw = r18.xyz * UniformVector_3.xyz;
    r5.y = ps;
    ps = r17.z * r17.z;
    r12.xyz = r14.yzw + r12.xyw;
    r5.w = ps;
    ps = (-0.5) + r5.y;
    r5.z = float((r5.z >= 0.9));
    r2.w = saturate(ps);
    r1.xyz = r13.xyz * r5.zzz + r15.yzw;
    ps = r0.w;
    r1.xyz = r1.xyz - r16.xyz;
    r5.z = ps;
    ps = 1.0 - r5.z;
    r15.yzw = r1.xyz * r2.www;
    r5.y = ps;
    ps = 1.0 - r0.x;
    r3 = r16.wxyz + r15;
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r14.w = saturate(r3.x - r13.x);
    r14.y = ps;
    r13.z = r5.y * r14.w + r0.w;
    r0.xy = -r0.yz * r14.ww + r0.yz;
    ps = ModShadowGroupColor.y * r5.z;
    r13.xy = r0.xy + r6.yw;
    r14.z = ps;
    ps = r12.w;
    r1 = -r14.wxyz + 1.0;
    r5.z = ps;
    ps = (-2.0) + r5.z;
    r6.xyz = -r12.xyz + r13.xyz;
    r12.w = ps;
    r6.xyz = r6.xyz * r2.www + r12.xyw;
    r6.w = r11.w * 2.0 + r6.z;
    r6.xyz = r6.wxy * r1.yyy;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r1.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r1.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.y = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.y));
    r0.yzw = r3.yzw * r11.xyz;
    r5.y = ps;
    r3.xyz = r6.xyz * r5.yyy;
    r5.y = dot(r3.zxy, r10.zxy);
    r6.xyz = r3.xyz * r5.yyy;
    r6.xyz = r6.xyz * 2.0 - r10.xyz;
    r5.y = saturate(dot(r2.zxy, r6.zxy));
    ps = log2(r5.y);
    r6.xyz = r9.xyz * r1.xxx;
    r8.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r8.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    r5.y = ps;
    ps = pow(2.0, r8.z);
    r6.xyz = r6.xyz * r2.www;
    r5.z = ps;
    r1.xy = r8.xy * r1.zw + 0.125;
    ps = r1.x * r1.y;
    r0.x = saturate(dot(r3.zyx, r2.zyx));
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.yzw = r6.xyz * r5.zzz;
    r6.x = ps;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r6.yz = r0.yz * r0.xx + r6.yz;
    r6.w = r0.w * r0.x + r6.w;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xyz = r6.xyz * r7.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
