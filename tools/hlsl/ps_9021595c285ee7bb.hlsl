// ps_9021595c285ee7bb.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10040C00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_7 : register(c4); // float
float4 UniformScalar_8 : register(c5); // float
float4 UniformScalar_9 : register(c6); // float
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ShadowTexture : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = 1.0 / r5.w;
    r6.zw = r6.xx * ScreenPositionScaleBias.xy;
    r6.y = 1.0 / ModShadowAccumResolution.y;
    r12.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r6.xy * abs(r8.xy);
    r6.zw = r6.zw * r5.xy + ScreenPositionScaleBias.wz;
    r5.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r8.xyz = tex2D(LightAttenuationTexture, r6.zw).xyz;
    r7.z = tex2D(ShadowTexture, r0.xy).x;
    r6.z = tex2D(Texture2D_1, r1.xy).x;
    r0.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r6.yw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r7.x = dot(r2.zxy, r2.zxy);
    r10.x = UniformScalar_9.x;
    r6.x = r2.z + 0.1;
    r10.y = 0.0001;
    r7.y = dot(r4.zxy, r4.zxy);
    r10.z = 0.875 * r6.y;
    r11.xyz = r0.xyz * 2.0 - 1.0;
    r7.z = r7.z * r7.z;
    r10.w = 0.875 * r6.w;
    r0.xyz = r7.zzz * r8.xyz;
    r6.y = rsqrt(abs(r7.y));
    r9.xyz = r6.yyy * r4.xyz;
    r6.y = rsqrt(abs(r7.x));
    r8.xyz = r6.yyy * r2.xyz;
    r7.x = 1.0 - r6.z;
    r7.yzw = r7.xxx * r5.yzx;
    r6.x = saturate(5.0 * r6.x);
    ps = 1.0 - r6.x;
    r6.z = dot(r11.zxy, r11.zxy);
    r6.y = ps;
    ps = rsqrt(abs(r6.z));
    r1.xyz = r7.wyz * r12.xyz;
    r6.x = ps;
    r6.yz = -r6.yy * ModShadowGroupColor.xy + 1.0;
    r4.xy = r10.zw * r6.yz + 0.125;
    ps = max(r10.x, r10.y);
    r2.xzw = r11.xyz * r6.xxx;
    r4.z = ps;
    ps = r7.x;
    r6.w = saturate(dot(r2.wxz, r8.zxy));
    r6.y = ps;
    ps = UniformScalar_7.x * r6.y;
    r6.x = dot(r2.wxz, r9.zxy);
    r2.y = ps;
    ps = UniformScalar_7.x * r7.y;
    r6.xyz = r2.xwz * r6.xxx;
    r2.z = ps;
    r6.xyz = r6.xyz * 2.0 - r9.xzy;
    ps = UniformScalar_7.x * r7.z;
    r6.x = saturate(dot(r8.zxy, r6.yxz));
    r2.w = ps;
    ps = log2(r6.x);
    r2.x = r2.y * r5.x;
    r4.w = ps;
    r7.xy = r4.zx * r4.wy;
    r6.xyz = r7.yyy * r3.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r7.x);
    r7.yzw = r2.xwz + UniformScalar_8.xxx;
    r7.x = ps;
    r7.xyz = r7.ywz * r7.xxx;
    r7.xy = r1.xy * r6.ww + r7.xy;
    r7.z = r1.z * r6.w + r7.z;
    r7.xyz = r0.xzy * r7.xzy;
    r7.xyz = r7.xyz * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
