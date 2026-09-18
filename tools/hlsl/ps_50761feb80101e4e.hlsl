// ps_50761feb80101e4e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 204 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000330 10040C00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c10); // float3
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

    r9 = tex2D(Texture2D_2, r0.xy);
    ps = 1.0 / r5.w;
    r1.zw = r5.xy * ScreenPositionScaleBias.xy;
    r0.z = ps;
    r1.zw = r1.zw * r0.zz + ScreenPositionScaleBias.wz;
    ps = r9.w;
    r1.xy = r1.xy * UniformVector_4.xy;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xw = r9.yz * UniformScalar_4.xx;
    r3.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r11.xyz = -UniformVector_0.xyz + 1.0;
    r3.y = ps;
    ps = (-0.5) + r0.z;
    r3.xy = r3.xy * abs(r6.xy);
    r0.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.zzzz)) clip(-1.0);
    r8.yz = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r3.xyz = tex2D(LightAttenuationTexture, r1.zw).xyz;
    r10 = tex2D(Texture2D_1, r0.xy);
    r1.xzw = tex2D(Texture2D_3, r1.xy).xyz;
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r3.w = dot(r2.zxy, r2.zxy);
    r2.w = dot(r4.zxy, r4.zxy);
    r6.xyz = UniformVector_3.xyz * 2e+01;
    r1.y = float((UniformScalar_3.x >= 1.0));
    r0.y = float((UniformScalar_3.x > 1.0));
    r7.xyz = r7.xyz * 2.0 - 1.0;
    r0.yzw = (-abs(r0.yyy) >= 0.0) ? r1.xzw : 1.0;
    r1.xzw = r10.xyz * r10.www;
    r1.xzw = r6.xyz * r1.xzw;
    r12.xyz = (-abs(r1.yyy) >= 0.0) ? 1.0 : r0.yzw;
    r0.yzw = r12.xyz * r9.xyz + r1.xzw;
    ps = rsqrt(abs(r2.w));
    r1.y = r12.x * UniformScalar_4.x;
    r2.w = ps;
    ps = rsqrt(abs(r3.w));
    r1.y = r1.y * r9.x;
    r3.w = ps;
    r6.xyz = -ModShadowColor.xyz + 1.0;
    r3.xyz = r3.xzy * LightColor.xzy;
    r10.xyz = r7.xyz * UniformVector_2.xyz;
    r7.xyz = r3.www * r2.xyz;
    ps = r5.w;
    r9.xyz = r2.www * r4.xyz;
    ps = 0.0001 * ps;
    r2.x = dot(r1.wxz, float3(0.11, 0.3, 0.59));
    r10.w = saturate(ps);
    ps = r2.x;
    r1.zw = r8.xw * r12.yz;
    ps = -r1.x + ps;
    r4.xy = -r10.zw + 1.0;
    r2.x = ps;
    ps = 0.1 - -r2.z;
    r5.x = saturate(r2.x + r1.x);
    r0.x = ps;
    ps = r4.x;
    r2.xyz = r0.yzw * r11.xyz;
    ps = r5.x * ps;
    r0.yz = -r10.xy * r5.xx;
    r0.w = ps;
    r10.xyz = r10.xyz + r0.yzw;
    ps = 5.0 * r0.x;
    r10.w = r10.z - 1.0;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r10.xyw = r10.xyw * r4.yyy;
    r0.z = ps;
    ps = ModShadowGroupColor.x * r0.z;
    r10.z = r10.w + 1.0;
    r5.y = ps;
    r0.xyw = (r4.yyy > 0.0) ? r10.xyz : float3(0.0, 0.0, 1.0);
    r4.xyz = (r4.yyy >= 0.0) ? r0.xyw : float3(0.0, 0.0, 1.0);
    ps = ModShadowGroupColor.y * r0.z;
    r0.w = dot(r4.zxy, r4.zxy);
    r5.z = ps;
    ps = rsqrt(abs(r0.w));
    r0.xyz = -r5.yzx + 1.0;
    r0.w = ps;
    r5.xyz = r4.xyz * r0.www;
    ps = UniformScalar_5.x + r1.y;
    r0.w = dot(r5.zxy, r9.zxy);
    r4.x = ps;
    ps = UniformScalar_5.x + r1.z;
    r10.xyz = r5.xyz * r0.www;
    r4.y = ps;
    r9.xyz = r10.xyz * 2.0 - r9.xyz;
    ps = UniformScalar_5.x + r1.w;
    r0.w = saturate(dot(r7.zxy, r9.zxy));
    r4.z = ps;
    ps = log2(r0.w);
    r1.xyz = r4.xyz * r0.zzz;
    r8.x = ps;
    r4.xyz = r8.xyz * float3(15.0, 0.875, 0.875);
    ps = pow(2.0, r4.x);
    r0.w = saturate(dot(r5.zyx, r7.zyx));
    r0.z = ps;
    r0.xy = r4.yz * r0.xy + 0.125;
    ps = r0.x * r0.y;
    r1.xyz = r1.xyz * r0.zzz;
    r0.x = ps;
    r0.xyz = r0.xxx * r6.xyz + ModShadowColor.xyz;
    r1.xy = r2.xy * r0.ww + r1.xy;
    r1.z = r2.z * r0.w + r1.z;
    r1.xyz = r3.xzy * r1.xyz;
    r0.xyz = r1.xzy * r0.xzy;
    oC0.xyz = r0.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
