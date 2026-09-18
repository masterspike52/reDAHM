// ps_e404cd54e89f188b.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 129 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000204 10000700 00000008 00000000 00005CE7 001F007F 00000001 00003050 00003151 0000F255 00007356 0000F457 0000F5A0 0000F6A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r5 <-> COLOR0 (flags 0xF)
//   interpolator: r6 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorldMatrix[3] : register(c4); // float3x3 (matrix_columns)
float4 OpacityOverride : register(c11); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 TwoSidedSign : register(c3); // float
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformVector_0 : register(c7); // float4
float4 UniformVector_1 : register(c8); // float4
sampler2D Texture2D_0 : register(s0);
samplerCUBE TextureCube_0 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
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
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.texcoord7;
    float4 r5 = In.color0;
    float4 r6 = In.color1;
    float4 r7 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.w = dot(r3.zxy, r3.zxy);
    r5 = r5.ywxz * 2.0 - 1.0;
    r0.xyz = r6.xyz * 2.0 - 1.0;
    r6.z = dot(r0.zxy, r0.zxy);
    ps = rsqrt(abs(r0.w));
    r6.w = dot(r5.wzx, r5.wzx);
    r6.x = ps;
    ps = rsqrt(abs(r6.w));
    r6.y = r6.x * TwoSidedSign.x;
    r6.w = ps;
    ps = rsqrt(abs(r6.z));
    r7.xyz = r5.xwz * r6.www;
    r6.z = ps;
    r0.xyz = r0.xzy * r6.zzz;
    r6 = r6.xxxy * r3.xyzz;
    ps = r6.w + r6.w;
    r2.xyz = r7.yzx * r0.zyx;
    r0.w = ps;
    r2.xyz = r7.xzy * r0.yzx - r2.xzy;
    r5.x = r0.w * TwoSidedSign.x - r6.z;
    r2.xyz = r2.xzy * r5.yyy;
    r5.w = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r5.w));
    r5.xyz = r7.zxy * r5.xxx;
    r5.w = ps;
    r2.xyz = r2.xzy * r5.www;
    r5.xyz = r2.xzy * -r6.yyy + r5.xyz;
    r5.xyw = r0.yzx * -r6.xxx + r5.zyx;
    r0.xyz = r5.xxx * LocalToWorldMatrix[2].xyz;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xyz + r0.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xzy + r5.xzy;
    r5 = xe_cube(r5.xzy);
    ps = 1.0 / abs(r5.z);
    r2.z = r5.w;
    r0.x = ps;
    r2.xy = r5.yx * r0.xx + 1.5;
    r0.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r5.xyz = texCUBE(TextureCube_0, xe_cube_dir(r2.xyz)).xyz;
    r1.xyz = UniformVector_1.xyz * UniformScalar_1.xxx;
    r5.w = dot(r5.zxy, float3(0.11, 0.3, 0.59));
    r2.xyz = r5.www - r5.xyz;
    r5.xyz = r2.xyz * UniformScalar_0.xxx + r5.xyz;
    r5.xyz = r1.xyz * r5.xyz + UniformVector_0.xyz;
    r5.yzw = r0.xyz * UniformVector_1.xyz + r5.xyz;
    ps = r4.w;
    r5.x = max(r6.z, 0.0);
    ps = SCENE_COLOR_BIAS_FACTOR.x * ps;
    r5.x = -r5.x + 1.0;
    r6.x = ps;
    oC0.xyz = r6.xxx * r5.yzw;
    ps = abs(r5.x) * abs(r5.x);
    r5.y = ps;
    r5.y = r5.y * abs(r5.x);
    ps = OpacityOverride.x * r5.y;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
