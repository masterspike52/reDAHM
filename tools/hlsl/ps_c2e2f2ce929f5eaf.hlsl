// ps_c2e2f2ce929f5eaf.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 342 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000558 10041100 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 AmbientColorAndSkyFactor : register(c15); // float4
float4 LightMapScale : register(c16); // float3
float4 LowerSkyColor : register(c14); // float3
float4 ModShadowAccumResolution : register(c19); // float2
float4 ModShadowColor : register(c17); // float3
float4 ModShadowGroupColor : register(c18); // float3
float4 OpacityOverride : register(c12); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_3 : register(c10); // float
float4 UniformScalar_4 : register(c11); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UpperSkyColor : register(c13); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);
sampler2D Texture2D_6 : register(s6);
sampler2D LightMapTexture : register(s7);
sampler2D ModShadowAccumTexture : register(s8);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
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
    float4 r1 = In.texcoord1;
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
    float4 r16 = 0.0;
    float4 r17 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r17 = tex2D(Texture2D_6, r1.xy).xywz;
    ps = (-0.5) + r17.z;
    r6.xy = r1.wz * 6.0;
    r6.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r7.xyz = tex2D(Texture2D_2, r6.xy).xyw;
    ps = r1.w;
    r6.zw = r1.xy * UniformScalar_0.xx;
    ps = UniformVector_2.x * ps;
    r9.xy = r1.wz * UniformVector_1.xy;
    r10.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.y = r3.w - 4e+02;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.x = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    r10.zw = r7.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.x));
    r10.y = saturate(r6.y * 0.00022222222);
    r6.x = ps;
    ps = -r1.z;
    r11.xyz = r6.xxx * r4.xyz;
    ps = 1.0 + ps;
    r12.xyw = r10.zyw * float3(0.5, -0.025, 0.5);
    r6.x = ps;
    ps = UniformVector_2.y * r6.x;
    r10.zw = r11.xy * r12.yy;
    r10.y = ps;
    r4.xy = r10.xy - 0.5;
    r6.xy = float2((r10.xy >= 0.5));
    ps = r0.z;
    r4.xy = r4.xy - r10.xy;
    ps = abs(r8.x) * ps;
    r9.zw = r4.xy * r6.xy;
    r4.x = ps;
    ps = r0.w;
    r9 = r10.zwxy + r9;
    ps = abs(r8.y) * ps;
    r0.zw = r9.zw + r9.zw;
    r4.y = ps;
    r12.yz = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r16.xyz = tex2D(Texture2D_5, r9.xy).xyz;
    r13.xyz = tex2D(Texture2D_4, r1.xy).xyz;
    r4.xyz = tex2D(LightMapTexture, r0.xy).xyz;
    r0 = tex2D(Texture2D_1, r0.zw);
    r8.xyz = tex2D(Texture2D_2, r1.wz).xyw;
    r7.xyw = tex2D(Texture2D_0, r9.xy).xyz;
    r1.yzw = tex2D(Texture2D_3, r6.zw).xyw;
    r6.w = dot(r5.zxy, r5.zxy);
    r6.z = dot(r2.zxy, r2.zxy);
    r14.zw = r1.yz * 2.0 - 1.0;
    r9.xyz = r7.wxy * 2.0 - 1.0;
    r15.yz = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r6.z));
    r1.x = r7.z * r8.z;
    r6.z = ps;
    r10.xyz = r6.zzz * r2.xyz;
    ps = r3.w;
    r10.w = dot(r6.xyy, float3(1.0, 1.0, 1.0));
    r7.z = (r10.w == 0.0) ? r0.x : r0.y;
    ps = 0.0001 * ps;
    r6.xyz = r10.zww + float3(0.1, -3.0, -2.0);
    r0.y = saturate(ps);
    ps = 5.0 * r6.x;
    r15.xw = r1.xw - 1.0;
    r0.x = saturate(ps);
    r7.z = (r6.z == 0.0) ? r0.z : r7.z;
    r17.z = (r6.y == 0.0) ? r0.w : r7.z;
    r6.yz = -r0.yx + 1.0;
    ps = rsqrt(abs(r6.w));
    r2.x = r15.w * r6.y;
    r6.x = ps;
    r1.xyz = UniformVector_5.xyz * UniformVector_5.www;
    r0.xyz = -UniformVector_0.xyz + 1.0;
    r8.xyz = r0.xyz * AmbientColorAndSkyFactor.xyz;
    r1.xyz = r1.xyz * r17.xyw;
    r2.yzw = r13.zxy + r13.zxy;
    r13.xyz = r6.xxx * r5.xyz;
    ps = OpacityOverride.x;
    r6.x = max(r17.z, 0.0);
    r17.w = saturate(ps);
    ps = UniformScalar_1.x * r6.y;
    r6.x = min(r6.x, 0.3);
    r14.y = ps;
    ps = 3.3333333 * r6.x;
    r15.yz = r15.yz + r12.xw;
    r6.x = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r7.xyz = r6.xxx * r15.yxz;
    r17.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r15 = r2 + float4(1.0, -1.0, -1.0, -1.0);
    r17.y = ps;
    r2.x = r15.y * UniformVector_4.z - r9.x;
    ps = 1.0 + r7.y;
    r5 = -r17.wxyz + 1.0;
    r0.w = ps;
    ps = r5.w;
    r17.yzw = r1.xyz * r15.xxx;
    r6.x = ps;
    r2.yzw = r17.yzw * UniformScalar_3.xxx + UniformScalar_4.xxx;
    ps = 2.5 * r6.x;
    r1.x = abs(r0.w) * abs(r0.w);
    r17.x = ps;
    ps = r1.x * r1.x;
    r6.w = float((r5.x >= 0.004));
    r14.x = ps;
    r1.xyz = r17.yzw * r0.www - r16.xyz;
    r6.x = saturate(r17.x * r0.w - 0.5);
    r1.xyz = r1.xyz * r6.xxx + r16.xyz;
    r8.xyz = r8.xyz * r1.xyz + UniformVector_0.xyz;
    r14.xyz = r14.xyy * r14.xzw;
    r12.xw = r15.zw + r14.yz;
    r2.yzw = r14.xxx * r2.yzw;
    r12.xw = r12.xw * UniformVector_4.xy + r7.xz;
    r12.xw = r12.xw - r9.yz;
    r2 = r2.xywz * r6.xxxx;
    r7.yz = r12.xw * r6.xx + r9.yz;
    ps = (-2.0) + r2.x;
    r4.xyz = r4.xyz * LightMapScale.xyz;
    r6.x = ps;
    r7.x = r7.w * 2.0 + r6.x;
    r7.yzw = r7.xyz * r6.yyy;
    ps = 1.0 + r7.y;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r7.x = ps;
    r7.xyz = (r6.yyy > 0.0) ? r7.xzw : float3(1.0, 0.0, 0.0);
    r7.xyz = (r6.yyy >= 0.0) ? r7.xyz : float3(1.0, 0.0, 0.0);
    r6.x = dot(r7.xyz, r7.xyz);
    ps = rsqrt(abs(r6.x));
    r0.xyz = r1.xyz * r0.xyz;
    r6.x = ps;
    r7.xyz = r7.xyz * r6.xxx;
    r1.xyz = r4.xzy * r7.xxx;
    r12.x = dot(r13.zxy, r7.xyz);
    r6.x = dot(r7.xyz, r11.zxy);
    r6.xyz = r7.yzx * r6.xxx;
    r7 = r12.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.xyz = r6.xyz * 2.0 - r11.xyz;
    r6.x = saturate(dot(r10.zxy, r6.zxy));
    r6.yz = r7.zw * r5.yz + 0.125;
    r7.xy = r7.xy + 0.5;
    r5.xy = abs(r7.xy) * abs(r7.xy);
    ps = log2(r6.x);
    r6.y = r6.y * r6.z;
    r6.x = ps;
    r7.xyz = r6.yyy * r9.xyz + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r9.xyz = r0.xzy * r5.yyy;
    r7.w = ps;
    r6.xyz = r9.xyz * UpperSkyColor.xzy + r8.xzy;
    ps = pow(2.0, r7.w);
    r5.xyz = r0.xzy * r5.xxx;
    r7.w = ps;
    r4.xyz = r4.xzy * r7.www;
    r6.xyz = r5.xzy * LowerSkyColor.xyz + r6.xzy;
    r6.xyz = r4.xyz * r2.yzw + r6.xzy;
    r6.xyz = r1.xzy * r0.xyz + r6.xzy;
    ps = -r3.w;
    r6.xyz = r6.xyz * r7.xyz;
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
