// ps_a3f52f0fbee5f95e.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 210 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000348 10000B00 00000008 00000000 000054C6 000F003F 00000001 00003050 0000F155 00007256 0000F357 0000F4A0 0000F5A1
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
float4 OpacityOverride : register(c20); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformScalar_0 : register(c10); // float
float4 UniformScalar_1 : register(c11); // float
float4 UniformScalar_2 : register(c12); // float
float4 UniformScalar_3 : register(c13); // float
float4 UniformScalar_4 : register(c14); // float
float4 UniformScalar_5 : register(c15); // float
float4 UniformScalar_6 : register(c16); // float
float4 UniformScalar_7 : register(c17); // float
float4 UniformScalar_8 : register(c18); // float
float4 UniformScalar_9 : register(c19); // float
float4 UniformVector_0 : register(c6); // float4
float4 UniformVector_1 : register(c7); // float4
float4 UniformVector_2 : register(c8); // float4
float4 UniformVector_3 : register(c9); // float4
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

    r0 = tex2D(Texture2D_0, r0.xy);
    r1.xyz = UniformVector_1.xyz * UniformScalar_0.xxx;
    r7.xyz = r5.xyz * 2.0 - 1.0;
    r5.y = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    ps = UniformScalar_6.x;
    r5.x = dot(r2.zxy, r2.zxy);
    r2.w = saturate(ps);
    r6 = r4.yxzw * 2.0 - 1.0;
    ps = rsqrt(abs(r5.x));
    r4.x = dot(r6.zyx, r6.zyx);
    r4.z = ps;
    ps = rsqrt(abs(r5.y));
    r5.x = float((r2.w >= 1.0));
    r4.w = ps;
    r4.y = r0.w * UniformScalar_9.x + UniformScalar_8.x;
    r5.y = (r5.x > 0.0) ? r4.y : UniformScalar_8.x;
    ps = UniformVector_2.x * r4.w;
    r4.y = dot(r7.zxy, r7.zxy);
    r8.x = ps;
    ps = rsqrt(abs(r4.y));
    r2.xyz = r4.zzz * r2.yxz;
    r4.y = ps;
    r5.x = r2.z * 2.0 - r2.z;
    ps = rsqrt(abs(r4.x));
    r9.xyz = r7.xzy * r4.yyy;
    r4.x = ps;
    ps = UniformVector_2.y * r4.w;
    r6.xyz = r6.xzy * r4.xxx;
    r8.y = ps;
    ps = UniformVector_2.z * r4.w;
    r4.xyz = r6.yyy * LocalToWorldMatrix[2].xyz;
    r8.z = ps;
    ps = r6.z;
    r7.xyz = r6.yzx * r9.zyx;
    r7.xyz = r6.xzy * r9.yzx - r7.xzy;
    r4.xyz = r6.xxx * LocalToWorldMatrix[1].xyz + r4.xyz;
    r4.xzw = r6.zzz * LocalToWorldMatrix[0].xzy + r4.xzy;
    ps = r2.z * ps;
    r10.yzw = r7.xzy * r6.www;
    r7.x = ps;
    ps = r6.x;
    r4.y = dot(r10.wyz, r10.wyz);
    ps = r2.z * ps;
    r5.z = dot(r8.zxy, r4.zxw);
    r7.y = ps;
    ps = r6.y;
    r5.w = r4.x + r4.x;
    ps = r2.z * ps;
    r10.x = r5.w * r5.z;
    r7.z = ps;
    ps = rsqrt(abs(r4.y));
    r4.xw = r5.zz * r4.wz;
    r4.y = ps;
    ps = r4.x + r4.x;
    r11.xyz = r10.ywz * r4.yyy;
    r10.y = ps;
    r7.xyz = r11.xyz * r2.xxx + r7.xzy;
    ps = r4.w + r4.w;
    r4.xyz = r11.yxz * -r2.xxx;
    r10.z = ps;
    r4.yzw = r9.xzy * -r2.yyy + r4.yzx;
    ps = r2.z;
    r8.xyz = r10.xyz - r8.xyz;
    r2.x = ps;
    r7.xyw = r9.zyx * r2.yyy + r7.zyx;
    ps = 0.0;
    r9.xyz = r7.yyy * LocalToWorldMatrix[2].xzy;
    r2.y = ps;
    r7.xyz = r7.xxx * LocalToWorldMatrix[1].xzy + r9.xyz;
    r7.xyz = r7.www * LocalToWorldMatrix[0].xyz + r7.xzy;
    ps = max(r2.x, r2.y);
    r5.z = saturate(dot(r8.zxy, r7.zxy));
    r4.x = ps;
    ps = log2(r5.z);
    r4.x = -r4.x + 1.0;
    r5.z = ps;
    ps = log2(abs(r4.x));
    r5.w = r5.z * UniformScalar_1.x;
    r5.z = ps;
    ps = pow(2.0, r5.w);
    r4.x = r5.z * UniformScalar_7.x;
    r5.w = ps;
    ps = pow(2.0, r4.x);
    r1.xyz = r1.xyz * r5.www;
    r4.x = ps;
    r4.x = r1.x + r4.x;
    ps = 1.0 - r4.x;
    r1.w = r5.z * UniformScalar_4.x;
    r6.w = ps;
    r5 = r6.zyxw * r5.xxxy + r4.ywzx;
    r4.xyz = r5.yyy * LocalToWorldMatrix[2].xyz;
    r4.xyz = r5.zzz * LocalToWorldMatrix[1].xyz + r4.xyz;
    r4.xyz = r5.xxx * LocalToWorldMatrix[0].xzy + r4.xzy;
    r4 = xe_cube(r4.xzy);
    ps = 1.0 / abs(r4.z);
    r2.z = r4.w;
    r2.x = ps;
    r2.xy = r4.yx * r2.xx + 1.5;
    r4.xyz = texCUBE(TextureCube_0, xe_cube_dir(r2.xyz)).xyz;
    r4.w = dot(r4.zxy, float3(0.11, 0.3, 0.59));
    r2.xyz = r4.www - r4.xyz;
    r4.xyz = r2.xyz * UniformScalar_2.xxx + r4.xyz;
    r2.xyz = r4.xyz * UniformScalar_3.xxx - UniformScalar_5.xxx;
    ps = pow(2.0, r1.w);
    r4.w = r0.w * r2.w;
    r4.x = ps;
    r4.xyz = r2.xyz * r4.xxx + UniformScalar_5.xxx;
    r4.xyz = r4.xyz + r1.xyz;
    r4.xyz = r4.xyz * UniformVector_3.xyz;
    r0.xyz = -r4.xyz + r0.xyz;
    r4.xyz = r4.www * r0.xyz + r4.xyz;
    ps = r5.w;
    r4.xzw = r4.xyz + UniformVector_0.xyz;
    r4.y = ps;
    r4.xzw = r4.xzw * r3.www + r3.xyz;
    ps = OpacityOverride.x * r4.y;
    oC0.xyz = r4.xzw * SCENE_COLOR_BIAS_FACTOR.xxx;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
