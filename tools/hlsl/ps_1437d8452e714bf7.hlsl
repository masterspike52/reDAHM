// ps_1437d8452e714bf7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 390 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000618 10041700 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_13 : register(c14); // float
float4 UniformScalar_8 : register(c11); // float
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
sampler2D ShadowTexture : register(s10);
sampler2D ModShadowAccumTexture : register(s11);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.color0;
    float4 r7 = In.color2;
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

    r10 = tex2D(Texture2D_8, r1.xy);
    ps = (-4e+02) - -r5.w;
    r6.x = ps;
    ps = r2.z;
    r6.zw = r1.wz * UniformVector_1.xy;
    ps = 0.1 + ps;
    r7.x = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r7.x));
    r7.y = r10.w - 0.5;
    r7.x = ps;
    ps = 0.00022222222 * r6.x;
    r9.xyz = r7.xxx * r4.xyz;
    r7.x = saturate(ps);
    ps = 5.0 * r6.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.yyyy)) clip(-1.0);
    r7.y = saturate(ps);
    ps = (-0.025) * r7.x;
    r3.yz = r1.wz * UniformVector_7.xy;
    r6.x = ps;
    r12.xy = r9.xy * r6.xx + r6.zw;
    r19.y = tex2D(ShadowTexture, r0.xy).x;
    r0.xyw = tex2D(Texture2D_0, r12.xy).xyz;
    ps = r1.w;
    r7.zw = r1.wz * 6.0;
    ps = UniformVector_2.x * ps;
    r4.y = -r1.z + 1.0;
    r14.x = ps;
    ps = 1.0 / r5.w;
    r6.w = saturate(r5.w * 0.0001);
    r6.y = ps;
    ps = 1.0 / UniformVector_1.y;
    r12.zw = r5.xy * ScreenPositionScaleBias.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xyz = r12.zwy * r6.yyx;
    r3.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r4.xw = -r6.zw + 1.0;
    r4.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r14.yzw = r4.yxz * UniformVector_2.yyx;
    r3.w = ps;
    ps = r14.w;
    r8.xy = r3.xw * abs(r8.xy);
    ps = r12.x * ps;
    r5.xyz = r14.zxy - 0.5;
    r11.w = ps;
    ps = r0.x + r0.x;
    r19.z = float((r11.w >= 0.5));
    r11.x = ps;
    ps = r0.y + r0.y;
    r20.xyz = float3((r14.xzy >= 0.5));
    r11.y = ps;
    ps = r0.w + r0.w;
    r5.xyz = r5.xzy - r14.zyx;
    r11.z = ps;
    r13 = r11 + float4(-1.0, -1.0, -1.0, -0.5);
    r5.yzw = r5.xzy * r20.yxz + r14.zxy;
    r19.x = r13.w - r11.w;
    r3.xw = r19.xy * r19.zy;
    ps = ScreenPositionScaleBias.w + r6.x;
    r5.x = r11.w + r3.x;
    r8.z = ps;
    ps = ScreenPositionScaleBias.z + r6.y;
    r11 = r5.zwxy + r5.zwxy;
    r8.w = ps;
    r5.xyz = tex2D(Texture2D_6, r12.xy).xyz;
    r15.xyz = tex2D(LightAttenuationTexture, r8.zw).xyz;
    r17 = tex2D(Texture2D_1, r11.xy);
    r18 = tex2D(Texture2D_1, r11.zw);
    r12.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r14 = tex2D(Texture2D_4, r1.xy);
    r21 = tex2D(Texture2D_5, r1.xy).xzyw;
    r8.xyz = tex2D(Texture2D_7, r3.yz).xyz;
    r0.xyz = tex2D(Texture2D_2, r7.zw).xyw;
    r16.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r6.xyz = tex2D(Texture2D_2, r1.wz).xyw;
    ps = UniformVector_6.x;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    ps = 2e+01 * ps;
    r23.xyz = UniformVector_5.xzy * 2e+01;
    r22.x = ps;
    ps = UniformVector_6.z;
    r6.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    ps = 2e+01 * ps;
    r7.z = float((UniformScalar_11.x >= 1.0));
    r22.y = ps;
    ps = UniformVector_6.y;
    r7.w = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r1.x = float((UniformScalar_11.x > 1.0));
    r22.z = ps;
    r12.zw = r0.xy * 2.0 - 1.0;
    r8.xyz = (-abs(r1.xxx) >= 0.0) ? r8.xyz : 1.0;
    ps = r21.x * r21.w;
    r1.xyz = r10.xyz * UniformScalar_12.xxx;
    r21.x = ps;
    ps = rsqrt(abs(r7.w));
    r14.xyz = r14.xzy * r14.www;
    r7.w = ps;
    ps = r21.y * r21.w;
    r3.xyz = r7.www * r2.xyz;
    r21.y = ps;
    ps = r21.z * r21.w;
    r14.xyz = r23.xyz * r14.xyz;
    r21.z = ps;
    r21.xyz = r22.xyz * r21.xyz;
    r8.xyz = (-abs(r7.zzz) >= 0.0) ? 1.0 : r8.xyz;
    r2.xyz = r1.xyz * r8.xyz + UniformScalar_13.xxx;
    r1 = r12.zwyx * float4(0.5, 0.5, 0.875, 0.875);
    r12.xyz = (abs(r6.www) > 0.0) ? r14.xzy : r21.xzy;
    r14.xyz = (-abs(r6.www) >= 0.0) ? r21.yxz : r14.yxz;
    r11.w = saturate(dot(r14.zxy, float3(0.59, 0.11, 0.3)));
    r6.w = dot(r12.zxy, float3(0.11, 0.3, 0.59));
    ps = r6.x + r6.x;
    r6.w = r6.w - r12.x;
    r14.z = ps;
    ps = r6.y + r6.y;
    r7.z = saturate(r6.w + r12.x);
    r14.w = ps;
    ps = r16.x + r16.x;
    r6.xw = -r7.yz + 1.0;
    r16.x = ps;
    r7.xy = -r6.xx * ModShadowGroupColor.xy + 1.0;
    ps = r16.y + r16.y;
    r14.xy = r1.wz * r7.xy;
    r16.y = ps;
    ps = r16.z + r16.z;
    r14 = r14 + float4(0.125, 0.125, -1.0, -1.0);
    r16.z = ps;
    ps = r0.z;
    r7.y = dot(r20.xzz, float3(1.0, 1.0, 1.0));
    r7.x = r20.y * 2.0 + r19.z;
    ps = r6.z * ps;
    r6.y = r14.x * r14.y;
    r6.x = ps;
    r0.xyz = r6.yyy * r11.xyz + ModShadowColor.xyz;
    r6.z = (r7.x == 0.0) ? r18.x : r18.y;
    r6.y = (r7.y == 0.0) ? r17.x : r17.y;
    ps = (-1.0) - -r6.x;
    r7 = r7.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r11.x = ps;
    r6.y = (r7.z == 0.0) ? r17.z : r6.y;
    r6.z = (r7.y == 0.0) ? r18.z : r6.z;
    r16.w = (r7.x == 0.0) ? r18.w : r6.z;
    r6.z = (r7.w == 0.0) ? r17.w : r6.y;
    ps = 1.0 - r6.z;
    r6.y = max(r6.z, 0.0);
    r7.x = ps;
    ps = 2.5 * r7.x;
    r6.y = min(r6.y, 0.3);
    r7.z = ps;
    ps = 3.3333333 * r6.y;
    r17 = r16 + float4(-1.0, -1.0, -1.0, 0.25);
    r7.w = ps;
    ps = r17.w;
    r2.xyz = r2.xyz * r6.www;
    ps = r16.w + ps;
    r6.yzw = r17.xzy * UniformVector_4.xzy;
    r1.w = ps;
    r14.xy = -r6.yw * r11.ww + r6.yw;
    ps = 1.0 - r6.z;
    r11.yz = r14.zw + r1.xy;
    r7.y = ps;
    ps = r1.w;
    r1.xyz = r3.www * r15.xyz;
    ps = -r6.x + ps;
    r11 = r7.ywww * r11.wxyz;
    r6.x = saturate(ps);
    ps = r6.z;
    r5.xyz = r6.xxx * r5.xyz;
    ps = r11.x + ps;
    r7.y = r11.y + 1.0;
    r6.w = ps;
    ps = r7.y * r7.x;
    r6.xz = r14.xy + r11.zw;
    r6.y = ps;
    ps = r7.z * r7.y;
    r11.xyz = -r13.xyz + r6.xzw;
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r6.w = float((r6.y > 0.9));
    r6.z = saturate(ps);
    r6.xy = r11.xy * r6.zz + r13.xy;
    r7.xyz = r6.www * r12.xyz - r5.xyz;
    r6.w = r11.z * r6.z - 2.0;
    r6.w = r0.w * 2.0 + r6.w;
    r7.xyz = r8.xyz * r10.xyz + r7.xyz;
    r7.xyz = r7.xyz * r6.zzz + r5.xyz;
    r5.xyw = r6.xyw * r4.www;
    ps = -UniformVector_0.x;
    r5.z = r5.w + 1.0;
    r6.xyw = (r4.www > 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r4.xyz = (r4.www >= 0.0) ? r6.xyw : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r2.xyz = r2.xyz * r6.zzz;
    r6.x = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r4.xyz * r6.xxx;
    ps = 1.0 + ps;
    r6.x = dot(r4.zxy, r9.zxy);
    r6.z = ps;
    ps = -UniformVector_0.z;
    r5.xyz = r4.xyz * r6.xxx;
    r5.xyz = r5.xyz * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r3.zxy, r5.zxy));
    r6.w = ps;
    ps = log2(r6.x);
    r7.xyz = r7.xyz * r6.yzw;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r6.x = ps;
    ps = pow(2.0, r6.x);
    r6.w = saturate(dot(r4.zyx, r3.zyx));
    r6.x = ps;
    r6.xyz = r2.xyz * r6.xxx;
    r6.xy = r7.xy * r6.ww + r6.xy;
    r6.z = r7.z * r6.w + r6.z;
    r6.xyz = r1.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r6.xyz = r6.xzy * r0.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
