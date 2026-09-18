// ps_a08f334f2b59fa34.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 198 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000318 10040F00 0000090A 00000000 00008D29 007F01FF 00000001 0000F050 0000F153 0000F254 0000F355 0000F456 00007557 0000F658 0000F7A0 0000F8A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD7 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR2 (flags 0xF)
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
    float4 color0 : COLOR0; // r7
    float4 color2 : COLOR2; // r8
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
    float4 r7 = In.color0;
    float4 r8 = In.color2;
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
    r10.xyz = -UniformVector_0.xyz + 1.0;
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.z = dot(r5.zxy, r5.zxy);
    r7.y = ps;
    r7.xy = r7.xy * abs(r9.xy);
    r9.zw = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r8 = tex2D(Texture2D_1, r0.xy);
    r0.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r7.y = dot(r6.zxy, r6.zxy);
    r7.x = saturate(ps);
    r13.xyz = r0.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.y));
    r10.w = r10.z * AmbientColorAndSkyFactor.z;
    r7.y = ps;
    ps = rsqrt(abs(r7.z));
    r7.x = -r7.x + 1.0;
    r0.z = ps;
    ps = r0.z;
    r0.xy = r8.xy * AmbientColorAndSkyFactor.xy;
    ps = r5.x * ps;
    r12.xyz = r7.yyy * r6.xyz;
    r11.x = ps;
    ps = r0.z;
    r7.w = float((r7.x >= 0.004));
    ps = r5.y * ps;
    r7.x = dot(r13.zxy, r13.zxy);
    r11.y = ps;
    ps = rsqrt(abs(r7.x));
    r6 = r10 * r8.xyzz;
    r7.x = ps;
    ps = r0.z;
    r7.xyz = r13.yxz * r7.xxx;
    ps = r5.z * ps;
    r9.y = dot(r12.zxy, r7.zyx);
    r11.z = ps;
    r0.z = dot(r7.zyx, r11.zxy);
    r5.w = saturate(dot(r7.zyx, float3(0.57735026, -0.70710677, -0.4082483)));
    ps = 0.57735026 * r7.z;
    r9.x = saturate(dot(r7.zyx, float3(0.57735026, 0.70710677, -0.4082483)));
    r12.x = ps;
    ps = r5.w * r5.w;
    r5.xyz = r7.yzx * r0.zzz;
    r0.z = ps;
    r14.xyz = r5.xyz * 2.0 - r11.xzy;
    r11 = r9.yzwy * float4(-0.5, 0.875, 0.875, 0.5) + float4(0.5, 0.125, 0.125, 0.5);
    ps = 0.8164966 * r7.x;
    r0.zw = r0.zz * r2.xy;
    r12.y = ps;
    ps = r9.x * r9.x;
    r13.xy = r0.zw * r6.xy;
    r9.y = ps;
    ps = r11.y * r11.z;
    r12.zw = r14.yz * float2(0.57735026, 0.8164966);
    r7.x = ps;
    ps = abs(r11.x) * abs(r11.x);
    r7.z = saturate(dot(r14.yxz, float3(0.57735026, 0.70710677, -0.4082483)));
    r5.x = ps;
    ps = abs(r11.w) * abs(r11.w);
    r11.xyz = r9.yyx * r3.xyz;
    r5.y = ps;
    r8.xyz = r7.xxx * r15.xyz + ModShadowColor.xyz;
    ps = r11.z;
    r0.z = saturate(dot(r14.yxz, float3(0.57735026, -0.70710677, -0.4082483)));
    ps = r9.x * ps;
    r7.xy = r6.yx * r5.yy;
    r0.w = ps;
    ps = log2(r0.z);
    r9 = r6.xzyz * r5.xxxy;
    r5.y = ps;
    ps = log2(r7.z);
    r15.yz = saturate(r12.yw + r12.xz);
    r5.z = ps;
    ps = log2(r15.z);
    r15.x = r15.y * r15.y;
    r5.x = ps;
    ps = UpperSkyColor.x * r7.y;
    r14.xyw = r5.zxy * 16.0;
    r5.x = ps;
    ps = UpperSkyColor.y * r7.x;
    r12.xyz = r15.xxy * r1.xyz;
    r5.y = ps;
    ps = pow(2.0, r14.x);
    r12.w = r12.z * r15.y;
    r7.x = ps;
    ps = pow(2.0, r14.y);
    r3.xyz = r7.xxx * r3.xyz;
    r7.x = ps;
    ps = pow(2.0, r14.w);
    r14.xyz = r7.xxx * r1.xyz;
    r5.z = ps;
    ps = r9.w;
    r1 = r5.zzzw * r2.xyzz;
    r7.x = ps;
    ps = UpperSkyColor.z * r7.x;
    r0.z = r1.w * r5.w;
    r5.z = ps;
    r13.z = dot(r0.wz, r6.zz) + 0.0;
    r7.xyz = r14.xyz * r8.www + r13.xyz;
    r7.xyz = r12.xyw * r6.xyz + r7.xyz;
    r7.z = r1.z * r8.w + r7.z;
    r7.xy = r1.xy * r8.ww + r7.xy;
    r7.xy = r11.xy * r6.xy + r7.xy;
    r7.xyz = r3.xyz * r8.www + r7.xyz;
    r7.xyz = r9.xzy * LowerSkyColor.xyz + r7.xyz;
    r7.xyz = r7.xyz + r5.xyz;
    r7.z = r7.z + r6.w;
    r7.xy = r0.xy * r10.xy + r7.xy;
    r7.xyz = r7.xyz + UniformVector_0.xyz;
    ps = -r4.w;
    r7.xyz = r7.xyz * r8.xyz;
    ps = OpacityOverride.x + ps;
    r8.xyz = r7.xyz - r7.xyz;
    r8.w = ps;
    oC0.w = r8.w * r7.w + r4.w;
    r7.xyz = r8.xyz * r7.www + r7.xyz;
    oC0.xyz = r7.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
