// ps_2a18279a78b317ae.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 132 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000210 10040900 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
sampler2D ModShadowAccumTexture : register(s4);

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

    r5.x = 1.0 / r4.w;
    r5.xy = r5.xx * ScreenPositionScaleBias.xy;
    r5.w = 1.0 / ModShadowAccumResolution.y;
    r8.xyz = -ModShadowColor.xyz + 1.0;
    r5.z = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r5.zw * abs(r7.xy);
    r5.xy = r5.xy * r4.xy + ScreenPositionScaleBias.wz;
    r2.xyw = tex2D(Texture2D_3, r0.xy).yzx;
    r1.w = tex2D(Texture2D_1, r0.xy).x;
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r5.yzw = tex2D(LightAttenuationTexture, r5.xy).xyz;
    r6.xy = tex2D(ModShadowAccumTexture, r6.xy).xy;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r4.x = UniformScalar_9.x;
    r6.z = dot(r1.zxy, r1.zxy);
    r4.y = 0.0001;
    r5.x = r1.z + 0.1;
    r4.z = max(r4.x, r4.y);
    ps = 0.875 * r6.x;
    r6.w = dot(r3.zxy, r3.zxy);
    r4.x = ps;
    r0.xyz = r0.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r6.w));
    r6.x = -r1.w + 1.0;
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r3.xyz = r6.www * r3.xyz;
    r6.z = ps;
    ps = 0.875 * r6.y;
    r7.xyz = r6.zzz * r1.xyz;
    r4.y = ps;
    ps = 5.0 * r5.x;
    r6.yzw = r6.xxx * r2.wxy;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r1.x = dot(r0.zxy, r0.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r1.x));
    r2.xyz = r6.yzw * r9.xyz;
    r5.x = ps;
    r1.xy = -r0.ww * ModShadowGroupColor.xy + 1.0;
    r4.xy = r4.xy * r1.xy + 0.125;
    ps = LightColor.x * r5.y;
    r1.xzw = r0.xyz * r5.xxx;
    r0.x = ps;
    ps = r6.x;
    r0.w = saturate(dot(r1.wxz, r7.zxy));
    r5.y = ps;
    ps = UniformScalar_7.x * r5.y;
    r5.x = dot(r1.wxz, r3.zxy);
    r1.y = ps;
    ps = UniformScalar_7.x * r6.z;
    r9.xyz = r1.xwz * r5.xxx;
    r1.z = ps;
    r3.xyz = r9.xyz * 2.0 - r3.xzy;
    ps = UniformScalar_7.x * r6.w;
    r5.x = saturate(dot(r7.zxy, r3.yxz));
    r1.w = ps;
    ps = log2(r5.x);
    r1.x = r1.y * r2.w;
    r4.w = ps;
    ps = LightColor.z * r5.w;
    r6.xw = r4.xz * r4.yw;
    r0.y = ps;
    r6.xyz = r6.xxx * r8.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r1.xyz = r1.xwz + UniformScalar_8.xxx;
    r5.x = ps;
    ps = LightColor.y * r5.z;
    r1.xyz = r1.xzy * r5.xxx;
    r0.z = ps;
    r5.xy = r2.xy * r0.ww + r1.xy;
    r5.z = r2.z * r0.w + r1.z;
    r5.xyz = r0.xzy * r5.xyz;
    r5.xyz = r5.xzy * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
