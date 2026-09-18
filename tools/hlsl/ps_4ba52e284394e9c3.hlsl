// ps_4ba52e284394e9c3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 93 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000174 10040600 0000060A 00000000 000058C6 000F003F 00000001 00007054 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD4 (flags 0x7)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
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
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord4 : TEXCOORD4; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 color0 : COLOR0; // r4
    float4 color2 : COLOR2; // r5
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord4;
    float4 r1 = In.texcoord5;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 r6 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / r3.w;
    r4.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r4.xy = r4.xx * ScreenPositionScaleBias.xy;
    r4.w = ps;
    r4.xy = r4.xy * r3.xy + ScreenPositionScaleBias.wz;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = dot(r0.zxy, r0.zxy);
    r4.z = ps;
    r4.zw = r4.zw * abs(r6.xy);
    r1.yz = tex2D(ModShadowAccumTexture, r4.zw).xy;
    r4.yzw = tex2D(LightAttenuationTexture, r4.xy).xyz;
    ps = rsqrt(abs(r5.x));
    r4.x = r0.z + 0.1;
    r5.y = ps;
    ps = 5.0 * r4.x;
    r5.x = dot(r2.zxy, r2.zxy);
    r4.x = saturate(ps);
    ps = rsqrt(abs(r5.x));
    r3.xyz = r5.yyy * r0.zxy;
    r5.x = ps;
    ps = 1.0 - r4.x;
    r2.xyz = r5.xxx * r2.zxy;
    r4.x = ps;
    r5.xz = -r4.xx * ModShadowGroupColor.xy + 1.0;
    r2.yz = -r2.yz;
    r2.x = r2.x * 2.0 - r2.x;
    r4.x = saturate(dot(r3.yzx, r2.yzx));
    ps = log2(r4.x);
    r1.x = r4.y * LightColor.x;
    r4.x = ps;
    ps = 15.0 * r4.x;
    r4.x = ps;
    ps = pow(2.0, r4.x);
    r2.w = saturate(r5.y * r0.z);
    r1.w = ps;
    ps = -UniformVector_0.x;
    r2.xyz = r1.yzw * float3(0.875, 0.875, 0.21952);
    ps = 1.0 + ps;
    r4.xy = r2.zz * r4.zw;
    r5.w = ps;
    ps = LightColor.y * r4.x;
    r0.xyz = -ModShadowColor.xyz + 1.0;
    r5.y = ps;
    r1.w = r2.w * r5.w + r2.z;
    r1.yz = r2.xy * r5.xz + 0.125;
    ps = LightColor.z * r4.y;
    r5.xw = r1.xy * r1.wz;
    r5.z = ps;
    r4.xyz = r5.www * r0.xyz + ModShadowColor.xyz;
    r4.xyz = r5.xyz * r4.xyz;
    oC0.xyz = r4.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
