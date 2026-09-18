// ps_a8e40e57b4d799ed.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 405 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000654 10041600 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c19); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c13); // float
float4 UniformScalar_11 : register(c14); // float
float4 UniformScalar_12 : register(c15); // float
float4 UniformScalar_13 : register(c16); // float
float4 UniformScalar_14 : register(c17); // float
float4 UniformScalar_16 : register(c18); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_8 : register(c11); // float
float4 UniformScalar_9 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 - r1.z;
    r6.xy = r1.xy * UniformVector_2.xy;
    r6.w = ps;
    r13.x = tex2D(Texture2D_6, r6.xy).x;
    r3.xy = r5.xy * ScreenPositionScaleBias.xy;
    ps = UniformScalar_16.x;
    r10 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    ps = 0.05 * ps;
    r0.z = r5.w - 4e+02;
    r3.z = ps;
    ps = r2.z;
    r6.z = UniformScalar_3.x * UniformVector_4.x;
    ps = 0.1 + ps;
    r2.w = r6.z * UniformScalar_4.x;
    r0.w = ps;
    ps = floor(r2.w);
    r6.z = dot(r4.zxy, r4.zxy);
    r9.w = ps;
    ps = rsqrt(abs(r6.z));
    r13.yz = saturate(r0.wz * float2(5.0, 0.00022222222));
    r6.z = ps;
    ps = 1.0 / r5.w;
    r9.xyz = r6.zzz * r4.xyz;
    r13.w = ps;
    ps = 1.0 / UniformScalar_1.x;
    r3.xyz = r3.xyz * r13.wwz;
    r3.w = ps;
    r4.xyw = r9.wxy * r3.wzz + r1.xwz;
    ps = 1.0 - r4.w;
    r11.x = r1.w * UniformVector_1.x;
    r6.z = ps;
    ps = UniformVector_1.x * r4.y;
    r11.yz = r6.wz * UniformVector_1.yy;
    r11.w = ps;
    r12 = r11.wzxy - 0.5;
    r18 = float4((r11.xwyz >= 0.5));
    r12 = r12 - r11.wzxy;
    r11 = r12 * r18.ywxz + r11.wzxy;
    r14 = r11 + r11;
    r20 = tex2D(Texture2D_4, r10.xy);
    r22.yzw = tex2D(Texture2D_4, r10.zw).xyw;
    r17 = tex2D(Texture2D_3, r14.zw);
    r12 = tex2D(Texture2D_9, r6.xy);
    r16.xyz = tex2D(Texture2D_5, r6.xy).xyz;
    r11.xy = r1.wz + r1.wz;
    ps = -r7.w;
    r6.y = float((UniformScalar_11.x >= 1.0));
    r10.xyz = r12.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    ps = UniformScalar_12.x + ps;
    r6.xw = -r13.xy + 1.0;
    r10.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r15 = r10 * r6.xxxy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = r15.w + r7.w;
    r0.w = ps;
    ps = -r6.x;
    r10.xy = r0.zw * abs(r8.xy);
    ps = r7.z + ps;
    r18.y = dot(r18.yww, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r6.x;
    r18.z = dot(r18.xzz, float3(1.0, 1.0, 1.0));
    r10.z = ps;
    r6.x = (r18.z == 0.0) ? r17.x : r17.y;
    ps = UniformScalar_13.x;
    r8 = r18.zzyy + float4(-2.0, -3.0, -3.0, -2.0);
    r10.w = ps;
    r6.x = (r8.x == 0.0) ? r17.z : r6.x;
    r6.x = (r8.y == 0.0) ? r17.w : r6.x;
    ps = max(r10.z, r10.w);
    r0.w = max(r6.x, 0.0);
    r0.z = ps;
    ps = 1.0 / UniformScalar_14.x;
    r0.zw = min(r0.zw, float2(1.0, 0.3));
    r6.z = ps;
    ps = r1.y;
    r6.z = saturate(r0.z * r6.z);
    ps = UniformScalar_8.x + ps;
    r6.z = -r6.z + 1.0;
    r4.z = ps;
    ps = r16.x + r16.x;
    r22.x = r6.z * r7.w;
    r16.x = ps;
    ps = r16.y + r16.y;
    r7.xy = r22.wx * r20.wz;
    r16.y = ps;
    ps = r16.z + r16.z;
    r6.z = float((r7.y >= 0.05));
    r16.z = ps;
    ps = ScreenPositionScaleBias.w + r3.x;
    r7.yz = -r6.zx + 1.0;
    r1.x = ps;
    r6.x = (UniformScalar_12.x > 0.0) ? r7.y : 1.0;
    r6.x = (UniformScalar_12.x >= 0.0) ? r6.x : r7.y;
    ps = ScreenPositionScaleBias.z + r3.y;
    r16.w = r6.x * r12.w;
    r1.y = ps;
    ps = r4.y + r4.y;
    r16 = r16 + float4(-1.0, -1.0, -1.0, -0.5);
    r6.x = ps;
    ps = r4.w + r4.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r16.wwww)) clip(-1.0);
    r6.z = ps;
    r8.xy = tex2D(ModShadowAccumTexture, r10.xy).xy;
    r10.xyz = tex2D(LightAttenuationTexture, r1.xy).xyz;
    r11.z = tex2D(ShadowTexture, r0.xy).x;
    r1.xyz = tex2D(Texture2D_8, r6.xz).xyz;
    r17 = tex2D(Texture2D_2, r11.xy);
    r21 = tex2D(Texture2D_3, r14.xy);
    r4 = tex2D(Texture2D_7, r4.xz);
    r0.xyz = tex2D(Texture2D_0, r6.xz).xyz;
    r11.xyw = tex2D(Texture2D_1, r11.xy).xyz;
    ps = r5.w;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r14.xyz = UniformVector_5.xyz * 2e+01;
    r18.x = saturate(ps);
    ps = r7.w;
    r6.x = dot(r2.zxy, r2.zxy);
    r11.xyw = r11.xyw * 2.0 - 1.0;
    ps = 15.0 * ps;
    r19.xyz = r0.xyz + r0.xyz;
    r18.w = saturate(ps);
    r20.zw = r20.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r5.xyz = r4.xyz * r4.www;
    r7.w = ps;
    r6.xz = r22.yz * 2.0 - 1.0;
    ps = 0.5 * r6.x;
    r4.xyz = r7.www * r2.xyz;
    r2.x = ps;
    r7.w = (r18.y == 0.0) ? r21.x : r21.y;
    r7.w = (r8.w == 0.0) ? r21.z : r7.w;
    r20.x = (r8.z == 0.0) ? r21.w : r7.w;
    ps = 0.5 * r6.z;
    r20.y = r0.w * 3.3333333;
    r2.y = ps;
    ps = ModShadowGroupColor.x * r6.w;
    r0.xy = -r20.xy + 1.0;
    r18.y = ps;
    ps = ModShadowGroupColor.y * r6.w;
    r2.z = r18.w * r0.y;
    r18.z = ps;
    r6.x = dot(r18.ww, r0.xx) + r20.x;
    ps = r6.x;
    r5.xyz = r14.xyz * r5.xyz;
    ps = r20.x + ps;
    r14.xyz = r20.zyw + r2.xzy;
    r19.w = ps;
    ps = (-1.0) - -r7.x;
    r6 = r19.wxyz + float4(0.25, -1.0, -1.0, -1.0);
    r14.w = ps;
    r7.w = r14.w * r14.y + 1.0;
    ps = r6.x;
    r2 = -r18.wxyz + 1.0;
    ps = -r7.x + ps;
    r11.xyw = r11.xyw - r6.yzw;
    r6.x = saturate(ps);
    r1.w = r11.w * r17.w - 2.0;
    r0.xyw = r11.xyw * r17.www + r6.yzw;
    r6.xyz = r6.xxx * r1.xyz;
    ps = 2.5 * r7.z;
    r1.xyz = -r6.xyz + r17.xyz;
    r7.x = ps;
    r1.xyz = r1.xyz * r17.www + r6.xyz;
    r6.xy = r7.wx * r7.zw;
    r7.w = float((r6.x >= 0.9));
    r11.w = saturate(r6.y * r2.x - 0.5);
    r6.xyz = r16.zxy * UniformVector_4.zxy;
    ps = (-1.0) - -r6.x;
    r7.xyz = r15.xyz * r11.www;
    r5.w = ps;
    r6.xy = r6.yz * r13.xx - r0.xy;
    r11.xy = r14.xy * r14.yz + r6.xy;
    r6 = r5 * r13.xxxx;
    r5.xyz = r6.xyz * r7.www + r12.xyz;
    ps = -r0.w;
    r6.xyz = r11.xyz * r11.wwz;
    ps = r6.w + ps;
    r0.xy = r0.xy + r6.xy;
    r6.x = ps;
    ps = 1.0 + r6.x;
    r5.xyz = r5.xyz - r1.xyz;
    r5.w = ps;
    r1 = r5 * r11.wwww + r1;
    r0.z = r0.z * 2.0 + r1.w;
    r0.xyw = r0.xyz * r2.yyy;
    ps = -UniformVector_0.x;
    r0.z = r0.w + 1.0;
    r0.xyz = (r2.yyy > 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    r5.xyz = (r2.yyy >= 0.0) ? r0.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r6.x = dot(r5.zxy, r5.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r0.xyz = r6.zzz * r10.xyz;
    r6.x = ps;
    ps = -UniformVector_0.y;
    r5.xyz = r5.xyz * r6.xxx;
    ps = 1.0 + ps;
    r6.x = dot(r5.zxy, r9.zxy);
    r6.z = ps;
    ps = -UniformVector_0.z;
    r10.xyz = r5.xyz * r6.xxx;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r4.zxy, r9.zxy));
    r6.w = ps;
    ps = log2(r6.x);
    r1.xyz = r1.xyz * r6.yzw;
    r8.z = ps;
    r6.xyz = r8.xyz * float3(0.875, 0.875, 15.0);
    ps = pow(2.0, r6.z);
    r6.w = saturate(dot(r5.zyx, r4.zyx));
    r6.z = ps;
    r6.xy = r6.xy * r2.zw + 0.125;
    ps = r6.x * r6.y;
    r7.xyz = r7.xyz * r6.zzz;
    r6.x = ps;
    r6.xyz = r6.xxx * r3.xyz + ModShadowColor.xyz;
    r7.xy = r1.xy * r6.ww + r7.xy;
    r7.z = r1.z * r6.w + r7.z;
    r7.xyz = r0.xyz * r7.xyz;
    r7.xyz = r7.xzy * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
