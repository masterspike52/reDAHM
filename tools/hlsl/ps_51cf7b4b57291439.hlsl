// ps_51cf7b4b57291439.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 165 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000294 10000900 00000008 00000000 00005CE7 001F007F 00000001 00003050 00003151 0000F255 00007356 0000F457 0000F5A0 0000F6A1
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
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r7.xy = r1.xy * 0.5 + UniformVector_3.xy;
    ps = r1.x;
    r1.zw = r1.xy + UniformVector_4.xy;
    ps = UniformVector_5.x + ps;
    r8.zw = r1.yx - 0.5;
    r8.x = ps;
    ps = r1.y;
    r0.w = dot(r3.zxy, r3.zxy);
    r2 = r5.yxzw * 2.0 - 1.0;
    r0.xyz = r6.xyz * 2.0 - 1.0;
    ps = UniformVector_5.y + ps;
    r5.x = dot(r0.zxy, r0.zxy);
    r8.y = ps;
    ps = rsqrt(abs(r0.w));
    r5.z = dot(r2.zyx, r2.zyx);
    r5.y = ps;
    ps = rsqrt(abs(r5.z));
    r6 = r8 + r1.xyyx;
    r5.z = ps;
    r1.y = dot(r6.zw, UniformVector_2.yx) + 0.5;
    r1.x = dot(r6.zw, UniformVector_1.yx) + 0.5;
    ps = rsqrt(abs(r5.x));
    r8.xyz = r2.xzy * r5.zzz;
    r5.x = ps;
    r2.xyz = r0.xzy * r5.xxx;
    ps = TwoSidedSign.x * r5.y;
    r9.xyz = r8.yzx * r2.zyx;
    r5.x = ps;
    r0 = r5.yyxy * r3.xyzz;
    r5.yzw = r8.xzy * r2.yzx - r9.xzy;
    ps = r0.z + r0.z;
    r6.z = float((UniformScalar_9.x >= 0.975));
    r5.x = ps;
    r5.x = r5.x * TwoSidedSign.x - r0.w;
    r3.xyz = r5.ywz * r2.www;
    r5.w = dot(r3.zxy, r3.zxy);
    ps = rsqrt(abs(r5.w));
    r5.xyz = r8.zxy * r5.xxx;
    r5.w = ps;
    r3.xyz = r3.xzy * r5.www;
    r5.xyz = r3.xzy * -r0.yyy + r5.xyz;
    r5.xyw = r2.yzx * -r0.xxx + r5.zyx;
    r2.xyz = r5.xxx * LocalToWorldMatrix[2].xyz;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xyz + r2.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xzy + r5.xzy;
    r5 = xe_cube(r5.xzy);
    ps = 1.0 / abs(r5.z);
    r2.z = r5.w;
    r2.x = ps;
    r2.xy = r5.yx * r2.xx + 1.5;
    r0.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    r3.xyz = texCUBE(TextureCube_0, xe_cube_dir(r2.xyz)).xyz;
    r5.xyz = tex2D(Texture2D_1, r6.xy).zxy;
    r6.xyw = tex2D(Texture2D_1, r1.zw).xyz;
    r1.xyz = tex2D(Texture2D_0, r1.xy).zxy;
    r7.xyz = UniformVector_6.xyz * UniformScalar_23.xxx;
    ps = r1.x + r1.x;
    r1.yz = r1.yz * float2(0.25, 0.5);
    r1.w = ps;
    ps = r5.y;
    r5.w = float((UniformScalar_9.x > 0.975));
    ps = r6.x + ps;
    r2.x = dot(r3.zxy, float3(0.11, 0.3, 0.59));
    r1.x = ps;
    ps = r5.z;
    r8.xyz = r2.xxx - r3.xyz;
    ps = r6.y + ps;
    r2.xyz = r1.yzw * r5.www;
    r1.y = ps;
    r3.xyz = r8.xyz * UniformScalar_22.xxx + r3.xyz;
    r5.yzw = r7.xyz * r3.xyz + UniformVector_0.xyz;
    ps = r5.x;
    r6.xyz = r2.xyz * r6.zzz;
    ps = r6.w + ps;
    r5.x = max(r0.w, 0.0);
    r1.z = ps;
    r6.xyz = r1.xyz * r0.xyz + r6.xyz;
    r6.xyz = r6.xyz * UniformVector_6.xyz + r5.yzw;
    ps = 1.0 - r5.x;
    r5.z = r4.w * SCENE_COLOR_BIAS_FACTOR.x;
    r5.y = ps;
    ps = OpacityOverride.x * r5.y;
    oC0.xyz = r5.zzz * r6.xyz;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
