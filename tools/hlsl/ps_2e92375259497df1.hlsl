// ps_2e92375259497df1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 108 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001B0 10040700 0000070A 00000000 000068E7 001F007F 00000021 0000F050 00007154 0000F255 00007356 0000F457 0000F5A0 0000F6A2
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
sampler2D ModShadowAccumTexture : register(s2);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r5.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.y = r1.z + 0.1;
    r5.x = ps;
    r5.xz = r5.xz * abs(r7.xy);
    r6.zw = tex2D(ModShadowAccumTexture, r5.xz).xy;
    r0.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    ps = 1.0 / r4.w;
    r5.x = dot(r0.wyz, r0.wyz);
    r5.z = ps;
    r5.zw = r5.zz * ScreenPositionScaleBias.xy;
    r5.zw = r5.zw * r4.xy + ScreenPositionScaleBias.wz;
    ps = rsqrt(abs(r5.x));
    r5.y = saturate(r5.y * 5.0);
    r5.x = ps;
    r6.xy = r5.xx * r0.yw;
    r6 = r6.xzwy * float4(0.70710677, 0.875, 0.875, 0.70710677);
    ps = r6.x + r6.w;
    r5.x = ps;
    r5.xy = -r5.xy + 1.0;
    r6.x = float((abs(r5.x) > 0.0345));
    r6.w = float((abs(r5.x) >= 0.0345));
    r5.xy = -r5.yy * ModShadowGroupColor.xy + 1.0;
    r6.yz = r6.yz * r5.xy + 0.125;
    r5.xy = r6.xy * r6.wz;
    ps = (-0.1) - -r5.x;
    r6.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.xxxx)) clip(-1.0);
    r6.xyz = tex2D(LightAttenuationTexture, r5.zw).xyz;
    ps = -ModShadowColor.x;
    r2.xyz = -UniformVector_0.xyz + 1.0;
    ps = 1.0 + ps;
    r5.z = dot(r1.zxy, r1.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r5.z));
    r0.yzw = r2.xyz * r0.yzw;
    r5.z = ps;
    ps = -ModShadowColor.y;
    r5.z = saturate(r5.z * r1.z);
    ps = 1.0 + ps;
    r1.xyz = r0.yzw * r5.zzz;
    r0.y = ps;
    ps = -ModShadowColor.z;
    r6.xyz = r1.xyz * r6.xyz;
    ps = 1.0 + ps;
    r6.xyz = r6.xyz * LightColor.xyz;
    r0.z = ps;
    r5.xyz = r5.yyy * r0.xyz + ModShadowColor.xyz;
    r5.xyz = r6.xyz * r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = 0.0;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
