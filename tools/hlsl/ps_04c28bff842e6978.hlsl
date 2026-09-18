// ps_04c28bff842e6978.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 201 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 00000324 10040E00 0000070A 00000000 000068E7 001F007F 00000021 00003050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 ModShadowAccumResolution : register(c14); // float2
float4 ModShadowColor : register(c12); // float3
float4 ModShadowGroupColor : register(c13); // float3
float4 OpacityOverride : register(c11); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_14 : register(c10); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_3 : register(c9); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D ModShadowAccumTexture : register(s3);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
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
    float4 r6 = In.color1;
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

    r11 = tex2D(Texture2D_1, r0.xy);
    ps = 1.0 / ModShadowAccumResolution.y;
    r0.w = r11.w - 0.5;
    r4.y = ps;
    ps = 1.0 / ModShadowAccumResolution.x;
    r0.z = dot(r1.zxy, r1.zxy);
    r4.x = ps;
    r4.xy = r4.xy * abs(r7.xy);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r0.wwww)) clip(-1.0);
    r4.zw = tex2D(ModShadowAccumTexture, r4.xy).xy;
    r4.xy = r0.xy + UniformVector_3.xy;
    r9 = r4 * float4(-1.0, -1.0, 0.875, 0.875);
    r14.w = tex2D(Texture2D_2, r0.xy).x;
    r13.w = tex2D(Texture2D_2, r9.xy).x;
    r0.xyw = tex2D(Texture2D_0, r0.xy).xyz;
    r7.xyz = -ModShadowColor.xyz + 1.0;
    r10 = r5.xywz * 2.0 - 1.0;
    r6.xzw = r6.zxy * 2.0 - 1.0;
    ps = OpacityOverride.x;
    r4.xyz = UniformVector_1.xyz * UniformVector_1.www;
    r6.y = saturate(ps);
    r8.xyz = UniformVector_2.xyz * UniformVector_2.www - r4.xyz;
    ps = r0.x + r0.x;
    r5.x = dot(r3.zxy, r3.zxy);
    r12.x = ps;
    ps = r0.y + r0.y;
    r5.z = dot(r6.xzw, r6.xzw);
    r12.y = ps;
    ps = r0.w + r0.w;
    r5.w = dot(r10.wxy, r10.wxy);
    r12.z = ps;
    ps = rsqrt(abs(r5.x));
    r0.x = dot(r11.zxy, float3(0.11, 0.3, 0.59));
    r5.x = ps;
    ps = rsqrt(abs(r0.z));
    r5.y = r5.x * r3.z;
    r5.x = ps;
    r5.x = r5.x * r1.z + 0.1;
    ps = rsqrt(abs(r5.w));
    r0.xyz = r0.xxx - r11.xyz;
    r5.w = ps;
    r0.xyz = r0.xyz * 0.8 + r11.xyz;
    ps = rsqrt(abs(r5.z));
    r11.xyz = r10.xyw * r5.www;
    r5.z = ps;
    ps = 5.0 * r5.x;
    r3.xyz = r6.xwz * r5.zzz;
    r6.x = saturate(ps);
    ps = r5.y;
    r14.xyz = r11.xyz * r3.yxz;
    r5.y = ps;
    ps = 0.0;
    r13.xyz = r11.yzx * r3.zyx;
    r5.w = ps;
    ps = max(r5.y, r5.w);
    r5.xz = -r6.yx + 1.0;
    r10.x = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6 = r14 - r13;
    r10.y = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r1.xyz = r6.xyz * r10.zzz;
    r10.z = ps;
    ps = -abs(r6.w);
    r6.xyz = -r10.xyz + 1.0;
    ps = 1.0 + ps;
    r5.y = dot(r1.xyz, r1.xyz);
    r0.w = ps;
    ps = rsqrt(abs(r5.y));
    r6.w = r6.x * UniformScalar_14.x;
    r5.y = ps;
    ps = r6.w;
    r5.w = float((r5.x >= 0.004));
    ps = r0.w * ps;
    r10.xyz = r1.xzy * r5.yyy;
    r12.w = ps;
    r1 = r12.xzyw + float4(-1.0, -1.0, -1.0, -0.4);
    r5.xyz = r11.zxy * r1.yyy;
    r5.xyz = r10.xyz * r1.zzz + r5.xzy;
    r5.xyz = r3.yzx * r1.xxx + r5.yzx;
    ps = log2(abs(r0.w));
    r6.w = r5.x * LocalToWorldMatrix[1].z;
    r5.x = ps;
    r5.y = r5.y * LocalToWorldMatrix[0].z + r6.w;
    r5.y = r5.z * LocalToWorldMatrix[2].z + r5.y;
    r6.xw = r5.yx * float2(0.5, 5e+01);
    ps = pow(2.0, r6.w);
    r5.y = saturate(r1.w * 2.0000002);
    r5.x = ps;
    ps = r5.y;
    r6.yz = r9.zw * r6.yz;
    ps = r5.x + ps;
    r6.xyw = r6.yzx + float3(0.125, 0.125, 0.5);
    r6.z = saturate(ps);
    r1.xyz = r8.xyz * r6.zzz + r4.xyz;
    ps = abs(r6.w) * abs(r6.w);
    r5.x = r6.x * r6.y;
    r0.w = ps;
    r5.xyz = r5.xxx * r7.xyz + ModShadowColor.xyz;
    r6.xyz = r1.xyz * r6.zzz + UniformVector_0.xyz;
    r6.w = r0.w * abs(r6.w);
    r0.xyz = r6.www * r0.xyz;
    r0.xyz = r0.xyz + r0.xyz;
    r6.xyz = r4.xyz * r0.xyz + r6.xyz;
    ps = -r2.w;
    r5.xyz = r6.xyz * r5.xyz;
    ps = OpacityOverride.x + ps;
    r6.xyz = r5.xyz - r5.xyz;
    r6.w = ps;
    oC0.w = r6.w * r5.w + r2.w;
    r5.xyz = r6.xyz * r5.www + r5.xyz;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
