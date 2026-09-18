// ps_df23c5f2cf603920.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 423 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000069C 10041700 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c18); // float4
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c12); // float
float4 UniformScalar_3 : register(c13); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UniformVector_8 : register(c10); // float4
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

    ps = UniformVector_2.x * r1.w;
    r6.zw = r1.wz + r1.wz;
    r13.y = ps;
    r9.xyw = tex2D(Texture2D_4, r6.zw).xyw;
    ps = UniformVector_1.x + UniformVector_1.x;
    r7.z = -r1.z + 1.0;
    r7.x = ps;
    ps = r5.w;
    r15.zw = r5.xy * ScreenPositionScaleBias.xy;
    ps = (-4e+02) + ps;
    r0.zw = r1.wz * UniformVector_1.xy;
    r6.x = ps;
    ps = 0.00022222222 * r6.x;
    r7.y = dot(r4.zxy, r4.zxy);
    r6.y = saturate(ps);
    ps = rsqrt(abs(r7.y));
    r13.zw = r9.xy + r9.xy;
    r6.x = ps;
    ps = 1.0 / UniformVector_1.x;
    r9.xyz = r6.xxx * r4.xyz;
    r7.w = ps;
    ps = 1.0 / UniformVector_1.y;
    r6.xyz = r6.yzw * float3(-0.1, 6.0, 6.0);
    r6.w = ps;
    r15.xy = r9.xy * r6.xx + r0.zw;
    r7.y = -r15.y * r6.w + 1.0;
    ps = UniformVector_1.y + UniformVector_1.y;
    r10.xyw = r7.wyz * UniformVector_2.xyy;
    r7.y = ps;
    ps = r10.x;
    r4.zw = r7.xy * r1.wz;
    ps = r15.x * ps;
    r6.xw = r10.yw - 0.5;
    r13.x = ps;
    ps = r6.x;
    r7.zw = float2((r10.yw >= 0.5));
    ps = -r10.y + ps;
    r12 = r13.zwyx + float4(-1.0, -1.0, -0.5, -0.5);
    r11.z = ps;
    ps = r6.w;
    r7.xy = float2((r13.xy >= 0.5));
    ps = -r10.w + ps;
    r11.xy = r12.wz - r13.xy;
    r11.w = ps;
    r10.xz = r11.xy * r7.xy + r13.xy;
    r10.yw = r11.zw * r7.zw + r10.yw;
    ps = 0.0001 * r5.w;
    r13 = r10 + r10;
    r0.z = saturate(ps);
    r10.xyz = tex2D(Texture2D_8, r15.xy).xyz;
    r16 = tex2D(Texture2D_3, r13.xy);
    r11.xyz = tex2D(Texture2D_1, r4.zw).xyz;
    r17.xzw = tex2D(Texture2D_4, r6.yz).wxy;
    r6.w = UniformScalar_1.x * UniformVector_4.x;
    ps = 1.0 / r5.w;
    r6.xy = r1.wz - r1.xy;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = r17.x * r9.w;
    r18.x = ps;
    r6.xy = r6.xy * UniformScalar_4.xx + r1.xy;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r6.yx * UniformVector_6.yx;
    r18.y = ps;
    ps = r18.x;
    r14.xyz = r11.zxy + r11.zxy;
    r4.xy = r15.zw * r6.zz + ScreenPositionScaleBias.wz;
    r7.xy = r7.zw * 2.0 + r7.xy;
    r6.z = (r7.x == 0.0) ? r16.x : r16.y;
    ps = abs(r8.x) * ps;
    r11 = r7.yxxy + float4(-2.0, -3.0, -2.0, -3.0);
    r7.z = ps;
    r6.z = (r11.z == 0.0) ? r16.z : r6.z;
    r14.w = (r11.y == 0.0) ? r16.w : r6.z;
    ps = r18.y;
    r16 = r14 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = abs(r8.y) * ps;
    r6.z = r16.w + r14.w;
    r7.w = ps;
    ps = 1.0 / UniformScalar_2.x;
    r6.z = saturate(r6.z - r0.w);
    r10.w = ps;
    ps = UniformVector_7.y + r6.x;
    r10 = r6.wzzz * r10.wxyz;
    r6.w = ps;
    r6.z = r10.x * UniformScalar_3.x + r6.y;
    r19 = tex2D(Texture2D_2, r4.zw);
    r7.xz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r4.xyz = tex2D(LightAttenuationTexture, r4.xy).xyz;
    r21.y = tex2D(ShadowTexture, r0.xy).x;
    r22 = tex2D(Texture2D_3, r13.zw);
    r14.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    ps = 0.1 - -r2.z;
    r13.xy = r1.wz * UniformVector_8.xy;
    r6.y = ps;
    r21.xzw = tex2D(Texture2D_9, r13.xy).xyz;
    r23 = tex2D(Texture2D_7, r6.zw);
    r13 = tex2D(Texture2D_6, r1.xy);
    r8.xyz = tex2D(Texture2D_0, r15.xy).xyz;
    ps = -ModShadowColor.x;
    r5.xyw = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r15.xyz = UniformVector_5.xyz * 2e+01;
    r17.x = ps;
    ps = -ModShadowColor.y;
    r2.w = float((UniformScalar_17.x >= 1.0));
    ps = 1.0 + ps;
    r6.z = float((UniformScalar_17.x > 1.0));
    r17.y = ps;
    ps = -ModShadowColor.z;
    r6.x = dot(r3.zxy, r3.zxy);
    ps = 1.0 + ps;
    r18.zw = r17.zw + r17.zw;
    r17.z = ps;
    r20.xyz = r8.zxy * 2.0 - 1.0;
    ps = 5.0 * r6.y;
    r6.w = dot(r2.zxy, r2.zxy);
    r0.x = saturate(ps);
    ps = rsqrt(abs(r6.w));
    r0.y = -r13.w + 1.0;
    r1.w = ps;
    ps = 1.0 - r6.x;
    r1.xyz = r23.xyz * r23.www;
    r7.w = saturate(ps);
    r3.xyz = (-abs(r6.zzz) >= 0.0) ? r21.xzw : 1.0;
    r6.xyz = r14.zxy * 2.0 - 1.0;
    ps = UniformVector_4.z * r6.x;
    r21.xzw = r13.zxy * UniformScalar_18.xxx;
    r6.w = ps;
    r14.xyz = (-abs(r2.www) >= 0.0) ? 1.0 : r3.xyz;
    ps = log2(r7.w);
    r3.xyz = r1.www * r2.xyz;
    r6.x = ps;
    r8.xyw = r21.xzw * r14.zxy + UniformScalar_19.xxx;
    ps = 1.0 - r0.x;
    r1.xyz = r15.xyz * r1.xyz;
    r7.w = ps;
    ps = 1.0 - r0.z;
    r1 = r1.xxyz * float4(0.3, 1.0, 1.0, 1.0);
    r3.w = ps;
    r2.xy = -r7.ww * ModShadowGroupColor.xy + 1.0;
    ps = UniformVector_4.y * r6.z;
    r15.xyz = r1.yzw * r0.yyy;
    r6.z = ps;
    r7.w = dot(r15.zy, float2(0.11, 0.59)) + 0.0;
    r7.w = dot(r1.yx, r0.yy) + r7.w;
    ps = UniformVector_4.x * r6.y;
    r21.z = saturate(r7.w - r15.x);
    r6.y = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r11.yz = -r6.yz * r21.zz;
    r7.w = ps;
    r6.x = (r7.y == 0.0) ? r22.x : r22.y;
    r6.x = (r11.x == 0.0) ? r22.z : r6.x;
    r21.w = (r11.w == 0.0) ? r22.w : r6.x;
    ps = 1.0 - r6.w;
    r6.x = max(r21.w, 0.0);
    r21.x = ps;
    ps = r21.x * r21.z;
    r7.y = min(r6.x, 0.3);
    r11.x = ps;
    ps = r21.y * r21.y;
    r1.xw = -r21.wz + 1.0;
    r11.w = ps;
    ps = 2.5 * r1.x;
    r2.z = r8.x * r1.w;
    r1.z = ps;
    ps = 3.3333333 * r7.y;
    r0.xyz = r16.xyz - r20.xyz;
    r16.x = ps;
    ps = 0.875 * r7.x;
    r6.yzw = r6.wyz + r11.xyz;
    r16.y = ps;
    ps = 0.875 * r7.z;
    r0.xyz = r0.xyz * r19.www;
    r16.z = ps;
    ps = r11.w;
    r18.xy = r16.yz * r2.xy;
    ps = r4.x * ps;
    r2.xyw = r20.yzx + r0.yzx;
    r10.x = ps;
    ps = r0.x;
    r7.xyz = -r10.yzw + r19.xyz;
    r6.x = ps;
    ps = (-2.0) + r6.x;
    r18 = r18 + float4(0.125, 0.125, -1.0, -1.0);
    r12.w = ps;
    r10.yzw = r7.xyz * r19.www + r10.yzw;
    r12.yz = r18.zw * 0.5 + r12.xy;
    ps = (-1.0) + r0.w;
    r6.x = r18.x * r18.y;
    r12.x = ps;
    r7.xyz = r6.xxx * r17.xyz + ModShadowColor.xyz;
    r1.y = r16.x * r12.x + 1.0;
    r0.xy = r16.xx * r12.yz + r6.zw;
    ps = r6.y;
    r0.xy = r0.xy - r2.xy;
    ps = -r2.w + ps;
    r6.xy = r1.zy * r1.yx;
    r2.w = ps;
    ps = (-0.5) + r6.x;
    r6.z = float((r6.y > 0.9));
    r5.z = saturate(ps);
    r6.xy = r0.xy * r5.zz + r2.xy;
    r0.xyz = r15.xyz * r6.zzz - r10.yzw;
    r0.xyz = r14.xyz * r13.xyz + r0.xyz;
    r6.w = r0.z * r5.z + r10.w;
    r2.xy = r0.xy * r5.zz + r10.yz;
    ps = r11.w;
    r2 = r2.wxyz * r5.zxyz;
    ps = r4.y * ps;
    r6.z = r12.w + r2.x;
    r10.y = ps;
    r6.z = r8.z * 2.0 + r6.z;
    ps = r11.w;
    r0.xyw = r6.xyz * r3.www;
    ps = r4.z * ps;
    r0.z = r0.w + 1.0;
    r10.z = ps;
    r6.xyz = (r3.www > 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r4.xyz = (r3.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = pow(2.0, r7.w);
    r6.x = dot(r4.zxy, r4.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r10.xzy * r6.yyy;
    r6.x = ps;
    ps = r8.y;
    r4.xyz = r4.xyz * r6.xxx;
    ps = r1.w * ps;
    r6.y = dot(r4.zxy, r9.zxy);
    r6.x = ps;
    ps = r8.w;
    r8.xyz = r4.xyz * r6.yyy;
    r8.xyz = r8.xyz * 2.0 - r9.xyz;
    ps = r1.w * ps;
    r6.y = saturate(dot(r3.zxy, r8.zxy));
    r6.z = ps;
    ps = log2(r6.y);
    r6.xzw = r6.xzw * r5.zzw;
    r6.y = ps;
    ps = 15.0 * r6.y;
    r6.y = ps;
    ps = pow(2.0, r6.y);
    r1.x = saturate(dot(r4.zyx, r3.zyx));
    r1.y = ps;
    r6.xyz = r6.xzw * r1.yyx;
    r6.xyz = r2.yzw * r1.xxy + r6.xyz;
    r6.xyz = r0.xzy * r6.xyz;
    r6.xyz = r6.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r6.xzy * r7.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
