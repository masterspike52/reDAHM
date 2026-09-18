// ps_70851f289f2ca5cc.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 414 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000678 10041700 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c20); // float3
float4 ModShadowAccumResolution : register(c23); // float2
float4 ModShadowColor : register(c21); // float3
float4 ModShadowGroupColor : register(c22); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_12 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_14 : register(c19); // float
float4 UniformScalar_3 : register(c14); // float
float4 UniformScalar_4 : register(c15); // float
float4 UniformScalar_5 : register(c16); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_10 : register(c9); // float4
float4 UniformVector_11 : register(c10); // float4
float4 UniformVector_12 : register(c11); // float4
float4 UniformVector_13 : register(c12); // float4
float4 UniformVector_14 : register(c13); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_8 : register(c8); // float4
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

    r14 = tex2D(Texture2D_9, r0.xy);
    ps = UniformVector_2.x * r0.w;
    r8.y = UniformScalar_4.x * UniformScalar_5.x;
    r11.y = ps;
    ps = 1.0 - r0.z;
    r6.y = ps;
    ps = UniformVector_12.x;
    r5.x = r4.w - 2e+02;
    r10.z = saturate(ps);
    ps = r1.z;
    r5.y = UniformScalar_3.x * UniformVector_4.x;
    ps = 0.1 + ps;
    r6.x = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r6.x));
    r5.w = r14.w - 0.5;
    r6.z = ps;
    ps = 0.00022222222 * r5.x;
    r6.xw = r0.wz * UniformVector_1.xy;
    r15.w = saturate(ps);
    ps = 5.0 * r5.z;
    r9.xyz = r6.zzz * r3.xyz;
    r15.x = saturate(ps);
    ps = 1.0 / UniformVector_1.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.wwww)) clip(-1.0);
    r6.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r5.z = r15.w * (-0.1);
    r5.x = ps;
    r10.xy = r9.xy * r5.zz + r6.xw;
    r6.x = -r10.y * r5.x + 1.0;
    ps = UniformVector_12.y;
    r6.xyz = r6.xzy * UniformVector_2.yxy;
    r10.w = saturate(ps);
    ps = UniformScalar_5.x * r5.y;
    r11.x = r6.y * r10.x;
    r8.x = ps;
    ps = (-0.5) + r6.x;
    r5.zw = float2((r6.xz >= 0.5));
    r5.y = ps;
    ps = (-0.5) + r6.z;
    r8.zw = r5.zw + r5.zw;
    r5.x = ps;
    ps = r5.y;
    r19.xy = float2((r11.xy >= 0.5));
    ps = -r6.x + ps;
    r3.xy = floor(r8.xy);
    r18.x = ps;
    r3.xy = r3.xy * UniformVector_11.xy - r8.xy;
    ps = r5.x;
    r19.zw = r3.xy * r10.zw;
    ps = -r6.z + ps;
    r8 = r8 + r19.zwxy;
    r18.y = ps;
    r5.xy = r0.xy * UniformVector_13.xy + r8.xy;
    ps = 1.0 / UniformVector_10.x;
    r3.xy = r5.xy * UniformVector_8.xy;
    r5.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r18.zw = frac(r3.xy);
    r5.y = ps;
    r17 = r18 * r5.zwxy;
    r5.xyz = tex2D(Texture2D_5, r0.xy).xyz;
    r16 = tex2D(Texture2D_6, r17.zw);
    r3.xy = r0.wz + r0.wz;
    ps = r4.w;
    r10.zw = r0.wz * UniformVector_14.xy;
    ps = 0.0001 * ps;
    r11.zw = r4.xy * ScreenPositionScaleBias.xy;
    r13.w = saturate(ps);
    ps = 1.0 / ModShadowAccumResolution.x;
    r3.zw = UniformVector_1.xy + UniformVector_1.xy;
    r13.x = ps;
    ps = r16.x * r16.w;
    r12.xyz = UniformVector_5.xyz * 2e+01;
    r16.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r3.zw = r3.zw * r0.wz;
    r13.y = ps;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    ps = r16.y * r16.w;
    r0.xy = r13.xy * abs(r7.xy);
    r16.y = ps;
    ps = UniformVector_4.x * r5.y;
    r0.zw = r11.xy - 0.5;
    r13.x = ps;
    ps = UniformVector_4.y * r5.z;
    r0.zw = r0.zw - r11.xy;
    r13.y = ps;
    r7.xz = r0.zw * r19.xy + r11.xy;
    ps = UniformVector_4.z * r5.x;
    r0.zw = float2((UniformVector_10.xy >= r18.zw));
    r13.z = ps;
    ps = r0.z * r0.w;
    r5.xy = float2((UniformVector_10.yx > r18.wz));
    r5.z = ps;
    ps = r5.z;
    r11.xy = -r13.zw + 1.0;
    ps = r5.x * ps;
    r7.yw = r6.xz + r17.xy;
    r5.z = ps;
    ps = r16.z * r16.w;
    r5.x = r5.z * r5.y;
    r16.z = ps;
    ps = r7.x + r7.x;
    r5.xyz = r16.xyz * r5.xxx;
    r6.x = ps;
    ps = r7.y + r7.y;
    r17.xyz = r12.xyz * r5.xyz;
    r6.y = ps;
    ps = r7.z + r7.z;
    r5.x = dot(r17.zxy, float3(0.11, 0.3, 0.59));
    r6.z = ps;
    ps = r7.w + r7.w;
    r5.x = r5.x - r17.x;
    r6.w = ps;
    ps = 1.0 / r4.w;
    r15.y = saturate(r5.x + r17.x);
    r15.z = ps;
    r5.xy = r11.zw * r15.zz + ScreenPositionScaleBias.wz;
    r8.xy = tex2D(ModShadowAccumTexture, r0.xy).xy;
    r18 = tex2D(Texture2D_2, r3.zw);
    r19.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r12 = tex2D(Texture2D_3, r6.zw);
    r23 = tex2D(Texture2D_3, r6.xy);
    r4.xyz = tex2D(Texture2D_8, r10.zw).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r6.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    r10.xyz = tex2D(Texture2D_1, r3.zw).xyz;
    r5.xyz = tex2D(Texture2D_4, r3.xy).wxy;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = float((UniformScalar_12.x >= 1.0));
    r6.z = dot(r1.zxy, r1.zxy);
    ps = (-1.0) + r5.x;
    r0.w = float((UniformScalar_12.x > 1.0));
    r21.x = ps;
    r21.yz = r5.yz * 2.0 - 1.0;
    r22.xyz = r10.xyz * 2.0 - 1.0;
    ps = r6.x + r6.x;
    r0.xyz = r0.xyz * r2.www;
    r20.x = ps;
    r2.xyz = (-abs(r0.www) >= 0.0) ? r4.xyz : 1.0;
    ps = rsqrt(abs(r6.z));
    r5.xyz = r14.xyz * UniformScalar_13.xxx;
    r6.z = ps;
    ps = r6.y + r6.y;
    r4.xyz = r6.zzz * r1.xyz;
    r20.y = ps;
    r16.xyz = (-abs(r5.www) >= 0.0) ? 1.0 : r2.xyz;
    r10.xyw = r5.xyz * r16.xyz + UniformScalar_14.xxx;
    r6.z = (r8.z == 0.0) ? r23.x : r23.y;
    r0.w = (r8.w == 0.0) ? r12.x : r12.y;
    ps = r6.w + r6.w;
    r5 = r8.wzzw + float4(-2.0, -3.0, -2.0, -3.0);
    r20.z = ps;
    r5.x = (r5.x == 0.0) ? r12.z : r0.w;
    r6.z = (r5.z == 0.0) ? r23.z : r6.z;
    r20.w = (r5.y == 0.0) ? r23.w : r6.z;
    r5.x = (r5.w == 0.0) ? r12.w : r5.x;
    ps = 1.0 - r5.x;
    r5.z = max(r5.x, 0.0);
    r5.y = ps;
    ps = 2.5 * r5.y;
    r5.x = min(r5.z, 0.3);
    r5.z = ps;
    ps = 3.3333333 * r5.x;
    r12 = r20 + float4(-1.0, -1.0, -1.0, -0.75);
    r5.x = ps;
    ps = r12.w;
    r2.xzw = r22.zxy - r12.zxy;
    ps = r20.w + ps;
    r6.xyz = r5.xxx * r21.xyz;
    r5.x = saturate(ps);
    ps = 1.0 + r6.x;
    r1.xyz = r5.xxx * r19.xyz;
    r5.x = ps;
    ps = -r1.z;
    r8.zw = -r1.xy + r18.xy;
    r1.xy = r8.zw * r18.ww + r1.xy;
    ps = r18.z + ps;
    r5.xy = r5.zx * r5.xy;
    r2.y = ps;
    ps = (-0.5) + r5.x;
    r2 = r2.zwxy * r18.wwww;
    r5.z = saturate(ps);
    ps = r1.z;
    r12.xyz = r12.xyz + r2.xyz;
    ps = r2.w + ps;
    r5.x = float((r5.y > 0.9));
    r1.z = ps;
    r5.xyw = r17.xyz * r5.xxx - r1.xyz;
    r8.zw = -r13.xy * r15.yy + r13.xy;
    r13.z = r11.x * r15.y + r13.z;
    r13.xy = r6.yz * 2.0 + r8.zw;
    r14.xyz = r16.xyz * r14.xyz + r5.xyw;
    ps = r2.z;
    r5.yw = -r15.xy + 1.0;
    r5.x = ps;
    r2.xy = -r5.yy * ModShadowGroupColor.xy + 1.0;
    r1.xyz = r14.xyz * r5.zzz + r1.xyz;
    ps = (-2.0) + r5.x;
    r13.xyz = -r12.xyz + r13.xyz;
    r12.w = ps;
    r6.xyz = r13.xyz * r5.zzz + r12.xyw;
    r6.w = r6.w * 2.0 + r6.z;
    r6.xyw = r6.xyw * r11.yyy;
    ps = r10.x;
    r6.z = r6.w + 1.0;
    r6.xyz = (r11.yyy > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.yzw = (r11.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = r5.w * ps;
    r5.x = dot(r6.wyz, r6.wyz);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r1.xyz = r1.xyz * r7.xyz;
    r5.x = ps;
    ps = r10.y;
    r7.xyz = r6.yzw * r5.xxx;
    ps = r5.w * ps;
    r5.x = dot(r7.zxy, r9.zxy);
    r6.y = ps;
    ps = r10.w;
    r10.xyz = r7.xyz * r5.xxx;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    ps = r5.w * ps;
    r5.x = saturate(dot(r4.zxy, r9.zxy));
    r6.z = ps;
    ps = log2(r5.x);
    r6.xyz = r6.xyz * r5.zzz;
    r8.z = ps;
    r5.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r5.z);
    r5.w = saturate(dot(r7.zyx, r4.zyx));
    r5.z = ps;
    r5.xy = r5.xy * r2.xy + 0.125;
    ps = r5.x * r5.y;
    r6.xyz = r6.xzy * r5.zzz;
    r5.x = ps;
    r5.xyz = r5.xxx * r3.xyz + ModShadowColor.xyz;
    r6.y = r1.z * r5.w + r6.y;
    r6.xz = r1.xy * r5.ww + r6.xz;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
