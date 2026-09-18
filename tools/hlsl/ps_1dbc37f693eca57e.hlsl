// ps_1dbc37f693eca57e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 327 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000051C 10041C00 0000090A 00000000 00008929 003F01FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c13); // float4
float4 LightMapScale : register(c14); // float3
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 OpacityOverride : register(c10); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_6 : register(c9); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UpperSkyColor : register(c11); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
samplerCUBE TextureCube_0 : register(s7);
sampler2D LightMapTexture : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
    float4 color2 : COLOR2; // r8
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
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
    float4 r6 = In.color0;
    float4 r7 = In.color1;
    float4 r8 = In.color2;
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
    float4 r25 = 0.0;
    float4 r26 = 0.0;
    float4 r27 = 0.0;
    float4 r28 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8.xzw = tex2D(Texture2D_0, r1.xy).xyz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r8.y = dot(r4.zxy, r4.zxy);
    r10.y = ps;
    r19.xyz = r8.xzw * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r13.xyz = -UniformVector_0.xyz + 1.0;
    r10.x = ps;
    ps = rsqrt(abs(r8.y));
    r8.x = dot(r19.zxy, r19.zxy);
    r8.y = ps;
    ps = rsqrt(abs(r8.x));
    r28.xyz = r8.yyy * r4.xyz;
    r8.x = ps;
    ps = r10.x;
    r25.xyz = r19.xyz * r8.xxx;
    ps = abs(r9.x) * ps;
    r8.x = dot(r25.zxy, r28.zxy);
    r0.z = ps;
    ps = r10.y;
    r8.xyz = r25.xzy * r8.xxx;
    r24.xyz = r8.xyz * 2.0 - r28.xzy;
    ps = abs(r9.y) * ps;
    r8 = xe_cube(r24.xzy);
    r0.w = ps;
    ps = 1.0 / abs(r8.z);
    r11.z = r8.w;
    r4.x = ps;
    r11.xy = r8.yx * r4.xx + 1.5;
    r4.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r21.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r9.yzw = tex2D(Texture2D_2, r1.xy).xyz;
    r27.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r16.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r10.xyz = tex2D(Texture2D_6, r1.xy).xyz;
    r11.xyz = texCUBE(TextureCube_0, xe_cube_dir(r11.xyz)).xyz;
    r17.xyz = tex2D(Texture2D_5, r1.xy).xyz;
    r8.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r8.w = dot(r5.zxy, r5.zxy);
    r0.xyz = UniformVector_1.xyz * UniformVector_1.www;
    r8.x = dot(r2.zxy, r2.zxy);
    r6 = r6.yxzw * 2.0 - 1.0;
    r20.xyz = r7.xyz * 2.0 - 1.0;
    ps = log2(abs(r17.x));
    r22.xy = r8.yz * 0.875;
    r14.x = ps;
    ps = log2(abs(r17.y));
    r7.z = dot(r20.zxy, r20.zxy);
    r14.y = ps;
    ps = log2(abs(r17.z));
    r7.y = dot(r6.zyx, r6.zyx);
    r14.z = ps;
    ps = rsqrt(abs(r8.x));
    r7.w = dot(r11.yzx, float3(0.59, 0.11, 0.3));
    r7.x = ps;
    ps = rsqrt(abs(r7.y));
    r8.xyz = r7.www * r17.xyz;
    r7.y = ps;
    r15.xyz = r0.xyz * r7.www - r8.xyz;
    ps = rsqrt(abs(r8.w));
    r26.xyz = r6.xyz * r7.yyy;
    r7.y = ps;
    ps = rsqrt(abs(r7.z));
    r23.xyz = r26.yxz * r19.zzz;
    r7.z = ps;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r0.yzw = r17.xyz * 0.01;
    r11.xyz = r10.xyz * 0.4;
    r10.xyz = r13.xyz * r17.xyz;
    r16.xyz = r16.xyz * LightMapScale.xyz;
    r1.xyz = r27.xyz * 0.8;
    r1.yzw = r1.xzy * UniformScalar_6.xxx;
    ps = r7.x;
    r27.xyz = r7.yyy * r5.xyz;
    ps = r2.x * ps;
    r14.xyw = r14.xyz * 0.3;
    r7.y = ps;
    ps = r7.x;
    r20.xyz = r20.xzy * r7.zzz;
    ps = r2.y * ps;
    r7.w = dot(r28.zxy, r19.zxy);
    r7.z = ps;
    ps = r7.x;
    r6.y = max(r7.w, 0.0);
    ps = r2.z * ps;
    r5.xyz = r26.zxy * r20.zxy;
    r7.x = ps;
    ps = 0.1 - -r7.x;
    r21.w = dot(r27.zxy, r25.zxy);
    r9.x = ps;
    r5.xyz = r26.xzy * r20.yxz - r5.xzy;
    ps = pow(2.0, r14.x);
    r6.xz = saturate(r9.xy * float2(5.0, 4.0));
    r2.x = ps;
    ps = pow(2.0, r14.y);
    r25.xyz = r16.xyz * r25.zzz;
    r2.y = ps;
    ps = pow(2.0, r14.w);
    r14.xyz = r25.xyz * r17.xyz;
    r2.z = ps;
    r8.xyz = r6.zzz * r15.yxz + r8.yxz;
    r2.xyz = saturate(r2.xyz - 0.2);
    r5.xyz = r5.xzy * r6.www;
    r15.xyz = r11.xzy * r2.xzy;
    r11 = r21.yzww * float4(0.8, 0.8, 0.5, -0.5);
    ps = OpacityOverride.x;
    r7.w = dot(r5.yxz, r5.yxz);
    r2.x = saturate(ps);
    ps = 0.8 * r8.y;
    r6.xz = -r6.yx + float2(0.9, 1.0);
    r8.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r4.w = saturate(dot(r7.xyz, r24.yxz));
    r2.y = ps;
    ps = rsqrt(abs(r7.w));
    r6.yw = r11.zw + 0.5;
    r7.x = ps;
    ps = abs(r6.y) * abs(r6.y);
    r8.yz = r11.xy * r8.xz;
    r6.y = ps;
    ps = abs(r6.w) * abs(r6.w);
    r7.xyz = r5.xzy * r7.xxx;
    r2.w = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r11.xyz = r10.xzy * r6.yyy;
    r2.z = ps;
    r6.yzw = r7.xzy * r19.yyy + r23.xzy;
    ps = r8.w;
    r7.xyw = -r2.yzx + 1.0;
    ps = r21.x * ps;
    r5.xy = r22.xy * r7.xy;
    r8.x = ps;
    r6.yzw = r20.xzy * r19.xxx + r6.ywz;
    ps = LocalToWorldMatrix[0].z * r6.y;
    r8.w = r6.z * LocalToWorldMatrix[1].z;
    r1.x = ps;
    ps = LocalToWorldMatrix[2].z * r6.w;
    r19 = r1.xywz + r8.wxyz;
    r0.x = ps;
    r19 = r19 + r0;
    r2.xyz = r9.yzw * 2.0 + r19.yzw;
    r2.xyz = r4.xyz * 2.0 + r2.xyz;
    ps = 0.5 * r19.x;
    r18.xyz = UniformVector_2.xyz * UniformVector_2.www;
    r5.z = ps;
    r2.xyz = r18.xzy * r17.xzy - r2.xzy;
    ps = log2(r4.w);
    r7.xyz = r5.zyx + float3(0.5, 0.125, 0.125);
    r6.y = ps;
    ps = log2(abs(r7.x));
    r7.z = r7.z * r7.y;
    r6.w = ps;
    r7.xyz = r7.zzz * r12.xyz + ModShadowColor.xyz;
    ps = 1.4285715 * r6.x;
    r6.yw = r6.wy * float2(0.8, 2e+01);
    r16.w = saturate(ps);
    ps = pow(2.0, r6.w);
    r12.xyz = r10.xzy * r2.www;
    r6.x = ps;
    ps = pow(2.0, r6.y);
    r6.w = float((r7.w >= 0.004));
    r6.y = ps;
    r5 = r16.xzyw * r6.xxxy;
    r6.xyz = r5.xyz * r15.xyz + UniformVector_0.xzy;
    r6.xyz = r14.xyz * r13.xyz + r6.xzy;
    r6.xyz = r12.xyz * LowerSkyColor.xzy + r6.xzy;
    r6.xyz = r11.xzy * UpperSkyColor.xyz + r6.xzy;
    r6.xyz = r10.xzy * AmbientColorAndSkyFactor.xzy + r6.xzy;
    r6.xyz = r5.www * r2.xzy + r6.xzy;
    r6.xyz = r6.xzy + r1.yzw;
    r6.xyz = r6.xzy + r8.xyz;
    r6.xyz = r6.xyz + r0.yzw;
    r6.xyz = r9.yzw * 2.0 + r6.xyz;
    r6.xyz = r4.xyz * 2.0 + r6.xyz;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
