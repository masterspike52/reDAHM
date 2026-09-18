// ps_7690acb5596be070.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10040E00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c16); // float2
float4 ModShadowColor : register(c14); // float3
float4 ModShadowGroupColor : register(c15); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_11 : register(c10); // float
float4 UniformScalar_12 : register(c11); // float
float4 UniformScalar_13 : register(c12); // float
float4 UniformScalar_8 : register(c9); // float
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = tex2D(Texture2D_4, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.z = r8.w - 0.5;
    r0.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r4.w = float((UniformScalar_11.x > 1.0));
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r9 = tex2D(Texture2D_1, r0.xy);
    ps = 0.0001 * r5.w;
    r0.zw = r0.zw * abs(r6.xy);
    r7.z = saturate(ps);
    r6 = tex2D(Texture2D_2, r0.xy).xzyw;
    r3.xy = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r10.zw = r5.xy * ScreenPositionScaleBias.xy;
    r1.xy = r1.xy * UniformVector_5.xy;
    r7.xyw = UniformVector_4.xzy * 2e+01;
    r11.xyz = UniformVector_3.xzy * 2e+01;
    ps = r6.x * r6.w;
    r1.w = float((UniformScalar_8.x >= UniformScalar_1.x));
    r6.x = ps;
    ps = r6.y * r6.w;
    r9.xyz = r9.xzy * r9.www;
    r6.y = ps;
    ps = r6.z * r6.w;
    r12.xyz = r11.xyz * r9.xyz;
    r6.z = ps;
    r13.xyz = r7.xyw * r6.xyz;
    r6.xyz = (abs(r1.www) > 0.0) ? r12.xzy : r13.xzy;
    ps = r2.z;
    r0.z = dot(r6.zxy, float3(0.11, 0.3, 0.59));
    ps = 0.1 + ps;
    r0.w = r0.z - r6.x;
    r0.z = ps;
    ps = 5.0 * r0.z;
    r3.w = saturate(r0.w + r6.x);
    r3.z = saturate(ps);
    ps = 0.875 * r3.x;
    r0.zw = -r3.zw + 1.0;
    r10.x = ps;
    ps = 0.875 * r3.y;
    r7.xy = r0.zz * ModShadowGroupColor.xy;
    r10.y = ps;
    ps = 1.0 / r5.w;
    r9.xyz = -r7.xyz + 1.0;
    r9.w = ps;
    r3.xy = r10.zw * r9.ww + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r3.xyz = tex2D(LightAttenuationTexture, r3.xy).xyz;
    r7.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r1.xyz = -ModShadowColor.xyz + 1.0;
    r2.w = float((UniformScalar_11.x >= 1.0));
    r3.w = dot(r4.zxy, r4.zxy);
    r0.x = dot(r2.zxy, r2.zxy);
    r11.xyz = (-abs(r4.www) >= 0.0) ? r7.xyz : 1.0;
    ps = rsqrt(abs(r0.x));
    r3.xyz = r3.xzy * LightColor.xzy;
    r4.w = ps;
    r0.xyz = r5.zxy * 2.0 - 1.0;
    ps = UniformVector_2.x * r0.y;
    r14.xyz = r8.xyz * UniformScalar_12.xxx;
    r0.y = ps;
    ps = rsqrt(abs(r3.w));
    r5.xyz = r4.www * r2.xyz;
    r2.x = ps;
    ps = UniformVector_2.y * r0.z;
    r7.xyz = r2.xxx * r4.xyz;
    r0.z = ps;
    r11.xyz = (-abs(r2.www) >= 0.0) ? 1.0 : r11.xyz;
    r4.xyz = r14.xyz * r11.xyz + UniformScalar_13.xxx;
    r2.xyz = (-abs(r1.www) >= 0.0) ? r13.yxz : r12.yxz;
    r8.xyz = r11.xyz * r8.xyz + r6.xyz;
    ps = UniformVector_2.z * r0.x;
    r6.w = saturate(dot(r2.zxy, float3(0.59, 0.11, 0.3)));
    r0.x = ps;
    ps = 1.0 - r0.x;
    r2.xy = -r0.yz * r6.ww;
    r6.x = ps;
    r6.yz = r10.xy * r9.xy + 0.125;
    ps = -UniformVector_0.x;
    r2.zw = r6.xy * r6.wz;
    r1.xyz = r2.www * r1.xyz + ModShadowColor.xyz;
    ps = 1.0 + ps;
    r6.xyz = r0.yzx + r2.xyz;
    r2.x = ps;
    ps = -UniformVector_0.y;
    r6.w = r6.z - 1.0;
    ps = 1.0 + ps;
    r6.xyw = r6.xyw * r9.zzz;
    r2.y = ps;
    ps = -UniformVector_0.z;
    r6.z = r6.w + 1.0;
    r6.xyz = (r9.zzz > 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    r6.xyz = (r9.zzz >= 0.0) ? r6.xyz : float3(0.0, 0.0, 1.0);
    ps = 1.0 + ps;
    r0.x = dot(r6.zxy, r6.zxy);
    r2.z = ps;
    ps = rsqrt(abs(r0.x));
    r2.xyz = r8.xyz * r2.xyz;
    r0.x = ps;
    r6.xyz = r6.xyz * r0.xxx;
    r0.x = dot(r6.zxy, r7.zxy);
    r8.xyz = r6.xyz * r0.xxx;
    r7.xyz = r8.xyz * 2.0 - r7.xyz;
    r0.x = saturate(dot(r5.zxy, r7.zxy));
    ps = log2(r0.x);
    r4.xyz = r4.xyz * r0.www;
    r0.y = ps;
    ps = 15.0 * r0.y;
    r0.x = ps;
    ps = pow(2.0, r0.x);
    r0.w = saturate(dot(r6.zyx, r5.zyx));
    r0.x = ps;
    r0.xyz = r4.xyz * r0.xxx;
    r0.xy = r2.xy * r0.ww + r0.xy;
    r0.z = r2.z * r0.w + r0.z;
    r0.xyz = r3.xzy * r0.xyz;
    r0.xyz = r0.xzy * r1.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
