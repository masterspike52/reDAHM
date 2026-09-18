// ps_aa6b2d7bd53da7f2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 237 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003B4 10040E00 00000606 00000000 000048C6 003F003F 00000021 00003050 00003151 00007254 0000F355 00007456 0000F557
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
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c17); // float2
float4 SpotDirection : register(c16); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7 = tex2D(Texture2D_4, r0.xy);
    r9.y = UniformScalar_2.x * UniformVector_4.y;
    ps = UniformVector_4.y;
    r8.xy = r1.xy * UniformVector_5.xy;
    ps = UniformScalar_5.x * ps;
    r0.z = UniformScalar_1.x * UniformVector_2.x;
    r9.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.w = UniformVector_2.x * UniformScalar_4.x;
    r8.z = ps;
    ps = 1.0 / r5.w;
    r1.yz = r5.xy * ScreenPositionScaleBias.xy;
    r1.x = ps;
    r1.xy = r1.yz * r1.xx + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.z = r7.w - 0.5;
    r8.w = ps;
    ps = UniformVector_4.x * r0.z;
    r8.zw = r8.zw * abs(r6.xy);
    r9.x = ps;
    ps = UniformVector_4.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.zzzz)) clip(-1.0);
    r9.z = ps;
    r6 = r9 + r0.xyxy;
    r1.yzw = tex2D(LightAttenuationTexture, r1.xy).xyz;
    r9.yz = tex2D(ModShadowAccumTexture, r8.zw).xy;
    r14 = tex2D(Texture2D_1, r6.xy);
    r6 = tex2D(Texture2D_2, r6.zw);
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r8.yzw = tex2D(Texture2D_3, r8.xy).xyz;
    r11.xyz = UniformVector_3.xyz * 2e+01;
    r1.x = float((UniformScalar_8.x >= 1.0));
    ps = r5.w;
    r4.w = dot(r4.zxy, r4.zxy);
    ps = 0.0001 * ps;
    r0.y = dot(r2.zxy, r2.zxy);
    r5.x = saturate(ps);
    ps = r2.z;
    r2.w = dot(r3.zxy, r3.zxy);
    ps = 0.1 + ps;
    r0.z = float((UniformScalar_8.x > 1.0));
    r0.x = ps;
    ps = 5.0 * r0.x;
    r13.xyz = r7.xyz * UniformScalar_9.xxx;
    r8.x = saturate(ps);
    r8.yzw = (-abs(r0.zzz) >= 0.0) ? r8.yzw : 1.0;
    ps = rsqrt(abs(r0.y));
    r0.w = saturate(-r2.w + 1.0);
    r5.z = ps;
    r0.xyz = r10.zxy * 2.0 - 1.0;
    ps = UniformVector_2.x * r0.y;
    r12.xyz = r6.xyz * r6.www;
    r5.y = ps;
    ps = rsqrt(abs(r4.w));
    r6.xyz = r5.zzz * r2.xyz;
    r0.y = ps;
    ps = rsqrt(abs(r2.w));
    r10.xyz = r0.yyy * r4.xyz;
    r0.y = ps;
    r2.xyz = r14.xyz * r14.www + r12.xyz;
    r8.yzw = (-abs(r1.xxx) >= 0.0) ? 1.0 : r8.yzw;
    ps = log2(r0.w);
    r12.xyz = r0.yyy * -SpotDirection.xyz;
    r1.x = ps;
    r4.xyz = r13.xyz * r8.yzw + UniformScalar_10.xxx;
    ps = UniformVector_2.y * r0.z;
    r0.y = dot(r12.zxy, r3.zxy);
    r5.z = ps;
    ps = UniformVector_2.z * r0.x;
    r2.xyz = r11.xyz * r2.xyz;
    r5.w = ps;
    r7.xyz = r8.yzw * r7.xyz + r2.xyz;
    ps = r5.w;
    r0.z = dot(r2.zxy, float3(0.11, 0.3, 0.59));
    r0.x = ps;
    ps = 1.0 - r0.x;
    r0.z = r0.z - r2.x;
    r0.x = ps;
    ps = 1.0 - r5.x;
    r8.y = saturate(r0.z + r2.x);
    r0.z = ps;
    ps = r0.x;
    r2.xy = -r5.yz * r8.yy;
    ps = r8.y * ps;
    r0.xw = -r8.xy + 1.0;
    r2.z = ps;
    r8.xy = -r0.xx * ModShadowGroupColor.xy + 1.0;
    r2.xyz = r5.wyz + r2.zxy;
    ps = (-1.0) - -r2.x;
    r5.xyz = -UniformVector_0.xyz + 1.0;
    r2.w = ps;
    r2.xyz = r2.wyz * r0.zzz;
    ps = 1.0 + r2.x;
    r3.xyz = -ModShadowColor.xyz + 1.0;
    r2.w = ps;
    r2.xyz = (r0.zzz > 0.0) ? r2.yzw : float3(0.0, 0.0, 1.0);
    r2.xyz = (r0.zzz >= 0.0) ? r2.xyz : float3(0.0, 0.0, 1.0);
    r0.z = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r0.z));
    r5.xyz = r7.xyz * r5.xyz;
    r0.z = ps;
    r7.xyz = r2.xyz * r0.zzz;
    r0.z = dot(r7.zxy, r10.zxy);
    r2.xyz = r7.xyz * r0.zzz;
    r2.xyz = r2.xyz * 2.0 - r10.xyz;
    ps = LightColorAndFalloffExponent.w * r1.x;
    r0.x = saturate(dot(r6.zxy, r2.zxy));
    r0.z = ps;
    ps = log2(r0.x);
    r2.xyz = r4.xyz * r0.www;
    r9.x = ps;
    ps = -SpotAngles.x - -r0.y;
    r4.xyz = r9.xyz * float3(15.0, 0.875, 0.875);
    r0.x = ps;
    r4.yz = r4.yz * r8.xy + 0.125;
    ps = pow(2.0, r4.x);
    r0.y = saturate(dot(r7.zyx, r6.zyx));
    r0.w = ps;
    ps = SpotAngles.y * r0.x;
    r2.xyz = r2.xyz * r0.www;
    r4.x = saturate(ps);
    r2.xy = r5.xy * r0.yy + r2.xy;
    r2.z = r5.z * r0.y + r2.z;
    ps = pow(2.0, r0.z);
    r0.xw = r4.yx * r4.zx;
    r1.x = ps;
    r0.xyz = r0.xxx * r3.xyz + ModShadowColor.xyz;
    r2.xyz = r2.xyz * r1.xxx;
    r1.xyz = r2.xyz * r1.yzw;
    r1.xyz = r1.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r1.xzy * r0.www;
    r0.xyz = r1.xzy * r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
