// ps_567df65c108cc595.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 423 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000069C 10041700 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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
sampler2D ShadowTexture : register(s11);
sampler2D ModShadowAccumTexture : register(s12);

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

    r15 = tex2D(Texture2D_9, r1.xy);
    r11.zw = saturate(UniformVector_12.xy);
    r13.y = UniformScalar_4.x * UniformScalar_5.x;
    ps = 1.0 / UniformVector_1.x;
    r12.y = r1.w * UniformVector_2.x;
    r12.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r12.z = -r1.z + 1.0;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.x = r5.w - 2e+02;
    r7.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.y = UniformScalar_3.x * UniformVector_4.x;
    r7.z = ps;
    ps = UniformVector_1.x + UniformVector_1.x;
    r6.w = dot(r4.zxy, r4.zxy);
    r7.x = ps;
    ps = rsqrt(abs(r6.w));
    r0.zw = r7.yz * abs(r8.xy);
    r7.w = ps;
    ps = UniformVector_1.y + UniformVector_1.y;
    r11.xy = r1.wz * UniformVector_14.xy;
    r7.y = ps;
    ps = UniformScalar_5.x * r6.y;
    r10.zw = r5.xy * ScreenPositionScaleBias.xy;
    r13.x = ps;
    ps = 0.00022222222 * r6.x;
    r6.yw = r1.wz * UniformVector_1.xy;
    r6.x = saturate(ps);
    ps = (-0.1) * r6.x;
    r7.xy = r7.xy * r1.wz;
    r7.z = ps;
    ps = 1.0 / r5.w;
    r9.xyz = r7.www * r4.xyz;
    r6.x = ps;
    r10.xy = r9.xy * r7.zz + r6.yw;
    r7.zw = r10.zw * r6.xx + ScreenPositionScaleBias.wz;
    r12.x = -r10.y * r6.z + 1.0;
    ps = r15.w;
    r6.yzw = r12.wxz * UniformVector_2.xyy;
    r6.x = ps;
    ps = (-0.5) + r6.x;
    r12.x = r6.y * r10.x;
    r4.x = ps;
    ps = (-0.5) + r6.z;
    r4.zw = float2((r6.zw >= 0.5));
    r2.w = ps;
    ps = (-0.5) + r6.w;
    r13.zw = r4.zw + r4.zw;
    r6.x = ps;
    ps = r2.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r4.xxxx)) clip(-1.0);
    ps = -r6.z + ps;
    r8.zw = r12.xy - 0.5;
    r22.x = ps;
    ps = floor(r13.x);
    r8.xy = float2((r12.xy >= 0.5));
    r4.x = ps;
    ps = floor(r13.y);
    r8.zw = r8.zw - r12.xy;
    r4.y = ps;
    r12.xz = r8.zw * r8.xy + r12.xy;
    r4.xy = r4.xy * UniformVector_11.xy - r13.xy;
    ps = r6.x;
    r8.zw = r4.xy * r11.zw;
    ps = -r6.w + ps;
    r8 = r13 + r8.zwxy;
    r22.y = ps;
    r4.xy = r1.xy * UniformVector_13.xy + r8.xy;
    ps = 1.0 / UniformVector_10.x;
    r11.zw = r4.xy * UniformVector_8.xy;
    r4.x = ps;
    ps = 1.0 / UniformVector_10.y;
    r22.zw = frac(r11.zw);
    r4.y = ps;
    r4 = r22 * r4.zwxy;
    ps = r1.w + r1.w;
    r12.yw = r6.zw + r4.xy;
    r6.x = ps;
    ps = r1.z + r1.z;
    r12 = r12 + r12;
    r6.y = ps;
    r8.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r18.xyz = tex2D(LightAttenuationTexture, r7.zw).xyz;
    r7.w = tex2D(ShadowTexture, r0.xy).x;
    r20.xyz = tex2D(Texture2D_7, r10.xy).xyz;
    r14 = tex2D(Texture2D_2, r7.xy);
    r21 = tex2D(Texture2D_3, r12.zw).xwyz;
    r23 = tex2D(Texture2D_3, r12.xy);
    r0.yzw = tex2D(Texture2D_5, r1.xy).xyz;
    r1.yzw = tex2D(Texture2D_8, r11.xy).xyz;
    r10.xyz = tex2D(Texture2D_0, r10.xy).xyz;
    r16 = tex2D(Texture2D_6, r4.zw);
    r11.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    r7.xyz = tex2D(Texture2D_4, r6.xy).wxy;
    ps = 0.0001 * r5.w;
    r12.x = saturate(ps);
    ps = -UniformVector_0.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r2.w = dot(r2.zxy, r2.zxy);
    r13.x = ps;
    ps = -UniformVector_0.y;
    r17.xyz = UniformVector_5.xyz * 2e+01;
    ps = 1.0 + ps;
    r1.x = float((UniformScalar_12.x >= 1.0));
    r13.y = ps;
    ps = -UniformVector_0.z;
    r6.z = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r6.x = r2.z + 0.1;
    r13.z = ps;
    ps = (-1.0) + r7.x;
    r6.y = float((UniformScalar_12.x > 1.0));
    r19.x = ps;
    r19.yz = r7.yz * 2.0 - 1.0;
    r11.xyz = r11.xyz * 2.0 - 1.0;
    ps = 5.0 * r6.x;
    r3.yzw = r16.xyz * r16.www;
    r0.x = saturate(ps);
    r7.xyz = (-abs(r6.yyy) >= 0.0) ? r1.yzw : 1.0;
    ps = 1.0 - r6.z;
    r6.xyw = r15.xyz * UniformScalar_13.xxx;
    r6.z = saturate(ps);
    r0.yzw = r0.yzw * 2.0 - 1.0;
    ps = log2(r6.z);
    r0.yzw = r0.yzw * UniformVector_4.xyz;
    r6.z = ps;
    r16.xyz = (-abs(r1.xxx) >= 0.0) ? 1.0 : r7.xyz;
    r5.xyz = r6.xyw * r16.xyz + UniformScalar_14.xxx;
    r6.y = (r8.z == 0.0) ? r23.x : r23.y;
    r6.x = (r8.w == 0.0) ? r21.x : r21.z;
    ps = r10.x + r10.x;
    r1 = r8.zzww + float4(-3.0, -2.0, -2.0, -3.0);
    r21.x = ps;
    r6.x = (r1.z == 0.0) ? r21.w : r6.x;
    r6.y = (r1.y == 0.0) ? r23.z : r6.y;
    r21.w = (r1.x == 0.0) ? r23.w : r6.y;
    r6.x = (r1.w == 0.0) ? r21.y : r6.x;
    ps = r10.y + r10.y;
    r6.y = max(r6.x, 0.0);
    r21.y = ps;
    ps = r10.z + r10.z;
    r8.zw = float2((UniformVector_10.xy >= r22.zw));
    r21.z = ps;
    ps = LightColorAndFalloffExponent.w * r6.z;
    r6.y = min(r6.y, 0.3);
    r6.z = ps;
    ps = 1.0 - r6.x;
    r1 = r21 + float4(-1.0, -1.0, -1.0, -0.75);
    r7.z = ps;
    ps = r1.w;
    r12.zw = float2((UniformVector_10.yx > r22.wz));
    ps = r21.w + ps;
    r11.xyz = r11.xyz - r1.xyz;
    r6.x = saturate(ps);
    r11.w = r11.z * r14.w - 2.0;
    r11.xyz = r11.xyz * r14.www + r1.xyz;
    ps = 3.3333333 * r6.y;
    r1.xyz = r6.xxx * r20.xyz;
    r6.x = ps;
    ps = 2.5 * r7.z;
    r6.xyw = r6.xxx * r19.xyz;
    r7.y = ps;
    ps = 1.0 + r6.x;
    r19.xyz = -r1.xyz + r14.xyz;
    r7.x = ps;
    r14.xyz = r19.xyz * r14.www + r1.xyz;
    ps = r0.w;
    r7.xyz = r7.ywx * r7.xwz;
    r6.x = ps;
    ps = r8.z * r8.w;
    r1.xyz = r7.yyy * r18.xyz;
    r1.w = ps;
    ps = pow(2.0, r6.z);
    r7.w = float((r7.z > 0.9));
    r12.y = ps;
    ps = 1.0 - r6.x;
    r1 = r1.xzyw * r12.yyyz;
    r6.x = ps;
    ps = 1.0 - r0.x;
    r3.x = r1.w * r12.w;
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r3.xyz = r3.yzw * r3.xxx;
    r12.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r3.xyw = r17.yzx * r3.yzx;
    r12.z = ps;
    ps = (-0.5) + r7.x;
    r6.z = dot(r3.ywx, float3(0.11, 0.3, 0.59));
    r7.x = saturate(ps);
    r7.yzw = r3.wxy * r7.www - r14.xyz;
    r7.yzw = r16.xyz * r15.xyz + r7.yzw;
    ps = rsqrt(abs(r2.w));
    r6.z = r6.z - r3.w;
    r2.w = ps;
    ps = r6.z;
    r3.xyz = r2.www * r2.xyz;
    r7.yzw = r7.yzw * r7.xxx + r14.xyz;
    ps = r3.w + ps;
    r2.xyz = r7.yzw * r13.xyz;
    r12.w = saturate(ps);
    r7.w = r6.x * r12.w + r0.w;
    r7.yz = -r0.yz * r12.ww + r0.yz;
    r0 = -r12.wxyz + 1.0;
    r7.yz = r6.yw * 2.0 + r7.yz;
    r6.xyz = -r11.xyz + r7.yzw;
    r6.xyz = r6.xyz * r7.xxx + r11.xyw;
    r6.w = r10.z * 2.0 + r6.z;
    r6.xyz = r6.wxy * r0.yyy;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r0.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r7.yzw = (r0.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r7.wyz, r7.wyz);
    ps = rsqrt(abs(r6.x));
    r6.yzw = r5.xyz * r0.xxx;
    r6.x = ps;
    r5.xyz = r7.yzw * r6.xxx;
    r6.x = dot(r5.zxy, r9.zxy);
    r7.yzw = r5.xyz * r6.xxx;
    r7.yzw = r7.yzw * 2.0 - r9.xyz;
    r6.x = saturate(dot(r3.zxy, r7.wyz));
    ps = log2(r6.x);
    r7.xyz = r6.yzw * r7.xxx;
    r8.z = ps;
    r6.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r6.z);
    r6.w = saturate(dot(r5.zyx, r3.zyx));
    r6.z = ps;
    r6.xy = r6.xy * r0.zw + 0.125;
    ps = r6.x * r6.y;
    r7.xyz = r7.xyz * r6.zzz;
    r6.x = ps;
    r6.xyz = r6.xxx * r4.xyz + ModShadowColor.xyz;
    r7.xy = r2.xy * r6.ww + r7.xy;
    r7.z = r2.z * r6.w + r7.z;
    r7.xyz = r1.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
