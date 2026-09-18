// ps_6b52484d54ba5fb2.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003A8 10040E00 0000080A 00000000 00007108 003F00FF 00000021 00003050 00003151 0000F254 0000F356 0000F457 0000F558 0000F6A0 0000F7A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r6 <-> COLOR0 (flags 0xF)
//   interpolator: r7 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorldMatrix[3] : register(c4); // float3x3 (matrix_columns)
float4 ModShadowAccumResolution : register(c21); // float2
float4 ModShadowColor : register(c19); // float3
float4 ModShadowGroupColor : register(c20); // float3
float4 OpacityOverride : register(c18); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformScalar_3 : register(c12); // float
float4 UniformScalar_4 : register(c13); // float
float4 UniformScalar_5 : register(c14); // float
float4 UniformScalar_6 : register(c15); // float
float4 UniformScalar_7 : register(c16); // float
float4 UniformScalar_8 : register(c17); // float
float4 UniformVector_0 : register(c7); // float4
float4 UniformVector_1 : register(c8); // float4
float4 UniformVector_2 : register(c9); // float4
float4 UniformVector_4 : register(c10); // float4
float4 UniformVector_5 : register(c11); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D ModShadowAccumTexture : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord4 : TEXCOORD4; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
    float4 texcoord8 : TEXCOORD8; // r5
    float4 color0 : COLOR0; // r6
    float4 color1 : COLOR1; // r7
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
    float4 r7 = In.color1;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 r14 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5 = tex2D(Texture2D_1, r0.xy);
    r0.z = UniformScalar_4.x - UniformScalar_3.x;
    r9.w = -UniformScalar_3.x + 1.0;
    r6 = r6.yxwz * 2.0 - 1.0;
    r9.xyz = r7.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r7.z = dot(r9.zxy, r9.zxy);
    r7.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r7.w = dot(r6.wyx, r6.wyx);
    r7.y = ps;
    ps = rsqrt(abs(r7.w));
    r7.xy = r7.xy * abs(r8.xy);
    r7.w = ps;
    ps = rsqrt(abs(r7.z));
    r10.xyz = r6.xyw * r7.www;
    r7.z = ps;
    ps = r1.y;
    r11.xyz = r9.xzy * r7.zzz;
    r1.w = saturate(ps);
    ps = UniformVector_5.x * UniformVector_5.w;
    r9.xyz = r10.xzy * r11.yxz;
    r14.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r1.xyz = r10.zxy * r11.zxy;
    r14.y = ps;
    ps = 1.0 / r0.z;
    r8 = r9 - r1.xzyw;
    r7.z = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r14.w = saturate(r8.w * r7.z);
    r14.z = ps;
    r1 = r14 * r5;
    ps = (-0.5) - -r1.w;
    r5.xyz = -ModShadowColor.xyz + 1.0;
    r7.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r7.zzzz)) clip(-1.0);
    r0.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r7.yz = tex2D(ModShadowAccumTexture, r7.xy).xy;
    ps = OpacityOverride.x;
    r0.x = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    r6.y = saturate(ps);
    ps = TwoSidedSign.x;
    r7.x = dot(r2.zxy, r2.zxy);
    ps = UniformVector_4.z * ps;
    r5.w = dot(r4.zxy, r4.zxy);
    r7.w = ps;
    ps = rsqrt(abs(r5.w));
    r7.yz = r7.yz * 0.875;
    r5.w = ps;
    ps = rsqrt(abs(r7.x));
    r0.yzw = r0.yzw + r0.yzw;
    r7.x = ps;
    ps = rsqrt(abs(r0.x));
    r4.xyw = r5.www * r4.zyx;
    r0.x = ps;
    ps = r7.x;
    r9.yzw = r0.xxx * UniformVector_2.xyz;
    ps = r2.z * ps;
    r7.x = max(r4.x, 0.0);
    r0.x = ps;
    ps = r11.y;
    r0 = r0 + float4(0.1, -1.0, -1.0, -1.0);
    ps = r9.y * ps;
    r2.z = r7.w * r0.w;
    r8.w = ps;
    ps = r0.x;
    r12.xyz = r10.yzx * r4.xxx;
    r6.x = ps;
    ps = 5.0 * r6.x;
    r2.xy = r0.yz * UniformVector_4.xy;
    r6.x = saturate(ps);
    ps = 1.0 - r6.x;
    r0.xyz = r8.xzy * r6.zzz;
    r6.z = ps;
    ps = ModShadowGroupColor.x * r6.z;
    r7.w = dot(r2.zxy, r2.zxy);
    r6.x = ps;
    ps = rsqrt(abs(r7.w));
    r6.w = dot(r0.yxz, r0.yxz);
    r7.w = ps;
    ps = ModShadowGroupColor.y * r6.z;
    r9.x = r2.z * r7.w;
    r6.z = ps;
    ps = rsqrt(abs(r6.w));
    r2.xy = r2.xy * r7.ww;
    r6.w = ps;
    ps = 1.0 - r6.x;
    r13.xyz = r0.xzy * r6.www;
    r7.w = ps;
    ps = 1.0 - r6.z;
    r0.xyz = r14.www * r1.xyz;
    r6.w = ps;
    r1.xyz = r0.xzy * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = r13.z;
    r8.xyz = r11.xzy * r2.xxx;
    ps = r9.z * ps;
    r2.xyz = r13.xzy * r2.yyy;
    r2.w = ps;
    r4.xyz = r13.xzy * r4.yyy + r12.xyz;
    r4.xyw = r11.zyx * r4.www + r4.zyx;
    ps = 1.0 - r6.y;
    r2 = r8 + r2.xzyw;
    r6.x = ps;
    r8.xyz = r4.yyy * LocalToWorldMatrix[2].xyz + r9.yzw;
    r8.xyz = r4.xxx * LocalToWorldMatrix[1].xzy + r8.xzy;
    r2 = r10.yzxz * r9.xxxw + r2.xzyw;
    ps = r7.y;
    r4.xyz = r2.yyy * LocalToWorldMatrix[2].xzy;
    r8.xyz = r4.www * LocalToWorldMatrix[0].xyz + r8.xzy;
    ps = r7.w * ps;
    r6.y = dot(r8.zxy, r8.zxy);
    r7.y = ps;
    r4.xyz = r2.zzz * LocalToWorldMatrix[1].xzy + r4.xyz;
    r4.xyz = r2.xxx * LocalToWorldMatrix[0].xyz + r4.xzy;
    ps = rsqrt(abs(r6.y));
    r7.w = dot(r9.wyz, r4.zxy);
    r6.y = ps;
    ps = r7.z;
    r8.xyz = r8.xyz * r6.yyy;
    ps = r6.w * ps;
    r6.y = saturate(dot(r8.zxy, r4.zxy));
    r7.z = ps;
    ps = log2(r6.y);
    r7.xw = r7.wx * 0.5;
    r6.y = ps;
    r0.w = r2.w * 0.5 + r7.w;
    ps = UniformScalar_5.x * r6.y;
    r7.xyz = r7.xyz + float3(0.5, 0.125, 0.125);
    r6.y = ps;
    ps = abs(r7.x) * abs(r7.x);
    r6.w = float((r6.x >= 0.004));
    r7.x = ps;
    ps = pow(2.0, r6.y);
    r6.x = r7.y * r7.z;
    r7.y = ps;
    r6.xyz = r6.xxx * r5.xyz + ModShadowColor.xyz;
    r7 = r0.xzyw * r7.xxxy;
    r7.xyz = r7.www * r1.xzy + r7.xzy;
    r7.xyz = r0.xzy * UniformScalar_8.xxx + r7.xzy;
    r7.xyz = r7.xzy * UniformVector_1.xyz + UniformVector_0.xyz;
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
