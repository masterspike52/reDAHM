// ps_6d833d1cab2567b4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 234 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003A8 10040E00 0000080A 00000000 00008108 001F00FF 00000021 0000F050 0000F154 0000F256 0000F357 0000F458 0000F5A0 0000F6A1 0000F7A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD4 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD8 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
//   interpolator: r7 <-> COLOR2 (flags 0xF)
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
    float4 texcoord4 : TEXCOORD4; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 texcoord8 : TEXCOORD8; // r4
    float4 color0 : COLOR0; // r5
    float4 color1 : COLOR1; // r6
    float4 color2 : COLOR2; // r7
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

    r7 = tex2D(Texture2D_1, r0.xy);
    r4.x = UniformScalar_4.x - UniformScalar_3.x;
    r9.w = -UniformScalar_3.x + 1.0;
    r5 = r5.yxwz * 2.0 - 1.0;
    r4.yzw = r6.xyz * 2.0 - 1.0;
    ps = 1.0 / ModShadowAccumResolution.x;
    r6.z = dot(r4.wyz, r4.wyz);
    r6.x = ps;
    ps = 1.0 / ModShadowAccumResolution.y;
    r6.w = dot(r5.wyx, r5.wyx);
    r6.y = ps;
    ps = rsqrt(abs(r6.w));
    r6.xy = r6.xy * abs(r8.xy);
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r10.xyz = r5.xyw * r6.www;
    r6.z = ps;
    ps = r0.z;
    r11.xyz = r4.ywz * r6.zzz;
    r8.w = saturate(ps);
    ps = UniformVector_5.x * UniformVector_5.w;
    r9.xyz = r10.xzy * r11.yxz;
    r14.x = ps;
    ps = UniformVector_5.y * UniformVector_5.w;
    r8.xyz = r10.zxy * r11.zxy;
    r14.y = ps;
    ps = 1.0 / r4.x;
    r8 = r9 - r8.xzyw;
    r6.z = ps;
    ps = UniformVector_5.z * UniformVector_5.w;
    r14.w = saturate(r8.w * r6.z);
    r14.z = ps;
    r7 = r14 * r7;
    ps = (-0.5) - -r7.w;
    r4.xyz = -ModShadowColor.xyz + 1.0;
    r6.z = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r6.zzzz)) clip(-1.0);
    r0.yzw = tex2D(Texture2D_0, r0.xy).xyz;
    r6.yz = tex2D(ModShadowAccumTexture, r6.xy).xy;
    ps = OpacityOverride.x;
    r0.x = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    r5.y = saturate(ps);
    ps = TwoSidedSign.x;
    r6.x = dot(r1.zxy, r1.zxy);
    ps = UniformVector_4.z * ps;
    r4.w = dot(r3.zxy, r3.zxy);
    r6.w = ps;
    ps = rsqrt(abs(r4.w));
    r6.yz = r6.yz * 0.875;
    r4.w = ps;
    ps = rsqrt(abs(r6.x));
    r0.yzw = r0.yzw + r0.yzw;
    r6.x = ps;
    ps = rsqrt(abs(r0.x));
    r3.xyw = r4.www * r3.zyx;
    r0.x = ps;
    ps = r6.x;
    r9.yzw = r0.xxx * UniformVector_2.xyz;
    ps = r1.z * ps;
    r6.x = max(r3.x, 0.0);
    r0.x = ps;
    ps = r11.y;
    r0 = r0 + float4(0.1, -1.0, -1.0, -1.0);
    ps = r9.y * ps;
    r1.z = r6.w * r0.w;
    r8.w = ps;
    ps = r0.x;
    r12.xyz = r10.yzx * r3.xxx;
    r5.x = ps;
    ps = 5.0 * r5.x;
    r1.xy = r0.yz * UniformVector_4.xy;
    r5.x = saturate(ps);
    ps = 1.0 - r5.x;
    r0.xyz = r8.xzy * r5.zzz;
    r5.z = ps;
    ps = ModShadowGroupColor.x * r5.z;
    r6.w = dot(r1.zxy, r1.zxy);
    r5.x = ps;
    ps = rsqrt(abs(r6.w));
    r5.w = dot(r0.yxz, r0.yxz);
    r6.w = ps;
    ps = ModShadowGroupColor.y * r5.z;
    r9.x = r1.z * r6.w;
    r5.z = ps;
    ps = rsqrt(abs(r5.w));
    r1.xy = r1.xy * r6.ww;
    r5.w = ps;
    ps = 1.0 - r5.x;
    r13.xyz = r0.xzy * r5.www;
    r6.w = ps;
    ps = 1.0 - r5.z;
    r7.xyz = r14.www * r7.xyz;
    r5.w = ps;
    r0.xyz = r7.xzy * UniformScalar_6.xxx + UniformScalar_7.xxx;
    ps = r13.z;
    r8.xyz = r11.xzy * r1.xxx;
    ps = r9.z * ps;
    r1.xyz = r13.xzy * r1.yyy;
    r1.w = ps;
    r3.xyz = r13.xzy * r3.yyy + r12.xyz;
    r3.xyw = r11.zyx * r3.www + r3.zyx;
    ps = 1.0 - r5.y;
    r1 = r8 + r1.xzyw;
    r5.x = ps;
    r8.xyz = r3.yyy * LocalToWorldMatrix[2].xyz + r9.yzw;
    r8.xyz = r3.xxx * LocalToWorldMatrix[1].xzy + r8.xzy;
    r1 = r10.yzxz * r9.xxxw + r1.xzyw;
    ps = r6.y;
    r3.xyz = r1.yyy * LocalToWorldMatrix[2].xzy;
    r8.xyz = r3.www * LocalToWorldMatrix[0].xyz + r8.xzy;
    ps = r6.w * ps;
    r5.y = dot(r8.zxy, r8.zxy);
    r6.y = ps;
    r3.xyz = r1.zzz * LocalToWorldMatrix[1].xzy + r3.xyz;
    r3.xyz = r1.xxx * LocalToWorldMatrix[0].xyz + r3.xzy;
    ps = rsqrt(abs(r5.y));
    r6.w = dot(r9.wyz, r3.zxy);
    r5.y = ps;
    ps = r6.z;
    r8.xyz = r8.xyz * r5.yyy;
    ps = r5.w * ps;
    r5.y = saturate(dot(r8.zxy, r3.zxy));
    r6.z = ps;
    ps = log2(r5.y);
    r6.xw = r6.wx * 0.5;
    r5.y = ps;
    r7.w = r1.w * 0.5 + r6.w;
    ps = UniformScalar_5.x * r5.y;
    r6.xyz = r6.xyz + float3(0.5, 0.125, 0.125);
    r5.y = ps;
    ps = abs(r6.x) * abs(r6.x);
    r5.w = float((r5.x >= 0.004));
    r6.x = ps;
    ps = pow(2.0, r5.y);
    r5.x = r6.y * r6.z;
    r6.y = ps;
    r5.xyz = r5.xxx * r4.xyz + ModShadowColor.xyz;
    r6 = r7.xzyw * r6.xxxy;
    r6.xyz = r6.www * r0.xzy + r6.xzy;
    r6.xyz = r7.xzy * UniformScalar_8.xxx + r6.xzy;
    r6.xyz = r6.xzy * UniformVector_1.xyz + UniformVector_0.xyz;
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
