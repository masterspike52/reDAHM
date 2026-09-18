// ps_6b49512eca239a81.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 258 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000408 10041500 0000090A 00000000 00009129 003F01FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c19); // float4
float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 LowerSkyColor : register(c18); // float3
float4 ModShadowAccumResolution : register(c22); // float2
float4 ModShadowColor : register(c20); // float3
float4 ModShadowGroupColor : register(c21); // float3
float4 OpacityOverride : register(c16); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_11 : register(c11); // float
float4 UniformScalar_12 : register(c12); // float
float4 UniformScalar_13 : register(c13); // float
float4 UniformScalar_14 : register(c14); // float
float4 UniformScalar_15 : register(c15); // float
float4 UniformScalar_8 : register(c10); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_3 : register(c9); // float4
float4 UpperSkyColor : register(c17); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord3 : TEXCOORD3; // r1
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
    float4 r1 = In.texcoord3;
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r0.xy + UniformVector_1.xy;
    r8.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.z = dot(r5.zxy, r5.zxy);
    r8.x = ps;
    r8.xy = r8.xy * abs(r9.xy);
    r9.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    r12.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r11.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r7.w = tex2D(Texture2D_4, r0.xy).w;
    r15.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r18.x = tex2D(Texture2D_2, r0.xy).w;
    r16.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r18.yzw = tex2D(Texture2D_5, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r20.xyz = r6.xyz * 2.0 - 1.0;
    r6.y = dot(r4.zxy, r4.zxy);
    r6.w = dot(r2.zxy, r2.zxy);
    r19.xyz = r8.zxy * 2.0 - 1.0;
    r13.xyw = r18.yzw * UniformScalar_8.xxx;
    r0.xy = r16.yz * UniformScalar_11.xx + r13.yw;
    ps = rsqrt(abs(r6.w));
    r6.xz = r18.zx * 3.0;
    r7.x = ps;
    ps = rsqrt(abs(r6.y));
    r17.z = r6.x * r15.y;
    r7.y = ps;
    r8.xyz = r7.www * float3(0.2, 3.0, 0.5);
    r6.xyw = r8.xzy * r15.xzy;
    ps = rsqrt(abs(r7.z));
    r6.w = r6.z * r6.w;
    r7.z = ps;
    ps = OpacityOverride.x;
    r10.xyw = -UniformVector_0.xyz + 1.0;
    r14.w = saturate(ps);
    ps = r7.x;
    r6.z = dot(r20.zxy, r20.zxy);
    ps = r2.x * ps;
    r5.yzw = r7.zzz * r5.xyz;
    r8.x = ps;
    ps = r7.x;
    r7.w = dot(r19.xyz, r19.xyz);
    ps = r2.y * ps;
    r4.xzw = r7.yyy * r4.zxy;
    r8.z = ps;
    ps = r7.x;
    r21 = r18.xyxw * float4(0.2, 0.2, 0.5, 0.5);
    ps = r2.z * ps;
    r14.x = max(r4.x, 0.0);
    r8.y = ps;
    ps = rsqrt(abs(r6.z));
    r17.xy = r21.yw * r15.xz;
    r7.x = ps;
    ps = 0.1 - -r8.y;
    r6.yz = r21.xz * r6.xy;
    r6.x = ps;
    ps = rsqrt(abs(r7.w));
    r7.xyz = r20.xyz * r7.xxx;
    r7.w = ps;
    ps = LocalToWorldMatrix[0].z * r7.x;
    r2.xyz = r19.xyz * r7.www;
    r5.x = ps;
    ps = LocalToWorldMatrix[1].z * r7.y;
    r4.y = dot(r5.wyz, r2.xyz);
    r17.w = ps;
    r5.yzw = r18.xxx * r15.xzy + r6.yzw;
    ps = 5.0 * r6.x;
    r6.z = dot(r2.xyz, r4.xzw);
    r6.y = saturate(ps);
    ps = 1.0 - r6.y;
    r15.xyz = r2.yzx * r6.zzz;
    r6.z = ps;
    r15.xyz = r15.xyz * 2.0 - r4.zwx;
    ps = ModShadowGroupColor.x * r6.z;
    r5 = r5.xzyw + r17.wyxz;
    r14.y = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r0.yz = r5.yw + r0.yx;
    r14.z = ps;
    r4.x = r7.z * LocalToWorldMatrix[2].z + r5.x;
    r2.yzw = r16.zxy * UniformScalar_11.xxx + r5.yzw;
    r6 = -r14 + float4(0.55, 1.0, 1.0, 1.0);
    r0.xw = r2.zw + r13.xy;
    r4.xyz = r4.yyx * float3(-0.5, 0.5, 0.5) + 0.5;
    ps = abs(r4.x) * abs(r4.x);
    r7 = r0 + r11.xzyy;
    r14.z = ps;
    r5.xyz = r7.xzy * UniformScalar_13.xxx + UniformScalar_14.xxx;
    ps = abs(r4.y) * abs(r4.y);
    r0 = r7.xzyw * r10.xywy;
    r14.w = ps;
    ps = log2(abs(r4.z));
    r4.xy = r0.xw * r14.zz;
    r12.x = ps;
    ps = r6.x;
    r10.xyz = UniformVector_3.xzy * UniformVector_3.www;
    r6.x = ps;
    ps = r2.y;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    ps = r13.w + ps;
    r2.xyz = r2.xxx * r1.xyz;
    r8.w = ps;
    ps = r8.w;
    r14.y = saturate(dot(r8.yxz, r15.zxy));
    ps = r11.z + ps;
    r6.w = float((r6.w >= 0.004));
    r8.w = ps;
    ps = r8.w;
    r8.xyz = r7.xyz * UniformScalar_15.xxx;
    ps = r10.w * ps;
    r7.xyz = r7.xyz * UniformScalar_12.xxx;
    r14.x = ps;
    r11.xyz = r5.xzy * UniformVector_2.xzy - r7.xyz;
    ps = r14.x * r14.z;
    r5.xyz = r0.xyz * r14.www;
    r4.z = ps;
    ps = r14.y * r14.y;
    r12.xyw = r12.yzx * float3(0.875, 0.875, 0.8);
    r4.w = ps;
    r12.yz = r12.xy * r6.yz + 0.125;
    ps = 2.2222223 * r6.x;
    r6.y = r4.w * r14.y;
    r12.x = saturate(ps);
    ps = pow(2.0, r12.w);
    r1.xyz = r6.yyy * r1.xzy;
    r12.w = ps;
    r12.xy = r12.xy * r12.wz;
    r6.xyz = r12.yyy * r13.xyz + ModShadowColor.xyz;
    r7.xyz = r12.xxx * r11.xyz + r7.xyz;
    r7.xyz = r10.xzy * r9.xyz + r7.xzy;
    r7.xyz = r7.xyz + UniformVector_0.xyz;
    r7.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + r7.xyz;
    r7.xyz = r5.xyz * UpperSkyColor.xyz + r7.xyz;
    r7.xyz = r4.xzy * LowerSkyColor.xzy + r7.xzy;
    r7.xyz = r1.xzy * r8.xzy + r7.xzy;
    r7.xyz = r2.xzy * r0.xzy + r7.xzy;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xyz;
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
