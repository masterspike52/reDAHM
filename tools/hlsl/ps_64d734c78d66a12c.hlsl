// ps_64d734c78d66a12c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 240 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003C0 10041000 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c16); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c12); // float
float4 UniformScalar_11 : register(c13); // float
float4 UniformScalar_12 : register(c14); // float
float4 UniformScalar_13 : register(c15); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformScalar_7 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D Texture2D_5 : register(s6);
sampler2D Texture2D_6 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_2, r0.xy);
    ps = (-0.5) + r10.w;
    r0.zw = r0.xy * UniformScalar_0.xx;
    r1.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r11.xyz = tex2D(Texture2D_0, r0.zw).xyw;
    ps = r1.y;
    r3.xy = r1.xy * UniformVector_4.xy;
    r1.y = saturate(ps);
    ps = r5.w;
    r7.xy = r0.xy * UniformScalar_7.xx;
    ps = 0.0001 * ps;
    r0.z = -UniformScalar_5.x + 1.0;
    r12.z = saturate(ps);
    ps = UniformScalar_6.x;
    r8.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = -UniformScalar_5.x + ps;
    r0.w = r2.z + 0.1;
    r1.x = ps;
    r15.xy = r11.xy * 2.0 - 1.0;
    ps = 1.0 / r1.x;
    r0.z = r0.z - r1.y;
    r1.x = ps;
    ps = 5.0 * r0.w;
    r9.y = saturate(r0.z * r1.x);
    r9.x = saturate(ps);
    ps = 1.0 / r5.w;
    r1.xw = -r9.xy + 1.0;
    r15.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r12.xy = r1.xx * ModShadowGroupColor.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.xyz = -r12.xzy + 1.0;
    r0.w = ps;
    ps = UniformScalar_1.x * r1.y;
    r3.zw = r0.zw * abs(r6.xy);
    r8.x = ps;
    r0.zw = r8.yz * r15.zz + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(Texture2D_6, r0.xy).xyz;
    r13.x = tex2D(Texture2D_4, r7.xy).x;
    r13.yz = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r16.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_5, r3.xy).xyz;
    r3.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r14.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r7.xyz = UniformVector_3.xyz * UniformVector_3.www;
    r12.xyz = -ModShadowColor.xyz + 1.0;
    r2.w = dot(r4.zxy, r4.zxy);
    r3.w = float((UniformScalar_10.x >= 1.0));
    r0.y = float((UniformScalar_10.x > 1.0));
    r0.x = dot(r2.zxy, r2.zxy);
    r14.z = r14.z * 2.0 - 1.0;
    r14.xy = r14.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.x));
    r3.xyz = r3.xyz * LightColor.xyz;
    r0.x = ps;
    r0.yzw = (-abs(r0.yyy) >= 0.0) ? r6.xyz : 1.0;
    r6.xyz = (-abs(r3.www) >= 0.0) ? 1.0 : r0.yzw;
    r0.yzw = r0.xxx * r2.xyz;
    r9.xyz = r9.yyy * r10.xyz;
    r10.xyz = r16.xyz * r10.xyz - r9.xyz;
    r14.xy = r8.xx * r15.xy + r14.xy;
    r2.xyz = r14.xyz * UniformVector_2.xyz;
    ps = rsqrt(abs(r2.w));
    r0.x = dot(r2.zxy, r2.zxy);
    r2.w = ps;
    ps = rsqrt(abs(r0.x));
    r4.xyz = r2.www * r4.xyz;
    r0.x = ps;
    r2.xyz = r2.xyz * r0.xxx;
    r0.x = dot(r2.zxy, r4.zxy);
    r14.xyz = r2.xzy * r0.xxx;
    r4.xyz = r14.xyz * 2.0 - r4.xzy;
    r0.x = saturate(dot(r0.wyz, r4.yxz));
    ps = log2(r0.x);
    r0.w = saturate(dot(r2.zxy, r0.wyz));
    r13.w = ps;
    r0.xyz = r13.yzw * float3(0.875, 0.875, 15.0);
    r13.yz = r0.xy * r1.xz;
    r2.xyz = r13.xyz + float3(0.5, 0.125, 0.125);
    ps = r2.y * r2.z;
    r11.w = r1.w * r2.x;
    r1.w = ps;
    r2.xyz = r1.www * r12.xyz + ModShadowColor.xyz;
    r0.xy = r11.wz + float2(-0.5, -1.0);
    r1.w = r0.y * r1.y + 1.0;
    ps = 5.0000005 * r0.x;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r2.w = saturate(ps);
    r4.xyz = r2.www * r10.xyz + r9.xyz;
    r1.w = (r8.x > 0.0) ? r1.w : 1.0;
    r1.w = (r8.x >= 0.0) ? r1.w : 1.0;
    r4.xyz = r7.xyz * r4.xyz;
    r4.xyz = r4.xyz * r6.xyz;
    r4.xyz = r4.xyz * r1.www;
    r1.xyz = r4.xyz * r1.xyz;
    ps = pow(2.0, r0.z);
    r5.xyz = -r4.xyz + r5.xyz;
    r0.x = ps;
    r4.xyz = r5.xyz * UniformScalar_11.xxx + r4.xyz;
    r4.xyz = r4.xyz * UniformScalar_12.xxx + UniformScalar_13.xxx;
    r0.xyz = r4.xyz * r0.xxx;
    r0.xy = r1.xy * r0.ww + r0.xy;
    r0.z = r1.z * r0.w + r0.z;
    r0.xyz = r3.xyz * r0.xyz;
    r0.xyz = r0.xyz * r2.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
