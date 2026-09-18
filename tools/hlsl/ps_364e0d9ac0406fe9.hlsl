// ps_364e0d9ac0406fe9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 198 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000318 10040F00 00000706 00000000 000064E7 007F007F 00000001 00003050 0000F153 0000F254 0000F355 0000F456 00007557 0000F658
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
sampler2D Texture2D_1 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

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

    ps = 1.0 / ModShadowAccumResolution.x;
    r8.xyz = -UniformVector_0.xyz + 1.0;
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.z = dot(r5.zxy, r5.zxy);
    r9.y = ps;
    r7.xy = r9.xy * abs(r7.xy);
    r10.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r9 = tex2D(Texture2D_1, r0.xy);
    r7.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r0.y = dot(r6.zxy, r6.zxy);
    r0.x = saturate(ps);
    r13.xyz = r7.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.y));
    r8.w = r8.z * AmbientColorAndSkyFactor.z;
    r0.y = ps;
    ps = rsqrt(abs(r0.z));
    r0.x = -r0.x + 1.0;
    r5.w = ps;
    ps = r5.w;
    r7.xy = r9.xy * AmbientColorAndSkyFactor.xy;
    ps = r5.x * ps;
    r12.xyz = r0.yyy * r6.xyz;
    r11.x = ps;
    ps = r5.w;
    r0.w = float((r0.x >= 0.004));
    ps = r5.y * ps;
    r0.x = dot(r13.zxy, r13.zxy);
    r11.y = ps;
    ps = rsqrt(abs(r0.x));
    r6 = r8 * r9.xyzz;
    r0.x = ps;
    ps = r5.w;
    r0.xyz = r13.yxz * r0.xxx;
    ps = r5.z * ps;
    r10.x = dot(r12.zxy, r0.zyx);
    r11.z = ps;
    r5.x = dot(r0.zyx, r11.zxy);
    r13.w = saturate(dot(r0.zyx, float3(0.57735026, -0.70710677, -0.4082483)));
    ps = 0.57735026 * r0.z;
    r7.z = saturate(dot(r0.zyx, float3(0.57735026, 0.70710677, -0.4082483)));
    r14.x = ps;
    ps = r13.w * r13.w;
    r5.xyz = r0.yzx * r5.xxx;
    r7.w = ps;
    r12.xyz = r5.xyz * 2.0 - r11.xzy;
    r5 = r10.xxyz * float4(-0.5, 0.5, 0.875, 0.875) + float4(0.5, 0.5, 0.125, 0.125);
    ps = 0.8164966 * r0.x;
    r10.xy = r7.ww * r2.xy;
    r14.y = ps;
    ps = r7.z * r7.z;
    r13.xy = r10.xy * r6.xy;
    r7.w = ps;
    ps = r5.z * r5.w;
    r14.zw = r12.yz * float2(0.57735026, 0.8164966);
    r0.x = ps;
    ps = abs(r5.x) * abs(r5.x);
    r0.z = saturate(dot(r12.yxz, float3(0.57735026, 0.70710677, -0.4082483)));
    r10.x = ps;
    ps = abs(r5.y) * abs(r5.y);
    r11.xyz = r7.wwz * r3.xyz;
    r10.y = ps;
    r5.xyz = r0.xxx * r15.xyz + ModShadowColor.xyz;
    ps = r11.z;
    r5.w = saturate(dot(r12.yxz, float3(0.57735026, -0.70710677, -0.4082483)));
    ps = r7.z * ps;
    r0.xy = r6.yx * r10.yy;
    r7.w = ps;
    ps = log2(r5.w);
    r10 = r6.xzyz * r10.xxxy;
    r12.y = ps;
    ps = log2(r0.z);
    r15.yz = saturate(r14.yw + r14.xz);
    r12.z = ps;
    ps = log2(r15.z);
    r15.x = r15.y * r15.y;
    r12.x = ps;
    ps = UpperSkyColor.x * r0.y;
    r14.xyw = r12.zxy * 16.0;
    r9.x = ps;
    ps = UpperSkyColor.y * r0.x;
    r12.xyz = r15.xxy * r1.xyz;
    r9.y = ps;
    ps = pow(2.0, r14.x);
    r12.w = r12.z * r15.y;
    r0.x = ps;
    ps = pow(2.0, r14.y);
    r3.xyz = r0.xxx * r3.xyz;
    r0.x = ps;
    ps = pow(2.0, r14.w);
    r14.xyz = r0.xxx * r1.xyz;
    r13.z = ps;
    ps = r10.w;
    r1 = r13.zzzw * r2.xyzz;
    r0.x = ps;
    ps = UpperSkyColor.z * r0.x;
    r7.z = r1.w * r13.w;
    r9.z = ps;
    r13.z = dot(r7.wz, r6.zz) + 0.0;
    r0.xyz = r14.xyz * r9.www + r13.xyz;
    r0.xyz = r12.xyw * r6.xyz + r0.xyz;
    r0.z = r1.z * r9.w + r0.z;
    r0.xy = r1.xy * r9.ww + r0.xy;
    r0.xy = r11.xy * r6.xy + r0.xy;
    r0.xyz = r3.xyz * r9.www + r0.xyz;
    r0.xyz = r10.xzy * LowerSkyColor.xyz + r0.xyz;
    r0.xyz = r0.xyz + r9.xyz;
    r0.z = r0.z + r6.w;
    r0.xy = r7.xy * r8.xy + r0.xy;
    r0.xyz = r0.xyz + UniformVector_0.xyz;
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
