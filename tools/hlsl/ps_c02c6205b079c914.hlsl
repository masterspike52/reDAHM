// ps_c02c6205b079c914.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10040900 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LightColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c7); // float3
float4 ModShadowGroupColor : register(c8); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformScalar_0 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 color0 : COLOR0; // r5
    float4 color2 : COLOR2; // r6
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
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r4.w;
    r2.yzw = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.z = dot(r3.zxy, r3.zxy);
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r6.xy = r6.xy * r4.xy + ScreenPositionScaleBias.wz;
    r8.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xyz = tex2D(LightAttenuationTexture, r6.xy).zxy;
    r5.xy = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r0 = tex2D(Texture2D_1, r0.xy).wxyz;
    r7.x = max(UniformScalar_0.x, 0.0001);
    ps = r1.z;
    r5.w = dot(r1.zxy, r1.zxy);
    ps = 0.1 + ps;
    r4.z = r0.x * UniformVector_1.z;
    r6.w = ps;
    ps = 0.875 * r5.x;
    r4.xyw = -UniformVector_0.xyz + 1.0;
    r7.y = ps;
    ps = 0.875 * r5.y;
    r4.xyw = r4.xyw * r0.yzw;
    r7.z = ps;
    r9.xyz = r8.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r5.x = saturate(r6.w * 5.0);
    r5.y = ps;
    ps = 1.0 - r5.x;
    r8.xyz = r5.yyy * r1.xyz;
    r6.w = ps;
    ps = rsqrt(abs(r5.z));
    r5.y = dot(r9.zxy, r9.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r5.y));
    r5.xzw = r5.xxx * r3.xyz;
    r5.y = ps;
    r1.xy = -r6.ww * ModShadowGroupColor.xy + 1.0;
    r7.yz = r7.yz * r1.xy + 0.125;
    ps = LightColor.x * r6.y;
    r3.xyz = r9.xyz * r5.yyy;
    r1.x = ps;
    ps = LightColor.y * r6.z;
    r5.y = dot(r3.zxy, r5.wxz);
    r1.y = ps;
    ps = r0.x;
    r9.xyz = r3.xzy * r5.yyy;
    r5.y = ps;
    r5.xzw = r9.xyz * 2.0 - r5.xwz;
    ps = UniformVector_1.x * r5.y;
    r5.x = saturate(dot(r8.zxy, r5.zxw));
    r1.z = ps;
    ps = log2(r5.x);
    r2.x = saturate(dot(r3.zxy, r8.zxy));
    r7.w = ps;
    ps = UniformVector_1.y * r0.x;
    r5.xw = r7.yx * r7.zw;
    r1.w = ps;
    r5.xyz = r5.xxx * r2.yzw + ModShadowColor.xyz;
    ps = pow(2.0, r5.w);
    r0.z = r4.w * r2.x;
    r2.y = ps;
    ps = LightColor.z * r6.x;
    r0.xy = r1.zw * r2.yy;
    r1.z = ps;
    r6.xyz = r4.xyz * r2.xxy + r0.xyz;
    r6.xyz = r1.xyz * r6.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
