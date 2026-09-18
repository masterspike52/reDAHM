// ps_8a5f9ec4e233fd20.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10000B00 00000008 00000000 000054C6 000F003F 00000001 00003050 0000F155 00007256 0000F357 0000F4A0 0000F5A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 OpacityOverride : register(c21); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c11); // float
float4 UniformScalar_1 : register(c12); // float
float4 UniformScalar_10 : register(c18); // float
float4 UniformScalar_11 : register(c19); // float
float4 UniformScalar_12 : register(c20); // float
float4 UniformScalar_4 : register(c13); // float
float4 UniformScalar_5 : register(c14); // float
float4 UniformScalar_6 : register(c15); // float
float4 UniformScalar_7 : register(c16); // float
float4 UniformScalar_8 : register(c17); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_3 : register(c9); // float4
float4 UniformVector_4 : register(c10); // float4
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
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.xyz = r5.xyz * 2.0 - 1.0;
    r0.z = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    r0.w = dot(r2.zxy, r2.zxy);
    r5 = r4.yxzw * 2.0 - 1.0;
    ps = rsqrt(abs(r0.w));
    r4.x = dot(r5.zyx, r5.zyx);
    r4.z = ps;
    ps = rsqrt(abs(r0.z));
    r4.y = dot(r1.zxy, r1.zxy);
    r4.w = ps;
    ps = rsqrt(abs(r4.y));
    r2.xyz = r4.zzz * r2.xyz;
    r4.y = ps;
    ps = rsqrt(abs(r4.x));
    r6.xyz = r1.xzy * r4.yyy;
    r4.x = ps;
    r5.xyz = r5.xyz * r4.xxx;
    r1.xyz = r5.zzz * LocalToWorldMatrix[2].xyz;
    ps = UniformVector_2.x * r4.w;
    r4.xyz = r5.zxy * r6.zxy;
    r8.x = ps;
    r4.xyz = r5.xzy * r6.yxz - r4.xzy;
    r1.xyz = r5.xxx * LocalToWorldMatrix[1].xyz + r1.xyz;
    r9.xyz = r5.yyy * LocalToWorldMatrix[0].xzy + r1.xzy;
    ps = UniformVector_2.y * r4.w;
    r7.xyz = r4.xzy * r5.www;
    r8.y = ps;
    ps = UniformVector_2.z * r4.w;
    r4.x = dot(r7.yxz, r7.yxz);
    r8.z = ps;
    ps = rsqrt(abs(r4.x));
    r2.w = dot(r8.zxy, r9.yxz);
    r4.y = ps;
    ps = r2.z + r2.z;
    r1.xy = r0.xy * UniformVector_3.xy;
    r4.x = ps;
    ps = r2.w + r2.w;
    r7.xyz = r7.xzy * r4.yyy;
    r0.z = ps;
    r4.x = r4.x - r2.z;
    r4.xyz = r5.yzx * r4.xxx;
    r4.xyz = r7.xyz * -r2.yyy + r4.xzy;
    r4.xyw = r6.yzx * -r2.xxx + r4.zyx;
    r10.xyz = r4.xxx * LocalToWorldMatrix[2].xyz;
    r4.xyz = r4.yyy * LocalToWorldMatrix[1].xyz + r10.xyz;
    r4.xyz = r4.www * LocalToWorldMatrix[0].xzy + r4.xzy;
    r4 = xe_cube(r4.xzy);
    ps = 1.0 / abs(r4.z);
    r11.z = r4.w;
    r5.w = ps;
    r11.xy = r4.yx * r5.ww + 1.5;
    r10 = tex2D(Texture2D_1, r0.xy);
    r4.yzw = texCUBE(TextureCube_0, xe_cube_dir(r11.xyz)).xyz;
    r11 = tex2D(Texture2D_0, r1.xy);
    ps = UniformScalar_4.x * r11.w;
    r1.x = UniformVector_0.x + 1e-05;
    r1.y = ps;
    ps = log2(abs(r10.w));
    r5.w = dot(r4.wyz, float3(0.11, 0.3, 0.59));
    r4.x = ps;
    r0.xyw = r5.www - r4.yzw;
    r4.yzw = r0.xyw * UniformScalar_7.xxx + r4.yzw;
    ps = 0.3 * r4.x;
    r0.x = max(r2.z, 0.0);
    r5.w = ps;
    ps = pow(2.0, r5.w);
    r4.x = -r0.x + 1.0;
    r0.x = ps;
    ps = -r1.y;
    r10.xyz = -r11.xyz + r10.xyz;
    ps = r0.x + ps;
    r5.w = abs(r4.x) * abs(r4.x);
    r10.w = ps;
    ps = r5.w * r5.w;
    r5.xyz = r5.yzx * r2.zzz;
    r5.w = ps;
    r0.xyw = r10.xyz * UniformScalar_5.xxx + r11.xyz;
    r1.w = r10.w * UniformScalar_5.x + r1.y;
    r1.x = r0.x * r1.w + r1.x;
    r1.yz = r0.yw * r1.ww + 1e-05;
    r4.x = r5.w * abs(r4.x);
    r5.w = r4.x * UniformScalar_12.x + UniformScalar_11.x;
    r0.xyz = r0.zzz * r9.xzy - r8.xyz;
    r5.xyz = r7.xyz * r2.yyy + r5.xzy;
    r2.xyz = r6.xyz * r2.xxx + r5.xzy;
    r5.xyz = r2.yyy * LocalToWorldMatrix[2].xzy;
    r5.xyz = r2.zzz * LocalToWorldMatrix[1].xzy + r5.xyz;
    r5.xyz = r2.xxx * LocalToWorldMatrix[0].xyz + r5.xzy;
    ps = UniformScalar_8.x * r4.y;
    r5.y = saturate(dot(r0.zxy, r5.zxy));
    r5.x = ps;
    ps = log2(r5.y);
    r4.x = -r1.w + 1.0;
    r5.y = ps;
    ps = UniformScalar_8.x * r4.z;
    r5.z = r5.y * UniformScalar_0.x;
    r5.y = ps;
    ps = pow(2.0, r5.z);
    r0.w = r4.x * r5.w;
    r5.z = ps;
    ps = UniformScalar_8.x * r4.w;
    r5.w = r5.z * UniformScalar_1.x;
    r5.z = ps;
    r4 = r5.xwyz * r4.xxxx;
    ps = r4.y;
    r4.xzw = r4.xzw * UniformScalar_10.xxx;
    r4.y = ps;
    ps = UniformScalar_6.x * r4.y;
    r0.xyz = r4.xzw * UniformVector_4.xyz;
    r5.w = ps;
    r5.xyz = r5.www * UniformVector_1.xyz;
    r4 = r1.xwyz + r0.xwyz;
    r4.zw = r4.zw + r5.yz;
    r4.xy = r4.xy + r5.xw;
    r4.zw = r4.zw + UniformVector_0.yz;
    r5.xyz = r4.xzw * r3.www + r3.xyz;
    ps = OpacityOverride.x * r4.y;
    oC0.xyz = r5.xyz * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
