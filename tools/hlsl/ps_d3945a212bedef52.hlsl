// ps_d3945a212bedef52.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 381 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005F4 10041700 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

    r9 = tex2D(Texture2D_8, r0.xy);
    ps = r4.w;
    r6.xy = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r5.w = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.w));
    r5.z = r9.w - 0.5;
    r5.w = ps;
    ps = 0.1 - -r1.z;
    r22.xyz = UniformVector_5.xzy * 2e+01;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r8.xyz = r5.www * r3.xyz;
    r5.x = saturate(ps);
    ps = 0.00022222222 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r5.z = saturate(ps);
    ps = (-0.025) * r5.z;
    r17.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    r10.xy = r8.xy * r5.yy + r6.xy;
    r2.xyw = tex2D(Texture2D_0, r10.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.yw = r0.wz * 6.0;
    r6.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r6.xy = r0.wz * UniformVector_7.xy;
    r11.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r11.y = -r0.z + 1.0;
    r6.w = ps;
    ps = 1.0 / r4.w;
    r10.zw = r4.xy * ScreenPositionScaleBias.xy;
    r1.w = ps;
    r3.xy = r10.zw * r1.ww + ScreenPositionScaleBias.wz;
    r11.x = -r10.y * r6.w + 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r14.yzw = r11.yxz * UniformVector_2.yyx;
    r6.w = ps;
    ps = UniformVector_2.x * r0.w;
    r16.xyz = UniformVector_6.xzy * 2e+01;
    r14.x = ps;
    ps = r14.w;
    r6.zw = r6.zw * abs(r7.xy);
    ps = r10.x * ps;
    r7.xyz = r14.zxy - 0.5;
    r11.w = ps;
    ps = r2.x + r2.x;
    r13.x = float((r11.w >= 0.5));
    r11.x = ps;
    ps = r2.y + r2.y;
    r19.xyz = float3((r14.xzy >= 0.5));
    r11.y = ps;
    ps = r2.w + r2.w;
    r7.xyz = r7.xzy - r14.zyx;
    r11.z = ps;
    r12 = r11 + float4(-1.0, -1.0, -1.0, -0.5);
    r7.yzw = r7.xzy * r19.yxz + r14.zxy;
    r1.w = r12.w - r11.w;
    r7.x = r1.w * r13.x + r11.w;
    r7 = r7.zwxy + r7.zwxy;
    r14.xyz = tex2D(Texture2D_6, r10.xy).xyz;
    r20 = tex2D(Texture2D_1, r7.zw);
    r18 = tex2D(Texture2D_1, r7.xy);
    r7.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r15.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r23 = tex2D(Texture2D_4, r0.xy);
    r21 = tex2D(Texture2D_5, r0.xy);
    r10.xyz = tex2D(Texture2D_7, r6.xy).xyz;
    r6.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    r2.xyz = tex2D(Texture2D_2, r5.yw).xyw;
    r0.xyz = tex2D(Texture2D_2, r0.wz).wxy;
    r5.w = r2.z * r0.x;
    r5.y = dot(r1.zxy, r1.zxy);
    r6.x = float((UniformScalar_8.x >= UniformScalar_1.x));
    r0.x = float((UniformScalar_11.x > 1.0));
    r3.xy = r0.yz * 2.0 - 1.0;
    r15.zw = r2.xy * 2.0 - 1.0;
    r6.yzw = r6.yzw * 2.0 - 1.0;
    r10.xyz = (-abs(r0.xxx) >= 0.0) ? r10.xyz : 1.0;
    r0.w = float((UniformScalar_11.x >= 1.0));
    ps = r21.x * r21.w;
    r11.xyz = r9.xyz * UniformScalar_12.xxx;
    r13.y = ps;
    ps = r21.z * r21.w;
    r0.xyz = r23.xzy * r23.www;
    r13.z = ps;
    ps = r21.y * r21.w;
    r0.xyz = r22.xyz * r0.xyz;
    r13.w = ps;
    r13.yzw = r16.xyz * r13.yzw;
    r10.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r10.xyz;
    r6.yzw = r6.yzw * UniformVector_4.xyz;
    r16.xyz = r11.xyz * r10.xyz + UniformScalar_13.xxx;
    r11.xyz = (abs(r6.xxx) > 0.0) ? r0.xzy : r13.ywz;
    r0.xyz = (-abs(r6.xxx) >= 0.0) ? r13.zyw : r0.yxz;
    r21 = r15 * float4(0.875, 0.875, 0.5, 0.5);
    ps = rsqrt(abs(r5.y));
    r15.yz = r3.xy + r21.zw;
    r5.y = ps;
    r3.xyz = r5.yyy * r1.xyz;
    r15.w = saturate(dot(r0.zxy, float3(0.59, 0.11, 0.3)));
    r5.y = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r5.y = r5.y - r11.x;
    ps = r4.w;
    r5.y = saturate(r5.y + r11.x);
    ps = 0.0001 * ps;
    r5.xz = -r5.yx + 1.0;
    r0.z = saturate(ps);
    ps = ModShadowGroupColor.x * r5.z;
    r13.zw = -r6.yz * r15.ww;
    r0.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r13.y = dot(r19.xzz, float3(1.0, 1.0, 1.0));
    r0.y = ps;
    r0.xyw = -r0.xyz + 1.0;
    ps = r19.y + r19.y;
    r4.xy = r21.xy * r0.xy;
    r6.x = ps;
    r5.y = (r13.y == 0.0) ? r18.x : r18.y;
    ps = (-1.0) - -r5.w;
    r13.xzw = r6.xyz + r13.xzw;
    r15.x = ps;
    r5.z = (r13.x == 0.0) ? r20.x : r20.y;
    ps = 1.0 - r6.w;
    r19 = r13.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r1.x = ps;
    r5.y = (r19.z == 0.0) ? r18.z : r5.y;
    r5.z = (r19.y == 0.0) ? r20.z : r5.z;
    r4.z = (r19.x == 0.0) ? r20.w : r5.z;
    r5.z = (r19.w == 0.0) ? r18.w : r5.y;
    ps = 1.0 - r5.z;
    r5.y = max(r5.z, 0.0);
    r6.x = ps;
    ps = 2.5 * r6.x;
    r5.y = min(r5.y, 0.3);
    r6.z = ps;
    ps = 3.3333333 * r5.y;
    r0.xyz = r4.xyz + float3(0.125, 0.125, 0.25);
    r1.y = ps;
    ps = r0.x * r0.y;
    r5.y = r0.z + r4.z;
    r0.z = ps;
    r0.xyz = r0.zzz * r17.xyz + ModShadowColor.xyz;
    ps = r5.y;
    r2.xyz = r16.xyz * r5.xxx;
    ps = -r5.w + ps;
    r4 = r1.xyyy * r15.wxyz;
    r5.x = saturate(ps);
    ps = r6.w;
    r1.xyz = r5.xxx * r14.xyz;
    ps = r4.x + ps;
    r6.y = r4.y + 1.0;
    r5.w = ps;
    ps = r6.y * r6.x;
    r5.xz = r13.zw + r4.zw;
    r5.y = ps;
    ps = r6.z * r6.y;
    r4.xyz = -r12.xyz + r5.xzw;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r5.z = float((r5.y > 0.9));
    r6.w = saturate(ps);
    r5.xy = r4.xy * r6.ww + r12.xy;
    r6.xyz = r5.zzz * r11.xyz - r1.xyz;
    r5.z = r4.z * r6.w - 2.0;
    r5.z = r2.w * 2.0 + r5.z;
    r6.xyz = r10.xyz * r9.xyz + r6.xyz;
    r1.xyz = r6.xyz * r6.www + r1.xyz;
    r5.xyz = r5.zxy * r0.www;
    ps = 1.0 + r5.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r5.w = ps;
    r5.xyz = (r0.www > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r5.yzw = (r0.www >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    r5.x = dot(r5.wyz, r5.wyz);
    ps = rsqrt(abs(r5.x));
    r2.xyz = r2.xyz * r6.www;
    r5.x = ps;
    r5.yzw = r5.yzw * r5.xxx;
    r5.x = dot(r5.wyz, r8.zxy);
    r4.xyz = r5.yzw * r5.xxx;
    r4.xyz = r4.xyz * 2.0 - r8.xyz;
    r5.x = saturate(dot(r3.zxy, r4.zxy));
    ps = log2(r5.x);
    r1.xyz = r1.xyz * r6.xyz;
    r5.x = ps;
    ps = 15.0 * r5.x;
    r6.xyz = r7.xyz * LightColor.xyz;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r5.wzy, r3.zyx));
    r5.x = ps;
    r5.xyz = r2.xyz * r5.xxx;
    r5.xy = r1.xy * r5.ww + r5.xy;
    r5.z = r1.z * r5.w + r5.z;
    r5.xyz = r6.xyz * r5.xyz;
    r5.xyz = r5.xzy * r0.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
