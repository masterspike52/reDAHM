// ps_1ec7be4d2b04e67d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 162 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000288 10040B00 0000080A 00000000 00007108 003F00FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A2
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

float4 LightColor : register(c11); // float3
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformScalar_2 : register(c8); // float
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D Texture2D_3 : register(s4);
sampler2D Texture2D_4 : register(s5);
sampler2D ShadowTexture : register(s6);
sampler2D ModShadowAccumTexture : register(s7);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r5.w;
    r6.zw = UniformVector_2.xy;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r6.xx * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = float((UniformScalar_1.x > UniformScalar_0.x));
    r6.x = ps;
    r6.xy = r6.xy * abs(r8.xy);
    r7.xy = r7.xy * r5.xy + ScreenPositionScaleBias.wz;
    r3.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    r0.x = tex2D(ShadowTexture, r0.xy).x;
    r11.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r5.xyz = tex2D(Texture2D_2, r1.xy).xyz;
    r8.xyz = tex2D(Texture2D_4, r6.zw).xyz;
    r7.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r0.yw = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r6.x = tex2D(Texture2D_3, r1.xy).x;
    r6.y = dot(r4.zxy, r4.zxy);
    r6.z = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r6.z));
    r9.xy = r0.yw * 0.875;
    r1.x = ps;
    ps = rsqrt(abs(r6.y));
    r6.w = saturate(r1.x * r2.z);
    r0.y = ps;
    r5.w = max(UniformScalar_9.x, 0.0001);
    r1.yzw = -ModShadowColor.xyz + 1.0;
    r7.w = float((UniformScalar_1.x >= UniformScalar_0.x));
    ps = r2.z;
    r7.xyz = r7.xyz * UniformVector_1.xyz;
    ps = 0.1 + ps;
    r8.xyz = r8.xyz * r6.xxx;
    r6.z = ps;
    ps = 5.0 * r6.z;
    r5.xyz = r11.xyz * r5.xyz;
    r6.y = saturate(ps);
    r10.xyz = (-abs(r0.zzz) >= 0.0) ? r11.xyz : r5.xyz;
    ps = 1.0 - r6.y;
    r0.yzw = r0.yyy * r4.xzy;
    r6.y = ps;
    ps = -r0.y;
    r5.xyz = r1.xxx * r2.zxy;
    r4.y = ps;
    r4.x = r0.z * 2.0 - r0.z;
    r2.xyz = (-abs(r7.www) >= 0.0) ? r11.xyz : r10.xyz;
    r6.yz = -r6.yy * ModShadowGroupColor.xy + 1.0;
    r0.yz = r9.xy * r6.yz + 0.125;
    ps = -r0.w;
    r2.xyz = -r7.xyz + r2.xyz;
    r4.z = ps;
    r6.y = saturate(dot(r5.yzx, r4.yzx));
    r4.xyz = r2.xyz * UniformScalar_1.xxx + r7.xyz;
    r7.yzw = r4.xyz * UniformScalar_2.xxx + UniformScalar_3.xxx;
    ps = 1.0 - r6.x;
    r0.xy = r0.xy * r0.xz;
    r8.w = ps;
    ps = log2(r6.y);
    r2 = r8 * r4.xyzz;
    r1.x = ps;
    r6.xyz = r0.yyy * r1.yzw + ModShadowColor.xyz;
    ps = r2.z + r2.w;
    r1.yzw = -UniformVector_0.xyz + 1.0;
    r5.z = ps;
    r5.xy = r8.ww * r4.xy + r2.xy;
    r1 = r5.wxyz * r1;
    ps = pow(2.0, r1.x);
    r0.xyz = r0.xxx * r3.xyz;
    r7.x = ps;
    r7.xyz = r7.ywz * r7.xxx;
    r7.y = r1.w * r6.w + r7.y;
    r7.xz = r1.yz * r6.ww + r7.xz;
    r7.xyz = r0.xzy * r7.xyz;
    r7.xyz = r7.xyz * LightColor.xzy;
    r6.xyz = r7.xzy * r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
