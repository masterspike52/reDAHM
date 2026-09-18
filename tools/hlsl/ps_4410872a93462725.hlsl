// ps_4410872a93462725.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000360 10040E00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_21 : register(c7); // float
float4 UniformScalar_22 : register(c8); // float
float4 UniformScalar_23 : register(c9); // float
float4 UniformScalar_24 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_8 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ShadowTexture : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r6.xx * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r6.zw = r6.zw * r5.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r10.y = tex2D(ShadowTexture, r0.xy).x;
    r8.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r12.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r7.xyz = tex2D(Texture2D_1, r1.xy).zxy;
    r3.xyw = tex2D(Texture2D_0, r1.xy).xyz;
    r10.xzw = tex2D(Texture2D_4, r1.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = UniformVector_2.x * UniformVector_2.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r0.x = ps;
    ps = UniformVector_2.z * UniformVector_2.z;
    r7.w = dot(r2.zxy, r2.zxy);
    r0.y = ps;
    ps = UniformScalar_22.x;
    r6.z = dot(r4.zxy, r4.zxy);
    ps = -UniformScalar_21.x + ps;
    r6.w = r2.z + 0.1;
    r14.z = ps;
    ps = 0.875 * r6.x;
    r11.xyz = r10.xzw + r10.xzw;
    r13.z = ps;
    r10.xzw = r3.xwy * 2.0 - 1.0;
    ps = r7.x + r7.x;
    r6.x = dot(r12.zxy, float3(1.0, 1.0, 1.0));
    r13.w = ps;
    ps = 4.0 * r7.y;
    r6.w = saturate(r6.w * 5.0);
    r13.x = ps;
    ps = 4.0 * r7.z;
    r6.w = -r6.w + 1.0;
    r13.y = ps;
    r12.zw = -r6.ww * ModShadowGroupColor.xy + 1.0;
    ps = 0.875 * r6.y;
    r7.xyz = r13.yxw + float3(-2.0, -2.0, -1.0);
    r13.w = ps;
    ps = 1.0 - r6.x;
    r11.w = r7.x - r10.w;
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r14.xy = r7.yz - r10.xz;
    r0.w = ps;
    ps = rsqrt(abs(r7.w));
    r6.xyz = r14.xyz * UniformScalar_0.xxx;
    r7.w = ps;
    ps = UniformScalar_21.x + r6.z;
    r7.xyz = r8.xyz * UniformVector_8.xyz;
    r0.z = ps;
    ps = (-2.0) + r6.y;
    r3.xyz = r7.www * r2.xyz;
    r7.w = ps;
    ps = r10.x;
    r8.xyz = r0.www * r4.xyz;
    r7.w = r3.w * 2.0 + r7.w;
    ps = r6.x + ps;
    r7 = r7 * r6.wwww;
    r12.x = ps;
    r11.xyz = r7.xyz * r11.xyz - r7.xyz;
    r12.y = r11.w * UniformScalar_0.x + r10.w;
    r4.xyz = r11.xyz * UniformScalar_0.xxx + r7.xyz;
    ps = r7.w;
    r11.xyz = r4.xyz * r0.zzz;
    r6.x = ps;
    ps = 1.0 + r6.x;
    r6.yz = r12.xy * r6.ww;
    r6.x = ps;
    ps = UniformScalar_23.x * r6.w;
    r13.xy = r0.xy * r6.wx;
    r7.x = ps;
    ps = r13.y;
    r0 = r6.yxwz * UniformVector_2.xzyy;
    ps = r6.x * ps;
    r10.x = r0.z * r12.y;
    r7.y = ps;
    ps = r10.x;
    r2.xyz = r13.xzw * r12.xzw;
    ps = r0.w * ps;
    r6.y = r2.x * r6.w;
    r6.x = ps;
    r11.w = r6.y * r12.x + r6.x;
    r7 = r11.wxyz + r7.yxxx;
    ps = rsqrt(abs(r7.x));
    r1.xyz = r4.xyz * r1.xyz;
    r10.z = ps;
    r0.xy = r0.xy * r10.zz;
    r0.zw = r10.xy * r10.zy;
    r6.x = dot(r0.yxz, r0.yxz);
    ps = rsqrt(abs(r6.x));
    r6.yz = r2.yz + 0.125;
    r6.x = ps;
    r4.xyz = r0.xyz * r6.xxx;
    ps = UniformScalar_24.x;
    r6.x = dot(r4.yxz, r8.zxy);
    r2.x = ps;
    ps = 0.0001;
    r10.xyz = r4.xzy * r6.xxx;
    r2.y = ps;
    r8.xyz = r10.xyz * 2.0 - r8.xyz;
    ps = max(r2.x, r2.y);
    r6.w = saturate(dot(r3.zxy, r8.zxy));
    r6.x = ps;
    ps = log2(r6.w);
    r0.xyz = r0.www * r5.xyz;
    r6.w = ps;
    r2.xy = r6.xy * r6.wz;
    r6.xyz = r2.yyy * r9.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r2.x);
    r6.w = saturate(dot(r4.yxz, r3.zxy));
    r7.x = ps;
    r7.xyz = r7.yzw * r7.xxx;
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
