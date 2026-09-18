// ps_129409199bf6d56e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 174 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002B8 10040B00 0000080A 00000000 00007908 001F00FF 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
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
float4 UniformScalar_10 : register(c9); // float
float4 UniformScalar_11 : register(c10); // float
float4 UniformScalar_7 : register(c6); // float
float4 UniformScalar_8 : register(c7); // float
float4 UniformScalar_9 : register(c8); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_4 : register(c5); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_2 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord4;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color1;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r11 = tex2D(Texture2D_2, r0.xy);
    ps = (-0.5) + r11.w;
    r6.z = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.xxxx)) clip(-1.0);
    r6.y = tex2D(Texture2D_1, r0.xy).x;
    r5.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    ps = r4.w;
    r5.w = r1.z + 0.1;
    r5.xyz = r5.zxy * 2.0 - 1.0;
    ps = 0.0001 * ps;
    r5.w = saturate(r5.w * 5.0);
    r6.x = saturate(ps);
    ps = rsqrt(abs(r6.z));
    r5.w = -r5.w + 1.0;
    r6.z = ps;
    ps = UniformVector_2.x * r5.y;
    r7.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = UniformVector_2.y * r5.z;
    r10.xyz = r6.zzz * r1.xyz;
    r5.z = ps;
    ps = UniformVector_2.z * r5.x;
    r6.zw = r5.ww * ModShadowGroupColor.xy;
    r5.x = ps;
    ps = (-1.0) - -r5.x;
    r9.xyz = -r6.xzw + 1.0;
    r5.w = ps;
    r5.xyz = r5.wyz * r9.xxx;
    ps = 1.0 + r5.x;
    r5.w = ps;
    r5.xyz = (r9.xxx > 0.0) ? r5.yzw : float3(0.0, 0.0, 1.0);
    r6.xzw = (r9.xxx >= 0.0) ? r5.xyz : float3(0.0, 0.0, 1.0);
    ps = rsqrt(abs(r7.x));
    r5.x = dot(r6.wxz, r6.wxz);
    r5.y = ps;
    ps = rsqrt(abs(r5.x));
    r5.yzw = r5.yyy * r3.xyz;
    r5.x = ps;
    r3.yzw = r6.xzw * r5.xxx;
    ps = 1.0 / r4.w;
    r5.x = dot(r3.wyz, r5.wyz);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xyz = r3.yzw * r5.xxx;
    r5.x = ps;
    r5.yzw = r7.xyz * 2.0 - r5.yzw;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = saturate(dot(r10.zxy, r5.wyz));
    r5.z = ps;
    ps = log2(r5.y);
    r7.z = r6.y * UniformScalar_8.x;
    r5.y = ps;
    ps = UniformScalar_7.x * r5.y;
    r7.xy = r4.xy * ScreenPositionScaleBias.xy;
    r5.w = ps;
    ps = pow(2.0, r5.w);
    r5.xz = r5.xz * abs(r8.xy);
    r6.y = ps;
    r6.xyw = r7.xyz * r6.xxy;
    r7.xy = r6.xy + ScreenPositionScaleBias.wz;
    r5.xz = tex2D(ModShadowAccumTexture, r5.xz).xy;
    r7.xyz = tex2D(LightAttenuationTexture, r7.xy).xyz;
    ps = UniformVector_4.x * UniformVector_4.w;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r1.x = ps;
    ps = UniformVector_4.y * UniformVector_4.w;
    r3.x = float((UniformScalar_9.x >= 1.0));
    r1.y = ps;
    ps = UniformVector_4.z * UniformVector_4.w;
    r7.w = float((UniformScalar_9.x > 1.0));
    r1.z = ps;
    ps = -ModShadowColor.x;
    r7.xyz = r7.xyz * r2.www;
    ps = 1.0 + ps;
    r1.xyz = r1.xyz * r11.xyz;
    r2.x = ps;
    ps = -ModShadowColor.y;
    r0.xyz = r1.xyz * r0.xyz;
    r1.xyz = r1.xyz * UniformScalar_10.xxx + UniformScalar_11.xxx;
    ps = 1.0 + ps;
    r5.w = saturate(dot(r3.wyz, r10.zxy));
    r2.y = ps;
    ps = -ModShadowColor.z;
    r6.xyz = r5.yxz * float3(15.0, 0.875, 0.875);
    r3.yz = r6.yz * r9.yz + 0.125;
    r3.w = (r7.w > 0.0) ? 0.0 : r6.w;
    ps = 1.0 + ps;
    r6.yz = r3.xy * r3.wz;
    r2.z = ps;
    r5.xyz = r6.zzz * r2.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.x);
    r6.yzw = r1.xyz + r6.yyy;
    r6.x = ps;
    r6.xyz = r6.yzw * r6.xxx;
    r6.xy = r0.xy * r5.ww + r6.xy;
    r6.z = r0.z * r5.w + r6.z;
    r6.xyz = r7.xyz * r6.xyz;
    r6.xyz = r6.xzy * LightColor.xzy;
    r5.xyz = r6.xzy * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
