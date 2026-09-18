// ps_4b4d1fd3151880ae.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 435 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006CC 10041800 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c16); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_6 : register(c9); // float
float4 UniformScalar_7 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
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
    float4 r24 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = UniformScalar_13.x;
    r3.xy = r5.xy * ScreenPositionScaleBias.xy;
    ps = 0.05 * ps;
    r6.y = saturate(r5.w * 0.0001);
    r3.z = ps;
    ps = r5.w;
    r6.w = dot(r4.zxy, r4.zxy);
    ps = (-4e+02) + ps;
    r6.z = r2.z + 0.1;
    r6.x = ps;
    ps = rsqrt(abs(r6.w));
    r6.xz = saturate(r6.zx * float2(5.0, 0.00022222222));
    r6.w = ps;
    ps = 1.0 / r5.w;
    r10.xyz = r6.www * r4.xyz;
    r6.w = ps;
    ps = UniformScalar_9.x - r7.w;
    r12 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    r10.w = ps;
    ps = -r1.z;
    r3.xyz = r3.xyz * r6.wwz;
    r11.xy = r10.xy * r3.zz + r1.wz;
    ps = 1.0 + ps;
    r11.z = -r11.y + 1.0;
    r11.w = ps;
    r13.yzw = r11.wxz * UniformVector_1.yxy;
    ps = UniformVector_1.x * r1.w;
    r16.xyz = UniformVector_5.xzy * 2e+01;
    r13.x = ps;
    r4 = r13.wzxy - 0.5;
    r18 = float4((r13.wzxy >= 0.5));
    ps = r1.w + r1.w;
    r4 = r4 - r13.wzxy;
    r9.x = ps;
    r4 = r4.yxzw * r18.yxzw + r13.zwxy;
    ps = r1.z + r1.z;
    r13 = r4 + r4;
    r9.y = ps;
    r15 = tex2D(Texture2D_9, r1.xy);
    r24 = tex2D(Texture2D_4, r12.xy);
    r5.yzw = tex2D(Texture2D_4, r12.zw).xyw;
    r14 = tex2D(Texture2D_3, r13.zw);
    r4.yzw = tex2D(Texture2D_1, r9.xy).xyz;
    r17 = tex2D(Texture2D_6, r1.xy);
    r12 = tex2D(Texture2D_7, r1.xy).xzyw;
    r1.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r19.xyz = UniformVector_4.xzy * 2e+01;
    r2.w = ps;
    r1.yzw = r1.xyz * 2.0 - 1.0;
    ps = r12.x * r12.w;
    r0.z = float((UniformScalar_8.x >= 1.0));
    r12.x = ps;
    ps = r12.y * r12.w;
    r17.xyz = r17.xzy * r17.www;
    r12.y = ps;
    ps = r12.z * r12.w;
    r22.xyz = r19.xyz * r17.xyz;
    r12.z = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r23.xyz = r16.xyz * r12.xyz;
    r9.w = ps;
    r12.xyz = (abs(r9.www) > 0.0) ? r22.xzy : r23.xzy;
    r16.xyz = (abs(r2.www) > 0.0) ? r12.xyz : r23.xzy;
    r1.x = r10.w * r0.z + r7.w;
    r0.z = dot(r16.zxy, float3(0.11, 0.3, 0.59));
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = r0.z - r16.x;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.x = saturate(r0.w + r16.x);
    r0.w = ps;
    r12.xyz = r4.yzw + r4.yzw;
    ps = -r1.x;
    r17.xyz = r1.yzw * UniformVector_3.xyz;
    ps = r7.z + ps;
    r8.xy = r0.zw * abs(r8.xy);
    r0.z = ps;
    r0.w = max(r0.z, UniformScalar_10.x);
    ps = r6.x;
    r21.x = dot(r18.yxx, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = 1.0 - r6.x;
    r21.y = dot(r18.zww, float3(1.0, 1.0, 1.0));
    r6.z = ps;
    r0.z = (r21.y == 0.0) ? r14.x : r14.y;
    ps = 1.0 - r6.y;
    r18 = r21.yxxy + float4(-2.0, -3.0, -2.0, -3.0);
    r1.x = ps;
    r6.x = (r18.x == 0.0) ? r14.z : r0.z;
    r6.y = (r18.w == 0.0) ? r14.w : r6.x;
    ps = ModShadowGroupColor.x * r6.z;
    r0.z = max(r6.y, 0.0);
    r4.y = ps;
    ps = 1.0 / UniformScalar_11.x;
    r6.xw = min(r0.wz, float2(1.0, 0.3));
    r0.z = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r4.w = saturate(r6.x * r0.z);
    r4.z = ps;
    r4 = -r4.wxyz + 1.0;
    r5.x = r4.x * r7.w;
    r7.xy = r5.xw * r24.zw;
    r17.w = float((r7.x >= 0.05));
    ps = ScreenPositionScaleBias.w + r3.x;
    r19.xw = -r17.zw + 1.0;
    r1.y = ps;
    r6.z = (UniformScalar_9.x > 0.0) ? r19.w : 1.0;
    r6.z = (UniformScalar_9.x >= 0.0) ? r6.z : r19.w;
    ps = ScreenPositionScaleBias.z + r3.y;
    r12.w = r6.z * r15.w;
    r1.z = ps;
    ps = r11.x + r11.x;
    r14 = r12 + float4(-1.0, -1.0, -1.0, -0.5);
    r0.z = ps;
    ps = r11.y + r11.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r14.wwww)) clip(-1.0);
    r0.w = ps;
    r8.xy = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r12.xyz = tex2D(LightAttenuationTexture, r1.yz).xyz;
    r19.y = tex2D(ShadowTexture, r0.xy).x;
    r11 = tex2D(Texture2D_2, r9.xy);
    r9.xyz = tex2D(Texture2D_8, r0.zw).xyz;
    r20 = tex2D(Texture2D_3, r13.xy);
    r3.xyw = tex2D(Texture2D_0, r0.zw).xyz;
    r6.x = dot(r2.zxy, r2.zxy);
    r6.z = saturate(r7.w * 15.0);
    r13.xyz = r3.xyw * 2.0 - 1.0;
    r1.yzw = r15.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r0.zw = r24.xy * 2.0 - 1.0;
    r22.xyz = (-abs(r9.www) >= 0.0) ? r23.yxz : r22.yxz;
    r22.xyz = (-abs(r2.www) >= 0.0) ? r23.yxz : r22.xyz;
    ps = r5.y + r5.y;
    r19.z = saturate(dot(r22.zxy, float3(0.59, 0.11, 0.3)));
    r18.x = ps;
    r8.zw = -r17.xy * r19.zz + r17.xy;
    r7.z = (r21.x == 0.0) ? r20.x : r20.y;
    r7.z = (r18.z == 0.0) ? r20.z : r7.z;
    r0.y = (r18.y == 0.0) ? r20.w : r7.z;
    ps = r5.z + r5.z;
    r0.x = r6.w * 3.3333333;
    r18.y = ps;
    ps = rsqrt(abs(r6.x));
    r5.xyz = r1.yzw * r4.yyy;
    r6.w = ps;
    ps = r0.y;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r1.yzw = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 - r0.x;
    r2.xyz = r6.www * r2.xyz;
    r7.w = ps;
    r6.x = dot(r6.zz, r6.xx) + r0.y;
    ps = 1.0 - r6.y;
    r18.z = r6.x + r0.y;
    r7.z = ps;
    ps = r6.z;
    r6.xyw = r18.xzy + float3(-1.0, 0.25, -1.0);
    ps = r7.w * ps;
    r7.x = saturate(r6.y - r7.y);
    r18.z = ps;
    ps = 0.5 * r6.x;
    r9.xyz = r7.xxx * r9.xyz;
    r18.x = ps;
    ps = 0.5 * r6.w;
    r20.xy = -r9.xy + r11.xy;
    r18.y = ps;
    ps = 1.0 - r6.z;
    r18.xyz = r0.zxw + r18.xzy;
    r7.w = ps;
    r9.xy = r20.xy * r11.ww + r9.xy;
    ps = 2.5 * r7.z;
    r6.xz = r19.yx * r19.yz;
    r7.x = ps;
    ps = (-1.0) - -r7.y;
    r0.xyz = r6.xxx * r12.xyz;
    r18.w = ps;
    r12.xy = r18.xy * r18.yz + r8.zw;
    r7.y = r18.w * r18.y + 1.0;
    r6.yw = r7.yx * r7.zy;
    ps = -r9.z;
    r6.xy = r6.wy * r7.ww;
    ps = r11.z + ps;
    r14.xzw = r14.zxy - r13.zxy;
    r14.y = ps;
    ps = r17.z;
    r6.w = float((r6.y >= 0.9));
    r7.yzw = r6.www * r16.xyz + r15.xyz;
    ps = r6.z + ps;
    r11 = r14.zwyx * r11.wwww;
    r12.z = ps;
    ps = (-0.5) + r6.x;
    r9.z = r9.z + r11.z;
    r7.x = saturate(ps);
    ps = r11.w;
    r11.xyz = r13.xyz + r11.xyw;
    r6.x = ps;
    ps = (-2.0) + r6.x;
    r6.yzw = -r11.xyz + r12.xyz;
    r11.w = ps;
    r6.xyz = r6.yzw * r7.xxx + r11.xyw;
    r7.yzw = r7.yzw - r9.xyz;
    r9.xyz = r7.yzw * r7.xxx + r9.xyz;
    r6.w = r3.w * 2.0 + r6.z;
    r6.xyz = r6.wxy * r1.xxx;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r1.xxx > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r1.xxx >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r7.xyz = r5.xyz * r7.xxx;
    r6.x = ps;
    r5.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r5.zxy, r10.zxy);
    r6.xyz = r5.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r10.xyz;
    r6.x = saturate(dot(r2.zxy, r6.zxy));
    ps = log2(r6.x);
    r1.xyz = r9.xyz * r1.yzw;
    r8.z = ps;
    r6.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r6.z);
    r6.w = saturate(dot(r5.zyx, r2.zyx));
    r6.z = ps;
    r6.xy = r6.xy * r4.zw + 0.125;
    ps = r6.x * r6.y;
    r7.xyz = r7.xzy * r6.zzz;
    r6.x = ps;
    r6.xyz = r6.xxx * r3.xyz + ModShadowColor.xyz;
    r7.y = r1.z * r6.w + r7.y;
    r7.xz = r1.xy * r6.ww + r7.xz;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
