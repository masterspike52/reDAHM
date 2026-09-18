// ps_86f6819c28fdd9a7.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 411 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000066C 10041700 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

    r15 = tex2D(Texture2D_9, r0.xy);
    ps = r0.w + r0.w;
    r13.yw = saturate(UniformVector_12.xy);
    r14.x = ps;
    ps = UniformScalar_4.x;
    r13.z = r0.w * UniformVector_2.x;
    ps = UniformScalar_5.x * ps;
    r11.y = -r0.z + 1.0;
    r8.y = ps;
    ps = r4.w;
    r9.xy = r0.wz * UniformVector_14.xy;
    ps = 0.0001 * ps;
    r12.zw = r4.xy * ScreenPositionScaleBias.xy;
    r3.w = saturate(ps);
    ps = r4.w;
    r8.xz = r0.wz * UniformVector_1.xy;
    ps = (-2e+02) + ps;
    r6.y = r1.z + 0.1;
    r6.x = ps;
    ps = UniformVector_1.x + UniformVector_1.x;
    r5.x = dot(r3.zxy, r3.zxy);
    r5.z = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r5.y = UniformScalar_3.x * UniformVector_4.x;
    r5.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.zw = r5.zw * r0.wz;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = saturate(r6.yx * float2(5.0, 0.00022222222));
    r5.w = ps;
    ps = rsqrt(abs(r5.x));
    r9.zw = r5.zw * abs(r7.xy);
    r5.x = ps;
    ps = 1.0 / r4.w;
    r10.xyz = r5.xxx * r3.xyz;
    r5.z = ps;
    ps = 1.0 / UniformVector_1.y;
    r5.w = r6.y * (-0.1);
    r5.x = ps;
    r12.xy = r10.xy * r5.ww + r8.xz;
    ps = UniformScalar_5.x * r5.y;
    r3.xyz = r12.wyz * r5.zxz;
    r8.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r11.xw = -r3.yw + 1.0;
    r11.z = ps;
    ps = r15.w;
    r5.yzw = r11.zxy * UniformVector_2.xyy;
    r5.x = ps;
    ps = (-0.5) + r5.x;
    r13.x = r5.y * r12.x;
    r4.x = ps;
    ps = (-0.5) + r5.z;
    r4.zw = float2((r5.zw >= 0.5));
    r1.w = ps;
    ps = (-0.5) + r5.w;
    r8.zw = r4.zw + r4.zw;
    r5.x = ps;
    ps = r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r4.xxxx)) clip(-1.0);
    ps = -r5.z + ps;
    r7.zw = r13.xz - 0.5;
    r21.x = ps;
    ps = floor(r8.x);
    r7.xy = float2((r13.xz >= 0.5));
    r4.x = ps;
    ps = floor(r8.y);
    r7.zw = r7.zw - r13.xz;
    r4.y = ps;
    r13.xz = r7.zw * r7.xy + r13.xz;
    r4.xy = r4.xy * UniformVector_11.xy - r8.xy;
    ps = r5.x;
    r7.zw = r4.xy * r13.yw;
    ps = -r5.w + ps;
    r8 = r8 + r7.zwxy;
    r21.y = ps;
    r4.xy = r0.xy * UniformVector_13.xy + r8.xy;
    ps = 1.0 / UniformVector_10.x;
    r7.xy = r4.xy * UniformVector_8.xy;
    r4.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r21.zw = frac(r7.xy);
    r4.y = ps;
    ps = r0.z + r0.z;
    r7 = r21 * r4.zwxy;
    r14.y = ps;
    ps = ScreenPositionScaleBias.w + r3.z;
    r13.yw = r5.zw + r7.xy;
    r4.x = ps;
    ps = ScreenPositionScaleBias.z + r3.x;
    r5 = r13 + r13;
    r4.y = ps;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r8.xy = tex2D(ModShadowAccumTexture, r9.zw).xy;
    r3 = tex2D(Texture2D_2, r6.zw).xzwy;
    r13.xyz = tex2D(Texture2D_7, r12.xy).xyz;
    r18 = tex2D(Texture2D_6, r7.zw);
    r20.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r22 = tex2D(Texture2D_3, r5.zw);
    r23 = tex2D(Texture2D_3, r5.xy);
    r9.yzw = tex2D(Texture2D_8, r9.xy).xyz;
    r5.yzw = tex2D(Texture2D_4, r14.xy).wxy;
    r0.xyw = tex2D(Texture2D_0, r12.xy).xyz;
    r12.xyz = tex2D(Texture2D_1, r6.zw).xyz;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = -UniformVector_0.x;
    r1.w = dot(r1.zxy, r1.zxy);
    ps = 1.0 + ps;
    r6.z = float((UniformScalar_12.x >= 1.0));
    r9.x = ps;
    r12.xzw = r12.xyz * 2.0 - 1.0;
    r17.xyz = r0.xyw * 2.0 - 1.0;
    ps = (-1.0) + r5.y;
    r5.x = dot(r2.zxy, r2.zxy);
    r19.x = ps;
    r19.yz = r5.zw * 2.0 - 1.0;
    ps = 1.0 - r5.x;
    r5.z = float((UniformScalar_12.x > 1.0));
    r5.y = saturate(ps);
    r5.xzw = (-abs(r5.zzz) >= 0.0) ? r9.yzw : 1.0;
    r16.xyz = (-abs(r6.zzz) >= 0.0) ? 1.0 : r5.xzw;
    ps = log2(r5.y);
    r5.xzw = r15.xyz * UniformScalar_13.xxx;
    r5.y = ps;
    r9.yzw = r5.xzw * r16.xyz + UniformScalar_14.xxx;
    ps = 1.0 - r6.x;
    r14.xyz = UniformVector_5.xyz * 2e+01;
    r5.z = ps;
    r5.w = (r8.z == 0.0) ? r23.x : r23.y;
    r5.x = (r8.w == 0.0) ? r22.x : r22.y;
    ps = ModShadowGroupColor.x * r5.z;
    r2 = r8.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r6.z = ps;
    r5.x = (r2.z == 0.0) ? r22.z : r5.x;
    r5.w = (r2.y == 0.0) ? r23.z : r5.w;
    r20.x = (r2.x == 0.0) ? r23.w : r5.w;
    r2.y = (r2.w == 0.0) ? r22.w : r5.x;
    ps = r2.y;
    r20.yzw = r20.yzw + r20.yzw;
    r5.x = ps;
    ps = 0.0;
    r6.xy = float2((UniformVector_10.yx > r21.wz));
    r5.w = ps;
    ps = max(r5.x, r5.w);
    r2.xz = float2((UniformVector_10.xy >= r21.zw));
    r5.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r5.x = min(r5.x, 0.3);
    r6.w = ps;
    ps = r2.x * r2.z;
    r21 = r20 + float4(-0.75, -1.0, -1.0, -1.0);
    r5.z = ps;
    ps = 3.3333333 * r5.x;
    r5.z = r5.z * r6.x;
    r5.x = ps;
    ps = r21.x;
    r18.xyz = r18.xyz * r18.www;
    ps = r20.x + ps;
    r2.xzw = r21.wyz * UniformVector_4.zxy;
    r5.w = saturate(ps);
    ps = r5.z;
    r13.xyz = r5.www * r13.xyz;
    ps = r6.y * ps;
    r0.xyz = r5.xxx * r19.xyz;
    r5.z = ps;
    ps = 1.0 + r0.x;
    r12.y = -r13.z + r3.y;
    r3.y = ps;
    ps = r2.y;
    r12.xzw = r12.wxz - r17.zxy;
    r5.x = ps;
    ps = 1.0 - r5.x;
    r6.xy = -r13.xy + r3.xw;
    r3.x = ps;
    ps = 1.0 - r2.x;
    r5.xzw = r18.xyz * r5.zzz;
    r3.w = ps;
    r13.xy = r6.xy * r3.zz + r13.xy;
    ps = 2.5 * r3.x;
    r12 = r12.zwxy * r3.zzzz;
    r3.z = ps;
    ps = r12.z;
    r14.xyz = r14.xyz * r5.xzw;
    r5.x = ps;
    ps = r13.z;
    r5.z = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    ps = r12.w + ps;
    r6.x = r5.z - r14.x;
    r13.z = ps;
    ps = rsqrt(abs(r1.w));
    r5.zw = r3.yz * r3.xy;
    r6.y = ps;
    ps = (-0.5) + r5.w;
    r1.xyz = r6.yyy * r1.xyz;
    r6.y = saturate(ps);
    ps = r6.x;
    r12.xyz = r17.xyz + r12.xyz;
    ps = r14.x + ps;
    r5.z = float((r5.z > 0.9));
    r6.x = saturate(ps);
    r3.z = r3.w * r6.x + r2.x;
    r14.xyz = r14.xyz * r5.zzz - r13.xyz;
    r5.zw = -r2.zw * r6.xx + r2.zw;
    r3.xy = r0.yz * 2.0 + r5.zw;
    r2.xyz = r16.xyz * r15.xyz + r14.xyz;
    r0.xyz = r2.xyz * r6.yyy + r13.xyz;
    ps = (-2.0) + r5.x;
    r2.xyz = -r12.xyz + r3.xyz;
    r12.w = ps;
    r2.xyz = r2.xyz * r6.yyy + r12.xyw;
    r2.w = r0.w * 2.0 + r2.z;
    ps = 1.0 - r6.x;
    r2.xyw = r2.xyw * r11.www;
    r3.x = ps;
    ps = 1.0 - r6.z;
    r2.z = r2.w + 1.0;
    r3.y = ps;
    r5.xzw = (r11.www > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r2.xyz = (r11.www >= 0.0) ? r5.xzw : float3(0.0, 0.0, 1.0);
    ps = 1.0 - r6.w;
    r5.x = dot(r2.zxy, r2.zxy);
    r3.z = ps;
    ps = rsqrt(abs(r5.x));
    r6.xzw = r9.yzw * r3.xxx;
    r5.x = ps;
    ps = -UniformVector_0.y;
    r2.xyz = r2.xyz * r5.xxx;
    ps = 1.0 + ps;
    r5.x = dot(r2.zxy, r10.zxy);
    r9.y = ps;
    ps = -UniformVector_0.z;
    r5.xzw = r2.xyz * r5.xxx;
    r5.xzw = r5.xzw * 2.0 - r10.xyz;
    ps = 1.0 + ps;
    r5.x = saturate(dot(r1.zxy, r5.wxz));
    r9.z = ps;
    ps = log2(r5.x);
    r0.xyz = r0.xyz * r9.xyz;
    r8.z = ps;
    ps = LightColorAndFalloffExponent.w * r5.y;
    r5.xzw = r8.xzy * float3(0.875, 15.0, 0.875);
    r5.y = ps;
    ps = pow(2.0, r5.z);
    r6.xyz = r6.xzw * r6.yyy;
    r5.z = ps;
    r5.xw = r5.xw * r3.yz + 0.125;
    ps = r5.x * r5.w;
    r6.w = saturate(dot(r2.zyx, r1.zyx));
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r6.xyz = r6.xyz * r5.zzz;
    r5.w = ps;
    r5.xyz = r5.xxx * r7.xyz + ModShadowColor.xyz;
    r6.xy = r0.xy * r6.ww + r6.xy;
    r6.z = r0.z * r6.w + r6.z;
    r6.xyz = r6.xyz * r5.www;
    r6.xyz = r6.xyz * r4.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r5.xyz = r6.xzy * r5.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
