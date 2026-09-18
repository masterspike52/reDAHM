// ps_e7043cbbeb651119.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 198 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000318 10040F00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c7); // float4
float4 LowerSkyColor : register(c6); // float3
float4 ModShadowAccumResolution : register(c10); // float2
float4 ModShadowColor : register(c8); // float3
float4 ModShadowGroupColor : register(c9); // float3
float4 OpacityOverride : register(c4); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c5); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
samplerCUBE TextureCube_0 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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
    float4 r15 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r6.y = ps;
    ps = rsqrt(abs(r6.x));
    r10.xy = r6.yz * abs(r8.xy);
    r6.x = ps;
    r14.xyz = r6.xxx * r4.zxy;
    r6 = xe_cube(r14.yzx);
    ps = 1.0 / abs(r6.z);
    r7.z = r6.w;
    r7.x = ps;
    r7.xy = r6.yx * r7.xx + 1.5;
    r8.xyz = tex2D(Texture2D_2, r14.xx).xyz;
    r4.xyw = texCUBE(TextureCube_0, xe_cube_dir(r7.xyz)).yzx;
    r6.xzw = tex2D(Texture2D_3, r0.xy).xyz;
    r13.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r7 = tex2D(Texture2D_1, r0.xy).yzxw;
    r12.xy = tex2D(ModShadowAccumTexture, r10.xy).xy;
    r10 = tex2D(Texture2D_4, r0.xy).xywz;
    r11.xyz = -ModShadowColor.xyz + 1.0;
    r8.w = dot(r5.zxy, r5.zxy);
    ps = OpacityOverride.x;
    r0.x = dot(r2.zxy, r2.zxy);
    r13.z = saturate(ps);
    ps = r10.x + r10.x;
    r12.xy = r12.xy * 0.875;
    r12.w = ps;
    ps = r7.z;
    r4.z = r7.w + UniformVector_0.y;
    r6.y = ps;
    r15.xyz = r13.wxy * 2.0 - 1.0;
    ps = 2e+02 * r6.x;
    r10.xy = r4.xy * r10.yw;
    r0.y = ps;
    ps = r10.z;
    r0.zw = r8.yz * r6.zw;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r6.z = r0.y * r8.x;
    r0.y = ps;
    ps = rsqrt(abs(r0.x));
    r6.xw = r0.wz * 2e+02;
    r0.x = ps;
    ps = r0.y;
    r8.xyz = r9.xyz * r7.zxy;
    r13.x = ps;
    ps = 0.0001;
    r0.xyz = r0.xxx * r2.zxy;
    r13.y = ps;
    ps = rsqrt(abs(r8.w));
    r0.w = dot(r15.xyz, r15.xyz);
    r2.x = ps;
    ps = rsqrt(abs(r0.w));
    r4.z = r4.z + r6.w;
    r0.w = ps;
    ps = UniformVector_0.x + r6.z;
    r2.xyz = r2.xxx * r5.xyz;
    r10.z = ps;
    ps = UniformVector_0.z + r6.x;
    r5.xyw = r15.yzx * r0.www;
    r10.w = ps;
    r4.xy = r7.ww * float2(0.5, 1.25) + r10.zw;
    ps = 0.1 - -r0.x;
    r10.z = dot(r2.zxy, r5.wxy);
    r6.x = ps;
    ps = 5.0 * r6.x;
    r6.w = dot(r5.wxy, r14.xyz);
    r6.x = saturate(ps);
    ps = max(r13.x, r13.y);
    r6.z = -r6.x + 1.0;
    r8.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r2.xyz = r5.xyw * r6.www;
    r13.x = ps;
    r5.xyz = r2.xyz * 2.0 - r14.yzx;
    ps = ModShadowGroupColor.y * r6.z;
    r2 = r10.zyxz * float4(0.5, 1.5, 1.8, -0.5);
    r13.y = ps;
    ps = r2.w;
    r10.xyz = r5.www * r1.xyz;
    r6.x = ps;
    ps = 0.5 + r6.x;
    r0.x = saturate(dot(r0.xyz, r5.zxy));
    r0.y = ps;
    ps = 0.5 + r2.x;
    r6.xzw = -r13.xyz + 1.0;
    r0.z = ps;
    r12.yz = r12.xy * r6.xz + 0.125;
    ps = log2(r0.x);
    r13.xy = abs(r0.yz) * abs(r0.yz);
    r13.z = ps;
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r5 = r8.xzyw * r13.xxxz;
    r0.x = ps;
    ps = pow(2.0, r5.w);
    r6.w = float((r6.w >= 0.004));
    r6.x = ps;
    ps = AmbientColorAndSkyFactor.y * r7.x;
    r6.xyz = r6.xxx * r1.zyx;
    r0.y = ps;
    ps = r6.z;
    r1.xyz = r8.xzy * r13.yyy;
    ps = r4.w * ps;
    r2.yz = r6.xy * r2.yz;
    r12.x = ps;
    ps = AmbientColorAndSkyFactor.z * r7.y;
    r2.xw = r12.xy * r12.wz;
    r0.z = ps;
    r6.xyz = r2.www * r11.xyz + ModShadowColor.xyz;
    r7.xyz = r10.xzy * r8.xzy + r2.xyz;
    r7.xyz = r5.xyz * LowerSkyColor.xzy + r7.xyz;
    r7.xyz = r1.xyz * UpperSkyColor.xzy + r7.xyz;
    r7.xyz = r0.xzy * r9.xzy + r7.xyz;
    r7.xyz = r7.xyz + r4.xyz;
    ps = -r3.w;
    r6.xyz = r7.xzy * r6.xyz;
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
