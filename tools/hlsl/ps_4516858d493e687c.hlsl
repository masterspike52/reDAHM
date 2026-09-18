// ps_4516858d493e687c.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10000900 00000008 00000000 00006CE7 000F007F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A1 0000F6A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
//   interpolator: r6 <-> COLOR2 (flags 0xF)
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
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 color0 : COLOR0; // r4
    float4 color1 : COLOR1; // r5
    float4 color2 : COLOR2; // r6
};

struct PS_OUTPUT
{
    float4 color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT In)
{
    float4 r0 = In.texcoord0;
    float4 r1 = In.texcoord5;
    float4 r2 = In.texcoord6;
    float4 r3 = In.texcoord7;
    float4 r4 = In.color0;
    float4 r5 = In.color1;
    float4 r6 = In.color2;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.zw = r0.wz * 0.5 + UniformVector_3.xy;
    ps = r0.w;
    r1.xy = r0.wz + UniformVector_4.xy;
    ps = UniformVector_5.x + ps;
    r8.zw = r0.zw - 0.5;
    r8.x = ps;
    ps = r0.z;
    r6.w = dot(r2.zxy, r2.zxy);
    r7 = r4.yxzw * 2.0 - 1.0;
    r6.xyz = r5.xyz * 2.0 - 1.0;
    ps = UniformVector_5.y + ps;
    r4.x = dot(r6.zxy, r6.zxy);
    r8.y = ps;
    ps = rsqrt(abs(r6.w));
    r4.z = dot(r7.zyx, r7.zyx);
    r4.y = ps;
    ps = rsqrt(abs(r4.z));
    r5 = r8 + r0.wzzw;
    r4.z = ps;
    r0.y = dot(r5.zw, UniformVector_2.yx) + 0.5;
    r0.x = dot(r5.zw, UniformVector_1.yx) + 0.5;
    ps = rsqrt(abs(r4.x));
    r8.xyz = r7.xzy * r4.zzz;
    r4.x = ps;
    r7.xyz = r6.xzy * r4.xxx;
    ps = TwoSidedSign.x * r4.y;
    r9.xyz = r8.yzx * r7.zyx;
    r4.x = ps;
    r6 = r4.yyxy * r2.xyzz;
    r4.yzw = r8.xzy * r7.yzx - r9.xzy;
    ps = r6.z + r6.z;
    r5.z = float((UniformScalar_9.x >= 0.975));
    r4.x = ps;
    r4.x = r4.x * TwoSidedSign.x - r6.w;
    r2.xyz = r4.ywz * r7.www;
    r4.w = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r4.w));
    r4.xyz = r8.zxy * r4.xxx;
    r4.w = ps;
    r2.xyz = r2.xzy * r4.www;
    r4.xyz = r2.xzy * -r6.yyy + r4.xyz;
    r4.xyw = r7.yzx * -r6.xxx + r4.zyx;
    r2.xyz = r4.xxx * LocalToWorldMatrix[2].xyz;
    r4.xyz = r4.yyy * LocalToWorldMatrix[1].xyz + r2.xyz;
    r4.xyz = r4.www * LocalToWorldMatrix[0].xzy + r4.xzy;
    r4 = xe_cube(r4.xzy);
    ps = 1.0 / abs(r4.z);
    r2.z = r4.w;
    r0.z = ps;
    r2.xy = r4.yx * r0.zz + 1.5;
    r6.xyz = tex2D(Texture2D_1, r1.zw).xyz;
    r2.xyz = texCUBE(TextureCube_0, xe_cube_dir(r2.xyz)).xyz;
    r4.xyz = tex2D(Texture2D_1, r5.xy).zxy;
    r5.xyw = tex2D(Texture2D_1, r1.xy).xyz;
    r0.xyz = tex2D(Texture2D_0, r0.xy).zxy;
    r7.xyz = UniformVector_6.xyz * UniformScalar_23.xxx;
    ps = r0.x + r0.x;
    r0.yz = r0.yz * float2(0.25, 0.5);
    r0.w = ps;
    ps = r4.y;
    r4.w = float((UniformScalar_9.x > 0.975));
    ps = r5.x + ps;
    r1.x = dot(r2.zxy, float3(0.11, 0.3, 0.59));
    r0.x = ps;
    ps = r4.z;
    r8.xyz = r1.xxx - r2.xyz;
    ps = r5.y + ps;
    r1.xyz = r0.yzw * r4.www;
    r0.y = ps;
    r2.xyz = r8.xyz * UniformScalar_22.xxx + r2.xyz;
    r4.yzw = r7.xyz * r2.xyz + UniformVector_0.xyz;
    ps = r4.x;
    r5.xyz = r1.xyz * r5.zzz;
    ps = r5.w + ps;
    r4.x = max(r6.w, 0.0);
    r0.z = ps;
    r5.xyz = r0.xyz * r6.xyz + r5.xyz;
    r5.xyz = r5.xyz * UniformVector_6.xyz + r4.yzw;
    ps = 1.0 - r4.x;
    r4.z = r3.w * SCENE_COLOR_BIAS_FACTOR.x;
    r4.y = ps;
    ps = OpacityOverride.x * r4.y;
    oC0.xyz = r4.zzz * r5.xyz;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
