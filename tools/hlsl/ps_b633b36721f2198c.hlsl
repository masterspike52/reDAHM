// ps_b633b36721f2198c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 381 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000005F4 10041600 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_8, r0.xy);
    ps = 0.1 - -r1.z;
    r5.x = ps;
    ps = r4.w;
    r5.zw = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.y = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = r9.w - 0.5;
    r6.y = ps;
    ps = 5.0 * r5.x;
    r8.xyz = r6.yyy * r3.xyz;
    r5.x = saturate(ps);
    ps = 0.00022222222 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r5.y = saturate(ps);
    ps = (-0.025) * r5.y;
    r19.z = saturate(r4.w * 0.0001);
    r6.x = ps;
    r10.zw = r8.xy * r6.xx + r5.zw;
    r3.xyw = tex2D(Texture2D_0, r10.zw).xyz;
    ps = r0.w;
    r6.zw = r0.wz * 6.0;
    ps = UniformVector_2.x * ps;
    r10.xy = r0.wz * UniformVector_7.xy;
    r11.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r14.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.z = ps;
    ps = 1.0 / UniformVector_1.x;
    r11.z = -r0.z + 1.0;
    r11.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r16.yzw = -ModShadowColor.xyz + 1.0;
    r16.x = ps;
    r11.y = -r10.w * r16.x + 1.0;
    ps = 1.0 / ModShadowAccumResolution.y;
    r11.yzw = r11.zyw * UniformVector_2.yyx;
    r5.w = ps;
    ps = r11.w;
    r7.xy = r5.zw * abs(r7.xy);
    ps = r10.z * ps;
    r12.xyz = r11.zxy - 0.5;
    r13.w = ps;
    ps = r3.x + r3.x;
    r5.w = float((r13.w >= 0.5));
    r13.x = ps;
    ps = r3.y + r3.y;
    r20.xyz = float3((r11.xzy >= 0.5));
    r13.y = ps;
    ps = r3.w + r3.w;
    r15.xyz = r12.xzy - r11.zyx;
    r13.z = ps;
    r12 = r13 + float4(-1.0, -1.0, -1.0, -0.5);
    r11.yzw = r15.xzy * r20.yxz + r11.zxy;
    ps = 1.0 / r4.w;
    r14.z = r12.w - r13.w;
    r5.z = ps;
    r6.xy = r14.xy * r5.zz + ScreenPositionScaleBias.wz;
    r11.x = r14.z * r5.w + r13.w;
    r11 = r11.zwxy + r11.zwxy;
    r4.xyz = tex2D(Texture2D_6, r10.zw).xyz;
    r14 = tex2D(Texture2D_1, r11.xy);
    r18 = tex2D(Texture2D_1, r11.zw);
    r13.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r22 = tex2D(Texture2D_5, r0.xy);
    r17 = tex2D(Texture2D_4, r0.xy).xzyw;
    r10.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r7.xyw = tex2D(Texture2D_2, r6.zw).xyw;
    r11.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r15.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    ps = UniformVector_6.x;
    r19.xyw = UniformVector_5.xzy * 2e+01;
    ps = 2e+01 * ps;
    r5.z = float((UniformScalar_8.x >= UniformScalar_1.x));
    r21.x = ps;
    ps = UniformVector_6.z;
    r6.w = float((UniformScalar_11.x >= 1.0));
    ps = 2e+01 * ps;
    r0.w = dot(r1.zxy, r1.zxy);
    r21.y = ps;
    ps = UniformVector_6.y;
    r0.x = float((UniformScalar_11.x > 1.0));
    ps = 2e+01 * ps;
    r2.xyz = r11.xyz * r2.www;
    r21.z = ps;
    r13.zw = r7.xy * 2.0 - 1.0;
    r10.xyz = (-abs(r0.xxx) >= 0.0) ? r10.xyz : 1.0;
    ps = r17.x * r17.w;
    r11.xyz = r9.xyz * UniformScalar_12.xxx;
    r17.x = ps;
    ps = rsqrt(abs(r0.w));
    r0.xyz = r22.xzy * r22.www;
    r0.w = ps;
    ps = r17.y * r17.w;
    r3.xyz = r0.www * r1.xyz;
    r17.y = ps;
    ps = r17.z * r17.w;
    r0.xyw = r21.xyz * r0.xyz;
    r17.z = ps;
    ps = r6.x + r6.x;
    r1.xyz = r19.xyw * r17.xyz;
    r0.z = ps;
    r10.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r10.xyz;
    r7.xyz = r11.xyz * r10.xyz + UniformScalar_13.xxx;
    r17.xyz = (-abs(r5.zzz) >= 0.0) ? r0.yxw : r1.yxz;
    r11.xyz = (abs(r5.zzz) > 0.0) ? r1.xzy : r0.xwy;
    ps = r6.y + r6.y;
    r5.z = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r0.w = ps;
    ps = r15.x + r15.x;
    r5.z = r5.z - r11.x;
    r15.x = ps;
    ps = r15.y + r15.y;
    r5.z = saturate(r5.z + r11.x);
    r15.y = ps;
    ps = r15.z + r15.z;
    r5.xz = -r5.zx + 1.0;
    r15.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r13 = r13.xzwy * float4(0.875, 0.5, 0.5, 0.875);
    r19.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1.y = dot(r20.xzz, float3(1.0, 1.0, 1.0));
    r19.y = ps;
    r1.x = r20.y * 2.0 + r5.w;
    r5.z = (r1.x == 0.0) ? r18.x : r18.y;
    r5.y = (r1.y == 0.0) ? r14.x : r14.y;
    ps = r7.w;
    r6.xyw = -r19.xyz + 1.0;
    ps = r6.z * ps;
    r0.xy = r13.xw * r6.xy;
    r5.w = ps;
    ps = (-1.0) - -r5.w;
    r1 = r1.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r13.x = ps;
    r5.y = (r1.z == 0.0) ? r14.z : r5.y;
    r5.z = (r1.y == 0.0) ? r18.z : r5.z;
    r15.w = (r1.x == 0.0) ? r18.w : r5.z;
    r5.z = (r1.w == 0.0) ? r14.w : r5.y;
    ps = 1.0 - r5.z;
    r14 = r0 + float4(0.125, 0.125, -1.0, -1.0);
    r0.x = ps;
    ps = r14.x * r14.y;
    r5.y = max(r5.z, 0.0);
    r6.z = ps;
    r1.xyz = r6.zzz * r16.yzw + ModShadowColor.xyz;
    ps = 2.5 * r0.x;
    r5.y = min(r5.y, 0.3);
    r0.z = ps;
    ps = 3.3333333 * r5.y;
    r16 = r15 + float4(-1.0, -1.0, -1.0, 0.25);
    r0.w = ps;
    ps = r16.w;
    r13.w = saturate(dot(r17.zxy, float3(0.59, 0.11, 0.3)));
    ps = r15.w + ps;
    r6.xyz = r16.zxy * UniformVector_4.zxy;
    r5.y = ps;
    r14.xy = -r6.yz * r13.ww + r6.yz;
    ps = 1.0 - r6.x;
    r7.xyz = r7.xyz * r5.xxx;
    r0.y = ps;
    ps = r5.y;
    r13.yz = r14.zw + r13.yz;
    ps = -r5.w + ps;
    r13 = r0.ywww * r13.wxyz;
    r5.x = saturate(ps);
    ps = r6.x;
    r4.xyz = r5.xxx * r4.xyz;
    ps = r13.x + ps;
    r0.y = r13.y + 1.0;
    r5.w = ps;
    ps = r0.y * r0.x;
    r5.xz = r14.xy + r13.zw;
    r5.y = ps;
    ps = r0.z * r0.y;
    r6.xyz = -r12.xyz + r5.xzw;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r5.w = float((r5.y > 0.9));
    r5.z = saturate(ps);
    r5.xy = r6.xy * r5.zz + r12.xy;
    r0.xyz = r5.www * r11.xyz - r4.xyz;
    r5.w = r6.z * r5.z - 2.0;
    r5.w = r3.w * 2.0 + r5.w;
    r0.xyz = r10.xyz * r9.xyz + r0.xyz;
    r6.xyz = r0.xyz * r5.zzz + r4.xyz;
    r0.xyw = r5.xyw * r6.www;
    ps = -UniformVector_0.x;
    r0.z = r0.w + 1.0;
    r5.xyw = (r6.www > 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r4.xyz = (r6.www >= 0.0) ? r5.xyw : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r5.x = dot(r4.zxy, r4.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r7.xyz * r5.zzz;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r4.xyz * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r4.zxy, r8.zxy);
    r5.z = ps;
    ps = -UniformVector_0.z;
    r7.xyz = r4.xyz * r5.xxx;
    r7.xyz = r7.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r3.zxy, r7.zxy));
    r5.w = ps;
    ps = log2(r5.x);
    r6.xyz = r6.xyz * r5.yzw;
    r5.y = ps;
    ps = 15.0 * r5.y;
    r5.x = ps;
    ps = pow(2.0, r5.x);
    r5.w = saturate(dot(r4.zyx, r3.zyx));
    r5.x = ps;
    r5.xyz = r0.xyz * r5.xxx;
    r5.xy = r6.xy * r5.ww + r5.xy;
    r5.z = r6.z * r5.w + r5.z;
    r5.xyz = r2.xyz * r5.xyz;
    r5.xyz = r5.xzy * LightColor.xzy;
    r5.xyz = r5.xzy * r1.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
