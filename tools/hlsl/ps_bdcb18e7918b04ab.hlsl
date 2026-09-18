// ps_bdcb18e7918b04ab.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 408 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000660 10041700 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_14 : register(c17); // float
float4 UniformScalar_16 : register(c18); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = (-4e+02) - -r4.w;
    r5.z = UniformScalar_16.x * 0.05;
    r5.x = ps;
    ps = r1.z;
    r5.w = UniformScalar_3.x * UniformVector_4.x;
    ps = 0.1 + ps;
    r1.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r1.w));
    r5.w = r5.w * UniformScalar_4.x;
    r1.w = ps;
    ps = floor(r5.w);
    r9.xz = r0.xy * UniformVector_2.xy;
    r10.w = ps;
    ps = 0.00022222222 * r5.x;
    r11 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r5.w = saturate(ps);
    ps = 5.0 * r5.y;
    r10.xyz = r1.www * r3.xyz;
    r5.x = saturate(ps);
    ps = 1.0 / UniformScalar_1.x;
    r5.y = r5.z * r5.w;
    r5.z = ps;
    r3.xyw = r10.wxy * r5.zyy + r0.xwz;
    ps = 1.0 - r3.w;
    r12.x = r0.w * UniformVector_1.x;
    r8.x = ps;
    ps = 1.0 - r0.z;
    r5.y = float((UniformScalar_11.x >= 1.0));
    r8.y = ps;
    ps = UniformVector_1.x * r3.y;
    r12.yz = r8.yx * UniformVector_1.yy;
    r12.w = ps;
    r8 = float4((r12.wzxy >= 0.5));
    ps = UniformScalar_12.x - r6.w;
    r13 = r12.wzxy - 0.5;
    r5.z = ps;
    r13 = r13 - r12.wzxy;
    r12 = r13 * r8 + r12.wzxy;
    r12 = r12 + r12;
    r13 = tex2D(Texture2D_9, r9.xz);
    r22 = tex2D(Texture2D_4, r11.xy);
    r23.yzw = tex2D(Texture2D_4, r11.zw).xyw;
    r9.y = tex2D(Texture2D_6, r9.xz).x;
    r11 = tex2D(Texture2D_3, r12.zw);
    r14.xyz = tex2D(Texture2D_5, r9.xz).xyz;
    ps = 0.0001 * r4.w;
    r16.w = saturate(r6.w * 15.0);
    r9.x = saturate(ps);
    r5.y = r5.z * r5.y + r6.w;
    ps = -r5.y;
    r14.yzw = r14.xyz + r14.xyz;
    ps = r6.z + ps;
    r21.z = dot(r8.xyy, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    ps = r5.y;
    r21.w = dot(r8.zww, float3(1.0, 1.0, 1.0));
    r8.x = ps;
    r5.y = (r21.w == 0.0) ? r11.x : r11.y;
    ps = UniformScalar_13.x;
    r20 = r21.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r8.z = ps;
    r5.y = (r20.z == 0.0) ? r11.z : r5.y;
    r5.z = (r20.w == 0.0) ? r11.w : r5.y;
    ps = max(r8.x, r8.z);
    r8.y = max(r5.z, 0.0);
    r8.x = ps;
    ps = 1.0 / UniformScalar_14.x;
    r11.xw = min(r8.xy, float2(1.0, 0.3));
    r5.y = ps;
    r9.z = saturate(r11.x * r5.y);
    ps = 1.0 - r5.x;
    r11.xyz = -r9.zxy + 1.0;
    r6.z = ps;
    ps = 1.0 - r5.z;
    r23.x = r11.x * r6.w;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r5.xz = r23.xw * r22.zw;
    r16.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r16.x = float((r5.x >= 0.05));
    r16.z = ps;
    ps = r0.w + r0.w;
    r8 = -r16.wxyz + 1.0;
    r5.y = ps;
    r5.w = (UniformScalar_12.x > 0.0) ? r8.y : 1.0;
    r5.w = (UniformScalar_12.x >= 0.0) ? r5.w : r8.y;
    ps = r0.z + r0.z;
    r14.x = r5.w * r13.w;
    r5.w = ps;
    ps = r3.y + r3.y;
    r19 = r14 + float4(-0.5, -1.0, -1.0, -1.0);
    r6.y = ps;
    ps = r3.w + r3.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r19.xxxx)) clip(-1.0);
    r6.w = ps;
    r15 = tex2D(Texture2D_3, r12.xy);
    r17 = tex2D(Texture2D_2, r5.yw);
    r12.xyz = tex2D(Texture2D_0, r6.yw).xyz;
    r18.xyz = tex2D(Texture2D_1, r5.yw).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r14.zw = r4.xy * ScreenPositionScaleBias.xy;
    r14.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r21.xy = r23.yz + r23.yz;
    r14.y = ps;
    r20.zw = r22.xy * 2.0 - 1.0;
    r18.xyz = r18.xyz * 2.0 - 1.0;
    r22.xyz = r12.xyz * 2.0 - 1.0;
    ps = r14.x;
    r18.xyw = r18.xyz - r22.xyz;
    r12.xyw = r18.xyw * r17.www + r22.xyz;
    r5.y = (r21.z == 0.0) ? r15.x : r15.y;
    r5.y = (r20.y == 0.0) ? r15.z : r5.y;
    r20.x = (r20.x == 0.0) ? r15.w : r5.y;
    ps = abs(r7.x) * ps;
    r20.y = r11.w * 3.3333333;
    r15.x = ps;
    ps = r14.y;
    r5.yw = -r20.xy + 1.0;
    r1.w = dot(r16.ww, r5.yy) + r20.x;
    ps = abs(r7.y) * ps;
    r21.z = r1.w + r20.x;
    r15.y = ps;
    ps = r16.w;
    r7.xyz = r21.xyz + float3(-1.0, -1.0, 0.25);
    ps = r5.w * ps;
    r16.xy = r7.xy * 0.5;
    r16.z = ps;
    ps = (-1.0) - -r5.z;
    r16.xyz = r20.zyw + r16.xzy;
    r16.w = ps;
    ps = 1.0 / r4.w;
    r5.xyw = r19.wyz * UniformVector_4.zxy;
    r1.w = ps;
    r4.xy = r5.yw * r9.yy - r12.xy;
    r14.xy = r16.xy * r16.yz + r4.xy;
    r4.xy = r14.zw * r1.ww + ScreenPositionScaleBias.wz;
    ps = (-1.0) - -r5.x;
    r3.z = r0.y + UniformScalar_8.x;
    r15.w = ps;
    r0.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r7.xy = tex2D(ModShadowAccumTexture, r15.xy).xy;
    r18.xyz = tex2D(Texture2D_8, r6.yw).xyz;
    r20 = tex2D(Texture2D_7, r3.xz);
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r19.xyz = UniformVector_5.xyz * 2e+01;
    r5.y = dot(r1.zxy, r1.zxy);
    r5.x = dot(r2.zxy, r2.zxy);
    r4.xyz = r13.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = rsqrt(abs(r5.y));
    r15.xyz = r20.xyz * r20.www;
    r5.y = ps;
    ps = 1.0 - r5.x;
    r2.xyz = r5.yyy * r1.xyz;
    r5.x = saturate(ps);
    ps = log2(r5.x);
    r15.xyz = r19.xyz * r15.xyz;
    r5.x = ps;
    r1.w = r18.w * r17.w - 2.0;
    r5.y = saturate(r7.z - r5.z);
    r5.yzw = r5.yyy * r18.xyz;
    ps = 2.5 * r6.x;
    r1.xyz = -r5.yzw + r17.xyz;
    r6.w = ps;
    r1.xyz = r1.xyz * r17.www + r5.yzw;
    r6.y = r16.w * r16.y + 1.0;
    r5.yz = r6.yw * r6.xy;
    r5.y = float((r5.y >= 0.9));
    r5.w = saturate(r5.z * r8.x - 0.5);
    r9 = r15 * r9.yyyy;
    r6.xy = r14.xy * r5.ww + r12.xy;
    r9.xyz = r9.xyz * r5.yyy + r13.xyz;
    r5.z = -r12.w + r9.w;
    ps = 1.0 + r5.z;
    r9.xyz = r9.xyz - r1.xyz;
    r9.w = ps;
    r9 = r9 * r5.wwww + r1;
    r6.z = r12.z * 2.0 + r9.w;
    r6.xyw = r6.xyz * r11.yyy;
    ps = -UniformVector_0.x;
    r6.z = r6.w + 1.0;
    r6.xyz = (r11.yyy > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r1.yzw = (r11.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.y = dot(r1.wyz, r1.wyz);
    r1.x = ps;
    ps = rsqrt(abs(r5.y));
    r6.xyz = r4.xyz * r11.zzz;
    r5.y = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r1.yzw * r5.yyy;
    ps = 1.0 + ps;
    r5.y = dot(r4.zxy, r10.zxy);
    r1.y = ps;
    ps = -UniformVector_0.z;
    r11.xyz = r4.xyz * r5.yyy;
    r10.xyz = r11.xyz * 2.0 - r10.xyz;
    ps = 1.0 + ps;
    r5.y = saturate(dot(r2.zxy, r10.zxy));
    r1.z = ps;
    ps = log2(r5.y);
    r6.xyz = r6.xyz * r5.www;
    r7.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.x;
    r7.xyz = r7.xyz * float3(0.875, 0.875, 15.0);
    r5.y = ps;
    ps = pow(2.0, r7.z);
    r1.xyz = r9.xyz * r1.xyz;
    r5.z = ps;
    r5.xw = r7.xy * r8.zw + 0.125;
    ps = r5.x * r5.w;
    r6.w = saturate(dot(r4.zyx, r2.zyx));
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.xyz = r6.xyz * r5.zzz;
    r5.w = ps;
    r5.xyz = r5.xxx * r3.xyz + ModShadowColor.xyz;
    r6.xy = r1.xy * r6.ww + r6.xy;
    r6.z = r1.z * r6.w + r6.z;
    r6.xyz = r6.xyz * r5.www;
    r6.xyz = r6.xyz * r0.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
