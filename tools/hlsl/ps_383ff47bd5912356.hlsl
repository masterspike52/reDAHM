// ps_383ff47bd5912356.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 396 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000630 10041800 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c19); // float3
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
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_12.x - r6.w;
    r8.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = UniformScalar_3.x * UniformVector_4.x;
    r8.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.x = r4.w - 4e+02;
    r8.w = ps;
    ps = UniformVector_1.x * r0.w;
    r5.z = dot(r3.zxy, r3.zxy);
    r11.x = ps;
    ps = rsqrt(abs(r5.z));
    r10.xy = r8.zw * abs(r7.xy);
    r5.w = ps;
    ps = r0.w + r0.w;
    r7.xy = r0.xy * UniformVector_2.xy;
    r7.z = ps;
    ps = 0.00022222222 * r5.x;
    r9 = r0.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r5.x = saturate(ps);
    ps = UniformScalar_4.x * r5.y;
    r5.z = float((UniformScalar_11.x >= 1.0));
    r5.y = ps;
    ps = floor(r5.y);
    r13.xyz = r5.www * r3.xyz;
    r13.w = ps;
    ps = 1.0 - r0.z;
    r8.x = UniformScalar_16.x * 0.05;
    r10.w = ps;
    ps = 1.0 / UniformScalar_1.x;
    r8.xz = r8.xy * r5.xz;
    r8.y = ps;
    r5.xyw = r13.wxy * r8.yxx + r0.xwz;
    ps = r0.z + r0.z;
    r10.z = -r5.w + 1.0;
    r7.w = ps;
    ps = UniformVector_1.x * r5.y;
    r11.yz = r10.wz * UniformVector_1.yy;
    r11.w = ps;
    ps = r0.y;
    r3 = r11.wzxy - 0.5;
    ps = UniformScalar_8.x + ps;
    r22 = float4((r11.wzxy >= 0.5));
    r5.z = ps;
    ps = r5.y + r5.y;
    r3 = r3 - r11.wzxy;
    r0.x = ps;
    r3 = r3 * r22 + r11.wzxy;
    ps = r5.w + r5.w;
    r3 = r3 + r3;
    r0.y = ps;
    r12.xy = tex2D(ModShadowAccumTexture, r10.xy).xy;
    r10 = tex2D(Texture2D_9, r7.xy);
    r11.xyw = tex2D(Texture2D_8, r0.xy).xyz;
    r14.y = tex2D(Texture2D_6, r7.xy).x;
    r21 = tex2D(Texture2D_3, r3.zw);
    r23 = tex2D(Texture2D_3, r3.xy);
    r15 = tex2D(Texture2D_7, r5.xz);
    r16 = tex2D(Texture2D_2, r7.zw);
    r19.yzw = tex2D(Texture2D_4, r9.zw).xyw;
    r3.xyw = tex2D(Texture2D_0, r0.xy).zyx;
    r5.yzw = tex2D(Texture2D_1, r7.zw).xyz;
    r17 = tex2D(Texture2D_4, r9.xy);
    r0.xyz = tex2D(Texture2D_5, r7.xy).xyz;
    ps = 0.0001 * r4.w;
    r11.z = saturate(ps);
    ps = r6.w;
    r7.x = dot(r1.zxy, r1.zxy);
    ps = 15.0 * ps;
    r9.zw = r4.xy * ScreenPositionScaleBias.xy;
    r14.w = saturate(ps);
    ps = r1.z;
    r20.xyz = UniformVector_5.xyz * 2e+01;
    ps = 0.1 + ps;
    r0.yzw = r0.xyz + r0.xyz;
    r5.x = ps;
    r18.zw = r17.xy * 2.0 - 1.0;
    r24.xyz = r5.yzw * 2.0 - 1.0;
    r7.yzw = r3.wyx * 2.0 - 1.0;
    r5.yz = r19.yz * 2.0 - 1.0;
    ps = 5.0 * r5.x;
    r24.xyz = r24.xyz - r7.yzw;
    r14.x = saturate(ps);
    r8.w = r24.z * r16.w - 2.0;
    r7.yzw = r24.xyz * r16.www + r7.yzw;
    ps = 0.5 * r5.y;
    r5.x = r8.z + r6.w;
    r8.x = ps;
    ps = -r5.x;
    r15.xyz = r15.xyz * r15.www;
    ps = r6.z + ps;
    r8.z = dot(r22.zww, float3(1.0, 1.0, 1.0));
    r5.x = ps;
    ps = r5.x;
    r8.y = dot(r22.xyy, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    r6.x = (r8.y == 0.0) ? r23.x : r23.y;
    r5.x = (r8.z == 0.0) ? r21.x : r21.y;
    ps = UniformScalar_13.x;
    r22 = r8.yzzy + float4(-3.0, -2.0, -3.0, -2.0);
    r5.w = ps;
    r5.x = (r22.y == 0.0) ? r21.z : r5.x;
    r6.x = (r22.w == 0.0) ? r23.z : r6.x;
    r18.x = (r22.x == 0.0) ? r23.w : r6.x;
    r6.x = (r22.z == 0.0) ? r21.w : r5.x;
    ps = max(r5.y, r5.w);
    r5.x = max(r6.x, 0.0);
    r5.y = ps;
    ps = 1.0 / UniformScalar_14.x;
    r5.xy = min(r5.xy, float2(0.3, 1.0));
    r5.w = ps;
    ps = 0.5 * r5.z;
    r6.y = saturate(r5.y * r5.w);
    r8.y = ps;
    ps = 3.3333333 * r5.x;
    r6.xz = -r6.xy + 1.0;
    r18.y = ps;
    ps = 2.5 * r6.x;
    r5.xy = -r18.xy + 1.0;
    r6.y = ps;
    ps = r14.w;
    r15.xyz = r20.xyz * r15.xyz;
    ps = r5.y * ps;
    r19.x = r6.z * r6.w;
    r8.z = ps;
    r5.z = dot(r14.ww, r5.xx) + r18.x;
    ps = r5.z;
    r5.xy = r19.wx * r17.wz;
    ps = r18.x + ps;
    r17.xyz = r18.zyw + r8.xzy;
    r0.x = ps;
    ps = (-1.0) - -r5.x;
    r0 = r0 + float4(0.25, -1.0, -1.0, -1.0);
    r17.w = ps;
    ps = r0.x;
    r14.z = float((r5.y >= 0.05));
    ps = -r5.x + ps;
    r5.yzw = r0.ywz * UniformVector_4.xzy;
    r5.x = saturate(ps);
    r6.w = r17.w * r17.y + 1.0;
    r8.xy = r5.yw * r14.yy - r7.yz;
    ps = (-1.0) - -r5.z;
    r0 = -r14.xwzy + 1.0;
    r15.w = ps;
    ps = r0.x;
    r5.xzw = r5.xxx * r11.xyw;
    r5.y = ps;
    r9.xy = r17.xy * r17.yz + r8.xy;
    ps = ModShadowGroupColor.x * r5.y;
    r8.xyz = -r5.xzw + r16.xyz;
    r11.x = ps;
    r5.y = (UniformScalar_12.x > 0.0) ? r0.z : 1.0;
    r3.w = (UniformScalar_12.x >= 0.0) ? r5.y : r0.z;
    r8.xyz = r8.xyz * r16.www + r5.xzw;
    ps = ModShadowGroupColor.y * r0.x;
    r5.xy = r6.wy * r6.xw;
    r11.y = ps;
    ps = 1.0 / r4.w;
    r6 = r15 * r14.yyyy;
    r5.z = ps;
    r4.xy = r9.zw * r5.zz + ScreenPositionScaleBias.wz;
    ps = -r7.w;
    r11.xyz = -r11.xyz + 1.0;
    ps = r6.w + ps;
    r5.w = float((r5.x >= 0.9));
    r5.x = ps;
    r1.w = saturate(r5.y * r0.y - 0.5);
    r5.yz = r9.xy * r1.ww + r7.yz;
    r6.xyz = r6.xyz * r5.www + r10.xyz;
    ps = 1.0 + r5.x;
    r6.xyz = r6.xyz - r8.xyz;
    r6.w = ps;
    r9 = r6 * r1.wwww + r8;
    r5.w = r3.x * 2.0 + r9.w;
    r5.xyz = r5.wyz * r11.zzz;
    ps = 1.0 + r5.x;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r11.zzz > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r11.zzz >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.x));
    r5.x = dot(r5.wyz, r5.wyz);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r7.xyz = r6.xxx * r1.xyz;
    r5.x = ps;
    r8.xyz = r5.yzw * r5.xxx;
    r5.x = dot(r8.zxy, r13.zxy);
    r5.xyz = r8.xyz * r5.xxx;
    r5.xyz = r5.xyz * 2.0 - r13.xyz;
    r5.x = saturate(dot(r7.zxy, r5.zxy));
    ps = log2(r5.x);
    r5.z = r3.w * r10.w;
    r12.z = ps;
    r6.xyz = r12.xyz * float3(0.875, 0.875, 15.0);
    r5.xy = r6.xy * r11.xy;
    r5.xyz = r5.xyz + float3(0.125, 0.125, -0.5);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r6.xyw = tex2D(LightAttenuationTexture, r4.xy).xyz;
    ps = r6.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r4.xyz = r10.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = r2.w * ps;
    r0.yzw = r4.xyz * r0.www;
    r0.x = ps;
    ps = r6.y;
    r4.xyz = r0.yzw * r1.www;
    ps = r2.w * ps;
    r1.xyz = r9.xyz * r1.xyz;
    r0.y = ps;
    ps = pow(2.0, r6.z);
    r5.w = saturate(dot(r8.zyx, r7.zyx));
    r6.z = ps;
    ps = r6.w;
    r6.xyz = r4.xyz * r6.zzz;
    r6.xy = r1.xy * r5.ww + r6.xy;
    r6.z = r1.z * r5.w + r6.z;
    ps = r2.w * ps;
    r5.x = r5.x * r5.y;
    r0.z = ps;
    r5.xyz = r5.xxx * r3.xyz + ModShadowColor.xyz;
    r6.xyz = r0.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
