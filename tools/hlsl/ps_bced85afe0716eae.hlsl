// ps_bced85afe0716eae.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 243 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003CC 10040D00 00000606 00000000 000050C6 003F003F 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
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
float4 UniformScalar_0 : register(c7); // float
float4 UniformScalar_1 : register(c8); // float
float4 UniformScalar_4 : register(c9); // float
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UpperSkyColor : register(c11); // float3
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D ModShadowAccumTexture : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float2 vPos : VPOS;   // r6 (pixel parameters)
    float vFace : VFACE;  // r6
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
    float4 r6 = float4(In.vFace < 0.0 ? -In.vPos.x : In.vPos.x, In.vPos.y, 0.0, 0.0);
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r8.zw = r0.xy + 0.5;
    r8.xy = r0.xy * UniformVector_3.xy;
    r1.z = dot(r2.zxy, r2.zxy);
    ps = 1.0 / ModShadowAccumResolution.x;
    r1.w = -r1.y + 1.0;
    r0.z = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.x = dot(r4.zxy, r4.zxy);
    r0.w = ps;
    r10.xyz = r7.wyz * 2.0 - 1.0;
    ps = rsqrt(abs(r7.x));
    r1.y = dot(r5.zxy, r5.zxy);
    r9.y = ps;
    ps = rsqrt(abs(r1.y));
    r9.x = r1.w * UniformVector_2.y;
    r7.w = ps;
    ps = r7.w;
    r0.zw = r0.zw * abs(r6.xy);
    ps = r5.x * ps;
    r7.xyz = r9.yyy * r4.zxy;
    r6.x = ps;
    ps = rsqrt(abs(r1.z));
    r1.y = dot(r10.xyz, r10.xyz);
    r1.z = ps;
    ps = rsqrt(abs(r1.y));
    r11.yzw = r1.zzz * r2.xyz;
    r1.y = ps;
    ps = r7.w;
    r1.yzw = r10.yzx * r1.yyy;
    ps = r5.y * ps;
    r2.x = dot(r1.wyz, r7.xyz);
    r6.y = ps;
    ps = r7.w;
    r2.xyz = r1.yzw * r2.xxx;
    r2.xyz = r2.xyz * 2.0 - r7.yzx;
    ps = r5.z * ps;
    r2.x = saturate(dot(r11.wyz, r2.zxy));
    r6.z = ps;
    ps = log2(r2.x);
    r9.w = dot(r6.zxy, r1.wyz);
    r9.z = ps;
    ps = r1.x;
    r6 = r9.ywwz * float4(-0.05, -0.5, 0.5, 15.0);
    ps = UniformVector_2.x * ps;
    r9.zw = r6.xx * r4.xy;
    r9.y = ps;
    r5 = r9.zwyx + float4(0.5, 0.5, -0.5, -0.5);
    ps = r8.z;
    r4.yz = float2((r9.xy >= 0.5));
    ps = r9.z + ps;
    r2.xy = r5.xy + r0.xy;
    r2.z = ps;
    ps = r8.w;
    r4.xw = r5.zw - r9.yx;
    r4.xw = r4.xw * r4.zy + r9.yx;
    ps = r9.w + ps;
    r4.xw = r4.xw + r4.xw;
    r2.w = ps;
    r6.x = tex2D(Texture2D_3, r8.xy).x;
    r8 = tex2D(Texture2D_2, r4.xw).zxwy;
    r12 = tex2D(Texture2D_1, r0.xy);
    r5.xyz = tex2D(Texture2D_1, r2.zw).xyz;
    r0.xw = tex2D(ModShadowAccumTexture, r0.zw).xy;
    r0.y = tex2D(Texture2D_1, r2.xy).w;
    r13.xyz = UniformVector_1.xyz * UniformVector_1.www;
    ps = OpacityOverride.x;
    r2.yzw = -UniformVector_0.xyz + 1.0;
    r10.w = saturate(ps);
    ps = 1.0 - r0.y;
    r9.xyz = -ModShadowColor.xyz + 1.0;
    r13.w = ps;
    ps = 0.875 * r0.x;
    r5.xyz = r5.xyz * 0.15;
    r4.x = ps;
    r2.x = r13.w * r12.w + r0.y;
    r10.xyz = r13.xyz * r12.xyz - r5.xyz;
    r7.yzw = r10.xyz * r12.www + r5.xyz;
    r5.xyz = r7.ywz * UniformScalar_0.xxx + UniformScalar_1.xxx;
    ps = 0.875 * r0.w;
    r11.x = dot(r4.zyy, float3(1.0, 1.0, 1.0));
    r4.y = ps;
    r1.x = (r11.x == 0.0) ? r8.y : r8.w;
    ps = r7.x;
    r0.xyz = r11.wxx + float3(0.1, -3.0, -2.0);
    r8.y = ps;
    ps = 5.0 * r0.x;
    r4.zw = r6.yz + 0.5;
    r0.w = saturate(ps);
    r1.x = (r0.z == 0.0) ? r8.x : r1.x;
    r8.x = (r0.y == 0.0) ? r8.z : r1.x;
    ps = 0.0;
    r0.x = -r0.w + 1.0;
    r8.z = ps;
    ps = max(r8.y, r8.z);
    r10.yz = r0.xx * ModShadowGroupColor.xy;
    r10.x = ps;
    ps = pow(2.0, r6.w);
    r0 = -r10.yxwz + 1.0;
    r1.x = ps;
    ps = log2(abs(r0.y));
    r4.zw = abs(r4.zw) * abs(r4.zw);
    r0.y = ps;
    ps = UniformScalar_4.x * r0.y;
    r6.yz = r4.xy * r0.xw;
    r4.x = ps;
    ps = pow(2.0, r4.x);
    r0.xyw = r6.yxz + float3(0.125, 1.0, 0.125);
    r8.y = ps;
    ps = r0.x * r0.w;
    r6.xyz = r1.xxx * ConstantLighting.xzy;
    r0.x = ps;
    ps = r0.y;
    r0.w = float((r0.z >= 0.004));
    r0.xyz = r0.xxx * r9.xyz + ModShadowColor.xyz;
    ps = -r8.y + ps;
    r4.xy = -r8.xy + 1.0;
    r1.x = ps;
    r7.x = r1.x * r4.y;
    r2 = r7 * r2;
    r8.xyz = r2.ywz * r4.zzz;
    ps = ConstantLighting.x * r1.w;
    r7 = r2.ywzx * r4.wwwx;
    r4.x = ps;
    r4.yzw = r2.yzw * AmbientColorAndSkyFactor.xyz + UniformVector_0.xyz;
    r7.xyz = r7.xyz * UpperSkyColor.xzy + r4.ywz;
    ps = ConstantLighting.y * r1.w;
    r1.x = r7.w - 0.5;
    r4.y = ps;
    ps = ConstantLighting.z * r1.w;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r1.xxxx)) clip(-1.0);
    r4.z = ps;
    r1.xyz = r8.xzy * LowerSkyColor.xyz + r7.xzy;
    r1.xyz = r6.xyz * r5.xyz + r1.xzy;
    r1.xyz = r4.xyz * r2.yzw + r1.xzy;
    ps = -r3.w;
    r0.xyz = r1.xyz * r0.xyz;
    ps = OpacityOverride.x + ps;
    r1.xyz = r0.xyz - r0.xyz;
    r1.w = ps;
    oC0.w = r1.w * r0.w + r3.w;
    r0.xyz = r1.xyz * r0.www + r0.xyz;
    oC0.xyz = r0.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
