// ps_5d27c42cac11f689.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 309 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 000004D4 10041200 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c13); // float4
float4 ConstantLighting : register(c14); // float3
float4 LowerSkyColor : register(c12); // float3
float4 ModShadowAccumResolution : register(c17); // float2
float4 ModShadowColor : register(c15); // float3
float4 ModShadowGroupColor : register(c16); // float3
float4 OpacityOverride : register(c10); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_2 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c11); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D ModShadowAccumTexture : register(s6);

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

    r8 = tex2D(Texture2D_5, r0.xy);
    ps = (-0.5) + r8.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r13.x = ps;
    r9.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    r12.xy = r0.wz * UniformVector_1.xy;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = r2.w - 4e+02;
    r6.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r3.zxy, r3.zxy);
    r6.w = ps;
    r5.yz = r9.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r5.x = saturate(r5.x * 0.00022222222);
    r5.w = ps;
    ps = -r0.z;
    r10.xyz = r5.www * r3.xyz;
    ps = 1.0 + ps;
    r11.xyw = r5.yxz * float3(0.5, -0.025, 0.5);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r13.zw = r10.xy * r11.yy;
    r13.y = ps;
    r5.xy = r13.xy - 0.5;
    r6.xy = float2((r13.xy >= 0.5));
    ps = r6.z;
    r5.xy = r5.xy - r13.xy;
    ps = abs(r7.x) * ps;
    r12.zw = r5.xy * r6.xy;
    r3.x = ps;
    ps = r6.w;
    r5 = r13.zwxy + r12;
    ps = abs(r7.y) * ps;
    r6.zw = r5.zw + r5.zw;
    r3.y = ps;
    r11.yz = tex2D(ModShadowAccumTexture, r3.xy).xy;
    r12.xyz = tex2D(Texture2D_4, r5.xy).xyz;
    r18 = tex2D(Texture2D_1, r6.zw);
    r5.xzw = tex2D(Texture2D_0, r5.xy).xyz;
    r3.xyz = tex2D(Texture2D_3, r0.xy).xyz;
    r13.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    ps = OpacityOverride.x;
    r5.y = saturate(r2.w * 0.0001);
    r8.w = saturate(ps);
    ps = -UniformVector_0.x;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    ps = 1.0 + ps;
    r6.w = dot(r4.zxy, r4.zxy);
    r0.x = ps;
    ps = -UniformVector_0.y;
    r9.xyz = UniformVector_5.xyz * UniformVector_5.www;
    ps = 1.0 + ps;
    r6.z = dot(r1.zxy, r1.zxy);
    r0.y = ps;
    r17.x = r9.w * r13.z - 1.0;
    r17.yz = r13.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r15.yzw = r9.xyz * r8.xyz;
    r6.z = ps;
    r16.xyz = r3.zxy * 2.0 - 1.0;
    r13.xyz = r5.wxz * 2.0 - 1.0;
    r14.x = r16.x * UniformVector_4.z - r13.x;
    r14.yzw = r15.yzw * UniformScalar_1.xxx + UniformScalar_2.xxx;
    ps = -UniformVector_0.z;
    r9.xyz = r6.zzz * r1.xyz;
    ps = 1.0 + ps;
    r9.w = dot(r6.xyy, float3(1.0, 1.0, 1.0));
    r0.z = ps;
    r0.w = (r9.w == 0.0) ? r18.x : r18.y;
    ps = rsqrt(abs(r6.w));
    r6.xyz = r9.zww + float3(0.1, -3.0, -2.0);
    r6.w = ps;
    ps = 5.0 * r6.x;
    r3.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r5.z = saturate(ps);
    r0.w = (r6.z == 0.0) ? r18.z : r0.w;
    r8.z = (r6.y == 0.0) ? r18.w : r0.w;
    ps = 1.0 - r5.z;
    r1.xyz = r6.www * r4.xyz;
    r5.z = ps;
    ps = 1.0 - r5.y;
    r6.y = max(r8.z, 0.0);
    r6.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r5.x = min(r6.y, 0.3);
    r8.x = ps;
    ps = 3.3333333 * r5.x;
    r17.yz = r17.yz + r11.xw;
    r5.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r6.yzw = r5.yyy * r17.xyz;
    r8.y = ps;
    r8 = -r8.wxyz + 1.0;
    r6.zw = r16.yz * UniformVector_4.xy + r6.zw;
    ps = r8.w;
    r5.y = r6.y + 1.0;
    r5.x = ps;
    ps = 2.5 * r5.x;
    r6.y = abs(r5.y) * abs(r5.y);
    r15.x = ps;
    ps = r6.y * r6.y;
    r4.yz = r6.zw - r13.yz;
    r4.x = ps;
    r6.yzw = r15.yzw * r5.yyy - r12.xyz;
    r4.w = saturate(r15.x * r5.y - 0.5);
    r12.xyz = r6.yzw * r4.www + r12.xyz;
    r3.xyz = r3.xyz * r12.xyz + UniformVector_0.xyz;
    r5.xyz = r4.xyz * r4.xww;
    ps = r13.y;
    r6.y = float((r8.x >= 0.004));
    ps = r5.y + ps;
    r14.yzw = r5.xxx * r14.yzw;
    r5.y = ps;
    ps = r13.z;
    r4 = r14.xywz * r4.wwww;
    ps = r5.z + ps;
    r5.x = r4.x - 2.0;
    r5.z = ps;
    r5.x = r5.w * 2.0 + r5.x;
    r5.yzw = r5.xyz * r6.xxx;
    ps = 1.0 + r5.y;
    r5.x = ps;
    r5.xyz = (r6.xxx > 0.0) ? r5.xzw : float3(1.0, 0.0, 0.0);
    r5.yzw = (r6.xxx >= 0.0) ? r5.xyz : float3(1.0, 0.0, 0.0);
    r5.x = dot(r5.yzw, r5.yzw);
    ps = rsqrt(abs(r5.x));
    r0.xyz = r12.xyz * r0.xyz;
    r5.x = ps;
    r5.xyw = r5.zwy * r5.xxx;
    r11.x = dot(r1.zxy, r5.wxy);
    r5.z = dot(r5.wxy, r10.zxy);
    r6.xzw = r5.xyw * r5.zzz;
    r1 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.xzw = r6.xzw * 2.0 - r10.xyz;
    r6.x = saturate(dot(r9.zxy, r6.wxz));
    r6.zw = r1.zw * r8.yz + 0.125;
    ps = ConstantLighting.x * r5.w;
    r1.yz = r1.xy + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r5.w;
    r1.zw = abs(r1.yz) * abs(r1.yz);
    r1.y = ps;
    ps = log2(r6.x);
    r5.z = r6.z * r6.w;
    r5.x = ps;
    r6.xzw = r5.zzz * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r5.x;
    r7.xyz = r0.xzy * r1.zzz;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r8.xyz = r0.xzy * r1.www;
    r5.z = ps;
    r3.xyz = r8.xyz * UpperSkyColor.xzy + r3.xzy;
    r3.xyz = r7.xzy * LowerSkyColor.xyz + r3.xzy;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r5.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r5.xyz = r7.xyz * r4.yzw + r3.xzy;
    r5.xyz = r1.xyz * r0.xyz + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.xzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r5.xyz - r5.xyz;
    r0.w = ps;
    oC0.w = r0.w * r6.y + r2.w;
    r5.xyz = r0.xyz * r6.yyy + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
