// ps_f7f92620c9a99608.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 231 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000039C 10041000 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c12); // float4
float4 ModShadowAccumResolution : register(c15); // float2
float4 ModShadowColor : register(c13); // float3
float4 ModShadowGroupColor : register(c14); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_5 : register(c8); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / r5.w;
    r1.zw = r5.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    r7.xy = r1.zw * r0.zz + ScreenPositionScaleBias.wz;
    ps = r11.w;
    r1.xy = r1.xy * UniformVector_5.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r14.xyz = UniformVector_4.xzy * 2e+01;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r2.w = dot(r4.zxy, r4.zxy);
    r1.w = ps;
    ps = (-0.5) + r0.z;
    r1.zw = r1.zw * abs(r6.xy);
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r6.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r12.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r13 = tex2D(Texture2D_1, r0.xy);
    r16 = tex2D(Texture2D_2, r0.xy);
    r1.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = r5.w;
    r15.xyz = UniformVector_3.xzy * 2e+01;
    ps = 0.0001 * ps;
    r6.w = float((UniformScalar_8.x >= 1.0));
    r5.x = saturate(ps);
    ps = (UniformScalar_5.x >= 0.0) ? 1.0 : 0.0;
    r0.y = dot(r2.zxy, r2.zxy);
    r1.w = ps;
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r0.z = float((UniformScalar_8.x > 1.0));
    r4.w = ps;
    ps = r2.z;
    r0.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r5.yzw = r11.xyz * UniformScalar_9.xxx;
    r0.x = ps;
    r8.xyz = (-abs(r0.zzz) >= 0.0) ? r1.xyz : 1.0;
    ps = 5.0 * r0.x;
    r1.xyz = r16.xzy * r16.www;
    r12.x = saturate(ps);
    ps = rsqrt(abs(r0.y));
    r13.xyz = r13.xzy * r13.www;
    r3.x = ps;
    r0.xyz = r12.wyz * 2.0 - 1.0;
    ps = UniformVector_2.x * r0.y;
    r3.xyz = r3.xxx * r2.xyz;
    r12.y = ps;
    ps = UniformVector_2.y * r0.z;
    r13.xyz = r15.xyz * r13.xyz;
    r12.z = ps;
    ps = UniformVector_2.z * r0.x;
    r1.xyz = r14.xyz * r1.xyz;
    r12.w = ps;
    r2.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r8.xyz;
    r8.xyz = r5.yzw * r2.xyz + UniformScalar_10.xxx;
    r5.yzw = (abs(r4.www) > 0.0) ? r13.xzy : r1.xzy;
    r0.xyz = (-abs(r4.www) >= 0.0) ? r1.yxz : r13.yxz;
    r13.xyz = (-abs(r1.www) >= 0.0) ? r1.yxz : r0.xyz;
    ps = rsqrt(abs(r2.w));
    r0.xz = -r12.wx + 1.0;
    r0.y = ps;
    r1.xyw = (abs(r1.www) > 0.0) ? r5.zwy : r1.zyx;
    r2.xyz = r2.xyz * r11.xyz + r1.wxy;
    ps = ModShadowGroupColor.x * r0.z;
    r11.xyz = r0.yyy * r4.xyz;
    r5.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r0.y = saturate(dot(r13.zxy, float3(0.59, 0.11, 0.3)));
    r5.z = ps;
    ps = r0.x;
    r1.z = dot(r1.ywx, float3(0.11, 0.3, 0.59));
    ps = r0.y * ps;
    r1.z = r1.z - r1.w;
    r0.z = ps;
    ps = r1.z;
    r0.xy = -r12.yz * r0.yy;
    ps = r1.w + ps;
    r1.xyz = r12.wyz + r0.zxy;
    r5.w = saturate(ps);
    ps = (-1.0) - -r1.x;
    r5 = -r5.wxyz + 1.0;
    r1.w = ps;
    r1.xyw = r1.yzw * r5.yyy;
    ps = 1.0 - r0.w;
    r1.z = r1.w + 1.0;
    r0.y = saturate(ps);
    r0.xzw = (r5.yyy > 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    r1.xyz = (r5.yyy >= 0.0) ? r0.xzw : float3(0.0, 0.0, 1.0);
    ps = log2(r0.y);
    r0.x = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r0.y = r0.y * LightColorAndFalloffExponent.w;
    r0.x = ps;
    r4.xyz = r1.xyz * r0.xxx;
    r0.x = dot(r4.zxy, r11.zxy);
    r0.xzw = r4.xyz * r0.xxx;
    r0.xzw = r0.xzw * 2.0 - r11.xyz;
    r0.x = saturate(dot(r3.zxy, r0.wxz));
    ps = log2(r0.x);
    r2.xyz = r2.xyz * r10.xyz;
    r9.x = ps;
    r0.xzw = r9.yxz * float3(0.875, 15.0, 0.875);
    ps = pow(2.0, r0.z);
    r1.xyz = r8.xyz * r5.xxx;
    r0.z = ps;
    r0.xw = r0.xw * r5.zw + 0.125;
    ps = r0.x * r0.w;
    r1.w = saturate(dot(r4.zyx, r3.zyx));
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r1.xyz = r1.xyz * r0.zzz;
    r0.w = ps;
    r0.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    r1.xy = r2.xy * r1.ww + r1.xy;
    r1.z = r2.z * r1.w + r1.z;
    r1.xyz = r1.xyz * r0.www;
    r1.xyz = r1.xyz * r6.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
