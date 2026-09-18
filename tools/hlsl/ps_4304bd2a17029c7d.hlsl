// ps_4304bd2a17029c7d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 120 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001E0 10000600 00000008 00000000 00006CE7 000F007F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A1 0000F6A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.w = dot(r2.zxy, r2.zxy);
    r6 = r4.yxzw * 2.0 - 1.0;
    r1.xyz = r5.xyz * 2.0 - 1.0;
    r4.y = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r1.w));
    r4.x = dot(r6.zyx, r6.zyx);
    r4.z = ps;
    ps = rsqrt(abs(r4.x));
    r5.xyw = r4.zzz * r2.xyz;
    r4.z = ps;
    r4.x = r5.w * 2.0 - r5.w;
    ps = rsqrt(abs(r4.y));
    r2.xyz = r6.xzy * r4.zzz;
    r4.y = ps;
    r6.xyz = r1.xzy * r4.yyy;
    r4.yzw = r2.yzx * r6.zyx;
    r4.yzw = r2.xzy * r6.yzx - r4.ywz;
    r1.xyz = r4.ywz * r6.www;
    r4.w = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r4.w));
    r4.xyz = r2.zxy * r4.xxx;
    r4.w = ps;
    r1.xyz = r1.xzy * r4.www;
    r4.xyz = r1.xzy * -r5.yyy + r4.xyz;
    r4.xyw = r6.yzx * -r5.xxx + r4.zyx;
    r6.xyz = r4.xxx * LocalToWorldMatrix[2].xyz;
    r4.xyz = r4.yyy * LocalToWorldMatrix[1].xyz + r6.xyz;
    r4.xyz = r4.www * LocalToWorldMatrix[0].xzy + r4.xzy;
    r4 = xe_cube(r4.xzy);
    ps = 1.0 / abs(r4.z);
    r6.z = r4.w;
    r5.z = ps;
    r6.xy = r4.yx * r5.zz + 1.5;
    r5.xyz = tex2D(Texture2D_0, r0.wz).xyz;
    r4.xyz = texCUBE(TextureCube_0, xe_cube_dir(r6.xyz)).xyz;
    r4.w = dot(r4.zxy, float3(0.11, 0.3, 0.59));
    r6.xyz = r4.www - r4.xyz;
    r6.xyz = r6.xyz * UniformScalar_0.xxx + r4.xyz;
    r4.x = max(r5.w, 0.0);
    ps = 1.0 - r4.x;
    r0.xyz = UniformVector_1.xyz * UniformScalar_1.xxx;
    r4.y = ps;
    r4.xzw = r0.xyz * r6.xyz + UniformVector_0.xyz;
    r4.xzw = r5.xyz * UniformVector_1.xyz + r4.xzw;
    ps = r3.w;
    r5.x = abs(r4.y) * abs(r4.y);
    ps = SCENE_COLOR_BIAS_FACTOR.x * ps;
    r4.y = r5.x * abs(r4.y);
    r5.x = ps;
    ps = OpacityOverride.x * r4.y;
    oC0.xyz = r5.xxx * r4.xzw;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
