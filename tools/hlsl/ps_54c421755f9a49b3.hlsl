// ps_54c421755f9a49b3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 213 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000354 10040C00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_10 : register(c14); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_8 : register(c12); // float
float4 UniformScalar_9 : register(c13); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3 = tex2D(Texture2D_4, r0.xy).xywz;
    r7.y = UniformScalar_2.x * UniformVector_4.y;
    ps = UniformVector_4.y;
    r1.zw = r1.xy * UniformVector_5.xy;
    ps = UniformScalar_5.x * ps;
    r0.z = UniformScalar_1.x * UniformVector_2.x;
    r7.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = UniformVector_2.x * UniformScalar_4.x;
    r7.x = ps;
    ps = 1.0 / r5.w;
    r8.xy = r5.xy * ScreenPositionScaleBias.xy;
    r1.x = ps;
    r1.xy = r8.xy * r1.xx + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.w = r3.z - 0.5;
    r7.z = ps;
    ps = UniformVector_4.x * r0.z;
    r6.xy = r7.xz * abs(r6.xy);
    r7.x = ps;
    ps = UniformVector_4.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r2.wwww)) clip(-1.0);
    r7.z = ps;
    r7 = r7 + r0.xyxy;
    r6.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r12 = tex2D(Texture2D_1, r7.xy);
    r7 = tex2D(Texture2D_2, r7.zw);
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r9.xyz = tex2D(Texture2D_3, r1.zw).xyz;
    r0.xyz = tex2D(LightAttenuationTexture, r1.xy).zxy;
    r8.xyz = UniformVector_3.xyz * 2e+01;
    r0.w = float((UniformScalar_8.x >= 1.0));
    r2.w = dot(r4.zxy, r4.zxy);
    ps = r5.w;
    r1.y = dot(r2.zxy, r2.zxy);
    ps = 0.0001 * ps;
    r1.x = r2.z + 0.1;
    r1.w = saturate(ps);
    ps = 5.0 * r1.x;
    r1.z = float((UniformScalar_8.x > 1.0));
    r3.z = saturate(ps);
    r9.xyz = (-abs(r1.zzz) >= 0.0) ? r9.xyz : 1.0;
    ps = rsqrt(abs(r1.y));
    r5.xyz = r3.xyw * UniformScalar_9.xxx;
    r4.w = ps;
    r1.xyz = r10.zxy * 2.0 - 1.0;
    ps = UniformVector_2.x * r1.y;
    r11.xyz = r7.xyz * r7.www;
    r1.y = ps;
    ps = rsqrt(abs(r2.w));
    r7.xyz = r4.www * r2.xyz;
    r2.x = ps;
    ps = UniformVector_2.y * r1.z;
    r10.xyz = r2.xxx * r4.xyz;
    r1.z = ps;
    r2.xyz = r12.xyz * r12.www + r11.xyz;
    r4.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r9.xyz;
    r9.xyz = r5.xyz * r4.xyz + UniformScalar_10.xxx;
    ps = UniformVector_2.z * r1.x;
    r2.xyz = r8.yxz * r2.yxz;
    r1.x = ps;
    r8.xyz = r4.xyz * r3.xyw + r2.yxz;
    ps = r1.x;
    r2.w = dot(r2.zyx, float3(0.11, 0.3, 0.59));
    r0.w = ps;
    ps = 1.0 - r0.w;
    r2.w = r2.w - r2.y;
    r2.x = ps;
    ps = 1.0 - r1.w;
    r3.w = saturate(r2.w + r2.y);
    r0.w = ps;
    ps = r2.x;
    r3.xy = -r1.yz * r3.ww;
    ps = r3.w * ps;
    r2.xz = -r3.zw + 1.0;
    r3.z = ps;
    r5.xy = -r2.xx * ModShadowGroupColor.xy + 1.0;
    r1.xyz = r1.xyz + r3.zxy;
    ps = (-1.0) - -r1.x;
    r3.xyz = -UniformVector_0.xyz + 1.0;
    r1.w = ps;
    r1.xyz = r1.wyz * r0.www;
    ps = 1.0 + r1.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r1.w = ps;
    r1.xyz = (r0.www > 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r0.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    r0.w = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.w));
    r3.xyz = r8.xyz * r3.xyz;
    r0.w = ps;
    r8.xyz = r1.xyz * r0.www;
    r0.w = dot(r8.zxy, r10.zxy);
    ps = LightColor.x * r0.y;
    r1.xyz = r8.xyz * r0.www;
    r2.x = ps;
    r1.xyz = r1.xyz * 2.0 - r10.xyz;
    ps = LightColor.z * r0.x;
    r0.w = saturate(dot(r7.zxy, r1.zxy));
    r2.y = ps;
    ps = log2(r0.w);
    r1.xyz = r9.xyz * r2.zzz;
    r6.x = ps;
    ps = LightColor.y * r0.z;
    r6.xyz = r6.xyz * float3(15.0, 0.875, 0.875);
    r2.z = ps;
    ps = pow(2.0, r6.x);
    r0.w = saturate(dot(r8.zyx, r7.zyx));
    r0.z = ps;
    r0.xy = r6.yz * r5.xy + 0.125;
    ps = r0.x * r0.y;
    r1.xyz = r1.xyz * r0.zzz;
    r0.x = ps;
    r0.xyz = r0.xxx * r4.xyz + ModShadowColor.xyz;
    r1.xy = r3.xy * r0.ww + r1.xy;
    r1.z = r3.z * r0.w + r1.z;
    r1.xyz = r2.xzy * r1.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
