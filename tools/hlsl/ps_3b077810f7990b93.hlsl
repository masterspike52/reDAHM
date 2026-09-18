// ps_3b077810f7990b93.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 321 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000504 10041400 0000080A 00000000 00007908 003F00FF 00000021 00003050 0000F151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A2
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

float4 AmbientColorAndSkyFactor : register(c14); // float4
float4 LightMapScale : register(c15); // float3
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
sampler2D LightMapTexture : register(s8);
sampler2D ModShadowAccumTexture : register(s9);

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
    float4 r18 = 0.0;
    float4 r19 = 0.0;
    float4 r20 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r9 = tex2D(Texture2D_5, r1.xy);
    r6.yw = r1.wz * 6.0;
    ps = r1.w;
    r7.zw = r1.wz * UniformVector_6.xy;
    ps = UniformVector_1.x * ps;
    r6.x = r3.w - 4e+02;
    r12.x = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.y = dot(r4.zxy, r4.zxy);
    r10.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.z = -r1.z + 1.0;
    r10.y = ps;
    ps = rsqrt(abs(r7.y));
    r7.x = r9.w - 0.5;
    r7.y = ps;
    ps = 0.00022222222 * r6.x;
    r11.xyz = r7.yyy * r4.xyz;
    r6.x = saturate(ps);
    ps = (-0.025) * r6.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.xxxx)) clip(-1.0);
    r6.x = ps;
    ps = UniformVector_2.y * r6.z;
    r4.zw = r11.xy * r6.xx;
    r4.y = ps;
    ps = OpacityOverride.x;
    r4.x = r1.w * UniformVector_2.x;
    r9.w = saturate(ps);
    ps = r1.z;
    r6.xz = r4.xy - 0.5;
    ps = UniformVector_1.y * ps;
    r7.xy = float2((r4.xy >= 0.5));
    r12.y = ps;
    ps = r10.x;
    r6.xz = r6.xz - r4.xy;
    ps = abs(r8.x) * ps;
    r12.zw = r6.xz * r7.xy;
    r0.z = ps;
    ps = r10.y;
    r4 = r4.zwxy + r12;
    ps = abs(r8.y) * ps;
    r6.xz = r4.zw + r4.zw;
    r0.w = ps;
    r12.yz = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r15.xyz = tex2D(Texture2D_4, r4.xy).xyz;
    r16.xyz = tex2D(Texture2D_6, r7.zw).xyz;
    r19 = tex2D(Texture2D_1, r6.xz);
    r4.xyz = tex2D(Texture2D_0, r4.xy).zxy;
    r10.xyz = tex2D(Texture2D_3, r1.xy).xyz;
    r8.xyz = tex2D(Texture2D_2, r6.yw).xyw;
    r13.xyz = tex2D(Texture2D_2, r1.wz).xyw;
    r14.xyz = tex2D(Texture2D_7, r1.xy).xyz;
    r6.xyw = tex2D(LightMapTexture, r0.xy).yxz;
    ps = r3.w;
    r6.z = dot(r5.zxy, r5.zxy);
    ps = 0.0001 * ps;
    r1.xyz = -UniformVector_0.xyz + 1.0;
    r7.z = saturate(ps);
    ps = UniformVector_5.x * UniformVector_5.w;
    r7.w = dot(r2.zxy, r2.zxy);
    r20.x = ps;
    r14.yzw = r14.xyz * UniformScalar_3.xxx + UniformScalar_4.xxx;
    r18.x = r8.z * r13.z - 1.0;
    r12.xw = r13.xy * 2.0 - 1.0;
    r18.zw = r8.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r7.w));
    r8.xyz = r1.xyz * AmbientColorAndSkyFactor.xyz;
    r7.w = ps;
    r17.xyz = r10.zxy * 2.0 - 1.0;
    r13.xyz = r4.xyz * 2.0 - 1.0;
    r14.x = r17.x * UniformVector_4.z - r13.x;
    ps = UniformVector_5.y * UniformVector_5.w;
    r10.xyz = r7.www * r2.xyz;
    r20.y = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r10.w = dot(r7.xyy, float3(1.0, 1.0, 1.0));
    r20.z = ps;
    r7.x = (r10.w == 0.0) ? r19.x : r19.y;
    ps = rsqrt(abs(r6.z));
    r0.xyz = r10.zww + float3(0.1, -3.0, -2.0);
    r6.z = ps;
    ps = 5.0 * r0.x;
    r2.yzw = r20.xyz * r9.xyz;
    r7.y = saturate(ps);
    r7.x = (r0.z == 0.0) ? r19.z : r7.x;
    r9.z = (r0.y == 0.0) ? r19.w : r7.x;
    ps = 1.0 - r7.y;
    r5.xyz = r6.zzz * r5.xyz;
    r6.z = ps;
    ps = 1.0 - r7.z;
    r7.x = max(r9.z, 0.0);
    r7.w = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r18.y = min(r7.x, 0.3);
    r9.x = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r7.xyz = r18.yzw * float3(3.3333333, 0.5, 0.5);
    r9.y = ps;
    r9 = -r9.wxyz + 1.0;
    ps = r9.w;
    r18.yz = r12.xw + r7.yz;
    r6.z = ps;
    ps = 2.5 * r6.z;
    r7.xyz = r7.xxx * r18.yxz;
    r2.x = ps;
    r0.xy = r17.yz * UniformVector_4.xy + r7.xz;
    ps = 1.0 + r7.y;
    r2.yzw = r2.yzw * r16.xyz;
    r6.z = ps;
    r7.xyz = r2.yzw * r6.zzz - r15.xyz;
    r2.w = saturate(r2.x * r6.z - 0.5);
    ps = abs(r6.z) * abs(r6.z);
    r6.z = ps;
    ps = r6.z * r6.z;
    r2.yz = r0.xy - r13.yz;
    r2.x = ps;
    r0.xyz = r7.xyz * r2.www + r15.xyz;
    r8.xyz = r8.xyz * r0.xyz + UniformVector_0.xyz;
    r4.yzw = r2.xzy * r2.xww;
    ps = r13.y;
    r7.x = float((r9.x >= 0.004));
    ps = r4.w + ps;
    r14.yzw = r4.yyy * r14.yzw;
    r4.y = ps;
    ps = r13.z;
    r2 = r14.xywz * r2.wwww;
    ps = r4.z + ps;
    r6.z = r2.x - 2.0;
    r4.z = ps;
    r4.x = r4.x * 2.0 + r6.z;
    r13.yzw = r4.yzx * r7.www;
    ps = LightMapScale.x * r6.y;
    r13.x = r13.w + 1.0;
    r4.x = ps;
    r4.yzw = (r7.www > 0.0) ? r13.xyz : float3(1.0, 0.0, 0.0);
    r7.yzw = (r7.www >= 0.0) ? r4.yzw : float3(1.0, 0.0, 0.0);
    ps = LightMapScale.y * r6.x;
    r6.z = dot(r7.yzw, r7.yzw);
    r4.y = ps;
    ps = rsqrt(abs(r6.z));
    r0.xyz = r0.xyz * r1.xyz;
    r6.z = ps;
    ps = LightMapScale.z * r6.w;
    r7.yzw = r7.yzw * r6.zzz;
    r4.z = ps;
    r1.xyz = r4.xzy * r7.yyy;
    r12.x = dot(r5.zxy, r7.yzw);
    ps = -ModShadowColor.x;
    r6.x = dot(r7.yzw, r11.zxy);
    ps = 1.0 + ps;
    r6.xzw = r7.zwy * r6.xxx;
    r6.y = ps;
    ps = -ModShadowColor.y;
    r5 = r12.xxyz * float4(-0.5, 0.5, 0.875, 0.875);
    r6.xzw = r6.xzw * 2.0 - r11.xyz;
    ps = 1.0 + ps;
    r6.x = saturate(dot(r10.zxy, r6.wxz));
    r6.z = ps;
    r7.yz = r5.zw * r9.yz + 0.125;
    ps = -ModShadowColor.z;
    r5.xy = r5.xy + 0.5;
    ps = 1.0 + ps;
    r5.xy = abs(r5.xy) * abs(r5.xy);
    r6.w = ps;
    ps = log2(r6.x);
    r7.y = r7.y * r7.z;
    r6.x = ps;
    r6.yzw = r7.yyy * r6.yzw + ModShadowColor.xyz;
    ps = 15.0 * r6.x;
    r7.yzw = r0.xzy * r5.yyy;
    r6.x = ps;
    r7.yzw = r7.yzw * UpperSkyColor.xzy + r8.xzy;
    ps = pow(2.0, r6.x);
    r5.xyz = r0.xzy * r5.xxx;
    r6.x = ps;
    r4.xyz = r4.xzy * r6.xxx;
    r7.yzw = r5.xzy * LowerSkyColor.xyz + r7.ywz;
    r7.yzw = r4.xyz * r2.yzw + r7.ywz;
    r7.yzw = r1.xzy * r0.xyz + r7.ywz;
    ps = -r3.w;
    r6.xyz = r7.yzw * r6.yzw;
    ps = OpacityOverride.x + ps;
    r0.xyz = r6.xyz - r6.xyz;
    r0.w = ps;
    oC0.w = r0.w * r7.x + r3.w;
    r6.xyz = r0.xyz * r7.xxx + r6.xyz;
    oC0.xyz = r6.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
