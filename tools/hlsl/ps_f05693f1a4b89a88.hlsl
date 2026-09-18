// ps_f05693f1a4b89a88.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000330 10040F00 00000506 00000000 000040A5 001F001F 00000001 00003050 00007154 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformScalar_21 : register(c6); // float
float4 UniformScalar_22 : register(c7); // float
float4 UniformScalar_23 : register(c8); // float
float4 UniformScalar_24 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float2 vPos : VPOS;   // r5 (pixel parameters)
    float vFace : VFACE;  // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r8.yz = UniformVector_2.xz * UniformVector_2.xz;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.xy = r0.zz * ScreenPositionScaleBias.xy;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r13.z = UniformScalar_22.x - UniformScalar_21.x;
    r0.z = ps;
    r0.zw = r0.zw * abs(r5.xy);
    r2.xy = r2.xy * r4.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r2.xy).xyz;
    r12.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r14.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r2.xyz = tex2D(Texture2D_1, r0.xy).zxy;
    r7.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r0.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    ps = r1.z;
    r6.w = max(UniformScalar_24.x, 0.0001);
    ps = 0.1 + ps;
    r10.yz = r0.xy * 0.875;
    r0.x = ps;
    r4.xyz = r7.wxy * 2.0 - 1.0;
    ps = r2.x + r2.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r15.z = ps;
    ps = 5.0 * r0.x;
    r0.w = dot(r3.zxy, r3.zxy);
    r0.x = saturate(ps);
    ps = 4.0 * r2.y;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r15.x = ps;
    ps = 4.0 * r2.z;
    r0.z = -r0.x + 1.0;
    r15.y = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r2.w = dot(r1.zxy, r1.zxy);
    r13.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r2.xyz = r15.yxz + float3(-2.0, -2.0, -1.0);
    r13.w = ps;
    ps = r2.x;
    r13.x = dot(r14.zxy, float3(1.0, 1.0, 1.0));
    ps = -r4.z + ps;
    r0.xyz = -r13.ywx + 1.0;
    r9.w = ps;
    ps = UniformScalar_23.x * r0.z;
    r13.xy = r2.yz - r4.yx;
    r4.x = ps;
    ps = UniformVector_2.y * r0.z;
    r2.xyz = r13.xzy * UniformScalar_0.xxx;
    r3.w = ps;
    ps = UniformScalar_21.x + r2.y;
    r9.xyz = r9.xyz + r9.xyz;
    r1.w = ps;
    ps = r4.y;
    r7.xyz = r0.zzz * r12.xyz;
    r9.xyz = r7.xyz * r9.xyz - r7.xyz;
    ps = r2.x + ps;
    r4.w = r2.z - 2.0;
    r10.w = ps;
    r10.x = r7.w * 2.0 + r4.w;
    r7.xyz = r9.xyz * UniformScalar_0.xxx + r7.xyz;
    r8.x = r9.w * UniformScalar_0.x + r4.z;
    ps = rsqrt(abs(r2.w));
    r8.w = r3.w * r8.x;
    r2.x = ps;
    r13.xy = r10.xw * r0.zz + float2(1.0, 0.0);
    r12.yzw = r10.xyz * r0.zxy + float3(1.0, 0.125, 0.125);
    ps = r8.z;
    r2.xyz = r2.xxx * r1.xyz;
    ps = r12.y * ps;
    r13.zw = r8.xy * r0.zz;
    r12.x = ps;
    ps = r13.w;
    r9.xyz = r7.xyz * r1.www;
    ps = r10.w * ps;
    r8.xyz = r13.yxz * UniformVector_2.xzy;
    r1.x = ps;
    ps = r1.x;
    r4.yz = r12.xz * r12.yw;
    r1.xyz = r4.zzz * r11.xyz + ModShadowColor.xyz;
    ps = r0.z * ps;
    r1.w = r8.w * r8.z;
    r0.x = ps;
    r9.w = r0.x * r10.w + r1.w;
    ps = rsqrt(abs(r0.w));
    r4 = r9 + r4.xxxy;
    r0.x = ps;
    ps = rsqrt(abs(r4.w));
    r3.xyz = r0.xxx * r3.xyz;
    r0.x = ps;
    r0.yzw = r8.xyw * r0.xxx;
    r0.x = dot(r0.zyw, r0.zyw);
    ps = rsqrt(abs(r0.x));
    r6.xyz = r7.xyz * r6.xyz;
    r0.x = ps;
    r0.xzw = r0.yzw * r0.xxx;
    r0.y = dot(r0.zxw, r3.zxy);
    r7.xyz = r0.xwz * r0.yyy;
    r3.xyz = r7.xyz * 2.0 - r3.xyz;
    r0.y = saturate(dot(r2.zxy, r3.zxy));
    ps = log2(r0.y);
    r0.x = saturate(dot(r0.zxw, r2.zxy));
    r0.y = ps;
    r0 = r6 * r0.xxxy;
    ps = pow(2.0, r0.w);
    r2.xyz = r5.xzy * LightColor.xzy;
    r1.w = ps;
    r0.xy = r4.xy * r1.ww + r0.xy;
    r0.z = r4.z * r1.w + r0.z;
    r0.xyz = r2.xzy * r0.xyz;
    r0.xyz = r0.xzy * r1.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
