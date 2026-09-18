// ps_e34cd3b4bd37a2af.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10000900 00000008 00000000 00007D29 007F01FF 00000001 00003050 00003151 0000F252 0000F353 0000F455 00007556 0000F657 0000F7A0 0000F8A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD2 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD3 (flags 0xF)
//   interpolator: r4 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r5 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r6 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r7 <-> COLOR0 (flags 0xF)
//   interpolator: r8 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorldMatrix[3] : register(c4); // float3x3 (matrix_columns)
float4 OpacityOverride : register(c17); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformScalar_22 : register(c15); // float
float4 UniformScalar_23 : register(c16); // float
float4 UniformScalar_9 : register(c14); // float
float4 UniformVector_0 : register(c7); // float4
float4 UniformVector_1 : register(c8); // float4
float4 UniformVector_2 : register(c9); // float4
float4 UniformVector_3 : register(c10); // float4
float4 UniformVector_4 : register(c11); // float4
float4 UniformVector_5 : register(c12); // float4
float4 UniformVector_6 : register(c13); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
samplerCUBE TextureCube_0 : register(s2);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord2 : TEXCOORD2; // r2
    float4 texcoord3 : TEXCOORD3; // r3
    float4 texcoord5 : TEXCOORD5; // r4
    float4 texcoord6 : TEXCOORD6; // r5
    float4 texcoord7 : TEXCOORD7; // r6
    float4 color0 : COLOR0; // r7
    float4 color1 : COLOR1; // r8
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord2;
    float4 r3 = In.texcoord3;
    float4 r4 = In.texcoord5;
    float4 r5 = In.texcoord6;
    float4 r6 = In.texcoord7;
    float4 r7 = In.color0;
    float4 r8 = In.color1;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3.xy = r1.xy * 0.5 + UniformVector_3.xy;
    ps = r1.x;
    r1.zw = r1.xy + UniformVector_4.xy;
    ps = UniformVector_5.x + ps;
    r4.zw = r1.yx - 0.5;
    r4.x = ps;
    ps = r1.y;
    r0.w = dot(r5.zxy, r5.zxy);
    r2 = r7.yxzw * 2.0 - 1.0;
    r0.xyz = r8.xyz * 2.0 - 1.0;
    ps = UniformVector_5.y + ps;
    r7.x = dot(r0.zxy, r0.zxy);
    r4.y = ps;
    ps = rsqrt(abs(r0.w));
    r7.z = dot(r2.zyx, r2.zyx);
    r7.y = ps;
    ps = rsqrt(abs(r7.z));
    r8 = r4 + r1.xyyx;
    r7.z = ps;
    r1.y = dot(r8.zw, UniformVector_2.yx) + 0.5;
    r1.x = dot(r8.zw, UniformVector_1.yx) + 0.5;
    ps = rsqrt(abs(r7.x));
    r9.xyz = r2.xzy * r7.zzz;
    r7.x = ps;
    r2.xyz = r0.xzy * r7.xxx;
    ps = TwoSidedSign.x * r7.y;
    r4.xyz = r9.yzx * r2.zyx;
    r7.x = ps;
    r0 = r7.yyxy * r5.xyzz;
    r7.yzw = r9.xzy * r2.yzx - r4.xzy;
    ps = r0.z + r0.z;
    r8.z = float((UniformScalar_9.x >= 0.975));
    r7.x = ps;
    r7.x = r7.x * TwoSidedSign.x - r0.w;
    r4.xyz = r7.ywz * r2.www;
    r7.w = dot(r4.zxy, r4.zxy);
    ps = rsqrt(abs(r7.w));
    r7.xyz = r9.zxy * r7.xxx;
    r7.w = ps;
    r4.xyz = r4.xzy * r7.www;
    r7.xyz = r4.xzy * -r0.yyy + r7.xyz;
    r7.xyw = r2.yzx * -r0.xxx + r7.zyx;
    r2.xyz = r7.xxx * LocalToWorldMatrix[2].xyz;
    r7.xyz = r7.yyy * LocalToWorldMatrix[1].xyz + r2.xyz;
    r7.xyz = r7.www * LocalToWorldMatrix[0].xzy + r7.xzy;
    r7 = xe_cube(r7.xzy);
    ps = 1.0 / abs(r7.z);
    r2.z = r7.w;
    r2.x = ps;
    r2.xy = r7.yx * r2.xx + 1.5;
    r0.xyz = tex2D(Texture2D_1, r3.xy).xyz;
    r3.xyz = texCUBE(TextureCube_0, xe_cube_dir(r2.xyz)).xyz;
    r7.xyz = tex2D(Texture2D_1, r8.xy).zxy;
    r8.xyw = tex2D(Texture2D_1, r1.zw).xyz;
    r1.xyz = tex2D(Texture2D_0, r1.xy).zxy;
    r4.xyz = UniformVector_6.xyz * UniformScalar_23.xxx;
    ps = r1.x + r1.x;
    r1.yz = r1.yz * float2(0.25, 0.5);
    r1.w = ps;
    ps = r7.y;
    r7.w = float((UniformScalar_9.x > 0.975));
    ps = r8.x + ps;
    r2.x = dot(r3.zxy, float3(0.11, 0.3, 0.59));
    r1.x = ps;
    ps = r7.z;
    r5.xyz = r2.xxx - r3.xyz;
    ps = r8.y + ps;
    r2.xyz = r1.yzw * r7.www;
    r1.y = ps;
    r3.xyz = r5.xyz * UniformScalar_22.xxx + r3.xyz;
    r7.yzw = r4.xyz * r3.xyz + UniformVector_0.xyz;
    ps = r7.x;
    r8.xyz = r2.xyz * r8.zzz;
    ps = r8.w + ps;
    r7.x = max(r0.w, 0.0);
    r1.z = ps;
    r8.xyz = r1.xyz * r0.xyz + r8.xyz;
    r8.xyz = r8.xyz * UniformVector_6.xyz + r7.yzw;
    ps = 1.0 - r7.x;
    r7.z = r6.w * SCENE_COLOR_BIAS_FACTOR.x;
    r7.y = ps;
    ps = OpacityOverride.x * r7.y;
    oC0.xyz = r7.zzz * r8.xyz;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
