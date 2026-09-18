// ps_47a762cc8ff5ba91.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 216 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000360 10040E00 0000080A 00000000 00008108 003F00FF 00000001 0000F050 0000F153 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 LowerSkyColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 OpacityOverride : register(c13); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_5 : register(c10); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c14); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

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

    ps = 1.0 / ModShadowAccumResolution.x;
    r6.xy = r0.xy * UniformScalar_0.xx;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.xy = r0.wz * UniformVector_3.xy;
    r6.w = ps;
    r6.zw = r6.zw * abs(r8.xy);
    r8.yzw = tex2D(Texture2D_3, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_2, r7.xy).xyz;
    r11.xy = tex2D(ModShadowAccumTexture, r6.zw).xy;
    r7.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r6.xy).xyw;
    r14.xyz = -ModShadowColor.xyz + 1.0;
    r6.y = dot(r4.zxy, r4.zxy);
    r6.z = dot(r5.zxy, r5.zxy);
    r9.xyz = UniformVector_4.yzx * UniformVector_4.www;
    r6.x = dot(r2.zxy, r2.zxy);
    r0.xy = r0.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r11.z = r0.z - 1.0;
    r6.x = ps;
    r7.xyz = r7.zxy * 2.0 - 1.0;
    r10.xyz = r9.xyz * UniformVector_5.yzx - r9.xyz;
    ps = rsqrt(abs(r6.z));
    r11.xy = r11.xy * 0.875;
    r7.w = ps;
    r12.yzw = r10.xyz * r13.xxx + r9.xyz;
    ps = r3.w;
    r10.xyz = r6.xxx * r2.xyz;
    ps = 0.0001 * ps;
    r6.x = r10.z + 0.1;
    r2.z = saturate(ps);
    ps = OpacityOverride.x;
    r6.x = saturate(r6.x * 5.0);
    r6.z = saturate(ps);
    ps = rsqrt(abs(r6.y));
    r6.xz = -r6.zx + 1.0;
    r6.y = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r9.xyz = r6.yyy * r4.xyz;
    r2.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r6.w = float((r6.x >= 0.004));
    r2.y = ps;
    r6.xyz = -r2.xzy + 1.0;
    r4.xyz = r11.xyz * r6.xzy + float3(0.125, 0.125, 1.0);
    ps = UniformScalar_1.x * r6.y;
    r11.xyz = UniformVector_0.xyz + UniformScalar_7.xxx;
    r2.z = ps;
    r2.xy = r2.zz * r0.xy + r7.yz;
    r0.w = (r2.z > 0.0) ? r4.z : 1.0;
    ps = r4.x * r4.y;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r6.x = ps;
    r6.xyz = r6.xxx * r14.xyz + ModShadowColor.xyz;
    r12.x = (r2.z >= 0.0) ? r0.w : 1.0;
    ps = UniformVector_2.z * r7.x;
    r2.xy = r2.xy * UniformVector_2.xy;
    r2.z = ps;
    r0.w = dot(r2.zxy, r2.zxy);
    r7.xyz = r12.xyz * r13.xyz;
    r7.xyz = r7.xyz * r12.wxx;
    ps = rsqrt(abs(r0.w));
    r7.xyz = r7.xyz * UniformScalar_5.xxx;
    r0.w = ps;
    ps = r7.w;
    r2.xyz = r2.xyz * r0.www;
    ps = r5.x * ps;
    r0.xyz = r7.xyz * r0.xyz;
    r8.x = ps;
    ps = r7.w;
    r4.xyz = -r7.xyz + r8.yzw;
    ps = r5.y * ps;
    r0.w = dot(r2.zxy, r9.zxy);
    r8.y = ps;
    ps = r7.w;
    r12.xyz = r2.xyz * r0.www;
    r7.xyz = r4.xyz * UniformScalar_5.xxx + r7.xyz;
    r4.xyz = r7.xzy * UniformScalar_6.xxx + UniformScalar_7.xxx;
    r9.xyz = r12.xyz * 2.0 - r9.xyz;
    r7.xyz = r7.xyz * UniformScalar_6.xxx + r11.xyz;
    r7.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz + r7.xyz;
    ps = r5.z * ps;
    r7.w = saturate(dot(r10.zxy, r9.zxy));
    r8.z = ps;
    ps = log2(r7.w);
    r5.x = dot(r8.zxy, r2.zxy);
    r5.y = ps;
    r2.xyw = r5.xxy * float3(-0.5, 0.5, 15.0);
    ps = pow(2.0, r2.w);
    r5.xy = r2.xy + 0.5;
    r7.w = ps;
    ps = abs(r5.x) * abs(r5.x);
    r2.xyz = r2.zzz * r1.xyz;
    r0.w = ps;
    ps = abs(r5.y) * abs(r5.y);
    r1.xyz = r7.www * r1.xzy;
    r7.w = ps;
    r5.xyz = r0.xzy * r0.www;
    r8.xyz = r0.xzy * r7.www;
    r7.xyz = r8.xyz * UpperSkyColor.xzy + r7.xzy;
    r7.xyz = r5.xzy * LowerSkyColor.xyz + r7.xzy;
    r7.xyz = r1.xyz * r4.xyz + r7.xzy;
    r7.xyz = r2.xyz * r0.xyz + r7.xzy;
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
