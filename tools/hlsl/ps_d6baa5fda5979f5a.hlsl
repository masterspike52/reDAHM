// ps_d6baa5fda5979f5a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 195 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000030C 10040E00 00000706 00000000 000064E7 007F007F 00000001 00003050 0000F153 0000F254 0000F355 0000F456 00007557 0000F658
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

float4 AmbientColorAndSkyFactor : register(c8); // float4
float4 LowerSkyColor : register(c7); // float3
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c9); // float3
float4 OpacityOverride : register(c5); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UpperSkyColor : register(c6); // float3
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.x;
    r9.x = dot(r5.zxy, r5.zxy);
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r6.zxy, r6.zxy);
    r0.w = ps;
    r0.zw = r0.zw * abs(r7.xy);
    r9.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r8 = tex2D(Texture2D_1, r0.xy);
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r0.yzw = r0.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r9.x));
    r4.xyz = r8.xyz * 0.05;
    r0.x = ps;
    r7.xyz = r4.xyz * UniformVector_1.xyz + UniformVector_0.xyz;
    r4.xyz = r0.xxx * r5.xyz;
    ps = rsqrt(abs(r5.w));
    r0.x = dot(r0.wyz, r0.wyz);
    r5.x = ps;
    ps = rsqrt(abs(r0.x));
    r5.xyz = r5.xxx * r6.xyz;
    r0.x = ps;
    r0.xyz = r0.ywz * r0.xxx;
    r9.x = dot(r5.zxy, r0.yxz);
    r0.w = dot(r0.yxz, r4.zxy);
    r6.x = saturate(dot(r0.yxz, float3(0.57735026, 0.70710677, -0.4082483)));
    r14.y = saturate(dot(r0.yxz, float3(0.57735026, -0.70710677, -0.4082483)));
    ps = r6.x * r6.x;
    r5.xyz = r0.xyz * r0.www;
    r6.y = ps;
    r4.xyz = r5.xyz * 2.0 - r4.xzy;
    r9 = r9.xxyz * float4(-0.5, 0.5, 0.875, 0.875) + float4(0.5, 0.5, 0.125, 0.125);
    ps = r9.z * r9.w;
    r10.xyz = r6.yyx * r3.xyz;
    r0.x = ps;
    r5.xyz = r0.xxx * r11.xyz + ModShadowColor.xyz;
    ps = OpacityOverride.x;
    r10.w = r10.z * r6.x;
    r0.x = saturate(ps);
    ps = 1.0 - r0.x;
    r6.xyz = -UniformVector_0.xyz + 1.0;
    r0.w = ps;
    ps = 0.57735026 * r0.y;
    r11.xyz = r8.xyz * UniformVector_1.xyz;
    r13.x = ps;
    ps = 0.8164966 * r0.z;
    r0.w = float((r0.w >= 0.004));
    r13.y = ps;
    ps = r14.y * r14.y;
    r6.xyz = r11.xyz * r6.xyz;
    r0.x = ps;
    ps = 0.57735026 * r4.y;
    r12.zw = r0.xx * r2.xy;
    r13.z = ps;
    ps = abs(r9.x) * abs(r9.x);
    r0.z = saturate(dot(r4.yxz, float3(0.57735026, 0.70710677, -0.4082483)));
    r9.x = ps;
    ps = abs(r9.y) * abs(r9.y);
    r5.w = saturate(dot(r4.yxz, float3(0.57735026, -0.70710677, -0.4082483)));
    r9.y = ps;
    ps = 0.8164966 * r4.z;
    r0.xy = r6.yx * r9.yy;
    r13.w = ps;
    ps = log2(r5.w);
    r9 = r6.xzyz * r9.xxxy;
    r11.x = ps;
    ps = log2(r0.z);
    r14.zw = saturate(r13.yw + r13.xz);
    r11.z = ps;
    ps = log2(r14.w);
    r14.x = r14.z * r14.z;
    r11.y = ps;
    r11.xyw = r11.zyx * 16.0;
    ps = UpperSkyColor.x * r0.y;
    r13.xyz = r14.xxz * r1.xyz;
    r8.x = ps;
    ps = pow(2.0, r11.x);
    r12.y = r13.z * r14.z;
    r0.z = ps;
    ps = pow(2.0, r11.y);
    r3.xyz = r0.zzz * r3.xyz;
    r0.z = ps;
    ps = UpperSkyColor.y * r0.x;
    r1.xyz = r0.zzz * r1.xyz;
    r8.y = ps;
    ps = pow(2.0, r11.w);
    r11.xyz = r1.xzy * r8.www;
    r14.x = ps;
    ps = r9.w;
    r1 = r14.xxxy * r2.xyzz;
    r0.x = ps;
    ps = UpperSkyColor.z * r0.x;
    r12.x = r1.w * r14.y;
    r8.z = ps;
    r0.xy = r13.xy * r6.xy + r11.xz;
    r0.xy = r12.zw * r6.xy + r0.xy;
    r0.z = dot(r12.xy, r6.zz) + r11.y;
    r0.xyz = r1.xyz * r8.www + r0.xyz;
    r0.xyz = r10.xyw * r6.xyz + r0.xyz;
    r0.xyz = r3.xyz * r8.www + r0.xyz;
    r0.xyz = r9.xzy * LowerSkyColor.xyz + r0.xyz;
    r0.xyz = r0.xyz + r8.xyz;
    r0.xyz = r6.xyz * AmbientColorAndSkyFactor.xyz + r0.xyz;
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
