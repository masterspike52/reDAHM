// ps_4b3fd9b5045eb313.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 246 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003D8 10041100 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
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
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c14); // float2
float4 SpotDirection : register(c13); // float3
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
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r8 = tex2D(Texture2D_4, r0.xy).wxyz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.w = ps;
    ps = 1.0 / r5.w;
    r7.xy = r5.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    r7.xy = r7.xy * r0.zz + ScreenPositionScaleBias.wz;
    ps = r8.x;
    r1.xy = r1.xy * UniformVector_5.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r2.w = float((UniformScalar_5.x >= 0.0));
    r1.z = ps;
    ps = (-0.5) + r0.z;
    r1.zw = r1.zw * abs(r6.xy);
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r6.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r1.zw).xy;
    r12.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r13 = tex2D(Texture2D_1, r0.xy);
    r17 = tex2D(Texture2D_2, r0.xy);
    r1.xyw = tex2D(Texture2D_3, r1.xy).xyz;
    ps = r5.w;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = 0.0001 * ps;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r8.x = saturate(ps);
    ps = (UniformScalar_5.x > 0.0) ? 1.0 : 0.0;
    r1.z = dot(r4.zxy, r4.zxy);
    r4.w = ps;
    ps = UniformVector_3.x;
    r14.xyz = UniformVector_4.xzy * 2e+01;
    ps = 2e+01 * ps;
    r6.w = float((UniformScalar_8.x >= 1.0));
    r16.x = ps;
    ps = UniformVector_3.z;
    r0.y = dot(r2.zxy, r2.zxy);
    ps = 2e+01 * ps;
    r0.z = float((UniformScalar_8.x > 1.0));
    r16.y = ps;
    ps = UniformVector_3.y;
    r0.w = dot(r3.zxy, r3.zxy);
    ps = 2e+01 * ps;
    r0.x = r2.z + 0.1;
    r16.z = ps;
    ps = 5.0 * r0.x;
    r15.xyz = r8.yzw * UniformScalar_9.xxx;
    r12.x = saturate(ps);
    r10.xyz = (-abs(r0.zzz) >= 0.0) ? r1.xyw : 1.0;
    ps = 1.0 - r0.w;
    r1.xyw = r17.xzy * r17.www;
    r5.w = saturate(ps);
    ps = rsqrt(abs(r0.y));
    r13.xyz = r13.xzy * r13.www;
    r5.x = ps;
    r0.xyz = r12.wyz * 2.0 - 1.0;
    ps = UniformVector_2.x * r0.y;
    r5.xyz = r5.xxx * r2.xyz;
    r12.y = ps;
    ps = UniformVector_2.y * r0.z;
    r13.xyz = r16.xyz * r13.xyz;
    r12.z = ps;
    ps = rsqrt(abs(r0.w));
    r1.xyw = r14.xyz * r1.xyw;
    r0.y = ps;
    r10.xyz = (-abs(r6.www) >= 0.0) ? 1.0 : r10.xyz;
    ps = log2(r5.w);
    r14.xyz = r0.yyy * -SpotDirection.xyz;
    r0.y = ps;
    r2.xyz = r15.xyz * r10.xyz + UniformScalar_10.xxx;
    ps = UniformVector_2.z * r0.x;
    r0.w = dot(r14.zxy, r3.zxy);
    r12.w = ps;
    r3.xyz = (abs(r4.www) > 0.0) ? r13.xzy : r1.xwy;
    r13.xyz = (-abs(r4.www) >= 0.0) ? r1.yxw : r13.yxz;
    r13.xyz = (-abs(r2.www) >= 0.0) ? r1.yxw : r13.xyz;
    ps = rsqrt(abs(r1.z));
    r0.xz = -r12.wx + 1.0;
    r1.z = ps;
    r1.xyw = (abs(r2.www) > 0.0) ? r3.yzx : r1.wyx;
    r3.xyz = r10.xyz * r8.yzw + r1.wxy;
    ps = ModShadowGroupColor.x * r0.z;
    r10.xyz = r1.zzz * r4.xyz;
    r8.y = ps;
    ps = ModShadowGroupColor.y * r0.z;
    r1.z = saturate(dot(r13.zxy, float3(0.59, 0.11, 0.3)));
    r8.z = ps;
    ps = r0.x;
    r2.w = dot(r1.ywx, float3(0.11, 0.3, 0.59));
    ps = r1.z * ps;
    r0.x = r2.w - r1.w;
    r4.z = ps;
    ps = r0.x;
    r4.xy = -r12.yz * r1.zz;
    ps = r1.w + ps;
    r1.xyz = r12.wyz + r4.zxy;
    r8.w = saturate(ps);
    ps = (-1.0) - -r1.x;
    r8 = -r8.wxyz + 1.0;
    r1.w = ps;
    r1.xyz = r1.wyz * r8.yyy;
    ps = 1.0 + r1.x;
    r1.w = ps;
    r1.xyz = (r8.yyy > 0.0) ? r1.yzw : float3(0.0, 0.0, 1.0);
    r1.xyz = (r8.yyy >= 0.0) ? r1.xyz : float3(0.0, 0.0, 1.0);
    r0.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r0.x));
    r3.xyz = r3.xyz * r11.xyz;
    r0.x = ps;
    r4.xyz = r1.xyz * r0.xxx;
    r0.x = dot(r4.zxy, r10.zxy);
    r1.xyz = r4.xyz * r0.xxx;
    r1.xyz = r1.xyz * 2.0 - r10.xyz;
    ps = LightColorAndFalloffExponent.w * r0.y;
    r0.x = saturate(dot(r5.zxy, r1.zxy));
    r0.y = ps;
    ps = log2(r0.x);
    r1.xyz = r2.xyz * r8.xxx;
    r9.x = ps;
    ps = -SpotAngles.x - -r0.w;
    r2.xyz = r9.yzx * float3(0.875, 0.875, 15.0);
    r0.x = ps;
    r2.xy = r2.xy * r8.zw + 0.125;
    ps = pow(2.0, r2.z);
    r0.z = saturate(dot(r4.zyx, r5.zyx));
    r0.w = ps;
    ps = SpotAngles.y * r0.x;
    r1.xyz = r1.zxy * r0.www;
    r2.z = saturate(ps);
    r1.yz = r3.xy * r0.zz + r1.yz;
    r1.w = r3.z * r0.z + r1.x;
    ps = pow(2.0, r0.y);
    r0.xw = r2.xz * r2.yz;
    r1.x = ps;
    r0.xyz = r0.xxx * r7.xyz + ModShadowColor.xyz;
    r1.xyz = r1.yzw * r1.xxx;
    r1.xyz = r1.xyz * r6.xyz;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r1.xzy * r0.www;
    r0.xyz = r1.xzy * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
