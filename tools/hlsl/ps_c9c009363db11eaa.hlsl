// ps_c9c009363db11eaa.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 342 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000558 10041200 0000070A 00000000 000070E7 001F007F 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A2
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

float4 AmbientColorAndSkyFactor : register(c16); // float4
float4 ConstantLighting : register(c17); // float3
float4 LowerSkyColor : register(c15); // float3
float4 ModShadowAccumResolution : register(c20); // float2
float4 ModShadowColor : register(c18); // float3
float4 ModShadowGroupColor : register(c19); // float3
float4 OpacityOverride : register(c13); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_5 : register(c11); // float
float4 UniformScalar_6 : register(c12); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UpperSkyColor : register(c14); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D Texture2D_7 : register(s7);
sampler2D Texture2D_8 : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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

    r17 = tex2D(Texture2D_6, r0.xy);
    ps = (-0.5) + r17.w;
    r5.xy = r0.wz * 6.0;
    r5.z = ps;
    ps = UniformVector_2.x * r0.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r5.zzzz)) clip(-1.0);
    r12.x = ps;
    r6.xyw = tex2D(Texture2D_2, r5.xy).xyw;
    ps = r0.w;
    r8.xy = r0.xy * UniformScalar_0.xx;
    ps = UniformVector_6.x * ps;
    r11.xy = r0.wz * UniformVector_1.xy;
    r9.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r5.x = r2.w - 4e+02;
    r9.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r5.w = dot(r3.zxy, r3.zxy);
    r9.w = ps;
    r5.yz = r6.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.w));
    r5.x = saturate(r5.x * 0.00022222222);
    r5.w = ps;
    ps = -r0.z;
    r10.xyz = r5.www * r3.xyz;
    ps = 1.0 + ps;
    r6.xyz = r5.xyz * float3(-0.025, 0.5, 0.5);
    r5.x = ps;
    ps = UniformVector_2.y * r5.x;
    r12.zw = r10.xy * r6.xx;
    r12.y = ps;
    ps = r0.z;
    r5.xy = r12.xy - 0.5;
    ps = UniformVector_6.y * ps;
    r8.zw = float2((r12.xy >= 0.5));
    r9.y = ps;
    ps = r9.z;
    r5.xy = r5.xy - r12.xy;
    ps = abs(r7.x) * ps;
    r11.zw = r5.xy * r8.zw;
    r3.z = ps;
    ps = r9.w;
    r5 = r12.zwxy + r11;
    ps = abs(r7.y) * ps;
    r3.xy = r5.zw + r5.zw;
    r3.w = ps;
    r11.yz = tex2D(ModShadowAccumTexture, r3.zw).xy;
    r12.xyz = tex2D(Texture2D_5, r5.xy).xyz;
    r16.xyz = tex2D(Texture2D_7, r9.xy).xyz;
    r14.yzw = tex2D(Texture2D_4, r0.xy).xyz;
    r3 = tex2D(Texture2D_1, r3.xy);
    r9.xyz = tex2D(Texture2D_2, r0.wz).xyw;
    r5.xyw = tex2D(Texture2D_0, r5.xy).xyz;
    r18.yzw = tex2D(Texture2D_3, r8.xy).xyw;
    r0.yzw = tex2D(Texture2D_8, r0.xy).xyz;
    r0.x = dot(r4.zxy, r4.zxy);
    r5.z = dot(r1.zxy, r1.zxy);
    r13.xyz = r0.yzw * UniformScalar_5.xxx + UniformScalar_6.xxx;
    r15.zw = r18.yz * 2.0 - 1.0;
    r7.xyz = r5.wxy * 2.0 - 1.0;
    r8.xy = r9.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r5.z));
    r18.x = r6.w * r9.z;
    r5.z = ps;
    r9.xyz = r5.zzz * r1.xyz;
    ps = r2.w;
    r9.w = dot(r8.zww, float3(1.0, 1.0, 1.0));
    r0.w = (r9.w == 0.0) ? r3.x : r3.y;
    ps = 0.0001 * ps;
    r5.xyz = r9.zww + float3(0.1, -3.0, -2.0);
    r0.z = saturate(ps);
    ps = 5.0 * r5.x;
    r6.xw = r18.xw - 1.0;
    r0.y = saturate(ps);
    r0.w = (r5.z == 0.0) ? r3.z : r0.w;
    r8.z = (r5.y == 0.0) ? r3.w : r0.w;
    r5.yz = -r0.zy + 1.0;
    ps = rsqrt(abs(r0.x));
    r14.x = r6.w * r5.y;
    r0.x = ps;
    r1.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r0.yzw = -UniformVector_0.xyz + 1.0;
    r3.xyz = r0.yzw * AmbientColorAndSkyFactor.xyz;
    r14.yzw = r14.wyz + r14.wyz;
    r17.xyz = r1.xyz * r17.xyz;
    r1.xyz = r0.xxx * r4.xyz;
    r4.yzw = r17.xyz * r16.xyz;
    ps = OpacityOverride.x;
    r0.x = max(r8.z, 0.0);
    r8.w = saturate(ps);
    ps = UniformScalar_1.x * r5.y;
    r5.x = min(r0.x, 0.3);
    r15.y = ps;
    ps = 3.3333333 * r5.x;
    r6.yz = r8.xy + r6.yz;
    r0.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6.xyz = r0.xxx * r6.yxz;
    r8.x = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r14 = r14 + float4(1.0, -1.0, -1.0, -1.0);
    r8.y = ps;
    r4.x = r14.y * UniformVector_4.z - r7.x;
    ps = 1.0 + r6.y;
    r8 = -r8.wxyz + 1.0;
    r6.w = ps;
    ps = r8.w;
    r0.x = float((r8.x >= 0.004));
    r5.x = ps;
    ps = 2.5 * r5.x;
    r1.w = abs(r6.w) * abs(r6.w);
    r16.x = ps;
    ps = r1.w * r1.w;
    r16.yzw = r4.yzw * r14.xxx;
    r15.x = ps;
    r4.yzw = r16.yzw * r6.www - r12.xyz;
    r6.w = saturate(r16.x * r6.w - 0.5);
    r12.xyz = r4.yzw * r6.www + r12.xyz;
    r3.xyz = r3.xyz * r12.xyz + UniformVector_0.xyz;
    r4.yzw = r15.xyy * r15.xzw;
    r11.xw = r14.zw + r4.zw;
    r4.yzw = r4.yyy * r13.xyz;
    r6.xy = r11.xw * UniformVector_4.xy + r6.xz;
    r4 = r4.xywz * r6.wwww;
    ps = (-2.0) + r4.x;
    r6.xy = r6.xy - r7.yz;
    r5.x = ps;
    r6.yz = r6.xy * r6.ww + r7.yz;
    r6.x = r5.w * 2.0 + r5.x;
    r6.yzw = r6.xyz * r5.yyy;
    ps = 1.0 + r6.y;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r6.x = ps;
    r6.xyz = (r5.yyy > 0.0) ? r6.xzw : float3(1.0, 0.0, 0.0);
    r5.yzw = (r5.yyy >= 0.0) ? r6.xyz : float3(1.0, 0.0, 0.0);
    r5.x = dot(r5.yzw, r5.yzw);
    ps = rsqrt(abs(r5.x));
    r0.yzw = r12.xyz * r0.yzw;
    r5.x = ps;
    r5.xyw = r5.zwy * r5.xxx;
    r11.x = dot(r1.zxy, r5.wxy);
    r5.z = dot(r5.wxy, r10.zxy);
    r6.xyz = r5.xyw * r5.zzz;
    r1 = r11.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.xyz = r6.xyz * 2.0 - r10.xyz;
    r6.x = saturate(dot(r9.zxy, r6.zxy));
    r6.yz = r1.zw * r8.yz + 0.125;
    ps = ConstantLighting.x * r5.w;
    r1.yz = r1.xy + 0.5;
    r1.x = ps;
    ps = ConstantLighting.y * r5.w;
    r1.zw = abs(r1.yz) * abs(r1.yz);
    r1.y = ps;
    ps = log2(r6.x);
    r5.z = r6.y * r6.z;
    r5.x = ps;
    r6.xyz = r5.zzz * r7.xyz + ModShadowColor.xyz;
    ps = 15.0 * r5.x;
    r7.xyz = r0.ywz * r1.zzz;
    r5.z = ps;
    ps = pow(2.0, r5.z);
    r8.xyz = r0.ywz * r1.www;
    r5.z = ps;
    r3.xyz = r8.xyz * UpperSkyColor.xzy + r3.xzy;
    r3.xyz = r7.xzy * LowerSkyColor.xyz + r3.xzy;
    ps = ConstantLighting.z * r5.w;
    r7.xyz = r5.zzz * ConstantLighting.xzy;
    r1.z = ps;
    r5.xyz = r7.xyz * r4.yzw + r3.xzy;
    r5.xyz = r1.xyz * r0.yzw + r5.xzy;
    ps = -r2.w;
    r5.xyz = r5.xyz * r6.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r0.x + r2.w;
    r5.xyz = r6.xyz * r0.xxx + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
