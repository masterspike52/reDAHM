// ps_db3f45a893eef497.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 438 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006D8 10041700 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_15 : register(c13); // float
float4 UniformScalar_16 : register(c14); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_20 : register(c18); // float
float4 UniformScalar_22 : register(c19); // float
float4 UniformScalar_3 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
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

    ps = UniformScalar_18.x - r7.w;
    r13.w = ps;
    ps = UniformScalar_22.x;
    r6.zw = r1.wz - r1.xy;
    ps = 0.05 * ps;
    r11 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r13.x = ps;
    ps = r5.w;
    r13.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = (-4e+02) + ps;
    r10.z = float((UniformScalar_17.x >= 1.0));
    r6.y = ps;
    ps = 0.00022222222 * r6.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r10.x = saturate(ps);
    ps = rsqrt(abs(r6.x));
    r6.zw = r6.zw * UniformScalar_6.xx;
    r6.x = ps;
    ps = 1.0 / r5.w;
    r9.xyz = r6.xxx * r4.xyz;
    r10.y = ps;
    r10 = r13 * r10.xyyz;
    ps = -r1.z;
    r6.xy = r9.xy * r10.xx;
    ps = 1.0 + ps;
    r15 = r6.xzwy + r1.wxyz;
    r6.z = ps;
    ps = r15.x;
    r6.x = -r15.w + 1.0;
    r6.y = ps;
    ps = UniformVector_1.x * r6.y;
    r12.yz = r6.zx * UniformVector_1.yy;
    r12.w = ps;
    ps = UniformVector_1.x * r1.w;
    r0.z = r10.w + r7.w;
    r12.x = ps;
    r6 = r12.wzxy - 0.5;
    r4 = float4((r12.wzxy >= 0.5));
    r6 = r6 - r12.wzxy;
    r6 = r6 * r4 + r12.wzxy;
    r6 = r6.zxwy + r6.zxwy;
    r16 = tex2D(Texture2D_4, r11.xy);
    r12 = tex2D(Texture2D_3, r6.xz);
    r13.yzw = tex2D(Texture2D_4, r11.zw).xyw;
    ps = -r0.z;
    r11.xy = r10.yz + ScreenPositionScaleBias.wz;
    ps = r7.z + ps;
    r11.z = dot(r4.xyy, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    ps = r0.z;
    r11.w = dot(r4.zww, float3(1.0, 1.0, 1.0));
    r4.x = ps;
    r0.z = (r11.w == 0.0) ? r12.x : r12.y;
    ps = UniformScalar_19.x;
    r10 = r11.zwwz + float4(-3.0, -2.0, -3.0, -2.0);
    r4.y = ps;
    r0.z = (r10.y == 0.0) ? r12.z : r0.z;
    r6.z = (r10.z == 0.0) ? r12.w : r0.z;
    ps = max(r4.x, r4.y);
    r0.z = max(r6.z, 0.0);
    r0.w = ps;
    ps = 1.0 / UniformScalar_20.x;
    r0.zw = min(r0.zw, float2(0.3, 1.0));
    r2.w = ps;
    r6.x = saturate(r0.w * r2.w);
    ps = 1.0 - r6.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r2.w = ps;
    ps = r7.w;
    r13.x = r2.w * r7.w;
    ps = 15.0 * ps;
    r7.xy = r13.wx * r16.wz;
    r20.x = saturate(ps);
    ps = r13.y + r13.y;
    r20.y = float((r7.y >= 0.05));
    r12.x = ps;
    ps = r13.z + r13.z;
    r7.zw = -r20.xy + 1.0;
    r12.y = ps;
    r2.w = (UniformScalar_18.x > 0.0) ? r7.w : 1.0;
    r12.z = (UniformScalar_18.x >= 0.0) ? r2.w : r7.w;
    r13.xyz = r12.xyz + float3(-1.0, -1.0, -0.5);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r13.zzzz)) clip(-1.0);
    r12.xyz = tex2D(LightAttenuationTexture, r11.xy).xyz;
    r0.w = tex2D(ShadowTexture, r0.xy).x;
    r14 = tex2D(Texture2D_3, r6.yw);
    r6.x = dot(r3.zxy, r3.zxy);
    r19.zw = r16.xy * 2.0 - 1.0;
    ps = r1.w + r1.w;
    r6.x = saturate(-r6.x + 1.0);
    r11.x = ps;
    ps = log2(r6.x);
    r3.w = UniformScalar_1.x * UniformVector_3.x;
    r6.x = ps;
    ps = r1.z + r1.z;
    r10.yz = r15.xw + r15.xw;
    r11.y = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r6.yw = r15.yz * UniformVector_5.xy;
    r6.x = ps;
    r0.x = (r11.z == 0.0) ? r14.x : r14.y;
    r0.x = (r10.w == 0.0) ? r14.z : r0.x;
    r19.x = (r10.x == 0.0) ? r14.w : r0.x;
    ps = 1.0 / ModShadowAccumResolution.x;
    r19.y = r0.z * 3.3333333;
    r0.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r10.xw = -r19.yx + 1.0;
    r0.y = ps;
    ps = r20.x;
    r11.zw = r0.xy * abs(r8.xy);
    ps = r10.x * ps;
    r0.xy = r13.xy * 0.5;
    r0.z = ps;
    ps = (-1.0) - -r7.x;
    r8.xyz = r19.zyw + r0.xzy;
    r8.w = ps;
    ps = 1.0 - r6.z;
    r8.xzw = r8.wxy * r8.yyz;
    r0.x = ps;
    ps = 2.5 * r0.x;
    r0.y = r8.x + 1.0;
    r0.z = ps;
    ps = 1.0 / UniformScalar_2.x;
    r14.xyz = r0.wyz * r0.wxy;
    r6.z = ps;
    ps = pow(2.0, r6.x);
    r3.xyz = r14.xxx * r12.xyz;
    r6.x = ps;
    ps = UniformVector_6.y + r6.w;
    r3 = r3.xzyw * r6.xxxz;
    r6.z = ps;
    r6.x = r3.w * UniformScalar_3.x + r6.y;
    r8.xy = tex2D(ModShadowAccumTexture, r11.zw).xy;
    r17 = tex2D(Texture2D_2, r11.xy);
    r16.xyz = tex2D(Texture2D_8, r10.yz).xyz;
    r22.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r23 = tex2D(Texture2D_7, r6.xz);
    r18.xyz = tex2D(Texture2D_1, r11.xy).xyz;
    r11.xyz = tex2D(Texture2D_0, r10.yz).xyz;
    r12 = tex2D(Texture2D_6, r1.xy).wxyz;
    ps = r2.z;
    r13.xyz = -UniformVector_0.xyz + 1.0;
    ps = 0.1 + ps;
    r21.xyz = UniformVector_4.xyz * 2e+01;
    r6.x = ps;
    r10.xyz = r12.yzw * UniformScalar_15.xxx + UniformScalar_16.xxx;
    r15.xyz = r11.xyz * 2.0 - 1.0;
    ps = 5.0 * r6.x;
    r6.w = -r12.x + 1.0;
    r0.x = saturate(ps);
    ps = r18.x + r18.x;
    r6.x = dot(r2.zxy, r2.zxy);
    r1.x = ps;
    ps = rsqrt(abs(r6.x));
    r1.yzw = r23.xyz * r23.www;
    r0.y = ps;
    r6.xyz = r22.zxy * 2.0 - 1.0;
    ps = UniformVector_3.x * r6.y;
    r2.xyz = r0.yyy * r2.xyz;
    r0.y = ps;
    ps = UniformVector_3.y * r6.z;
    r1.yzw = r21.xyz * r1.yzw;
    r0.z = ps;
    ps = UniformVector_3.z * r6.x;
    r21 = r1.yyzw * float4(0.3, 1.0, 1.0, 1.0);
    r0.w = ps;
    r16.w = dot(r21.yx, r6.ww) + 0.0;
    ps = r18.y + r18.y;
    r11.xyw = r21.yzw * r6.www;
    r1.y = ps;
    r14.x = dot(r11.wy, float2(0.11, 0.59)) + 0.0;
    r6.x = dot(r20.xx, r10.ww) + r19.x;
    ps = r18.z + r18.z;
    r1.w = r6.x + r19.x;
    r1.z = ps;
    ps = r5.w;
    r1 = r1 + float4(-1.0, -1.0, -1.0, 0.25);
    ps = 0.0001 * ps;
    r6.x = saturate(r1.w - r7.x);
    r12.x = saturate(ps);
    ps = r0.w;
    r6.yzw = r6.xxx * r16.xzy;
    r6.x = ps;
    ps = -r6.z;
    r1.xzw = r1.zxy - r15.zxy;
    ps = r17.z + ps;
    r7.xy = -r6.yw + r17.xy;
    r1.y = ps;
    r16.xy = r7.xy * r17.ww + r6.yw;
    ps = 1.0 - r6.x;
    r1 = r1.zwyx * r17.wwww;
    r6.w = ps;
    ps = r6.z;
    r6.xy = r14.zy * r7.zz;
    ps = r1.z + ps;
    r6.z = float((r6.y >= 0.9));
    r16.z = ps;
    r7.xyz = r11.xyw * r6.zzz + r12.yzw;
    ps = (-0.5) + r6.x;
    r7.yzw = r7.xyz - r16.xyz;
    r7.x = saturate(ps);
    ps = 1.0 - r0.x;
    r14.yzw = r7.yzw * r7.xxx;
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r14 = r16.wxyz + r14;
    r12.y = ps;
    ps = r14.x;
    r5.xyz = r15.xyz + r1.xyw;
    ps = -r11.x + ps;
    r1.xyz = r14.yzw * r13.xyz;
    r12.w = saturate(ps);
    r7.w = r6.w * r12.w + r0.w;
    r6.xy = -r0.yz * r12.ww + r0.yz;
    ps = ModShadowGroupColor.y * r6.z;
    r7.yz = r6.xy + r8.zw;
    r12.z = ps;
    ps = r1.w;
    r0 = -r12.wxyz + 1.0;
    r6.x = ps;
    ps = (-2.0) + r6.x;
    r6.yzw = -r5.xyz + r7.yzw;
    r5.w = ps;
    r6.xyz = r6.yzw * r7.xxx + r5.xyw;
    r6.w = r11.z * 2.0 + r6.z;
    r6.xyz = r6.wxy * r0.yyy;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r0.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r7.yzw = (r0.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r7.wyz, r7.wyz);
    ps = rsqrt(abs(r6.x));
    r6.yzw = r10.xyz * r0.xxx;
    r6.x = ps;
    r5.xyz = r7.yzw * r6.xxx;
    r6.x = dot(r5.zxy, r9.zxy);
    r7.yzw = r5.xyz * r6.xxx;
    r7.yzw = r7.yzw * 2.0 - r9.xyz;
    r6.x = saturate(dot(r2.zxy, r7.wyz));
    ps = log2(r6.x);
    r7.xyz = r6.yzw * r7.xxx;
    r8.z = ps;
    r6.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r6.z);
    r6.w = saturate(dot(r5.zyx, r2.zyx));
    r6.z = ps;
    r6.xy = r6.xy * r0.zw + 0.125;
    ps = r6.x * r6.y;
    r7.xyz = r7.xyz * r6.zzz;
    r6.x = ps;
    r6.xyz = r6.xxx * r4.xyz + ModShadowColor.xyz;
    r7.xy = r1.xy * r6.ww + r7.xy;
    r7.z = r1.z * r6.w + r7.z;
    r7.xyz = r3.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
