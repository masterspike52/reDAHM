// ps_4423e95f81bbeb15.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 393 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000624 10041700 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
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

    r2 = tex2D(Texture2D_7, r0.xy).xzyw;
    ps = 0.1 - -r1.z;
    r5.x = ps;
    ps = r4.w;
    r5.zw = r0.wz * UniformVector_1.xy;
    ps = (-4e+02) + ps;
    r6.y = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = rsqrt(abs(r6.y));
    r6.x = r2.w - 0.5;
    r6.y = ps;
    ps = 5.0 * r5.x;
    r8.xyz = r6.yyy * r3.xyz;
    r5.x = saturate(ps);
    ps = 0.00022222222 * r5.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r5.y = saturate(ps);
    ps = (-0.025) * r5.y;
    r6.x = ps;
    r6.zw = r8.xy * r6.xx + r5.zw;
    r3.xyw = tex2D(Texture2D_0, r6.zw).xyz;
    ps = r0.w;
    r6.xy = r0.wz * UniformVector_7.xy;
    ps = UniformVector_2.x * ps;
    r9.zw = r0.wz * 6.0;
    r10.x = ps;
    ps = 1.0 / UniformVector_1.y;
    r19.y = -r0.z + 1.0;
    r5.z = ps;
    ps = 1.0 / r4.w;
    r9.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    r9.xy = r9.xy * r5.ww + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = r6.w * r5.z;
    r11.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r19.xw = -r5.zx + 1.0;
    r19.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.yzw = r19.yxz * UniformVector_2.yyx;
    r11.y = ps;
    ps = r10.w;
    r5.xy = r11.xy * abs(r7.xy);
    ps = r6.z * ps;
    r11.xyz = r10.zxy - 0.5;
    r7.w = ps;
    ps = r3.x + r3.x;
    r17.x = float((r7.w >= 0.5));
    r7.x = ps;
    ps = r3.y + r3.y;
    r17.yzw = float3((r10.xzy >= 0.5));
    r7.y = ps;
    ps = r3.w + r3.w;
    r11.yzw = r11.xzy - r10.zyx;
    r7.z = ps;
    r13 = r7 + float4(-1.0, -1.0, -1.0, -0.5);
    r11.x = r13.w - r7.w;
    r7.x = r11.x * r17.x + r7.w;
    r7.yzw = r11.ywz * r17.zyw + r10.zxy;
    r7 = r7.zwxy + r7.zwxy;
    r10.xyz = tex2D(Texture2D_6, r6.zw).xyz;
    r16 = tex2D(Texture2D_1, r7.xy);
    r18 = tex2D(Texture2D_1, r7.zw);
    r20.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r21 = tex2D(Texture2D_5, r0.xy);
    r23 = tex2D(Texture2D_4, r0.xy);
    r6.xzw = tex2D(Texture2D_8, r6.xy).xyz;
    r14.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r11.xyz = tex2D(Texture2D_2, r9.zw).wxy;
    r5.xyz = tex2D(LightAttenuationTexture, r9.xy).zxy;
    r9.xzw = tex2D(Texture2D_2, r0.wz).wxy;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r15.w = saturate(r4.w * 0.0001);
    r1.w = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r7.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = UniformVector_5.x;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    ps = 2e+01 * ps;
    r22.xyz = UniformVector_6.xzy * 2e+01;
    r12.x = ps;
    ps = UniformVector_5.z;
    r0.w = float((UniformScalar_8.x >= 1.0));
    ps = 2e+01 * ps;
    r3.z = dot(r1.zxy, r1.zxy);
    r12.y = ps;
    ps = UniformVector_5.y;
    r0.x = float((UniformScalar_8.x > 1.0));
    ps = 2e+01 * ps;
    r9.zw = r9.zw + r9.zw;
    r12.z = ps;
    r20.zw = r11.yz * 2.0 - 1.0;
    ps = r2.z;
    r14.yzw = r14.xyz + r14.xyz;
    r5.w = ps;
    r6.xzw = (-abs(r0.xxx) >= 0.0) ? r6.xzw : 1.0;
    ps = UniformScalar_9.x * r5.w;
    r0.xyz = r23.xzy * r23.www;
    r4.x = ps;
    ps = rsqrt(abs(r3.z));
    r21.xyz = r21.xzy * r21.www;
    r5.w = ps;
    ps = UniformScalar_9.x * r2.y;
    r3.xyz = r5.www * r1.xyz;
    r4.y = ps;
    ps = r11.x;
    r11.yzw = r22.xyz * r21.xyz;
    ps = r9.x * ps;
    r0.xyz = r12.xyz * r0.xyz;
    r5.w = ps;
    r6.xzw = (-abs(r0.www) >= 0.0) ? 1.0 : r6.zxw;
    ps = (-1.0) - -r5.w;
    r1.yz = r4.xy * r6.xw;
    r11.x = ps;
    r4.xyz = (-abs(r6.yyy) >= 0.0) ? r11.zyw : r0.yxz;
    r12.xyz = (abs(r6.yyy) > 0.0) ? r0.xzy : r11.ywz;
    ps = UniformScalar_9.x * r6.z;
    r0 = r20.xwzy * float4(0.875, 0.5, 0.5, 0.875);
    r6.y = ps;
    r12.xyz = (abs(r1.www) > 0.0) ? r12.xyz : r11.ywz;
    r4.xyz = (-abs(r1.www) >= 0.0) ? r11.zyw : r4.xyz;
    ps = r6.y;
    r11.w = saturate(dot(r4.zxy, float3(0.59, 0.11, 0.3)));
    ps = r2.x * ps;
    r6.y = dot(r12.zxy, float3(0.11, 0.3, 0.59));
    r1.x = ps;
    ps = r6.y;
    r4.xyz = r1.xyz + UniformScalar_10.xxx;
    r1.xy = -r19.ww * ModShadowGroupColor.xy + 1.0;
    ps = -r12.x + ps;
    r9.xy = r0.xw * r1.xy;
    r6.y = ps;
    ps = r6.y;
    r1 = r9 + float4(0.125, 0.125, -1.0, -1.0);
    ps = r12.x + ps;
    r9.z = dot(r17.yww, float3(1.0, 1.0, 1.0));
    r9.y = saturate(ps);
    r9.x = r17.z * 2.0 + r17.x;
    ps = r1.z;
    r6.y = r1.x * r1.y;
    r1.xyz = r6.yyy * r15.xyz + ModShadowColor.xyz;
    r4.w = (r9.x == 0.0) ? r18.x : r18.y;
    r6.y = (r9.z == 0.0) ? r16.x : r16.y;
    ps = r0.z + ps;
    r17 = r9.xxzz + float4(-3.0, -2.0, -2.0, -3.0);
    r11.y = ps;
    r6.y = (r17.z == 0.0) ? r16.z : r6.y;
    r4.w = (r17.y == 0.0) ? r18.z : r4.w;
    r14.x = (r17.x == 0.0) ? r18.w : r4.w;
    r9.x = (r17.w == 0.0) ? r16.w : r6.y;
    ps = r1.w;
    r6.y = max(r9.x, 0.0);
    ps = r0.y + ps;
    r0.xw = -r9.xy + 1.0;
    r11.z = ps;
    ps = 2.5 * r0.x;
    r6.y = min(r6.y, 0.3);
    r0.z = ps;
    ps = 3.3333333 * r6.y;
    r16 = r14 + float4(0.25, -1.0, -1.0, -1.0);
    r9.y = ps;
    ps = r16.x;
    r4.xyz = r4.xyz * r0.www;
    ps = r14.x + ps;
    r15.xyz = r16.yzw * UniformVector_4.xyz;
    r6.y = ps;
    r14.xy = -r15.xy * r11.ww + r15.xy;
    ps = r6.y;
    r9.xz = -r15.zw + 1.0;
    ps = -r5.w + ps;
    r11 = r9.yyxy * r11.yzwx;
    r5.w = saturate(ps);
    ps = r15.z;
    r10.xyz = r5.www * r10.xyz;
    ps = r11.z + ps;
    r0.y = r11.w + 1.0;
    r11.z = ps;
    ps = r0.y * r0.x;
    r11.xy = r14.xy + r11.xy;
    r6.y = ps;
    ps = r0.z * r0.y;
    r11.xyw = -r13.xyz + r11.xyz;
    r5.w = ps;
    ps = (-0.5) + r5.w;
    r6.y = float((r6.y > 0.9));
    r0.x = saturate(ps);
    r0.yz = r11.xy * r0.xx + r13.xy;
    r11.xyz = r6.yyy * r12.xyz - r10.xyz;
    r5.w = r11.w * r0.x - 2.0;
    r0.w = r3.w * 2.0 + r5.w;
    r6.xyz = r6.zxw * r2.xzy + r11.xyz;
    r2.xyz = r6.xyz * r0.xxx + r10.xyz;
    r6.xyz = r0.wyz * r9.zzz;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r9.zzz > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.xyz = (r9.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r5.w = dot(r6.zxy, r6.zxy);
    ps = rsqrt(abs(r5.w));
    r0.xyz = r4.xyz * r0.xxx;
    r5.w = ps;
    r4.xyz = r6.xyz * r5.www;
    r5.w = dot(r4.zxy, r8.zxy);
    r6.xyz = r4.xyz * r5.www;
    r6.xyz = r6.xyz * 2.0 - r8.xyz;
    ps = LightColor.x * r5.y;
    r5.w = saturate(dot(r3.zxy, r6.zxy));
    r6.x = ps;
    ps = log2(r5.w);
    r2.xyz = r2.xyz * r7.xyz;
    r5.w = ps;
    ps = LightColor.y * r5.z;
    r6.z = r5.w * 15.0;
    r6.y = ps;
    ps = pow(2.0, r6.z);
    r5.w = saturate(dot(r4.zyx, r3.zyx));
    r6.z = ps;
    ps = LightColor.z * r5.x;
    r0.xyz = r0.xyz * r6.zzz;
    r6.z = ps;
    r5.xy = r2.xy * r5.ww + r0.xy;
    r5.z = r2.z * r5.w + r0.z;
    r5.xyz = r6.xyz * r5.xyz;
    r5.xyz = r5.xzy * r1.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
