// ps_82eb8117a54ddeb4.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 219 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000036C 10000800 00000008 00000000 00005CC6 0007003F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A1 0000F5A2
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
float4 UniformScalar_0 : register(c9); // float
float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_10 : register(c15); // float
float4 UniformScalar_6 : register(c11); // float
float4 UniformScalar_7 : register(c12); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformScalar_9 : register(c14); // float
float4 UniformVector_1 : register(c6); // float4
float4 UniformVector_2 : register(c7); // float4
float4 UniformVector_4 : register(c8); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);

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
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.x = UniformVector_1.x * UniformScalar_0.x;
    r8.w = UniformScalar_10.x * 4.0;
    r5.yzw = r4.xyz * 2.0 - 1.0;
    r1.x = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    r1.z = dot(r2.zxy, r2.zxy);
    r4 = r3 * 2.0 - 1.0;
    ps = rsqrt(abs(r1.z));
    r3.x = dot(r4.zxy, r4.zxy);
    r3.z = ps;
    ps = rsqrt(abs(r1.x));
    r3.y = dot(r5.wyz, r5.wyz);
    r3.w = ps;
    ps = rsqrt(abs(r3.y));
    r2.xyz = r3.zzz * r2.zxy;
    r3.y = ps;
    ps = rsqrt(abs(r3.x));
    r6.xyz = r5.ywz * r3.yyy;
    r3.x = ps;
    r5.yzw = r4.xyz * r3.xxx;
    ps = UniformVector_2.x * r3.w;
    r7.xyz = r5.www * LocalToWorldMatrix[2].xyz;
    r1.x = ps;
    ps = UniformVector_2.y * r3.w;
    r3.xyz = r5.wyz * r6.zyx;
    r1.z = ps;
    r3.xyz = r5.zwy * r6.yxz - r3.xyz;
    r7.xyz = r5.zzz * LocalToWorldMatrix[1].xyz + r7.xyz;
    r4.xyz = r5.yyy * LocalToWorldMatrix[0].zyx + r7.zyx;
    ps = UniformVector_2.z * r3.w;
    r8.xyz = r3.xyz * r4.www;
    r1.w = ps;
    ps = r2.x;
    r3.y = dot(r8.zxy, r8.zxy);
    r7.x = ps;
    ps = 0.0;
    r3.z = dot(r1.wxz, r4.xzy);
    r7.y = ps;
    ps = max(r7.x, r7.y);
    r3.w = r4.z + r4.z;
    r3.x = ps;
    ps = 1.0 - r3.x;
    r7.x = r3.w * r3.z;
    r4.z = ps;
    ps = rsqrt(abs(r3.y));
    r4.xw = r3.zz * r4.yx;
    r4.y = ps;
    ps = r4.x + r4.x;
    r5.yzw = r5.ywz * r2.xxx;
    r7.y = ps;
    ps = r4.w + r4.w;
    r3 = r8.xzwy * r4.yyzy;
    r7.z = ps;
    r1.xzw = r7.xyz - r1.xzw;
    r5.yzw = r3.xwy * r2.zzz + r5.ywz;
    r3.xyw = r6.xyz * r2.yyy + r5.ywz;
    ps = -r0.z;
    r5.yzw = r3.yyy * LocalToWorldMatrix[2].xzy;
    r5.yzw = r3.www * LocalToWorldMatrix[1].xzy + r5.yzw;
    r5.yzw = r3.xxx * LocalToWorldMatrix[0].xyz + r5.ywz;
    ps = 1.0 + ps;
    r4.x = saturate(dot(r1.wxz, r5.wyz));
    r4.w = ps;
    ps = log2(r4.x);
    r1.x = r4.w * UniformVector_4.y;
    r4.x = ps;
    ps = log2(abs(r4.z));
    r4.x = r4.x * UniformScalar_1.x;
    r4.y = ps;
    ps = pow(2.0, r4.x);
    r4.z = r4.y * UniformScalar_7.x;
    r4.x = ps;
    ps = UniformVector_4.x * r0.w;
    r1.z = r5.x * r4.x;
    r1.y = ps;
    r5.xy = r1.yx - 0.5;
    r4.xy = float2((r1.xy >= 0.5));
    r5.xy = r5.xy - r1.yx;
    ps = pow(2.0, r4.z);
    r5.yz = r5.xy * r4.yx;
    r5.x = ps;
    ps = r0.w + r0.w;
    r5.yzw = r1.zyx + r5.xyz;
    r1.x = ps;
    ps = r0.z + r0.z;
    r4.zw = r5.zw + r5.zw;
    r1.y = ps;
    r3.w = tex2D(Texture2D_2, r0.xy).w;
    r3.x = tex2D(Texture2D_0, r1.xy).w;
    r0 = tex2D(Texture2D_1, r4.zw);
    ps = r3.z;
    r3.y = dot(r4.yxx, float3(1.0, 1.0, 1.0));
    r4.x = ps;
    r4.y = (r3.y == 0.0) ? r0.x : r0.y;
    ps = (-255.0);
    r3.xyz = r3.yxy + float3(-3.0, -1.0, -2.0);
    r4.z = ps;
    r4.y = (r3.z == 0.0) ? r0.z : r4.y;
    r0.y = (r3.x == 0.0) ? r0.w : r4.y;
    ps = max(r4.x, r4.z);
    r4.y = max(r0.y, 0.0);
    r4.x = ps;
    r4.xy = min(r4.xy, float2(255.0, 0.3));
    r3.xz = r4.yx * float2(3.3333333, 0.003921569);
    r5.x = r3.x * r3.y + 1.0;
    r3.xy = -r5.xy + 1.0;
    ps = 0.3 * r3.x;
    r0.x = ps;
    ps = UniformScalar_6.x;
    r4.xw = -r0.yx + 1.0;
    r4.y = saturate(ps);
    ps = r3.z;
    r4.z = r5.x * r4.x;
    r4.x = ps;
    r3.w = r4.w * r3.w + r0.x;
    r3.w = r3.w * UniformScalar_9.x + UniformScalar_8.x;
    ps = 0.0;
    r4.zw = float2((r4.yz >= float2(1.0, 0.8)));
    r4.y = ps;
    r3.w = (r4.z > 0.0) ? r3.w : UniformScalar_8.x;
    r3.y = r3.y * r3.w + r5.y;
    r3.y = r3.y * r4.w - 0.003921569;
    ps = min(r4.x, r4.y);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.yyyy)) clip(-1.0);
    r3.y = ps;
    oC0.zw = abs(r3.yy);
    oC0.xy = max(r3.zz, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
