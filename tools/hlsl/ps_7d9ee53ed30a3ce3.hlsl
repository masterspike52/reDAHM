// ps_7d9ee53ed30a3ce3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 195 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000030C 10040E00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c11); // float4
float4 LowerSkyColor : register(c10); // float3
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UpperSkyColor : register(c9); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord3 : TEXCOORD3; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float4 color0 : COLOR0; // r6
    float4 color2 : COLOR2; // r7
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
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.texcoord8;
    float4 r6 = In.color0;
    float4 r7 = In.color2;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.zw = r0.xy + UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.xy = UniformVector_2.yx - 0.5;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.zw = r7.xy + r0.yx;
    r6.y = ps;
    r7.xy = r6.xy * abs(r8.xy);
    r6.y = dot(r7.zw, UniformVector_4.yx) + 0.5;
    r6.x = dot(r7.zw, UniformVector_3.yx) + 0.5;
    r13.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    r9.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r14.w = tex2D(Texture2D_2, r6.zw).x;
    r8.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r7 = tex2D(Texture2D_1, r0.xy);
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r6.x = tex2D(Texture2D_2, r6.xy).x;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r0.z = dot(r2.zxy, r2.zxy);
    r6.y = dot(r5.zxy, r5.zxy);
    r6.z = dot(r4.zxy, r4.zxy);
    r14.xyz = -UniformVector_0.yzx + 1.0;
    ps = OpacityOverride.x;
    r0.xyw = r14.xyz * AmbientColorAndSkyFactor.yzx;
    r12.z = saturate(ps);
    r10.xyz = r10.zxy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r8.xyz = r8.yzx + r7.yzx;
    r6.z = ps;
    ps = rsqrt(abs(r6.y));
    r4.xyz = r6.zzz * r4.xyz;
    r6.y = ps;
    ps = rsqrt(abs(r0.z));
    r6.yzw = r6.yyy * r5.xyz;
    r0.z = ps;
    ps = r6.x * r6.x;
    r7.xyz = r0.zzz * r2.zxy;
    r8.w = ps;
    ps = 0.1 - -r7.x;
    r0.z = dot(r10.xyz, r10.xyz);
    r6.x = ps;
    ps = rsqrt(abs(r0.z));
    r5 = r8 * r14;
    r0.z = ps;
    ps = 5.0 * r6.x;
    r10.xyz = r10.xyz * r0.zzz;
    r6.x = saturate(ps);
    ps = r5.w;
    r13.x = dot(r6.wyz, r10.xyz);
    ps = r14.w * ps;
    r6.z = -r6.x + 1.0;
    r9.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r6.x = dot(r10.xyz, r4.zxy);
    r12.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r2.xz = r9.xy * 5e+01;
    r12.y = ps;
    ps = r2.x;
    r6.xyz = r10.yzx * r6.xxx;
    r2.xyw = r6.xyz * 2.0 - r4.xyz;
    ps = r7.w * ps;
    r6 = r13.xyxz * float4(-0.5, 0.875, 0.5, 0.875);
    r0.z = ps;
    ps = r6.x;
    r2.z = max(r2.z, 0.0001);
    r6.x = ps;
    ps = 0.5 + r6.x;
    r7.z = saturate(dot(r7.xyz, r2.wxy));
    r4.x = ps;
    ps = 0.5 + r6.z;
    r7.xyw = -r12.xzy + 1.0;
    r4.y = ps;
    r2.xy = r6.yw * r7.xw + 0.125;
    ps = log2(r7.z);
    r7.xw = abs(r4.xy) * abs(r4.xy);
    r2.w = ps;
    ps = r5.x;
    r6.w = float((r7.y >= 0.004));
    ps = r7.w * ps;
    r7.yz = r2.xz * r2.yw;
    r2.x = ps;
    r6.xyz = r7.yyy * r11.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r7.z);
    r4.xyz = r5.xyz * r7.xxx;
    r10.w = ps;
    ps = r5.y;
    r7.yz = r10.ww * r1.yz;
    ps = r7.w * ps;
    r7.xy = r7.yz * r9.zw;
    r2.y = ps;
    ps = r5.z;
    r1 = r10.xxxw * r1.yzxx;
    ps = r7.w * ps;
    r7.z = r1.w * r9.y;
    r2.z = ps;
    r7.xyz = r1.xyz * r5.xyz + r7.xyz;
    r7.xyz = r4.xyz * LowerSkyColor.yzx + r7.xyz;
    r7.xyz = r2.xyz * UpperSkyColor.yzx + r7.xyz;
    r0.xyw = r0.xyw * r8.xyz + r7.xyz;
    r7.yzw = r0.xyz + UniformVector_0.yzx;
    r7.x = r7.w + r0.w;
    ps = -r3.w;
    r6.xyz = r7.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r7.xyz = r6.xyz - r6.xyz;
    r7.w = ps;
    oC0.w = r7.w * r6.w + r3.w;
    r6.xyz = r7.xyz * r6.www + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
