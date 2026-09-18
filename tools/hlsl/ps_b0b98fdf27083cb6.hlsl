// ps_b0b98fdf27083cb6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 180 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002D0 10040B00 0000090A 00000000 00008129 003F01FF 00000001 00003050 0000F151 00007254 0000F355 00007456 0000F557 0000F6A0 0000F7A1 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r5 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c8); // float3
float4 ModShadowAccumResolution : register(c11); // float2
float4 ModShadowColor : register(c9); // float3
float4 ModShadowGroupColor : register(c10); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c6); // float
float4 UniformScalar_1 : register(c7); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
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
    float4 color1 : COLOR1; // r7
    float4 color2 : COLOR2; // r8
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
    float4 r7 = In.color1;
    float4 r8 = In.color2;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.x = r1.w * UniformVector_2.x;
    r7.z = 1.0 / ModShadowAccumResolution.y;
    r7.x = -r1.z + 1.0;
    r6.z = 1.0 / r5.w;
    ps = ScreenPositionScaleBias.x * r6.z;
    r6.y = dot(r2.zxy, r2.zxy);
    r8.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.w = r2.z + 0.1;
    r7.y = ps;
    ps = rsqrt(abs(r6.y));
    r7.zw = r7.yz * abs(r9.xy);
    r7.y = ps;
    ps = ScreenPositionScaleBias.y * r6.z;
    r6.y = dot(r4.zxy, r4.zxy);
    r8.y = ps;
    r0.zw = r8.xy * r5.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r6.y));
    r8.xyw = r7.yyy * r2.xyz;
    r6.y = ps;
    ps = UniformVector_2.y * r7.x;
    r4.xyw = r6.yyy * r4.xyz;
    r6.y = ps;
    ps = (-0.5) + r6.x;
    r3.xy = r8.xy * -r4.xy;
    r3.z = ps;
    ps = (-0.5) + r6.y;
    r5.xy = float2((r6.xy >= 0.5));
    r3.w = ps;
    r3.zw = r3.zw - r6.xy;
    r3.zw = r3.zw * r5.xy + r6.xy;
    r3.xyw = r3.zwx + r3.zwy;
    r8.xyz = tex2D(LightAttenuationTexture, r0.zw).xyz;
    r4.z = tex2D(ShadowTexture, r0.xy).x;
    r9 = tex2D(Texture2D_2, r3.xy);
    r3.xyz = tex2D(Texture2D_3, r1.wz).xyz;
    r11.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r10 = tex2D(Texture2D_1, r1.xy);
    r6.xy = tex2D(ModShadowAccumTexture, r7.zw).xy;
    r4.xy = r6.xy * 0.875;
    ps = 5.0 * r6.w;
    r7.w = saturate(r7.y * r2.z);
    r6.y = saturate(ps);
    ps = r10.w;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    ps = 1.0 - r6.x;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r6.w = ps;
    ps = r10.w;
    r1.xyz = r11.xyz * 0.5;
    r6.z = ps;
    ps = UniformScalar_0.x * r6.z;
    r2.xyz = r1.xyz * r10.www;
    r6.x = ps;
    r6.xzw = r6.www * UniformVector_1.xyz + r6.xxx;
    r1.xyz = r2.xyz * UniformScalar_1.xxx + r6.xzw;
    r6.x = r4.w * 2.0 - r4.w;
    r2.xyz = r10.xyz * 2e+01 + r2.xyz;
    ps = 1.0 - r6.y;
    r2.xyz = r2.xyz - r3.xyz;
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r6.y = dot(r5.xyy, float3(1.0, 1.0, 1.0));
    r5.y = ps;
    r0.w = (r6.y == 0.0) ? r9.x : r9.y;
    ps = ModShadowGroupColor.y * r6.z;
    r6.yw = r6.yy + float2(-2.0, -3.0);
    r5.z = ps;
    r6.y = (r6.y == 0.0) ? r9.z : r0.w;
    r5.x = (r6.w == 0.0) ? r9.w : r6.y;
    r6.w = saturate(r8.w * r6.x + r3.w);
    ps = log2(r6.w);
    r6.xyz = -r5.xyz + 1.0;
    r6.w = ps;
    r4.xy = r4.xy * r6.yz + 0.125;
    r6.xy = r6.xw * float2(2.5, 15.0);
    r6.zw = r4.xz * r4.yz;
    r7.xyz = r6.zzz * r7.xyz + ModShadowColor.xyz;
    ps = (-0.5) + r6.x;
    r8.xyz = r6.www * r8.xyz;
    r6.z = saturate(ps);
    r1.xyz = r1.xyz * r6.zzz;
    r2.xyz = r2.xyz * r6.zzz + r3.xyz;
    ps = pow(2.0, r6.y);
    r0.xyz = r2.xyz * r0.xyz;
    r6.x = ps;
    r6.xyz = r1.xyz * r6.xxx;
    r6.xy = r0.xy * r7.ww + r6.xy;
    r6.z = r0.z * r7.w + r6.z;
    r6.xyz = r8.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r6.xyz = r6.xzy * r7.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
