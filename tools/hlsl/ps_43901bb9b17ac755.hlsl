// ps_43901bb9b17ac755.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 387 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000060C 10041700 0000080A 00000000 00007908 003F00FF 00000001 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c17); // float4
float4 LightMapScale : register(c18); // float3
float4 LowerSkyColor : register(c16); // float3
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 OpacityOverride : register(c14); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformScalar_7 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UpperSkyColor : register(c15); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
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
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
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

    ps = r1.x;
    r6.xy = UniformVector_1.xy * 1.7;
    ps = UniformScalar_0.x * ps;
    r7 = UniformVector_1.xyxy * float4(1.8, 1.8, 6.0, 6.0);
    r6.z = ps;
    ps = r1.y;
    r6.xy = r6.xy * r1.wz;
    ps = UniformScalar_0.x * ps;
    r7 = r7 * r1.wzwz;
    r6.w = ps;
    r18.xyz = tex2D(Texture2D_0, r6.zw).xyw;
    r23 = tex2D(Texture2D_3, r7.zw);
    r15 = tex2D(Texture2D_3, r6.xy);
    r0.zw = r1.wz * UniformScalar_5.xx;
    r12.xy = r1.xy * UniformScalar_2.xx;
    ps = -r1.z;
    r13.x = float((r1.w >= 0.5));
    ps = 1.0 + ps;
    r6.x = dot(r2.zxy, r2.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r9.y = float((r6.y >= 0.5));
    r6.x = ps;
    r11.xyz = r6.xxx * r2.xyz;
    ps = r23.w;
    r6.x = r11.z + 0.1;
    ps = r15.w * ps;
    r6.x = saturate(r6.x * 5.0);
    r6.z = ps;
    r13.yzw = -r6.yxz + float3(0.5, 1.0, 1.0);
    r6.x = r13.y - r1.z;
    r18.w = dot(r6.xx, r9.yy) - r1.z;
    r6.xw = r13.xw * float2(-0.5, 0.5);
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.x = r6.x + r1.w;
    r2.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r17.xw = r18.zw + float2(-1.0, 2.0);
    r2.y = ps;
    ps = r17.w;
    r2.xy = r2.xy * abs(r8.xy);
    ps = -r1.z + ps;
    r8.xz = r9.xy + r9.xy;
    r8.y = ps;
    r22.xyz = tex2D(Texture2D_7, r0.zw).xyz;
    r19.yzw = tex2D(Texture2D_5, r7.xy).xyz;
    r10 = tex2D(Texture2D_2, r8.xy);
    r0.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_6, r12.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r2.xy).xy;
    r1.xyz = tex2D(Texture2D_4, r12.xy).xyz;
    r21.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    r16.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r7.z = dot(r4.zxy, r4.zxy);
    r2.x = saturate(ps);
    ps = r3.w;
    r7.w = dot(r5.zxy, r5.zxy);
    ps = 0.0001 * ps;
    r14.xyz = -UniformVector_0.xyz + 1.0;
    r2.w = saturate(ps);
    r1.yzw = r1.zxy * 2.0 - 1.0;
    ps = r21.z + r21.z;
    r12.xy = r18.xy + r18.xy;
    r12.w = ps;
    r20.yz = r15.xy * 2.0 - 3.0;
    ps = r15.z;
    r7.x = dot(r9.zxy, float3(0.11, 0.3, 0.59));
    ps = r23.z + ps;
    r15.xyz = r7.xxx - r9.xyz;
    r20.x = ps;
    r20.xyz = r23.zxy * float3(1.0, 4.0, 4.0) + r20.xyz;
    r15.xyz = r15.xyz * UniformScalar_4.xxx + r9.xyz;
    ps = 0.875 * r6.x;
    r2.yz = r13.zz * ModShadowGroupColor.xy;
    r17.y = ps;
    ps = 0.875 * r6.y;
    r2 = -r2 + 1.0;
    r17.z = ps;
    ps = (-1.0) - -r6.z;
    r8.w = r2.w * UniformScalar_1.x;
    r20.w = ps;
    ps = r8.z;
    r9.xyz = r0.xyz * LightMapScale.xyz;
    ps = r13.x + ps;
    r0.xyw = r17.yzx * r2.yzw;
    r12.z = ps;
    ps = 0.125 + r0.x;
    r8.xyz = r14.xyz * AmbientColorAndSkyFactor.xyz;
    r17.x = ps;
    r6.y = (r12.z == 0.0) ? r10.x : r10.y;
    ps = 0.125 + r0.y;
    r13 = r12.yxzz + float4(-1.0, -1.0, -2.0, -3.0);
    r17.y = ps;
    r6.y = (r13.z == 0.0) ? r10.z : r6.y;
    ps = rsqrt(abs(r7.w));
    r7.xy = r8.ww * r13.xy;
    r6.z = ps;
    ps = (-2.0) + r7.y;
    r10.xyz = r6.zzz * r5.xyz;
    r5.x = ps;
    ps = r1.w;
    r13.xyz = r15.xyz * UniformVector_4.xyz;
    r0.z = (r13.w == 0.0) ? r10.w : r6.y;
    ps = r7.x + ps;
    r6.y = r1.z + r7.y;
    r1.x = ps;
    ps = UniformVector_3.x * r6.y;
    r7.w = max(r0.z, 0.0);
    r19.x = ps;
    ps = 1.0 - r0.z;
    r6.yz = r0.wz + float2(1.0, -0.75);
    r6.x = ps;
    ps = 2.5 * r6.x;
    r6.z = r6.z + r0.z;
    r5.z = ps;
    r6.y = (r8.w > 0.0) ? r6.y : 1.0;
    r6.y = (r8.w >= 0.0) ? r6.y : 1.0;
    ps = r6.z;
    r21.w = min(r7.w, 0.3);
    ps = r6.w + ps;
    r12.xyz = r21.xyw * float3(4.0, 4.0, 3.3333333);
    r6.x = saturate(ps);
    ps = r1.y;
    r21.yzw = r6.xxx * r19.yzw;
    r6.x = ps;
    ps = UniformVector_3.z * r6.x;
    r0 = r12.zzzz * r20;
    r19.y = ps;
    ps = UniformVector_3.y * r1.x;
    r20.yz = r0.yz + r0.yz;
    r19.z = ps;
    ps = r0.x;
    r6.xzw = r6.yyy * r22.yxz;
    r6.y = ps;
    ps = 0.1 * r6.y;
    r5.w = r0.w + 1.0;
    r20.x = ps;
    ps = UniformVector_4.x * r6.z;
    r0.xyz = r12.wxy + float3(-1.0, -2.0, -2.0);
    r21.x = ps;
    ps = UniformVector_4.y * r6.x;
    r1.xyz = r21.yzw * r18.zzz;
    r21.y = ps;
    ps = UniformVector_4.z * r6.w;
    r18.xyz = r13.xyz * r6.zxw;
    r21.z = ps;
    r13.xyz = r18.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r15.xyz = r21.xyz * r15.xyz - r1.xyz;
    ps = 0.5 * r0.x;
    r6.yzw = r18.xyz - r1.xyz;
    r18.x = ps;
    ps = abs(r5.w) * abs(r5.w);
    r18.yz = r0.yz + r7.yx;
    r5.y = ps;
    ps = r5.y * r5.y;
    r0.xyz = r20.yxz + r19.xyz;
    r17.z = ps;
    ps = r5.z * r5.w;
    r0.xyz = r0.yxz - r18.xyz;
    r17.w = ps;
    ps = (-2.0) + r7.x;
    r0.w = saturate(r17.w - 0.5);
    r5.y = ps;
    r15.xyz = r15.xyz * r0.www + r1.xyz;
    r5.xw = r0.yz * r0.ww + r5.xy;
    r6.x = r0.x * r0.w + r18.x;
    r0.xyz = r6.yzw * r0.www + r1.xyz;
    ps = rsqrt(abs(r7.z));
    r6.yz = r17.xz * r17.yz;
    r6.w = ps;
    r7.yzw = r6.yyy * r16.xyz + ModShadowColor.xyz;
    r8.xyz = r8.xyz * r0.xyz + UniformVector_0.xyz;
    ps = (-1.0) - -r6.x;
    r1.xyz = r6.www * r4.xyz;
    r6.x = ps;
    ps = r5.x;
    r7.x = float((r2.x >= 0.004));
    ps = r12.x + ps;
    r0.xyz = r0.xyz * r14.xyz;
    r6.y = ps;
    ps = r5.w;
    r5.xyz = r15.xyz * r14.xyz;
    ps = r12.y + ps;
    r2.xyz = r6.zzz * r13.xyz;
    r6.z = ps;
    r6.xyz = r6.xyz * r2.www;
    ps = 1.0 + r6.x;
    r6.w = ps;
    r6.xyz = (r2.www > 0.0) ? r6.yzw : float3(0.0, 0.0, 1.0);
    r6.yzw = (r2.www >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.x = dot(r6.wyz, r6.wyz);
    ps = rsqrt(abs(r6.x));
    r2.xyz = r2.xzy * r0.www;
    r6.x = ps;
    r6.xyw = r6.yzw * r6.xxx;
    r6.z = dot(r6.wxy, r1.zxy);
    r4.xyz = r6.xyw * r6.zzz;
    r1.xyz = r4.xyz * 2.0 - r1.xyz;
    r6.z = saturate(dot(r11.zxy, r1.zxy));
    ps = log2(r6.z);
    r1.x = dot(r10.zxy, r6.wxy);
    r1.y = ps;
    r6.xyz = r1.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r6.z);
    r6.xy = r6.yx + 0.5;
    r6.z = ps;
    ps = abs(r6.y) * abs(r6.y);
    r1.xyz = r9.xzy * r6.www;
    r6.y = ps;
    ps = abs(r6.x) * abs(r6.x);
    r4.xyz = r9.xzy * r6.zzz;
    r6.x = ps;
    r5.xyz = r5.xzy * r6.yyy;
    r6.xyz = r0.xzy * r6.xxx;
    r6.xyz = r6.xyz * UpperSkyColor.xzy + r8.xzy;
    r6.xyz = r5.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r4.xyz * r2.xyz + r6.xzy;
    r6.xyz = r1.xzy * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.x + r3.w;
    r6.xyz = r0.xyz * r7.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
