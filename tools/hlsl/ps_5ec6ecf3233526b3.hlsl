// ps_5ec6ecf3233526b3.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 315 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004EC 10041200 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c14); // float4
float4 ConstantLighting : register(c15); // float3
float4 LowerSkyColor : register(c13); // float3
float4 ModShadowAccumResolution : register(c18); // float2
float4 ModShadowColor : register(c16); // float3
float4 ModShadowGroupColor : register(c17); // float3
float4 OpacityOverride : register(c11); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_3 : register(c9); // float
float4 UniformScalar_4 : register(c10); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UpperSkyColor : register(c12); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

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
    float4 r15 = 0.0;
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 r18 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r9.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r8.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    ps = r0.w;
    r6.zw = r0.wz * UniformVector_6.xy;
    ps = UniformVector_2.x * ps;
    r11.xy = r0.wz * UniformVector_1.xy;
    r12.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = r2.w - 4e+02;
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r3.zxy, r3.zxy);
    r6.y = ps;
    r5.yz = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r5.x = saturate(r5.x * 0.00022222222);
    r5.w = ps;
    ps = -r0.z;
    r8.xyz = r5.www * r3.xyz;
    ps = 1.0 + ps;
    r3.xzw = r5.xyz * float3(-0.025, 0.5, 0.5);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r12.zw = r8.xy * r3.xx;
    r12.y = ps;
    r5.xy = r12.xy - 0.5;
    r18.xy = float2((r12.xy >= 0.5));
    ps = r6.x;
    r5.xy = r5.xy - r12.xy;
    ps = abs(r7.x) * ps;
    r11.zw = r5.xy * r18.xy;
    r10.x = ps;
    ps = r6.y;
    r5 = r12.zwxy + r11;
    ps = abs(r7.y) * ps;
    r6.xy = r5.zw + r5.zw;
    r10.y = ps;
    r11.yz = tex2D(ModShadowAccumTexture, r10.xy).xy;
    r10.xyz = tex2D(Texture2D_4, r5.xy).xyz;
    r14.xyz = tex2D(Texture2D_6, r6.zw).xyz;
    r17 = tex2D(Texture2D_1, r6.xy);
    r6.xyw = tex2D(Texture2D_0, r5.xy).xyz;
    r7.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r12.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r13.xyz = tex2D(Texture2D_7, r0.xy).xyz;
    ps = OpacityOverride.x;
    r6.z = saturate(r2.w * 0.0001);
    r7.w = saturate(ps);
    ps = UniformVector_5.x * UniformVector_5.w;
    r0.w = dot(r4.zxy, r4.zxy);
    r0.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r5.z = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r5.xyw = -UniformVector_0.yxz + 1.0;
    r0.z = ps;
    r13.yzw = r13.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r16.x = r8.w * r12.z - 1.0;
    r11.xw = r12.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r16.yzw = r0.xyz * r9.xyz;
    r5.z = ps;
    r15.xyz = r7.zxy * 2.0 - 1.0;
    r12.xyz = r6.wxy * 2.0 - 1.0;
    r13.x = r15.x * UniformVector_4.z - r12.x;
    ps = AmbientColorAndSkyFactor.x * r5.y;
    r9.xyz = r5.zzz * r1.xyz;
    r3.x = ps;
    ps = AmbientColorAndSkyFactor.y * r5.x;
    r9.w = dot(r18.xyy, float3(1.0, 1.0, 1.0));
    r3.y = ps;
    r5.z = (r9.w == 0.0) ? r17.x : r17.y;
    ps = rsqrt(abs(r0.w));
    r0.xyz = r9.zww + float3(0.1, -3.0, -2.0);
    r0.w = ps;
    ps = 5.0 * r0.x;
    r1.xyz = r0.www * r4.xyz;
    r6.y = saturate(ps);
    r5.z = (r0.z == 0.0) ? r17.z : r5.z;
    r7.z = (r0.y == 0.0) ? r17.w : r5.z;
    ps = 1.0 - r6.y;
    r14.yzw = r16.yzw * r14.xyz;
    r5.z = ps;
    ps = 1.0 - r6.z;
    r0.y = max(r7.z, 0.0);
    r0.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6.x = min(r0.y, 0.3);
    r7.x = ps;
    ps = 3.3333333 * r6.x;
    r16.yz = r11.xw + r3.zw;
    r6.z = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r6.xyz = r6.zzz * r16.xyz;
    r7.y = ps;
    ps = AmbientColorAndSkyFactor.z * r5.w;
    r7 = -r7.wxyz + 1.0;
    r3.z = ps;
    r0.zw = r15.yz * UniformVector_4.xy + r6.yz;
    ps = r7.w;
    r6.z = r6.x + 1.0;
    r5.z = ps;
    ps = 2.5 * r5.z;
    r0.y = abs(r6.z) * abs(r6.z);
    r14.x = ps;
    ps = r0.y * r0.y;
    r4.yz = r0.zw - r12.yz;
    r4.x = ps;
    r0.yzw = r14.yzw * r6.zzz - r10.xyz;
    r4.w = saturate(r14.x * r6.z - 0.5);
    r10.xyz = r0.yzw * r4.www + r10.xyz;
    r3.xyz = r3.xyz * r10.xyz + UniformVector_0.xyz;
    r6.xyz = r4.zxy * r4.wxw;
    ps = r12.y;
    r0.y = float((r7.x >= 0.004));
    ps = r6.z + ps;
    r13.yzw = r6.yyy * r13.yzw;
    r6.y = ps;
    ps = r12.z;
    r4 = r13.xywz * r4.wwww;
    ps = r6.x + ps;
    r5.z = r4.x - 2.0;
    r6.z = ps;
    r6.x = r6.w * 2.0 + r5.z;
    r6.yzw = r6.xyz * r0.xxx;
    ps = 1.0 + r6.y;
    r6.x = ps;
    r6.xyz = (r0.xxx > 0.0) ? r6.xzw : float3(1.0, 0.0, 0.0);
    r6.xyz = (r0.xxx >= 0.0) ? r6.xyz : float3(1.0, 0.0, 0.0);
    r5.z = dot(r6.xyz, r6.xyz);
    ps = rsqrt(abs(r5.z));
    r0.xzw = r10.xyz * r5.yxw;
    r5.x = ps;
    ps = -ModShadowColor.x;
    r5.xyw = r6.yzx * r5.xxx;
    ps = 1.0 + ps;
    r11.x = dot(r1.zxy, r5.wxy);
    r6.x = ps;
    ps = -ModShadowColor.y;
    r5.z = dot(r5.wxy, r8.zxy);
    ps = 1.0 + ps;
    r10.xyz = r5.xyw * r5.zzz;
    r6.y = ps;
    ps = -ModShadowColor.z;
    r1 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r8.xyz = r10.xyz * 2.0 - r8.xyz;
    ps = 1.0 + ps;
    r6.w = saturate(dot(r9.zxy, r8.zxy));
    r6.z = ps;
    r7.xy = r1.zw * r7.yz + 0.125;
    ps = ConstantLighting.x * r5.w;
    r1.yz = r1.xy + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r5.w;
    r1.zw = abs(r1.yz) * abs(r1.yz);
    r1.y = ps;
    ps = log2(r6.w);
    r5.z = r7.x * r7.y;
    r5.x = ps;
    r6.xyz = r5.zzz * r6.xyz + ModShadowColor.xyz;
    ps = 15.0 * r5.x;
    r7.xyz = r0.xwz * r1.zzz;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r8.xyz = r0.xwz * r1.www;
    r5.z = ps;
    r3.xyz = r8.xyz * UpperSkyColor.xzy + r3.xzy;
    r3.xyz = r7.xzy * LowerSkyColor.xyz + r3.xzy;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r5.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r5.xyz = r7.xyz * r4.yzw + r3.xzy;
    r5.xyz = r1.xyz * r0.xzw + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r0.y + r2.w;
    r5.xyz = r6.xyz * r0.yyy + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
