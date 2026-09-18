// ps_a778651c162041a8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10040F00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c15); // float4
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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r10 = tex2D(Texture2D_4, r0.xy);
    r9.y = UniformScalar_2.x * UniformVector_4.y;
    ps = UniformVector_4.y;
    r7.xy = r1.xy * UniformVector_5.xy;
    ps = UniformScalar_5.x * ps;
    r0.z = UniformScalar_1.x * UniformVector_2.x;
    r9.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = UniformVector_2.x * UniformScalar_4.x;
    r1.y = ps;
    ps = 1.0 / r5.w;
    r1.zw = r5.xy * ScreenPositionScaleBias.xy;
    r1.x = ps;
    r8.xy = r1.zw * r1.xx + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.x = r10.w - 0.5;
    r1.z = ps;
    ps = UniformVector_4.x * r0.z;
    r7.zw = r1.yz * abs(r6.xy);
    r9.x = ps;
    ps = UniformVector_4.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.xxxx)) clip(-1.0);
    r9.z = ps;
    r1 = r9 + r0.xyxy;
    r6.xyz = tex2D(LightAttenuationTexture, r8.xy).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r15 = tex2D(Texture2D_1, r1.xy);
    r11 = tex2D(Texture2D_2, r1.zw);
    r1.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_3, r7.xy).xyz;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r12.xyz = UniformVector_3.xyz * 2e+01;
    r1.w = float((UniformScalar_8.x >= 1.0));
    r0.z = dot(r4.zxy, r4.zxy);
    ps = r5.w;
    r0.w = dot(r2.zxy, r2.zxy);
    ps = 0.0001 * ps;
    r2.w = float((UniformScalar_8.x > 1.0));
    r5.z = saturate(ps);
    ps = r2.z;
    r0.x = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r8.xyz = r10.xyz * UniformScalar_9.xxx;
    r0.y = ps;
    r13.xyz = (-abs(r2.www) >= 0.0) ? r13.xyz : 1.0;
    r1.xyz = r1.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r14.xyz = r11.xyz * r11.www;
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r3.xyz = r0.www * r2.xyz;
    r0.z = ps;
    ps = 5.0 * r0.y;
    r11.xyz = r0.zzz * r4.xyz;
    r5.x = saturate(ps);
    r0.yzw = r15.xyz * r15.www + r14.xyz;
    r4.xyz = (-abs(r1.www) >= 0.0) ? 1.0 : r13.xyz;
    r8.xyz = r8.xyz * r4.xyz + UniformScalar_10.xxx;
    ps = UniformVector_2.x * r1.y;
    r2.xyz = r12.xyz * r0.yzw;
    r0.y = ps;
    r10.xyz = r4.xyz * r10.xyz + r2.xyz;
    ps = UniformVector_2.y * r1.z;
    r0.z = dot(r2.zxy, float3(0.11, 0.3, 0.59));
    r0.w = ps;
    ps = UniformVector_2.z * r1.x;
    r1.w = r0.z - r2.x;
    r0.z = ps;
    ps = 1.0 - r0.z;
    r5.y = saturate(r1.w + r2.x);
    r1.x = ps;
    ps = r1.x;
    r2.xy = -r0.yw * r5.yy;
    ps = r5.y * ps;
    r1.xyz = -r5.zxy + 1.0;
    r2.z = ps;
    r5.xy = -r1.yy * ModShadowGroupColor.xy + 1.0;
    r2.xyz = r0.ywz + r2.xyz;
    ps = -UniformVector_0.x;
    r2.w = r2.z - 1.0;
    ps = 1.0 + ps;
    r4.xyw = r2.xyw * r1.xxx;
    r2.x = ps;
    ps = 1.0 - r0.x;
    r4.z = r4.w + 1.0;
    r0.y = saturate(ps);
    r0.xzw = (r1.xxx > 0.0) ? r4.xyz : float3(0.0, 0.0, 1.0);
    r2.yzw = (r1.xxx >= 0.0) ? r0.xzw : float3(0.0, 0.0, 1.0);
    ps = log2(r0.y);
    r0.x = dot(r2.wyz, r2.wyz);
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r0.y = r0.y * LightColorAndFalloffExponent.w;
    r0.x = ps;
    ps = -UniformVector_0.y;
    r4.xyz = r2.yzw * r0.xxx;
    ps = 1.0 + ps;
    r0.x = dot(r4.zxy, r11.zxy);
    r2.y = ps;
    ps = -UniformVector_0.z;
    r0.xzw = r4.xyz * r0.xxx;
    r0.xzw = r0.xzw * 2.0 - r11.xyz;
    ps = 1.0 + ps;
    r0.x = saturate(dot(r3.zxy, r0.wxz));
    r2.z = ps;
    ps = log2(r0.x);
    r2.xyz = r10.xyz * r2.xyz;
    r9.x = ps;
    r0.xzw = r9.yxz * float3(0.875, 15.0, 0.875);
    ps = pow(2.0, r0.z);
    r1.xyz = r8.xyz * r1.zzz;
    r0.z = ps;
    r0.xw = r0.xw * r5.xy + 0.125;
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
