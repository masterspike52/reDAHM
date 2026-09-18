// ps_c0e2ab812cd9ed12.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 132 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000210 10040A00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColorAndFalloffExponent : register(c6); // float4
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 SpotAngles : register(c8); // float2
float4 SpotDirection : register(c7); // float3
float4 UniformScalar_0 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D ShadowTexture : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.zw = r6.xx * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.y = dot(r4.zxy, r4.zxy);
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r6.zw = r6.zw * r5.xy + ScreenPositionScaleBias.wz;
    r5.yzw = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r10.z = tex2D(ShadowTexture, r0.xy).x;
    r6.yw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r0 = tex2D(Texture2D_0, r1.xy).wzxy;
    ps = r2.z;
    r7.z = dot(r2.zxy, r2.zxy);
    ps = 0.1 + ps;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r6.z = ps;
    ps = r0.x;
    r6.x = dot(r3.zxy, r3.zxy);
    r7.x = ps;
    ps = rsqrt(abs(r6.x));
    r8.xyw = r1.xyz * r0.zwy;
    r0.w = ps;
    ps = rsqrt(abs(r7.z));
    r6.x = saturate(-r6.x + 1.0);
    r1.y = ps;
    ps = log2(r6.x);
    r5.x = saturate(r1.y * r2.z);
    r6.x = ps;
    ps = rsqrt(abs(r7.y));
    r0.z = r8.w * r5.x;
    r1.x = ps;
    ps = 0.875 * r6.y;
    r7.y = max(UniformScalar_0.x, 0.0001);
    r7.z = ps;
    ps = 0.875 * r6.w;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r7.w = ps;
    ps = 5.0 * r6.z;
    r0.xy = r0.xx * UniformVector_1.xy;
    r6.y = saturate(ps);
    ps = 1.0 - r6.y;
    r2.xyz = r1.yyy * r2.zxy;
    r6.z = ps;
    ps = LightColorAndFalloffExponent.w * r6.x;
    r1.xyz = r1.xxx * r4.zxy;
    r6.w = ps;
    ps = -r1.y;
    r4.xyz = r0.www * -SpotDirection.xyz;
    r1.y = ps;
    r1.x = r1.x * 2.0 - r1.x;
    ps = -r1.z;
    r6.y = dot(r4.zxy, r3.zxy);
    r1.z = ps;
    r6.xz = -r6.zz * ModShadowGroupColor.xy + 1.0;
    r10.xy = r7.zw * r6.xz + 0.125;
    ps = -SpotAngles.x - -r6.y;
    r7.w = saturate(dot(r2.yzx, r1.yzx));
    r6.x = ps;
    ps = SpotAngles.y * r6.x;
    r1.xy = r10.xz * r10.yz;
    r7.z = saturate(ps);
    r6.xyz = r1.xxx * r9.xyz + ModShadowColor.xyz;
    ps = log2(r7.w);
    r1.xyz = r1.yyy * r5.yzw;
    r7.w = ps;
    ps = pow(2.0, r6.w);
    r7.yz = r7.yz * r7.wz;
    r6.w = ps;
    ps = pow(2.0, r7.y);
    r1.xyz = r1.xyz * r6.www;
    r5.y = ps;
    ps = UniformVector_1.z * r7.x;
    r0.xy = r0.xy * r5.yy;
    r8.z = ps;
    r0.xyz = r8.xyz * r5.xxy + r0.xyz;
    r0.xyz = r1.xyz * r0.xyz;
    r0.xyz = r0.xyz * LightColorAndFalloffExponent.xyz;
    r7.xyz = r0.xyz * r7.zzz;
    r6.xyz = r7.xyz * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
