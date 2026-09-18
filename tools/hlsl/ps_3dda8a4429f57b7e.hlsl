// ps_3dda8a4429f57b7e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 171 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000002AC 10040E00 0000070A 00000000 000070E7 001F007F 00000001 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c9); // float4
float4 ConstantLighting : register(c10); // float3
float4 LowerSkyColor : register(c8); // float3
float4 ModShadowAccumResolution : register(c13); // float2
float4 ModShadowColor : register(c11); // float3
float4 ModShadowGroupColor : register(c12); // float3
float4 OpacityOverride : register(c6); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_6 : register(c4); // float
float4 UniformScalar_7 : register(c5); // float
float4 UniformVector_0 : register(c3); // float4
float4 UpperSkyColor : register(c7); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D ModShadowAccumTexture : register(s5);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
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
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.texcoord8;
    float4 r5 = In.color0;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    ps = 1.0 / ModShadowAccumResolution.y;
    r5.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r13.xyz = -ModShadowColor.xyz + 1.0;
    r5.x = ps;
    r5.xy = r5.xy * abs(r7.xy);
    r7.xyz = tex2D(Texture2D_2, r0.xy).xyz;
    r8.xyz = tex2D(Texture2D_4, r0.xy).xyz;
    r14.zw = tex2D(ModShadowAccumTexture, r5.xy).xy;
    r10.xyz = tex2D(Texture2D_0, r0.xy).xyz;
    r6.xyz = tex2D(Texture2D_3, r0.xy).zxy;
    r5.xyz = tex2D(Texture2D_1, r0.xy).xzy;
    ps = OpacityOverride.x;
    r6.w = dot(r1.zxy, r1.zxy);
    r10.w = saturate(ps);
    ps = UniformScalar_7.x;
    r5.w = dot(r4.zxy, r4.zxy);
    r0.x = ps;
    ps = 0.0001;
    r9.xyz = -UniformVector_0.xyz + 1.0;
    r0.y = ps;
    ps = max(r0.x, r0.y);
    r0.w = dot(r3.zxy, r3.zxy);
    r14.x = ps;
    r0.xyz = r10.xyz * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r12.xyz = r9.xyz * r6.yzx;
    r0.w = ps;
    ps = rsqrt(abs(r5.w));
    r3.xyz = r0.www * r3.xyz;
    r5.w = ps;
    ps = 0.8 * r5.x;
    r10.xyz = r5.www * r4.xyz;
    r4.x = ps;
    ps = rsqrt(abs(r6.w));
    r5.w = dot(r0.zxy, r0.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r5.w));
    r1.xyz = r6.www * r1.xzy;
    r5.w = ps;
    ps = 0.8 * r5.z;
    r0.yzw = r0.xyz * r5.www;
    r4.y = ps;
    ps = 0.1 - -r1.y;
    r14.y = dot(r10.zxy, r0.wyz);
    r5.x = ps;
    ps = 5.0 * r5.x;
    r5.w = dot(r0.wyz, r3.zxy);
    r5.z = saturate(ps);
    ps = AmbientColorAndSkyFactor.x * r6.y;
    r5.z = -r5.z + 1.0;
    r10.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r11.xyz = r0.ywz * r5.www;
    r10.y = ps;
    r11.xyz = r11.xyz * 2.0 - r3.xzy;
    ps = ModShadowGroupColor.y * r5.z;
    r3 = r14.yyzw * float4(0.5, -0.5, 0.875, 0.875);
    r10.z = ps;
    ps = r3.x;
    r5.w = saturate(dot(r1.yxz, r11.yxz));
    r5.z = ps;
    ps = 0.5 + r5.z;
    r10.yzw = -r10.yzw + 1.0;
    r1.x = ps;
    ps = 0.5 + r3.y;
    r6.w = float((r10.w >= 0.004));
    r1.y = ps;
    r14.yz = r3.zw * r10.yz + 0.125;
    ps = AmbientColorAndSkyFactor.y * r6.z;
    r1.xz = abs(r1.xy) * abs(r1.xy);
    r10.y = ps;
    ps = log2(r5.w);
    r11.xyz = r12.yzx * r1.xxx;
    r14.w = ps;
    ps = AmbientColorAndSkyFactor.z * r6.x;
    r1.xy = r14.xy * r14.wz;
    r10.z = ps;
    r6.xyz = r1.yyy * r13.xyz + ModShadowColor.xyz;
    ps = pow(2.0, r1.x);
    r13.xyz = r12.yzx * r1.zzz;
    r0.x = ps;
    ps = ConstantLighting.y * r0.x;
    r3 = r0.wwwx * ConstantLighting.xyzx;
    r1.x = ps;
    ps = ConstantLighting.z * r0.x;
    r12.xyz = r3.xyz * r12.xyz;
    r1.y = ps;
    r0.xyz = r13.zyx * LowerSkyColor.xzy + r12.xzy;
    r0.xyz = r11.zxy * UpperSkyColor.xyz + r0.xzy;
    r0.xyz = r10.zyx * r9.zyx + r0.zyx;
    r0.z = r3.w * r8.x + r0.z;
    r0.xy = r1.xy * r8.yz + r0.yx;
    ps = 0.8 * r5.y;
    r0.xy = r0.xy + UniformVector_0.yz;
    r4.z = ps;
    r5.xyz = r4.yzx * UniformScalar_6.xxx + r0.xyz;
    r5.yzw = r7.xyz * 2.0 + r5.zxy;
    ps = UniformVector_0.x + r5.y;
    r5.x = ps;
    ps = -r2.w;
    r5.xyz = r5.xzw * r6.xyz;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.w + r2.w;
    r5.xyz = r0.xyz * r6.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
