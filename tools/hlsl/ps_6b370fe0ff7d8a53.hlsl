// ps_6b370fe0ff7d8a53.bin
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

float4 LightColorAndFalloffExponent : register(c10); // float4
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_3 : register(c7); // float
float4 UniformScalar_4 : register(c8); // float
float4 UniformScalar_5 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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

    r7 = tex2D(Texture2D_2, r0.xy).yxzw;
    ps = 1.0 / r5.w;
    r1.zw = r5.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    r8.yz = r1.zw * r0.zz + ScreenPositionScaleBias.wz;
    ps = r7.w;
    r1.xy = r1.xy * UniformVector_4.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xw = r7.xz * UniformScalar_4.xx;
    r1.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = float((UniformScalar_3.x >= 1.0));
    r1.w = ps;
    ps = (-0.5) + r0.z;
    r1.zw = r1.zw * abs(r6.xy);
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r6.xyz = tex2D(LightAttenuationTexture, r8.yz).xyz;
    r8.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r12 = tex2D(Texture2D_1, r0.xy);
    r9.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r1.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r10.w = saturate(r5.w * 0.0001);
    r0.z = dot(r4.zxy, r4.zxy);
    r1.w = dot(r2.zxy, r2.zxy);
    ps = r2.z;
    r2.w = float((UniformScalar_3.x > 1.0));
    ps = 0.1 + ps;
    r0.x = dot(r3.zxy, r3.zxy);
    r0.y = ps;
    r1.xyz = (-abs(r2.www) >= 0.0) ? r1.xyz : 1.0;
    r9.xyz = r9.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r1.w));
    r0.y = saturate(r0.y * 5.0);
    r1.w = ps;
    ps = rsqrt(abs(r0.z));
    r5.xyz = r1.www * r2.xyz;
    r0.z = ps;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    r11.xyz = UniformVector_3.xyz * 2e+01;
    r3.xyz = r12.xyz * r12.www;
    r10.xyz = r9.xyz * UniformVector_2.xyz;
    r9.xyz = r0.zzz * r4.xyz;
    ps = 1.0 - r0.x;
    r4.xyz = r11.xyz * r3.xyz;
    r0.x = saturate(ps);
    r1.xyz = (-abs(r0.www) >= 0.0) ? 1.0 : r1.yxz;
    ps = log2(r0.x);
    r0.z = -r0.y + 1.0;
    r0.x = ps;
    r3.xyz = r1.yxz * r7.yxz + r4.xyz;
    r0.y = dot(r4.zxy, float3(0.11, 0.3, 0.59));
    ps = r0.y;
    r7.zw = r8.xw * r1.xz;
    ps = -r4.x + ps;
    r0.yw = -r10.zw + 1.0;
    r1.w = ps;
    r7.x = saturate(r1.w + r4.x);
    ps = r0.y;
    r3.xyz = r3.xyz * r2.xyz;
    ps = r7.x * ps;
    r2.xy = -r10.xy * r7.xx;
    r2.z = ps;
    r2.xyz = r10.zxy + r2.zxy;
    ps = (-1.0) - -r2.x;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r2.w = ps;
    ps = UniformScalar_4.x * r1.y;
    r2.xyw = r2.yzw * r0.www;
    r1.x = ps;
    ps = r1.x;
    r2.z = r2.w + 1.0;
    r1.xyz = (r0.www > 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r2.xyz = (r0.www >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    ps = r7.y * ps;
    r0.y = dot(r2.zxy, r2.zxy);
    r7.y = ps;
    ps = rsqrt(abs(r0.y));
    r1.xyz = r7.yzw + UniformScalar_5.xxx;
    r0.y = ps;
    r2.xyz = r2.xyz * r0.yyy;
    r0.y = dot(r2.zxy, r9.zxy);
    ps = ModShadowGroupColor.x * r0.z;
    r10.xyz = r2.xyz * r0.yyy;
    r7.y = ps;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    ps = ModShadowGroupColor.y * r0.z;
    r0.y = saturate(dot(r5.zxy, r9.zxy));
    r7.z = ps;
    ps = log2(r0.y);
    r7.xyz = -r7.xyz + 1.0;
    r8.x = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r8.xyz = r8.xyz * float3(15.0, 0.875, 0.875);
    r0.y = ps;
    ps = pow(2.0, r8.x);
    r1.xyz = r1.xyz * r7.xxx;
    r0.z = ps;
    r0.xw = r8.yz * r7.yz + 0.125;
    ps = r0.x * r0.w;
    r1.w = saturate(dot(r2.zyx, r5.zyx));
    r0.x = ps;
    ps = pow(2.0, r0.y);
    r1.xyz = r1.xyz * r0.zzz;
    r0.w = ps;
    r0.xyz = r0.xxx * r4.xyz + ModShadowColor.xyz;
    r1.xy = r3.xy * r1.ww + r1.xy;
    r1.z = r3.z * r1.w + r1.z;
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
