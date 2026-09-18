// ps_fbbde8c495726692.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 141 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000234 10040900 0000070A 00000000 000068E7 001F007F 00000001 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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

float4 LightColor : register(c4); // float3
float4 ModShadowAccumResolution : register(c7); // float2
float4 ModShadowColor : register(c5); // float3
float4 ModShadowGroupColor : register(c6); // float3
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 ScreenPositionScaleBias : register(c1); // float4
float4 UniformVector_0 : register(c3); // float4
sampler2D LightAttenuationTexture : register(s0);
sampler2D Texture2D_0 : register(s1);
sampler2D Texture2D_1 : register(s2);
sampler2D Texture2D_4 : register(s3);
samplerCUBE TextureCube_0 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

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
    r5.x = dot(r3.zxy, r3.zxy);
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.yz = r5.yy * ScreenPositionScaleBias.xy;
    r6.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.w = r1.z + 0.1;
    r6.x = ps;
    ps = rsqrt(abs(r5.x));
    r7.xy = r6.xy * abs(r7.xy);
    r5.x = ps;
    r7.zw = r5.yz * r4.xy + ScreenPositionScaleBias.wz;
    r8.xyz = r5.xxx * r3.xyz;
    r5 = xe_cube(r8.xyz);
    ps = 1.0 / abs(r5.z);
    r6.z = r5.w;
    r6.x = ps;
    r6.xy = r5.yx * r6.xx + 1.5;
    r6.yzw = texCUBE(TextureCube_0, xe_cube_dir(r6.xyz)).yzx;
    r4.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r2.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r5.yzw = tex2D(LightAttenuationTexture, r7.zw).xyz;
    r9.xy = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r3 = tex2D(Texture2D_4, r0.xy).yzwx;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r0.w = dot(r1.zxy, r1.zxy);
    ps = r3.z;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r9.xy = r9.xy * 0.875;
    r6.x = ps;
    ps = LightColor.x * r5.y;
    r2.xyz = r0.xyz * r2.xyz;
    r0.x = ps;
    r4.xyz = r4.xyz * 2.0 - 1.0;
    ps = LightColor.z * r5.w;
    r5.x = saturate(r1.w * 5.0);
    r0.y = ps;
    ps = 1.0 - r5.x;
    r5.yw = r6.yz * r3.xy;
    r0.z = ps;
    ps = rsqrt(abs(r0.w));
    r5.x = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    ps = rsqrt(abs(r5.x));
    r3.xyz = r0.www * r1.xyz;
    r5.x = ps;
    r0.zw = -r0.zz * ModShadowGroupColor.xy + 1.0;
    r6.yz = r9.xy * r0.zw + 0.125;
    ps = r3.w + r3.w;
    r4.xyz = r4.xyz * r5.xxx;
    r0.z = ps;
    ps = r0.z;
    r5.x = dot(r4.zxy, r8.zxy);
    ps = r6.w * ps;
    r1.yzw = r4.xzy * r5.xxx;
    r1.x = ps;
    r1.yzw = r1.yzw * 2.0 - r8.xzy;
    ps = 1.8 * r5.y;
    r5.x = saturate(dot(r3.zxy, r1.zyw));
    r1.y = ps;
    ps = log2(r5.x);
    r6.x = max(r6.x, 0.0001);
    r6.w = ps;
    ps = 1.5 * r5.w;
    r6.xw = r6.yx * r6.zw;
    r1.z = ps;
    r6.xyz = r6.xxx * r7.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r6.w);
    r5.x = saturate(dot(r4.zxy, r3.zxy));
    r6.w = ps;
    ps = LightColor.y * r5.z;
    r1.xyz = r1.zxy * r6.www;
    r0.z = ps;
    r5.y = r2.z * r5.x + r1.x;
    r5.xz = r2.xy * r5.xx + r1.yz;
    r5.xyz = r0.xyz * r5.xyz;
    r5.xyz = r5.xyz * r6.xzy;
    oC0.xyz = r5.xzy * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
