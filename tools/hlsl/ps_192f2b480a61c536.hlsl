// ps_192f2b480a61c536.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 180 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002D0 10041100 0000090A 00000000 00008D29 007F01FF 00000001 0000F050 0000F153 0000F254 0000F355 0000F456 00007557 0000F658 0000F7A0 0000F8A2
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
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r8.xy = r0.xy * 2e+01;
    r7.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.y = dot(r6.zxy, r6.zxy);
    r7.x = ps;
    r7.xz = r7.xz * abs(r9.xy);
    r7.zw = tex2D(ModShadowAccumTexture, r7.xz).xy;
    r8.xyz = tex2D(Texture2D_0, r8.xy).yxz;
    r13.xyz = r1.xyz * 0.3333333;
    r0.xyz = -UniformVector_0.zxy + 1.0;
    r9.xyz = r8.yxz * 0.5 + UniformVector_0.xyz;
    r13.w = r13.z * r0.x;
    r10.xyw = r3.zxy * 0.3333333;
    r12.xyz = r2.xyz * 0.3333333;
    ps = AmbientColorAndSkyFactor.z * r0.x;
    r7.x = r10.x * r0.x;
    r8.w = ps;
    r10.z = r8.w * r8.z;
    r11.z = r7.x * r8.z;
    r15.xyz = -ModShadowColor.xyz + 1.0;
    ps = OpacityOverride.x;
    r8.w = dot(r5.zxy, r5.zxy);
    r7.x = saturate(ps);
    ps = AmbientColorAndSkyFactor.x * r8.y;
    r14.xyz = r0.yzx * r8.yxz;
    r10.x = ps;
    ps = AmbientColorAndSkyFactor.y * r8.x;
    r11.xy = r10.yw * r8.yx;
    r10.y = ps;
    ps = 1.0 - r7.x;
    r10.xy = r10.xy * r0.yz;
    r7.x = ps;
    ps = rsqrt(abs(r8.w));
    r11.xy = r11.xy * r0.yz;
    r8.w = ps;
    ps = r12.z;
    r5.yzw = r8.www * r5.xzy;
    ps = r0.x * ps;
    r8.w = float((r7.x >= 0.004));
    r12.w = ps;
    ps = 0.875 * r7.z;
    r12.xyz = r12.xyw * r8.yxz;
    r5.x = ps;
    r5.z = r5.z * 2.0 - r5.z;
    ps = rsqrt(abs(r7.y));
    r17 = -r5.yyww * float4(-0.70710677, 0.70710677, -0.4082483, 0.8164966);
    r5.y = ps;
    ps = r17.x + r17.z;
    r13.xyz = r13.xyw * r8.yxz;
    r7.x = ps;
    ps = r17.y + r17.z;
    r16.xyz = r5.yyz * float3(-0.5, 0.5, 0.57735026);
    r7.y = ps;
    ps = 0.875 * r7.w;
    r8.xy = saturate(r7.xy + r16.zz);
    r5.y = ps;
    ps = log2(r8.x);
    r7.y = saturate(r17.w + r16.z);
    r7.x = ps;
    ps = log2(r7.y);
    r5.zw = r16.xy * r6.zz;
    r7.y = ps;
    ps = log2(r8.y);
    r5 = r5 + float4(0.125, 0.125, 0.5, 0.5);
    r7.z = ps;
    ps = r5.x * r5.y;
    r7.xzw = r7.xyz * 16.0;
    r7.y = ps;
    r8.xyz = r7.yyy * r15.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r7.x);
    r5.xy = abs(r5.zw) * abs(r5.zw);
    r6.x = ps;
    ps = pow(2.0, r7.z);
    r7.xy = r14.yx * r5.yy;
    r6.y = ps;
    ps = pow(2.0, r7.w);
    r5 = r14.xzyz * r5.xxxy;
    r6.z = ps;
    r6.xyz = r6.zxy * 0.21952;
    ps = UpperSkyColor.x * r7.y;
    r1.yzw = r6.zzz * r1.zxy;
    r1.x = ps;
    r1.zw = r13.xy * r0.yz + r1.zw;
    ps = UpperSkyColor.y * r7.x;
    r7.z = r13.z + r1.y;
    r1.y = ps;
    ps = r5.w;
    r7.w = r7.z + r12.z;
    r7.x = ps;
    r7.yz = r12.xy * r0.yz + r1.zw;
    r7.yzw = r6.yyy * r2.xyz + r7.yzw;
    ps = UpperSkyColor.z * r7.x;
    r7.yzw = r7.yzw + r11.xyz;
    r1.z = ps;
    r7.xyz = r6.xxx * r3.xyz + r7.yzw;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xyz;
    r7.xyz = r7.xyz + r1.xyz;
    r7.xyz = r7.xyz + r10.xyz;
    r7.xyz = r9.xyz + r7.xyz;
    ps = -r4.w;
    r7.xyz = r7.xyz * r8.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r7.xyz - r7.xyz;
    r0.w = ps;
    oC0.w = r0.w * r8.w + r4.w;
    r7.xyz = r0.xyz * r8.www + r7.xyz;
    oC0.xyz = r7.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
