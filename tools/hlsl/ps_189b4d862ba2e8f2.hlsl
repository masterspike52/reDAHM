// ps_189b4d862ba2e8f2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 372 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005D0 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_5 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
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

    r9 = tex2D(Texture2D_8, r0.xy);
    ps = r1.z;
    r6.xy = r0.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r5.z = r9.w - 0.5;
    r5.w = ps;
    ps = UniformVector_2.x * r0.w;
    r5.x = r4.w - 4e+02;
    r14.x = ps;
    ps = 0.00022222222 * r5.x;
    r8.xyz = r5.www * r3.xyz;
    r5.x = saturate(ps);
    ps = 5.0 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r5.z = saturate(ps);
    ps = (-0.025) * r5.x;
    r19.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    r11.zw = r8.xy * r5.yy + r6.xy;
    r3.xyw = tex2D(Texture2D_0, r11.zw).xyz;
    ps = -r0.z;
    r6.xy = r0.wz * 6.0;
    ps = 1.0 + ps;
    r10.w = UniformVector_6.y * UniformScalar_5.x;
    r20.y = ps;
    ps = UniformScalar_2.x;
    r6.zw = r0.wz * UniformVector_7.xy;
    ps = UniformVector_6.y * ps;
    r5.y = UniformScalar_1.x * UniformVector_4.x;
    r10.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.w = UniformVector_4.x * UniformScalar_4.x;
    r16.x = ps;
    ps = 1.0 / r4.w;
    r10.xz = r4.xy * ScreenPositionScaleBias.xy;
    r1.w = ps;
    r11.xy = r10.xz * r1.ww + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.xz = r5.yw * UniformVector_6.xx;
    r16.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r13 = r10 + r0.xyxy;
    r5.y = ps;
    ps = r3.x + r3.x;
    r5.y = r11.w * r5.y;
    r10.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r20.xw = -r5.yz + 1.0;
    r20.z = ps;
    ps = r3.y + r3.y;
    r14.yzw = r20.yxz * UniformVector_2.yyx;
    r10.y = ps;
    ps = r14.w;
    r5.xyz = r14.zxy - 0.5;
    ps = r11.z * ps;
    r17.xyz = float3((r14.xzy >= 0.5));
    r10.w = ps;
    ps = r3.w + r3.w;
    r17.w = float((r10.w >= 0.5));
    r10.z = ps;
    ps = r16.x;
    r15.xyz = r5.xzy - r14.zyx;
    ps = abs(r7.x) * ps;
    r12 = r10 + float4(-1.0, -1.0, -1.0, -0.5);
    r5.x = ps;
    ps = r16.y;
    r15.w = r12.w - r10.w;
    r10.x = r15.w * r17.w + r10.w;
    r10.yzw = r15.xzy * r17.yxz + r14.zxy;
    ps = abs(r7.y) * ps;
    r10 = r10.zwxy + r10.zwxy;
    r5.y = ps;
    r14.xyz = tex2D(Texture2D_6, r11.zw).xyz;
    r16 = tex2D(Texture2D_1, r10.xy);
    r18 = tex2D(Texture2D_1, r10.zw);
    r21.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r10 = tex2D(Texture2D_4, r13.xy);
    r22 = tex2D(Texture2D_5, r13.zw);
    r15.xzw = tex2D(Texture2D_7, r6.zw).xyz;
    r6.xyw = tex2D(Texture2D_2, r6.xy).xyw;
    r7.xyw = tex2D(Texture2D_3, r0.xy).xyz;
    r13.xyw = tex2D(LightAttenuationTexture, r11.xy).xyz;
    r5.xyw = tex2D(Texture2D_2, r0.wz).wxy;
    r5.z = dot(r1.zxy, r1.zxy);
    ps = r4.w;
    r11.xyz = UniformVector_5.xyz * 2e+01;
    ps = 0.0001 * ps;
    r0.w = float((UniformScalar_8.x >= 1.0));
    r6.z = saturate(ps);
    ps = r5.y + r5.y;
    r0.x = float((UniformScalar_8.x > 1.0));
    r13.z = ps;
    ps = r5.w + r5.w;
    r3.xyz = r13.xyw * r2.www;
    r13.w = ps;
    r21.zw = r6.xy * 2.0 - 1.0;
    ps = r7.x + r7.x;
    r2.xyz = r9.xyz * UniformScalar_9.xxx;
    r15.y = ps;
    r4.xyz = (-abs(r0.xxx) >= 0.0) ? r15.xzw : 1.0;
    ps = r7.y + r7.y;
    r0.xyz = r22.xyz * r22.www;
    r15.z = ps;
    r0.xyz = r10.xyz * r10.www + r0.xyz;
    r10.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r4.xyz;
    r7.xyz = r2.xyz * r10.xyz + UniformScalar_10.xxx;
    ps = r7.w + r7.w;
    r11.xyz = r11.xyz * r0.xyz;
    r15.w = ps;
    ps = r6.w;
    r4 = r21 * float4(0.875, 0.875, 0.5, 0.5);
    ps = r5.x * ps;
    r5.y = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r5.x = ps;
    ps = (-1.0) - -r5.x;
    r6.xy = r20.ww * ModShadowGroupColor.xy;
    r0.y = ps;
    ps = r5.y;
    r6.xyw = -r6.xyz + 1.0;
    ps = -r11.x + ps;
    r13.xy = r4.xy * r6.xy;
    r5.y = ps;
    ps = r5.y;
    r0.w = dot(r17.xzz, float3(1.0, 1.0, 1.0));
    r0.z = r17.y * 2.0 + r17.w;
    r5.w = (r0.z == 0.0) ? r18.x : r18.y;
    r5.y = (r0.w == 0.0) ? r16.x : r16.y;
    ps = r11.x + ps;
    r13 = r13 + float4(0.125, 0.125, -1.0, -1.0);
    r0.x = saturate(ps);
    ps = r13.x * r13.y;
    r17 = r0.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r6.z = ps;
    r2.xyz = r6.zzz * r19.xyz + ModShadowColor.xyz;
    r5.y = (r17.z == 0.0) ? r16.z : r5.y;
    r5.w = (r17.y == 0.0) ? r18.z : r5.w;
    r15.x = (r17.x == 0.0) ? r18.w : r5.w;
    r5.y = (r17.w == 0.0) ? r16.w : r5.y;
    ps = 1.0 - r0.x;
    r6.x = -r5.y + 1.0;
    r0.z = ps;
    ps = 2.5 * r6.x;
    r5.y = max(r5.y, 0.0);
    r6.z = ps;
    ps = rsqrt(abs(r5.z));
    r5.y = min(r5.y, 0.3);
    r5.z = ps;
    ps = 3.3333333 * r5.y;
    r16 = r15 + float4(0.25, -1.0, -1.0, -1.0);
    r4.y = ps;
    ps = r16.x;
    r1.xyz = r5.zzz * r1.xyz;
    ps = r15.x + ps;
    r5.yzw = r16.ywz * UniformVector_4.xzy;
    r1.w = ps;
    r13.xy = -r5.yw * r0.xx + r5.yw;
    ps = 1.0 - r5.z;
    r7.xyz = r7.xyz * r0.zzz;
    r4.x = ps;
    ps = r1.w;
    r0.zw = r13.zw + r4.zw;
    ps = -r5.x + ps;
    r4 = r4.xyyy * r0;
    r5.x = saturate(ps);
    ps = r5.z;
    r0.xyz = r5.xxx * r14.xyz;
    ps = r4.x + ps;
    r6.y = r4.y + 1.0;
    r5.w = ps;
    ps = r6.y * r6.x;
    r5.xz = r13.xy + r4.zw;
    r5.y = ps;
    ps = r6.z * r6.y;
    r4.xyw = -r12.xyz + r5.xzw;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r5.z = float((r5.y > 0.9));
    r6.y = saturate(ps);
    r5.xy = r4.xy * r6.yy + r12.xy;
    r4.xyz = r11.xyz * r5.zzz - r0.xyz;
    r5.z = r4.w * r6.y - 2.0;
    r5.z = r3.w * 2.0 + r5.z;
    r4.xyz = r10.xyz * r9.xyz + r4.xyz;
    r4.xyz = r4.xyz * r6.yyy + r0.xyz;
    r5.xyw = r5.xyz * r6.www;
    ps = -UniformVector_0.x;
    r5.z = r5.w + 1.0;
    r5.xyz = (r6.www > 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.yzw = (r6.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.x = dot(r5.wyz, r5.wyz);
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r7.xyz * r6.yyy;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r5.yzw = r5.yzw * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r5.wyz, r8.zxy);
    r6.y = ps;
    ps = -UniformVector_0.z;
    r7.xyz = r5.yzw * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r1.zxy, r7.zxy));
    r6.z = ps;
    ps = log2(r5.x);
    r6.xyz = r4.xyz * r6.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r1.zyx));
    r5.x = ps;
    r5.xyz = r0.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r3.xyz * r5.xyz;
    r5.xyz = r5.xzy * LightColor.xzy;
    r5.xyz = r5.xzy * r2.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
