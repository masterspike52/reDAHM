// ps_1f14f1362ad12700.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 441 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006E4 10041500 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r5.yz = r4.xy * ScreenPositionScaleBias.xy;
    r5.x = ps;
    r5.xy = r5.yz * r5.xx + ScreenPositionScaleBias.wz;
    r10.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r9.y = UniformScalar_2.x * UniformVector_5.y;
    ps = UniformScalar_13.x;
    r9.z = UniformVector_5.y * UniformScalar_5.x;
    ps = 0.05 * ps;
    r5.y = UniformVector_3.x * UniformScalar_4.x;
    r13.w = ps;
    ps = r4.w;
    r5.z = UniformScalar_1.x * UniformVector_3.x;
    ps = (-4e+02) + ps;
    r11 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r5.w = ps;
    ps = 0.00022222222 * r5.w;
    r3.w = dot(r3.zxy, r3.zxy);
    r8.w = saturate(ps);
    ps = UniformVector_5.x * r5.y;
    r1.w = dot(r2.zxy, r2.zxy);
    r9.x = ps;
    ps = rsqrt(abs(r3.w));
    r5.x = saturate(-r1.w + 1.0);
    r5.y = ps;
    ps = log2(r5.x);
    r13.xyz = r10.xyz * r2.www;
    r5.x = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r10.xyz = r5.yyy * r3.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r12.xy = r9.xz + r0.xy;
    r8.y = ps;
    r3 = r13.xzyw * r8.yyyw;
    ps = UniformVector_5.x * r5.z;
    r9.zw = r10.xy * r3.ww;
    r9.x = ps;
    r9 = r9.zxyw + r0.wxyz;
    ps = r9.x;
    r8.y = -r9.w + 1.0;
    r5.y = ps;
    ps = 1.0 - r0.z;
    r14.xyz = UniformVector_4.xyz * 2e+01;
    r8.z = ps;
    ps = UniformVector_1.x * r5.y;
    r8.yz = r8.zy * UniformVector_1.yy;
    r8.w = ps;
    ps = UniformVector_1.x * r0.w;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r8.x = ps;
    r13 = r8.wzxy - 0.5;
    r5 = float4((r8.wxyz >= 0.5));
    r13 = r13 - r8.wzxy;
    r8 = r13 * r5.xwyz + r8.wzxy;
    r17 = r8 + r8;
    r20 = tex2D(Texture2D_4, r11.xy);
    r8 = tex2D(Texture2D_3, r17.zw);
    r16 = tex2D(Texture2D_6, r9.yz);
    r18 = tex2D(Texture2D_7, r12.xy);
    r13 = tex2D(Texture2D_9, r0.xy);
    r15.yzw = tex2D(Texture2D_4, r11.zw).xyw;
    r12.xyz = r13.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r11.xzw = r18.xyz * r18.www;
    r11.xzw = r16.xyz * r16.www + r11.xzw;
    r14.xyz = r14.xyz * r11.xzw;
    r10.w = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    r10.w = r10.w - r14.x;
    ps = -r6.w;
    r19.z = saturate(r10.w + r14.x);
    ps = UniformScalar_9.x + ps;
    r11.x = -r19.z + 1.0;
    r12.w = ps;
    ps = 0.0001 * r4.w;
    r11.y = float((UniformScalar_8.x >= 1.0));
    r18.w = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r11 = r12 * r11.xxxy;
    r12.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.w = r11.w + r6.w;
    r12.y = ps;
    ps = -r10.w;
    r7.xy = r12.xy * abs(r7.xy);
    ps = r6.z + ps;
    r18.y = dot(r5.xww, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r18.z = dot(r5.yzz, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    r5.y = (r18.z == 0.0) ? r8.x : r8.y;
    ps = UniformScalar_10.x;
    r16 = r18.yyzz + float4(-3.0, -2.0, -2.0, -3.0);
    r5.z = ps;
    r5.y = (r16.z == 0.0) ? r8.z : r5.y;
    r7.z = (r16.w == 0.0) ? r8.w : r5.y;
    ps = max(r5.x, r5.z);
    r5.y = max(r7.z, 0.0);
    r5.x = ps;
    ps = 1.0 / UniformScalar_11.x;
    r5.xw = min(r5.xy, float2(1.0, 0.3));
    r5.y = ps;
    r5.x = saturate(r5.x * r5.y);
    ps = 1.0 - r5.x;
    r5.y = dot(r1.zxy, r1.zxy);
    r5.z = ps;
    r15.x = r5.z * r6.w;
    ps = r0.w + r0.w;
    r5.xz = r15.xw * r20.zw;
    r12.x = ps;
    ps = r0.z + r0.z;
    r7.w = float((r5.x >= 0.05));
    r12.y = ps;
    ps = r15.y + r15.y;
    r6.xy = -r7.zw + 1.0;
    r8.x = ps;
    r7.z = (UniformScalar_9.x > 0.0) ? r6.y : 1.0;
    r7.z = (UniformScalar_9.x >= 0.0) ? r7.z : r6.y;
    ps = r15.z + r15.z;
    r8.z = r7.z * r13.w;
    r8.y = ps;
    ps = r9.x + r9.x;
    r8.xzw = r8.zxy + float3(-0.5, -1.0, -1.0);
    r12.z = ps;
    ps = r9.w + r9.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r8.xxxx)) clip(-1.0);
    r12.w = ps;
    r8.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r9 = tex2D(Texture2D_2, r12.xy);
    r15.xyw = tex2D(Texture2D_8, r12.zw).xyz;
    r21 = tex2D(Texture2D_3, r17.xy);
    r7.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r0.xyw = tex2D(Texture2D_0, r12.zw).xyz;
    r12.xyz = tex2D(Texture2D_1, r12.xy).xyz;
    ps = 0.1 - -r1.z;
    r18.x = saturate(r6.w * 15.0);
    r5.x = ps;
    r17.yzw = r12.xyz * 2.0 - 1.0;
    r12.xyz = r0.xyw * 2.0 - 1.0;
    r16.zw = r20.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.y));
    r20.xyz = r7.xyz + r7.xyz;
    r5.y = ps;
    ps = rsqrt(abs(r1.w));
    r7.xyz = r5.yyy * r1.xyz;
    r5.y = ps;
    r1.xyz = r5.yyy * -SpotDirection.xyz;
    ps = 5.0 * r5.x;
    r5.y = dot(r1.zxy, r2.zxy);
    r17.x = saturate(ps);
    r6.z = (r18.y == 0.0) ? r21.x : r21.y;
    r6.z = (r16.y == 0.0) ? r21.z : r6.z;
    r16.x = (r16.x == 0.0) ? r21.w : r6.z;
    ps = -SpotAngles.x - -r5.y;
    r16.y = r5.w * 3.3333333;
    r5.x = ps;
    ps = SpotAngles.y * r5.x;
    r5.yw = -r16.xy + 1.0;
    r19.y = saturate(ps);
    r6.z = dot(r18.xx, r5.yy) + r16.x;
    ps = r18.x;
    r20.w = r6.z + r16.x;
    ps = r5.w * ps;
    r2 = r20 + float4(-1.0, -1.0, -1.0, 0.25);
    r15.z = ps;
    ps = r2.w;
    r1.xzw = r17.wyz - r12.zxy;
    ps = -r5.z + ps;
    r17.yzw = r2.xyz * UniformVector_3.xyz;
    r5.y = saturate(ps);
    r2.xy = -r17.yz * r19.zz + r17.yz;
    ps = (-1.0) - -r5.z;
    r0.xyz = r5.yyy * r15.xyw;
    r15.w = ps;
    ps = 2.5 * r6.x;
    r19.xw = -r17.wx + 1.0;
    r6.w = ps;
    ps = -r0.z;
    r5.xy = -r0.xy + r9.xy;
    r0.xy = r5.xy * r9.ww + r0.xy;
    ps = r9.z + ps;
    r18.yz = r19.ww * ModShadowGroupColor.xy;
    r1.y = ps;
    ps = r19.x * r19.z;
    r9 = r1.zwxy * r9.wwww;
    r5.y = ps;
    ps = r19.y * r19.y;
    r0.z = r0.z + r9.w;
    r5.w = ps;
    ps = r9.z;
    r1 = -r18.wxyz + 1.0;
    r5.x = ps;
    ps = r17.w;
    r15.xy = r8.zw * 0.5;
    ps = r5.y + ps;
    r15.xyz = r16.zyw + r15.xzy;
    r2.z = ps;
    r2.xy = r15.xy * r15.yz + r2.xy;
    r6.z = r15.w * r15.y + 1.0;
    ps = r6.z * r6.x;
    r9.xyz = r12.xyz + r9.xyz;
    r5.y = ps;
    ps = r6.w * r6.z;
    r12.xyz = -r9.xyz + r2.xyz;
    r5.z = ps;
    ps = (-2.0) + r5.x;
    r5.yz = r5.yz * r1.yy;
    r9.w = ps;
    ps = (-0.5) + r5.z;
    r5.x = float((r5.y >= 0.9));
    r5.y = saturate(ps);
    r2.xyz = r14.xyz * r5.xxx + r13.xyz;
    r6.xyz = r12.xyz * r5.yyy + r9.xyw;
    r6.w = r0.w * 2.0 + r6.z;
    r2.xyz = r2.xyz - r0.xyz;
    r9.xyz = r2.xyz * r5.yyy + r0.xyz;
    r6.xyw = r6.xyw * r1.xxx;
    ps = -UniformVector_0.x;
    r6.z = r6.w + 1.0;
    r6.xyz = (r1.xxx > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r0.yzw = (r1.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.x = dot(r0.wyz, r0.wyz);
    r0.x = ps;
    ps = rsqrt(abs(r5.x));
    r6.xyz = r11.xyz * r5.yyy;
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
    r5.x = saturate(dot(r7.zxy, r5.zxy));
    r0.z = ps;
    ps = log2(r5.x);
    r0.xyz = r9.xyz * r0.xyz;
    r8.z = ps;
    r5.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r5.z);
    r6.w = saturate(dot(r2.zyx, r7.zyx));
    r5.z = ps;
    r5.xy = r5.xy * r1.zw + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xyz * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r3.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r5.www;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
