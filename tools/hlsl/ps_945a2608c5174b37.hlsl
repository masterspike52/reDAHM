// ps_945a2608c5174b37.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10000600 00000008 00000000 00005CE7 001F007F 00000001 00003050 00003151 0000F255 00007356 0000F457 0000F5A0 0000F6A1
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

float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 OpacityOverride : register(c10); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.z = dot(r3.zxy, r3.zxy);
    r0 = r5.yxzw * 2.0 - 1.0;
    r2.xyz = r6.xyz * 2.0 - 1.0;
    r5.y = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r1.z));
    r5.x = dot(r0.zyx, r0.zyx);
    r5.z = ps;
    ps = rsqrt(abs(r5.x));
    r6.xyw = r5.zzz * r3.xyz;
    r5.z = ps;
    r5.x = r6.w * 2.0 - r6.w;
    ps = rsqrt(abs(r5.y));
    r3.xyz = r0.xzy * r5.zzz;
    r5.y = ps;
    r0.xyz = r2.xzy * r5.yyy;
    r5.yzw = r3.yzx * r0.zyx;
    r5.yzw = r3.xzy * r0.yzx - r5.ywz;
    r2.xyz = r5.ywz * r0.www;
    r5.w = dot(r2.zxy, r2.zxy);
    ps = rsqrt(abs(r5.w));
    r5.xyz = r3.zxy * r5.xxx;
    r5.w = ps;
    r2.xyz = r2.xzy * r5.www;
    r5.xyz = r2.xzy * -r6.yyy + r5.xyz;
    r5.xyw = r0.yzx * -r6.xxx + r5.zyx;
    r0.xyz = r5.xxx * LocalToWorldMatrix[2].xyz;
    r5.xyz = r5.yyy * LocalToWorldMatrix[1].xyz + r0.xyz;
    r5.xyz = r5.www * LocalToWorldMatrix[0].xzy + r5.xzy;
    r5 = xe_cube(r5.xzy);
    ps = 1.0 / abs(r5.z);
    r0.z = r5.w;
    r6.z = ps;
    r0.xy = r5.yx * r6.zz + 1.5;
    r6.xyz = tex2D(Texture2D_0, r1.xy).xyz;
    r5.xyz = texCUBE(TextureCube_0, xe_cube_dir(r0.xyz)).xyz;
    r5.w = dot(r5.zxy, float3(0.11, 0.3, 0.59));
    r0.xyz = r5.www - r5.xyz;
    r0.xyz = r0.xyz * UniformScalar_0.xxx + r5.xyz;
    r5.x = max(r6.w, 0.0);
    ps = 1.0 - r5.x;
    r1.xyz = UniformVector_1.xyz * UniformScalar_1.xxx;
    r5.y = ps;
    r5.xzw = r1.xyz * r0.xyz + UniformVector_0.xyz;
    r5.xzw = r6.xyz * UniformVector_1.xyz + r5.xzw;
    ps = r4.w;
    r6.x = abs(r5.y) * abs(r5.y);
    ps = SCENE_COLOR_BIAS_FACTOR.x * ps;
    r5.y = r6.x * abs(r5.y);
    r6.x = ps;
    ps = OpacityOverride.x * r5.y;
    oC0.xyz = r6.xxx * r5.xzw;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
