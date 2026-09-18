// ps_b2e3b50f099088f2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 207 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000033C 10040E00 00000606 00000000 000048C6 003F003F 00000001 00003050 00003151 00007254 0000F355 00007456 0000F557
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColorAndFalloffExponent : register(c13); // float4
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c15); // float2
float4 SpotDirection : register(c14); // float3
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
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
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.zw = r0.xy * UniformScalar_0.xx;
    r7.xyz = tex2D(Texture2D_0, r0.zw).wxy;
    r0.zw = r1.xy * UniformVector_3.xy;
    r12.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = r5.w;
    r1.x = r2.z + 0.1;
    r13.xy = r7.yz * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r1.x = saturate(r1.x * 5.0);
    r1.z = saturate(ps);
    ps = 1.0 / r5.w;
    r1.x = -r1.x + 1.0;
    r13.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.xy = r1.xx * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r1.xyz = -r1.xzy + 1.0;
    r5.y = ps;
    ps = UniformScalar_1.x * r1.y;
    r6.xy = r5.xy * abs(r6.xy);
    r12.x = ps;
    r5.xy = r12.yz * r13.ww + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r8.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r10.xyz = tex2D(Texture2D_2, r0.zw).xyz;
    r0.xzw = tex2D(Texture2D_1, r0.xy).xyz;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    ps = UniformVector_4.x * UniformVector_4.w;
    r1.w = dot(r4.zxy, r4.zxy);
    r9.x = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r2.w = dot(r2.zxy, r2.zxy);
    r9.y = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r0.y = dot(r3.zxy, r3.zxy);
    r9.z = ps;
    r13.z = r0.w * 2.0 - 1.0;
    r0.zw = r0.xz * 2.0 - 1.0;
    ps = rsqrt(abs(r2.w));
    r0.x = saturate(-r0.y + 1.0);
    r2.w = ps;
    r14.xyz = r9.xzy * UniformVector_5.xzy - r9.xzy;
    r9.yzw = r14.xyz * r10.xxx + r9.xzy;
    ps = rsqrt(abs(r1.w));
    r2.yzw = r2.www * r2.xyz;
    r1.w = ps;
    ps = rsqrt(abs(r0.y));
    r4.xyz = r1.www * r4.xyz;
    r0.y = ps;
    ps = log2(r0.x);
    r14.xyz = r0.yyy * -SpotDirection.xyz;
    r0.x = ps;
    r0.y = dot(r14.zxy, r3.zxy);
    r13.xy = r12.xx * r13.xy + r0.zw;
    r3.yzw = r13.xyz * UniformVector_2.xyz;
    ps = -SpotAngles.x - -r0.y;
    r0.z = dot(r3.wyz, r3.wyz);
    r0.y = ps;
    ps = rsqrt(abs(r0.z));
    r3.x = saturate(r0.y * SpotAngles.y);
    r0.y = ps;
    r3.yzw = r3.yzw * r0.yyy;
    r0.y = dot(r3.wyz, r4.zxy);
    ps = -UniformVector_0.x;
    r0.yzw = r3.ywz * r0.yyy;
    r0.yzw = r0.yzw * 2.0 - r4.xzy;
    ps = 1.0 + ps;
    r0.y = saturate(dot(r2.wyz, r0.zyw));
    r2.x = ps;
    ps = log2(r0.y);
    r2.z = saturate(dot(r3.wyz, r2.wyz));
    r6.z = ps;
    ps = (-1.0) + r7.x;
    r6.xyz = r6.xyz * float3(0.875, 0.875, 15.0);
    r6.w = ps;
    r3.yzw = r6.xyw * r1.xzy + float3(0.125, 0.125, 1.0);
    r0.y = (r12.x > 0.0) ? r3.w : 1.0;
    r9.x = (r12.x >= 0.0) ? r0.y : 1.0;
    ps = -UniformVector_0.y;
    r1.xy = r3.xy * r3.xz;
    r0.yzw = r1.yyy * r11.xyz + ModShadowColor.xyz;
    ps = 1.0 + ps;
    r3.xyz = r9.xwz * r10.xyz;
    r2.y = ps;
    ps = -UniformVector_0.z;
    r3.xyz = r3.xyz * r9.yxx;
    ps = 1.0 + ps;
    r3.xyz = r3.xyz * UniformScalar_5.xxx;
    r2.w = ps;
    ps = LightColorAndFalloffExponent.w * r0.x;
    r2.xyw = r3.xyz * r2.xyw;
    r0.x = ps;
    ps = pow(2.0, r6.z);
    r4.xyz = -r3.xyz + r8.xyz;
    r1.z = ps;
    r3.xyz = r4.xyz * UniformScalar_5.xxx + r3.xyz;
    r3.xyz = r3.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = pow(2.0, r0.x);
    r1.yzw = r3.xyz * r1.zzz;
    r0.x = ps;
    r2.xy = r2.xy * r2.zz + r1.yz;
    r2.z = r2.w * r2.z + r1.w;
    r2.xyz = r2.xyz * r0.xxx;
    r2.xyz = r2.xyz * r5.xyz;
    r2.xyz = r2.xyz * LightColorAndFalloffExponent.xyz;
    r1.xyz = r2.xzy * r1.xxx;
    r0.xyz = r1.xzy * r0.yzw;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
