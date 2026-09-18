// ps_6384df121bb02927.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 180 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002D0 10040F00 00000706 00000000 000064E7 007F007F 00000001 00003050 0000F153 0000F254 0000F355 0000F456 00007557 0000F658
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c9); // float2
float4 ModShadowColor : register(c8); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D ModShadowAccumTexture : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord3 : TEXCOORD3; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord5 : TEXCOORD5; // r3
    float4 texcoord6 : TEXCOORD6; // r4
    float4 texcoord7 : TEXCOORD7; // r5
    float4 texcoord8 : TEXCOORD8; // r6
    float2 vPos : VPOS;   // r7 (pixel parameters)
    float vFace : VFACE;  // r7
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord3;
    float4 r2 = In.texcoord4;
    float4 r3 = In.texcoord5;
    float4 r4 = In.texcoord6;
    float4 r5 = In.texcoord7;
    float4 r6 = In.texcoord8;
    float4 r7 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r0.yw = r0.xy * 2e+01;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r8.w = dot(r6.zxy, r6.zxy);
    r0.x = ps;
    r0.xz = r0.xz * abs(r7.xy);
    r0.xz = tex2D(ModShadowAccumTexture, r0.xz).xy;
    r4.xyz = tex2D(Texture2D_0, r0.yw).yxz;
    r10.xyz = r1.xyz * 0.3333333;
    r6.xyw = -UniformVector_0.xyz + 1.0;
    r7.xyz = r4.yxz * 0.5 + UniformVector_0.xyz;
    r10.w = r10.z * r6.w;
    r11.xyz = r3.xyz * 0.3333333;
    r9.xyz = r2.xyz * 0.3333333;
    ps = AmbientColorAndSkyFactor.z * r6.w;
    r0.y = r11.z * r6.w;
    r0.w = ps;
    r8.z = r0.w * r4.z;
    r11.z = r0.y * r4.z;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r0.w = dot(r5.zxy, r5.zxy);
    r0.y = saturate(ps);
    ps = AmbientColorAndSkyFactor.x * r4.y;
    r14.xyz = r6.xyw * r4.yxz;
    r8.x = ps;
    ps = AmbientColorAndSkyFactor.y * r4.x;
    r11.xy = r11.xy * r4.yx;
    r8.y = ps;
    ps = 1.0 - r0.y;
    r8.xy = r8.xy * r6.xy;
    r0.y = ps;
    ps = rsqrt(abs(r0.w));
    r11.xy = r11.xy * r6.xy;
    r0.w = ps;
    ps = r9.z;
    r5.xyz = r0.www * r5.xyz;
    ps = r6.w * ps;
    r0.w = float((r0.y >= 0.004));
    r9.w = ps;
    ps = 0.875 * r0.x;
    r12.xyz = r9.xyw * r4.yxz;
    r9.x = ps;
    r9.w = r5.z * 2.0 - r5.z;
    ps = rsqrt(abs(r8.w));
    r5 = -r5.xxyy * float4(-0.70710677, 0.70710677, 0.8164966, -0.4082483);
    r9.z = ps;
    ps = r5.x + r5.w;
    r13.xyz = r10.xyw * r4.yxz;
    r9.y = ps;
    ps = r5.y + r5.w;
    r10.xyz = r9.zzw * float3(-0.5, 0.5, 0.57735026);
    r9.z = ps;
    ps = 0.875 * r0.z;
    r5.xy = saturate(r9.yz + r10.zz);
    r9.y = ps;
    ps = log2(r5.x);
    r0.y = saturate(r5.z + r10.z);
    r0.x = ps;
    ps = log2(r0.y);
    r9.zw = r10.xy * r6.zz;
    r0.y = ps;
    ps = log2(r5.y);
    r9 = r9 + float4(0.125, 0.125, 0.5, 0.5);
    r0.z = ps;
    ps = r9.x * r9.y;
    r10.xyz = r0.xyz * 16.0;
    r0.x = ps;
    r5.xyz = r0.xxx * r15.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r10.x);
    r9.xy = abs(r9.zw) * abs(r9.zw);
    r10.x = ps;
    ps = pow(2.0, r10.y);
    r0.xy = r14.yx * r9.yy;
    r10.y = ps;
    ps = pow(2.0, r10.z);
    r9 = r14.xzyz * r9.xxxy;
    r10.z = ps;
    r10.xyz = r10.zxy * 0.21952;
    ps = UpperSkyColor.x * r0.y;
    r1.yzw = r10.zzz * r1.zxy;
    r1.x = ps;
    r1.zw = r13.xy * r6.xy + r1.zw;
    ps = UpperSkyColor.y * r0.x;
    r0.z = r13.z + r1.y;
    r1.y = ps;
    ps = r9.w;
    r12.z = r0.z + r12.z;
    r0.x = ps;
    r12.xy = r12.xy * r6.xy + r1.zw;
    r2.xyz = r10.yyy * r2.xyz + r12.xyz;
    ps = UpperSkyColor.z * r0.x;
    r2.xyz = r2.xyz + r11.xyz;
    r1.z = ps;
    r0.xyz = r10.xxx * r3.xyz + r2.xyz;
    r0.xyz = r9.xzy * LowerSkyColor.xyz + r0.xyz;
    r0.xyz = r0.xyz + r1.xyz;
    r0.xyz = r0.xyz + r8.xyz;
    r0.xyz = r7.xyz + r0.xyz;
    ps = -r4.w;
    r0.xyz = r0.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r4.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
