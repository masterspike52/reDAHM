// ps_c9f52fe8b6d7a78d.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 156 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000270 10000600 00000008 00000000 00005CC6 0007003F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A1 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR1 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 LocalToWorldMatrix[3] : register(c3); // float3x3 (matrix_columns)
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_10 : register(c14); // float
float4 UniformScalar_6 : register(c10); // float
float4 UniformScalar_7 : register(c11); // float
float4 UniformScalar_8 : register(c12); // float
float4 UniformScalar_9 : register(c13); // float
float4 UniformVector_1 : register(c6); // float4
float4 UniformVector_2 : register(c7); // float4
sampler2D Texture2D_0 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 color0 : COLOR0; // r3
    float4 color1 : COLOR1; // r4
    float4 color2 : COLOR2; // r5
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
    float4 r3 = In.color0;
    float4 r4 = In.color1;
    float4 r5 = In.color2;
    float4 r6 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.y = tex2D(Texture2D_0, r0.xy).w;
    r5.x = dot(r2.zxy, r2.zxy);
    r5.z = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    r6.xyz = r4.xyz * 2.0 - 1.0;
    r1 = r3 * 2.0 - 1.0;
    r3.x = dot(r1.zxy, r1.zxy);
    ps = UniformScalar_6.x;
    r3.y = dot(r6.zxy, r6.zxy);
    r3.z = saturate(ps);
    ps = rsqrt(abs(r5.z));
    r4.x = float((r3.z >= 1.0));
    r3.z = ps;
    r3.w = r5.y * UniformScalar_9.x + UniformScalar_8.x;
    r4.x = (r4.x > 0.0) ? r3.w : UniformScalar_8.x;
    ps = rsqrt(abs(r5.x));
    r0.xyz = r3.zzz * UniformVector_2.xyz;
    r3.z = ps;
    ps = rsqrt(abs(r3.y));
    r5.xyz = r3.zzz * r2.zxy;
    r4.y = ps;
    ps = rsqrt(abs(r3.x));
    r3.z = max(r5.x, 0.0);
    r3.x = ps;
    ps = 1.0 - r3.z;
    r3.xyw = r1.xyz * r3.xxx;
    r5.w = ps;
    ps = LocalToWorldMatrix[2].x * r3.w;
    r1.xyz = r6.xzy * r4.yyy;
    r2.x = ps;
    ps = LocalToWorldMatrix[2].y * r3.w;
    r4.yzw = r3.xwy * r5.xxx;
    r2.y = ps;
    ps = LocalToWorldMatrix[2].z * r3.w;
    r6.xyz = r3.wxy * r1.zyx;
    r2.z = ps;
    r6.xyz = r3.ywx * r1.yxz - r6.xyz;
    r2.xyz = r3.yyy * LocalToWorldMatrix[1].xyz + r2.xyz;
    ps = log2(abs(r5.w));
    r3.z = r5.w * 4.0;
    r3.y = ps;
    r2.xyz = r3.xxx * LocalToWorldMatrix[0].xzy + r2.xzy;
    r6.xyz = r6.xyz * r1.www;
    ps = UniformScalar_10.x * r3.z;
    r5.w = dot(r6.zxy, r6.zxy);
    r3.z = ps;
    ps = r3.z;
    r3.x = dot(r0.zxy, r2.yxz);
    r3.z = ps;
    ps = (-255.0);
    r0.w = r2.x + r2.x;
    r3.w = ps;
    ps = max(r3.z, r3.w);
    r2.x = r0.w * r3.x;
    r3.w = ps;
    ps = rsqrt(abs(r5.w));
    r3.xz = r3.xx * r2.zy;
    r5.w = ps;
    ps = r3.x + r3.x;
    r3.w = min(r3.w, 255.0);
    r2.y = ps;
    ps = r3.z + r3.z;
    r6.xyz = r6.xzy * r5.www;
    r2.z = ps;
    r4.yzw = r6.xzy * r5.zzz + r4.ywz;
    ps = UniformVector_1.x;
    r0.xyz = r2.xyz - r0.xyz;
    r4.yzw = r1.yxz * r5.yyy + r4.wyz;
    ps = UniformScalar_0.x * ps;
    r5.xyz = r4.yyy * LocalToWorldMatrix[2].xzy;
    r4.y = ps;
    r5.xyz = r4.www * LocalToWorldMatrix[1].xzy + r5.xyz;
    r5.xyz = r4.zzz * LocalToWorldMatrix[0].xyz + r5.xzy;
    ps = UniformScalar_7.x * r3.y;
    r3.z = saturate(dot(r0.zxy, r5.zxy));
    r3.x = ps;
    ps = log2(r3.z);
    r3.y = r3.w * 0.003921569;
    r3.z = ps;
    ps = pow(2.0, r3.x);
    r3.w = r3.z * UniformScalar_1.x;
    r3.x = ps;
    ps = pow(2.0, r3.w);
    r3.z = min(r3.y, 0.0);
    r3.w = ps;
    r3.x = r4.y * r3.w + r3.x;
    ps = 1.0 - r3.x;
    r3.w = ps;
    r3.x = r3.w * r4.x + r3.x;
    ps = (-0.003921569) - -r3.x;
    r3.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.xxxx)) clip(-1.0);
    oC0.zw = abs(r3.zz);
    oC0.xy = max(r3.yy, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
