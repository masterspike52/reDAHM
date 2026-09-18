// ps_ddafeac9b33ee3e1.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 228 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000390 10000B00 00000008 00000000 00006CE7 000F007F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A1 0000F6A2
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
    float4 r10 = 0.0;
    float4 r11 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6.xyz = r5.xyz * 2.0 - 1.0;
    r6.w = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    r1.x = dot(r2.zxy, r2.zxy);
    r5 = r4.yxzw * 2.0 - 1.0;
    ps = rsqrt(abs(r1.x));
    r4.x = dot(r5.zyx, r5.zyx);
    r4.z = ps;
    ps = rsqrt(abs(r6.w));
    r4.y = dot(r6.zxy, r6.zxy);
    r4.w = ps;
    ps = rsqrt(abs(r4.y));
    r1.xyz = r4.zzz * r2.xyz;
    r4.y = ps;
    ps = rsqrt(abs(r4.x));
    r2.xyz = r6.xzy * r4.yyy;
    r4.x = ps;
    r5.xyz = r5.xyz * r4.xxx;
    r6.yzw = r5.zzz * LocalToWorldMatrix[2].xyz;
    ps = UniformVector_2.x * r4.w;
    r4.xyz = r5.zxy * r2.zxy;
    r6.x = ps;
    r4.xyz = r5.xzy * r2.yxz - r4.xzy;
    r6.yzw = r5.xxx * LocalToWorldMatrix[1].xyz + r6.yzw;
    r8.xyz = r5.yyy * LocalToWorldMatrix[0].xzy + r6.ywz;
    ps = UniformVector_2.y * r4.w;
    r7.xyz = r4.xzy * r5.www;
    r6.y = ps;
    ps = UniformVector_2.z * r4.w;
    r4.x = dot(r7.yxz, r7.yxz);
    r6.z = ps;
    ps = rsqrt(abs(r4.x));
    r1.w = dot(r6.zxy, r8.yxz);
    r4.y = ps;
    ps = r1.z + r1.z;
    r10.xy = r0.xy * UniformVector_3.xy;
    r4.x = ps;
    ps = r1.w + r1.w;
    r7.xyz = r7.xzy * r4.yyy;
    r6.w = ps;
    r4.x = r4.x - r1.z;
    r4.xyz = r5.yzx * r4.xxx;
    r4.xyz = r7.xyz * -r1.yyy + r4.xzy;
    r4.xyw = r2.yzx * -r1.xxx + r4.zyx;
    r9.xyz = r4.xxx * LocalToWorldMatrix[2].xyz;
    r4.xyz = r4.yyy * LocalToWorldMatrix[1].xyz + r9.xyz;
    r4.xyz = r4.www * LocalToWorldMatrix[0].xzy + r4.xzy;
    r4 = xe_cube(r4.xzy);
    ps = 1.0 / abs(r4.z);
    r11.z = r4.w;
    r5.w = ps;
    r11.xy = r4.yx * r5.ww + 1.5;
    r9 = tex2D(Texture2D_1, r0.xy);
    r4.yzw = texCUBE(TextureCube_0, xe_cube_dir(r11.xyz)).xyz;
    r0 = tex2D(Texture2D_0, r10.xy);
    ps = UniformScalar_4.x * r0.w;
    r2.w = UniformVector_0.x + 1e-05;
    r0.w = ps;
    ps = log2(abs(r9.w));
    r5.w = dot(r4.wyz, float3(0.11, 0.3, 0.59));
    r4.x = ps;
    r10.xyz = r5.www - r4.yzw;
    r4.yzw = r10.xyz * UniformScalar_7.xxx + r4.yzw;
    ps = 0.3 * r4.x;
    r7.w = max(r1.z, 0.0);
    r5.w = ps;
    ps = pow(2.0, r5.w);
    r4.x = -r7.w + 1.0;
    r7.w = ps;
    ps = -r0.w;
    r9.xyz = -r0.xyz + r9.xyz;
    ps = r7.w + ps;
    r5.w = abs(r4.x) * abs(r4.x);
    r9.w = ps;
    ps = r5.w * r5.w;
    r5.xyz = r5.yzx * r1.zzz;
    r5.w = ps;
    r0.xyz = r9.xyz * UniformScalar_5.xxx + r0.xyz;
    r0.w = r9.w * UniformScalar_5.x + r0.w;
    r0.x = r0.x * r0.w + r2.w;
    r0.yz = r0.yz * r0.ww + 1e-05;
    r4.x = r5.w * abs(r4.x);
    r5.w = r4.x * UniformScalar_12.x + UniformScalar_11.x;
    r6.xyz = r6.www * r8.xzy - r6.xyz;
    r5.xyz = r7.xyz * r1.yyy + r5.xzy;
    r1.xyz = r2.xyz * r1.xxx + r5.xzy;
    r5.xyz = r1.yyy * LocalToWorldMatrix[2].xzy;
    r5.xyz = r1.zzz * LocalToWorldMatrix[1].xzy + r5.xyz;
    r5.xyz = r1.xxx * LocalToWorldMatrix[0].xyz + r5.xzy;
    ps = UniformScalar_8.x * r4.y;
    r5.y = saturate(dot(r6.zxy, r5.zxy));
    r5.x = ps;
    ps = log2(r5.y);
    r4.x = -r0.w + 1.0;
    r5.y = ps;
    ps = UniformScalar_8.x * r4.z;
    r5.z = r5.y * UniformScalar_0.x;
    r5.y = ps;
    ps = pow(2.0, r5.z);
    r6.w = r4.x * r5.w;
    r5.z = ps;
    ps = UniformScalar_8.x * r4.w;
    r5.w = r5.z * UniformScalar_1.x;
    r5.z = ps;
    r4 = r5.xwyz * r4.xxxx;
    ps = r4.y;
    r4.xzw = r4.xzw * UniformScalar_10.xxx;
    r4.y = ps;
    ps = UniformScalar_6.x * r4.y;
    r6.xyz = r4.xzw * UniformVector_4.xyz;
    r5.w = ps;
    r5.xyz = r5.www * UniformVector_1.xyz;
    r4 = r0.xwyz + r6.xwyz;
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
