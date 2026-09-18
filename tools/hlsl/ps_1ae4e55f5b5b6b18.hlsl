// ps_1ae4e55f5b5b6b18.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 435 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006CC 10041700 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c19); // float4
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c16); // float
float4 UniformScalar_11 : register(c17); // float
float4 UniformScalar_13 : register(c18); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformScalar_8 : register(c14); // float
float4 UniformScalar_9 : register(c15); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
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

    r12.y = UniformScalar_2.x * UniformVector_5.y;
    r0.w = UniformVector_5.y * UniformScalar_5.x;
    ps = UniformScalar_13.x;
    r6.y = r2.z + 0.1;
    ps = 0.05 * ps;
    r6.z = UniformScalar_1.x * UniformVector_3.x;
    r6.w = ps;
    ps = r5.w;
    r7.y = UniformVector_3.x * UniformScalar_4.x;
    ps = (-4e+02) + ps;
    r7.x = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r7.x));
    r0.z = r7.y * UniformVector_5.x;
    r7.y = ps;
    ps = 5.0 * r6.y;
    r11 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r7.x = saturate(ps);
    ps = 0.00022222222 * r6.x;
    r10.xyz = r7.yyy * r4.xyz;
    r7.y = saturate(ps);
    r6.x = r6.w * r7.y;
    ps = UniformVector_5.x * r6.z;
    r12.zw = r10.xy * r6.xx;
    r12.x = ps;
    r12 = r12 + r1.xywz;
    ps = r12.z;
    r9.x = -r12.w + 1.0;
    r6.y = ps;
    ps = 1.0 - r1.z;
    r16.w = -r7.w + UniformScalar_9.x;
    r9.y = ps;
    ps = UniformVector_1.x * r6.y;
    r13.zw = r9.xy * UniformVector_1.yy;
    r13.x = ps;
    ps = UniformVector_1.x * r1.w;
    r20.w = saturate(r5.w * 0.0001);
    r13.y = ps;
    ps = r0.z;
    r4 = r13.xzwy - 0.5;
    ps = r1.x + ps;
    r9 = float4((r13.wzyx >= 0.5));
    r6.x = ps;
    ps = r0.w;
    r4 = r4 - r13.xzwy;
    r4 = r4 * r9.wyxz + r13.xzwy;
    ps = r1.y + ps;
    r18 = r4.xywz + r4.xywz;
    r6.y = ps;
    r23 = tex2D(Texture2D_4, r11.xy);
    r4 = tex2D(Texture2D_3, r18.zw);
    r20.y = tex2D(ShadowTexture, r0.xy).x;
    r14 = tex2D(Texture2D_6, r12.xy);
    r0 = tex2D(Texture2D_7, r6.xy);
    r6.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r13 = tex2D(Texture2D_9, r1.xy);
    r15.yzw = tex2D(Texture2D_4, r11.zw).xyw;
    r17.w = saturate(r7.w * 15.0);
    r11.xyw = UniformVector_4.xyz * 2e+01;
    r11.z = float((UniformScalar_8.x >= 1.0));
    ps = 1.0 / r5.w;
    r16.xy = r5.xy * ScreenPositionScaleBias.xy;
    r6.w = ps;
    r19.xy = r16.xy * r6.ww + ScreenPositionScaleBias.wz;
    r16.xyz = r13.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r6.xyz = r6.zxy * 2.0 - 1.0;
    r0.xyz = r0.xyz * r0.www;
    r0.xyz = r14.xyz * r14.www + r0.xyz;
    ps = UniformVector_3.x * r6.y;
    r14.xyz = r11.xyw * r0.xyz;
    r0.y = ps;
    ps = UniformVector_3.y * r6.z;
    r6.w = dot(r14.zxy, float3(0.11, 0.3, 0.59));
    r0.z = ps;
    ps = UniformVector_3.z * r6.x;
    r6.w = r6.w - r14.x;
    r0.x = ps;
    ps = 1.0 - r0.x;
    r20.z = saturate(r6.w + r14.x);
    r20.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r11.xy = -r20.zw + 1.0;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5 = r16 * r11.xxxz;
    r6.y = ps;
    ps = r5.w;
    r12.xy = r6.xy * abs(r8.xy);
    ps = r7.w + ps;
    r22.x = dot(r9.wyy, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r1.w + r1.w;
    r6.x = -r6.x + r7.z;
    r9.y = ps;
    ps = r6.x;
    r22.y = dot(r9.zxx, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    r6.y = (r22.y == 0.0) ? r4.x : r4.y;
    ps = UniformScalar_10.x;
    r16 = r22.xxyy + float4(-3.0, -2.0, -2.0, -3.0);
    r6.z = ps;
    r6.y = (r16.z == 0.0) ? r4.z : r6.y;
    r7.z = (r16.w == 0.0) ? r4.w : r6.y;
    ps = max(r6.x, r6.z);
    r6.y = max(r7.z, 0.0);
    r6.x = ps;
    ps = 1.0 / UniformScalar_11.x;
    r9.xw = min(r6.xy, float2(1.0, 0.3));
    r6.x = ps;
    ps = r1.z + r1.z;
    r6.x = saturate(r9.x * r6.x);
    r9.z = ps;
    ps = 1.0 - r7.z;
    r6.x = -r6.x + 1.0;
    r6.z = ps;
    ps = 1.0 - r7.x;
    r15.x = r6.x * r7.w;
    r6.w = ps;
    ps = ModShadowGroupColor.x * r6.w;
    r7.xy = r15.wx * r23.wz;
    r17.y = ps;
    ps = ModShadowGroupColor.y * r6.w;
    r17.x = float((r7.y >= 0.05));
    r17.z = ps;
    ps = r15.y + r15.y;
    r4 = -r17.wxyz + 1.0;
    r1.x = ps;
    r6.x = (UniformScalar_9.x > 0.0) ? r4.y : 1.0;
    r6.x = (UniformScalar_9.x >= 0.0) ? r6.x : r4.y;
    ps = r15.z + r15.z;
    r1.z = r6.x * r13.w;
    r1.y = ps;
    ps = r12.z + r12.z;
    r8.xzw = r1.zxy + float3(-0.5, -1.0, -1.0);
    r6.x = ps;
    ps = r12.w + r12.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r8.xxxx)) clip(-1.0);
    r6.y = ps;
    r8.xy = tex2D(ModShadowAccumTexture, r12.xy).xy;
    r12.xyw = tex2D(Texture2D_8, r6.xy).xyz;
    r15 = tex2D(Texture2D_2, r9.yz);
    r19.xyz = tex2D(LightAttenuationTexture, r19.xy).xyz;
    r21 = tex2D(Texture2D_3, r18.xy);
    r18.xyz = tex2D(Texture2D_1, r9.yz).xyz;
    r1.xyw = tex2D(Texture2D_0, r6.xy).xyz;
    r6.y = dot(r2.zxy, r2.zxy);
    r6.x = dot(r3.zxy, r3.zxy);
    r9.xyz = r1.xyw * 2.0 - 1.0;
    r16.zw = r23.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.y));
    r6.x = saturate(-r6.x + 1.0);
    r6.y = ps;
    ps = log2(r6.x);
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r18.xyz = r18.xyz + r18.xyz;
    r6.x = ps;
    r7.zw = -r0.yz * r20.zz + r0.yz;
    ps = r20.x * r20.z;
    r3.xyz = r6.yyy * r2.xyz;
    r6.y = ps;
    r0.w = (r22.x == 0.0) ? r21.x : r21.y;
    r0.w = (r16.y == 0.0) ? r21.z : r0.w;
    r16.x = (r16.x == 0.0) ? r21.w : r0.w;
    ps = r20.y * r20.y;
    r16.y = r9.w * 3.3333333;
    r0.w = ps;
    ps = r0.x;
    r2.xw = -r16.xy + 1.0;
    r0.x = dot(r17.ww, r2.xx) + r16.x;
    ps = r6.y + ps;
    r18.w = r0.x + r16.x;
    r12.z = ps;
    ps = 2.5 * r6.z;
    r18 = r18 + float4(-1.0, -1.0, -1.0, 0.25);
    r6.y = ps;
    ps = r18.w;
    r0.xyz = r0.www * r19.xyz;
    ps = -r7.x + ps;
    r18.xyz = r18.xyz - r9.xyz;
    r0.w = saturate(ps);
    r9.w = r18.z * r15.w - 2.0;
    r9.xyz = r18.xyz * r15.www + r9.xyz;
    ps = r17.w;
    r2.xyz = r0.www * r12.xyw;
    ps = r2.w * ps;
    r17.xyz = -r2.xyz + r15.xyz;
    r12.w = ps;
    r2.xyz = r17.xyz * r15.www + r2.xyz;
    ps = (-1.0) - -r7.x;
    r12.xy = r8.zw * 0.5;
    r15.w = ps;
    ps = pow(2.0, r6.x);
    r15.xyz = r16.zyw + r12.xwy;
    r7.x = ps;
    r12.xy = r15.xy * r15.yz + r7.zw;
    r6.x = r15.w * r15.y + 1.0;
    ps = r6.x * r6.z;
    r0.xyz = r0.xzy * r7.xxx;
    r7.x = ps;
    ps = r6.y * r6.x;
    r12.xyz = -r9.xyz + r12.xyz;
    r7.y = ps;
    r6.xy = r7.yx * r4.xx;
    ps = (-0.5) + r6.x;
    r6.z = float((r6.y >= 0.9));
    r7.x = saturate(ps);
    r7.yzw = r14.xyz * r6.zzz + r13.xyz;
    r6.xyz = r12.xyz * r7.xxx + r9.xyw;
    r6.w = r1.w * 2.0 + r6.z;
    r7.yzw = r7.yzw - r2.xyz;
    r9.xyz = r7.yzw * r7.xxx + r2.xyz;
    r6.xyz = r6.wxy * r11.yyy;
    ps = 1.0 + r6.x;
    r2.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    r6.xyz = (r11.yyy > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r11.yyy >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r7.xyz = r5.xyz * r7.xxx;
    r6.x = ps;
    r5.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r5.zxy, r10.zxy);
    r6.xyz = r5.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r10.xyz;
    r6.x = saturate(dot(r3.zxy, r6.zxy));
    ps = log2(r6.x);
    r1.xyz = r9.xyz * r1.xyz;
    r8.z = ps;
    r6.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r6.z);
    r6.w = saturate(dot(r5.zyx, r3.zyx));
    r6.z = ps;
    r6.xy = r6.xy * r4.zw + 0.125;
    ps = r6.x * r6.y;
    r7.xyz = r7.xyz * r6.zzz;
    r6.x = ps;
    r6.xyz = r6.xxx * r2.xyz + ModShadowColor.xyz;
    r7.xy = r1.xy * r6.ww + r7.xy;
    r7.z = r1.z * r6.w + r7.z;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r6.xyz = r7.xzy * r6.xzy;
    oC0.xyz = r6.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
