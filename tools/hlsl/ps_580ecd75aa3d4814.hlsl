// ps_580ecd75aa3d4814.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 432 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000006C0 10041700 0000080A 00000000 00007108 003F00FF 00000021 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c17); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_13 : register(c14); // float
float4 UniformScalar_14 : register(c15); // float
float4 UniformScalar_16 : register(c16); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
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

    ps = UniformScalar_16.x;
    r3.xy = r5.xy * ScreenPositionScaleBias.xy;
    ps = 0.05 * ps;
    r13.y = saturate(r5.w * 0.0001);
    r3.z = ps;
    ps = r5.w;
    r0.z = dot(r4.zxy, r4.zxy);
    ps = (-4e+02) + ps;
    r9.z = r2.z + 0.1;
    r9.y = ps;
    ps = rsqrt(abs(r0.z));
    r13.xz = saturate(r9.zy * float2(5.0, 0.00022222222));
    r0.z = ps;
    ps = 1.0 / r5.w;
    r10.xyz = r0.zzz * r4.xyz;
    r13.w = ps;
    r3.xyz = r3.xyz * r13.wwz;
    ps = UniformScalar_12.x - r7.w;
    r15.xyz = UniformVector_5.xzy * 2e+01;
    r10.w = ps;
    r12.xy = r10.xy * r3.zz + r1.wz;
    ps = -r1.z;
    r6 = r1.wzwz * float4(3.0, 3.0, 18.0, 18.0);
    ps = 1.0 + ps;
    r12.z = -r12.y + 1.0;
    r12.w = ps;
    r9.yzw = r12.wxz * UniformVector_1.yxy;
    ps = UniformVector_1.x * r1.w;
    r20.xyz = UniformVector_4.xzy * 2e+01;
    r9.x = ps;
    r4 = r9.wzxy - 0.5;
    r18 = float4((r9.xwyz >= 0.5));
    ps = r1.w + r1.w;
    r4 = r4 - r9.wzxy;
    r11.x = ps;
    r4 = r4.yxzw * r18.wyxz + r9.zwxy;
    ps = r1.z + r1.z;
    r9 = r4 + r4;
    r11.y = ps;
    r14 = tex2D(Texture2D_9, r1.xy);
    r23 = tex2D(Texture2D_4, r6.xy);
    r5.yzw = tex2D(Texture2D_4, r6.zw).xyw;
    r17 = tex2D(Texture2D_3, r9.zw);
    r4.yzw = tex2D(Texture2D_1, r11.xy).xyz;
    r19 = tex2D(Texture2D_6, r1.xy);
    r16 = tex2D(Texture2D_7, r1.xy);
    r6.yzw = tex2D(Texture2D_5, r1.xy).xyz;
    r6.x = float((UniformScalar_11.x >= 1.0));
    r1.xyz = r6.yzw * 2.0 - 1.0;
    ps = r16.x * r16.w;
    r2.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    r6.y = ps;
    ps = r16.z * r16.w;
    r19.xyz = r19.xzy * r19.www;
    r6.z = ps;
    ps = r16.y * r16.w;
    r21.xyz = r20.xyz * r19.xyz;
    r6.w = ps;
    r22.xyz = r15.xyz * r6.yzw;
    r15.xyz = (abs(r2.www) > 0.0) ? r21.xzy : r22.xzy;
    r6.w = dot(r15.zxy, float3(0.11, 0.3, 0.59));
    r6.x = r10.w * r6.x + r7.w;
    r6.yz = -r13.yx + 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = r6.w - r15.x;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.x = saturate(r6.w + r15.x);
    r0.w = ps;
    r13.xyz = r4.yzw + r4.yzw;
    ps = ModShadowGroupColor.x * r6.z;
    r16.xyz = r1.xyz * UniformVector_3.xyz;
    r4.y = ps;
    ps = -r6.x;
    r11.zw = r0.zw * abs(r8.xy);
    ps = r7.z + ps;
    r18.y = dot(r18.wyy, float3(1.0, 1.0, 1.0));
    r6.x = ps;
    ps = r6.x;
    r18.z = dot(r18.xzz, float3(1.0, 1.0, 1.0));
    r1.x = ps;
    r6.x = (r18.z == 0.0) ? r17.x : r17.y;
    ps = UniformScalar_13.x;
    r8 = r18.zzyy + float4(-2.0, -3.0, -3.0, -2.0);
    r1.y = ps;
    r6.x = (r8.x == 0.0) ? r17.z : r6.x;
    r6.x = (r8.y == 0.0) ? r17.w : r6.x;
    ps = max(r1.x, r1.y);
    r0.w = max(r6.x, 0.0);
    r0.z = ps;
    ps = 1.0 / UniformScalar_14.x;
    r1.xy = min(r0.wz, float2(0.3, 1.0));
    r6.w = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r4.w = saturate(r1.y * r6.w);
    r4.z = ps;
    r4 = -r4.wxyz + 1.0;
    r5.x = r4.x * r7.w;
    r0.zw = r5.wx * r23.wz;
    r16.w = float((r0.w >= 0.05));
    ps = ScreenPositionScaleBias.w + r3.x;
    r20.xw = -r16.zw + 1.0;
    r1.z = ps;
    r6.z = (UniformScalar_12.x > 0.0) ? r20.w : 1.0;
    r6.z = (UniformScalar_12.x >= 0.0) ? r6.z : r20.w;
    ps = ScreenPositionScaleBias.z + r3.y;
    r13.w = r6.z * r14.w;
    r1.w = ps;
    ps = r12.x + r12.x;
    r17 = r13 + float4(-1.0, -1.0, -1.0, -0.5);
    r6.z = ps;
    ps = r12.y + r12.y;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r17.wwww)) clip(-1.0);
    r6.w = ps;
    r8.xy = tex2D(ModShadowAccumTexture, r11.zw).xy;
    r19.xyz = tex2D(LightAttenuationTexture, r1.zw).xyz;
    r20.y = tex2D(ShadowTexture, r0.xy).x;
    r12 = tex2D(Texture2D_2, r11.xy);
    r11.xyz = tex2D(Texture2D_8, r6.zw).xyz;
    r9 = tex2D(Texture2D_3, r9.xy);
    r3.xyw = tex2D(Texture2D_0, r6.zw).xyz;
    r6.w = dot(r2.zxy, r2.zxy);
    r6.z = saturate(r7.w * 15.0);
    r13.xyz = r3.xyw * 2.0 - 1.0;
    r7.xyz = r14.xyz * UniformScalar_9.xxx + UniformScalar_10.xxx;
    r1.zw = r23.xy * 2.0 - 1.0;
    r21.xyz = (-abs(r2.www) >= 0.0) ? r22.yxz : r21.yxz;
    ps = r5.y + r5.y;
    r20.z = saturate(dot(r21.zxy, float3(0.59, 0.11, 0.3)));
    r18.x = ps;
    r0.xy = -r16.xy * r20.zz + r16.xy;
    r7.w = (r18.y == 0.0) ? r9.x : r9.y;
    r7.w = (r8.w == 0.0) ? r9.z : r7.w;
    r1.y = (r8.z == 0.0) ? r9.w : r7.w;
    ps = r5.z + r5.z;
    r1.x = r1.x * 3.3333333;
    r18.y = ps;
    ps = rsqrt(abs(r6.w));
    r5.xyz = r7.xyz * r4.yyy;
    r7.y = ps;
    ps = r1.y;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = ps;
    ps = 1.0 - r7.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.w = ps;
    ps = 1.0 - r1.x;
    r2.xyz = r7.yyy * r2.xyz;
    r2.w = ps;
    r6.w = dot(r6.zz, r6.ww) + r1.y;
    ps = 1.0 - r6.x;
    r18.z = r6.w + r1.y;
    r7.w = ps;
    ps = r6.z;
    r7.xyz = r18.xzy + float3(-1.0, 0.25, -1.0);
    ps = r2.w * ps;
    r6.w = saturate(r7.y - r0.z);
    r18.z = ps;
    ps = 0.5 * r7.x;
    r11.xyz = r6.www * r11.xyz;
    r18.x = ps;
    ps = 0.5 * r7.z;
    r8.zw = -r11.xy + r12.xy;
    r18.y = ps;
    ps = 1.0 - r6.z;
    r18.xyz = r1.zxw + r18.xzy;
    r7.z = ps;
    r11.xy = r8.zw * r12.ww + r11.xy;
    ps = 2.5 * r7.w;
    r6.xw = r20.yx * r20.yz;
    r7.y = ps;
    ps = (-1.0) - -r0.z;
    r1.xyz = r6.xxx * r19.xyz;
    r18.w = ps;
    r12.xy = r18.xy * r18.yz + r0.xy;
    r7.x = r18.w * r18.y + 1.0;
    r0.xy = r7.xy * r7.wx;
    ps = -r11.z;
    r6.xz = r0.xy * r7.zz;
    ps = r12.z + ps;
    r7.xzw = r17.zxy - r13.zxy;
    r7.y = ps;
    ps = r16.z;
    r0.x = float((r6.x >= 0.9));
    r0.xyz = r0.xxx * r15.xyz + r14.xyz;
    ps = r6.w + ps;
    r7 = r7.zwyx * r12.wwww;
    r12.z = ps;
    ps = (-0.5) + r6.z;
    r11.z = r11.z + r7.z;
    r0.w = saturate(ps);
    ps = r7.w;
    r7.xyz = r13.xyz + r7.xyw;
    r6.x = ps;
    ps = (-2.0) + r6.x;
    r12.xyz = -r7.xyz + r12.xyz;
    r7.w = ps;
    r7.xyz = r12.xyz * r0.www + r7.xyw;
    r0.xyz = r0.xyz - r11.xyz;
    r0.xyz = r0.xyz * r0.www + r11.xyz;
    r7.w = r3.w * 2.0 + r7.z;
    r7.xyz = r7.wxy * r6.yyy;
    ps = 1.0 + r7.x;
    r7.w = ps;
    r7.xyz = (r6.yyy > 0.0) ? r7.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r6.yyy >= 0.0) ? r7.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r7.xyz = r5.xyz * r0.www;
    r6.x = ps;
    r5.xyz = r6.yzw * r6.xxx;
    r6.x = dot(r5.zxy, r10.zxy);
    r6.xyz = r5.xyz * r6.xxx;
    r6.xyz = r6.xyz * 2.0 - r10.xyz;
    r6.x = saturate(dot(r2.zxy, r6.zxy));
    ps = log2(r6.x);
    r0.xyz = r0.xyz * r9.xyz;
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
    r7.y = r0.z * r6.w + r7.y;
    r7.xz = r0.xy * r6.ww + r7.xz;
    r7.xyz = r1.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
