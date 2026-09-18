// ps_09335d1f939df31a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000360 10040E00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
sampler2D ShadowTexture : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xy = r1.xy * UniformScalar_0.xx;
    r6.xyw = tex2D(Texture2D_0, r6.xy).xyw;
    r0.zw = r1.wz * UniformVector_3.xy;
    r10.yz = r5.xy * ScreenPositionScaleBias.xy;
    ps = r5.w;
    r6.z = r2.z + 0.1;
    r13.xy = r6.xy * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r6.x = saturate(r6.z * 5.0);
    r7.z = saturate(ps);
    ps = 1.0 / r5.w;
    r6.x = -r6.x + 1.0;
    r13.w = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xy = r6.xx * ModShadowGroupColor.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xyz = -r7.xzy + 1.0;
    r6.y = ps;
    ps = UniformScalar_1.x * r7.y;
    r8.xy = r6.xy * abs(r8.xy);
    r10.x = ps;
    r6.xy = r10.yz * r13.ww + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r11.yz = tex2D(ModShadowAccumTexture, r8.xy).xy;
    r14.xyz = tex2D(LightAttenuationTexture, r6.xy).xyz;
    r0.y = tex2D(ShadowTexture, r0.xy).x;
    r9.xyz = tex2D(Texture2D_2, r0.zw).xyz;
    r0.xzw = tex2D(Texture2D_1, r1.xy).xyz;
    ps = UniformVector_4.x * UniformVector_4.w;
    r6.z = dot(r4.zxy, r4.zxy);
    r1.x = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r7.w = dot(r2.zxy, r2.zxy);
    r1.y = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r6.y = dot(r3.zxy, r3.zxy);
    r1.z = ps;
    r13.z = r0.w * 2.0 - 1.0;
    r0.zw = r0.xz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r6.x = saturate(-r6.y + 1.0);
    r7.w = ps;
    r8.xyz = r1.xzy * UniformVector_5.xzy - r1.xzy;
    r8.yzw = r8.xyz * r9.xxx + r1.xzy;
    ps = rsqrt(abs(r6.z));
    r12.xyz = r7.www * r2.xyz;
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r4.xyz = r6.zzz * r4.xyz;
    r6.y = ps;
    ps = log2(r6.x);
    r1.xyz = r6.yyy * -SpotDirection.xyz;
    r6.z = ps;
    r6.y = dot(r1.zxy, r3.zxy);
    ps = -SpotAngles.x - -r6.y;
    r2.yzw = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    ps = SpotAngles.y * r6.x;
    r0.x = saturate(ps);
    r0.xy = r0.xy * r0.xy;
    r1.xyz = r0.yyy * r14.xyz;
    r13.xy = r10.xx * r13.xy + r0.zw;
    ps = LightColorAndFalloffExponent.w * r6.z;
    r3.xyz = r13.xyz * UniformVector_2.xyz;
    r7.w = ps;
    ps = pow(2.0, r7.w);
    r6.z = dot(r3.zxy, r3.zxy);
    r7.w = ps;
    ps = rsqrt(abs(r6.z));
    r1.xyz = r1.xzy * r7.www;
    r6.z = ps;
    r3.xyz = r3.xyz * r6.zzz;
    r6.z = dot(r3.zxy, r4.zxy);
    ps = -UniformVector_0.x;
    r13.xyz = r3.xzy * r6.zzz;
    r4.xyz = r13.xyz * 2.0 - r4.xzy;
    ps = 1.0 + ps;
    r6.z = saturate(dot(r12.zxy, r4.yxz));
    r2.x = ps;
    ps = log2(r6.z);
    r7.w = saturate(dot(r3.zxy, r12.zxy));
    r11.x = ps;
    ps = (-1.0) + r6.w;
    r3.yzw = r11.xyz * float3(15.0, 0.875, 0.875);
    r3.x = ps;
    r6.xyw = r3.zwx * r7.xzy + float3(0.125, 0.125, 1.0);
    r6.w = (r10.x > 0.0) ? r6.w : 1.0;
    ps = -UniformVector_0.y;
    r6.x = r6.x * r6.y;
    r6.xyz = r6.xxx * r2.yzw + ModShadowColor.xyz;
    r8.x = (r10.x >= 0.0) ? r6.w : 1.0;
    ps = 1.0 + ps;
    r7.xyz = r8.xwz * r9.xyz;
    r2.y = ps;
    ps = -UniformVector_0.z;
    r7.xyz = r7.xyz * r8.yxx;
    ps = 1.0 + ps;
    r7.xyz = r7.xyz * UniformScalar_5.xxx;
    r2.z = ps;
    r0.yzw = r7.xyz * r2.xyz;
    ps = pow(2.0, r3.y);
    r2.xyz = -r7.xyz + r5.xyz;
    r6.w = ps;
    r7.xyz = r2.xyz * UniformScalar_5.xxx + r7.xyz;
    r7.xyz = r7.xyz * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r7.xyz = r7.xyz * r6.www;
    r7.xy = r0.yz * r7.ww + r7.xy;
    r7.z = r0.w * r7.w + r7.z;
    r7.xyz = r1.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r7.xzy * r0.xxx;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
