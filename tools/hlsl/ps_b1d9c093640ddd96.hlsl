// ps_b1d9c093640ddd96.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 231 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000039C 10000A00 00000008 00000000 00005CC6 0007003F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A1 0000F5A2
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
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.xy = r0.wz * 6.0;
    r6.x = tex2D(Texture2D_0, r5.xy).w;
    r1.y = tex2D(Texture2D_0, r0.wz).w;
    r1.x = 1.0;
    r10.w = UniformScalar_10.x * 4.0;
    r5.yzw = r4.xyz * 2.0 - 1.0;
    ps = r0.w;
    r1.z = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    r4 = r3.xywz * 2.0 - 1.0;
    ps = UniformVector_4.x * ps;
    r3.y = dot(r2.zxy, r2.zxy);
    r3.z = ps;
    ps = rsqrt(abs(r3.y));
    r3.x = -r0.z + 1.0;
    r3.y = ps;
    ps = UniformVector_4.y * r3.x;
    r3.w = dot(r4.wxy, r4.wxy);
    r3.x = ps;
    ps = rsqrt(abs(r1.z));
    r5.x = dot(r5.wyz, r5.wyz);
    r1.z = ps;
    ps = rsqrt(abs(r5.x));
    r9.xyz = r1.zzz * UniformVector_2.xyz;
    r5.x = ps;
    ps = (-0.5) + r3.z;
    r7.xyz = r3.yyy * r2.zxy;
    r3.y = ps;
    ps = rsqrt(abs(r3.w));
    r8.xyz = r5.ywz * r5.xxx;
    r3.w = ps;
    ps = (-0.5) + r3.x;
    r4.xyw = r4.xyw * r3.www;
    r3.w = ps;
    ps = LocalToWorldMatrix[2].x * r4.w;
    r1.zw = float2((r3.xz >= 0.5));
    r5.x = ps;
    ps = LocalToWorldMatrix[2].y * r4.w;
    r6.yz = r3.yw - r3.zx;
    r5.y = ps;
    ps = LocalToWorldMatrix[2].z * r4.w;
    r2.xyz = r4.wxy * r8.zyx;
    r5.z = ps;
    r2.xyz = r4.ywx * r8.yxz - r2.xyz;
    r10.xyz = r4.yyy * LocalToWorldMatrix[1].xyz + r5.xyz;
    r5.yz = r6.yz * r1.wz + r3.zx;
    r3.yzw = r4.xxx * LocalToWorldMatrix[0].xzy + r10.xzy;
    r10.xyz = r2.xyz * r4.zzz;
    ps = r7.x;
    r3.x = dot(r10.zxy, r10.zxy);
    r2.x = ps;
    ps = 0.0;
    r4.z = dot(r9.zxy, r3.zyw);
    r2.y = ps;
    ps = max(r2.x, r2.y);
    r5.x = r3.y + r3.y;
    r3.y = ps;
    ps = 1.0 - r3.y;
    r2.x = r5.x * r4.z;
    r5.w = ps;
    ps = rsqrt(abs(r3.x));
    r2.yz = r4.zz * r3.wz;
    r5.x = ps;
    ps = r2.y + r2.y;
    r4.xyz = r4.xwy * r7.xxx;
    r2.y = ps;
    ps = r2.z + r2.z;
    r3 = r10.wxzy * r5.wxxx;
    r2.z = ps;
    r2.xyz = r2.xyz - r9.xyz;
    r4.xyz = r3.ywz * r7.zzz + r4.xzy;
    r3.yzw = r8.xyz * r7.yyy + r4.xzy;
    r4.xyz = r3.zzz * LocalToWorldMatrix[2].xzy;
    r4.xyz = r3.www * LocalToWorldMatrix[1].xzy + r4.xyz;
    r4.xyz = r3.yyy * LocalToWorldMatrix[0].xyz + r4.xzy;
    r4.x = saturate(dot(r2.zxy, r4.zxy));
    ps = log2(r4.x);
    r4.z = UniformVector_1.x * UniformScalar_0.x;
    r4.x = ps;
    ps = log2(abs(r5.w));
    r4.y = r4.x * UniformScalar_1.x;
    r4.x = ps;
    ps = pow(2.0, r4.y);
    r4.x = r4.x * UniformScalar_7.x;
    r4.y = ps;
    ps = pow(2.0, r4.x);
    r5.x = r4.z * r4.y;
    r5.w = ps;
    r5.xzw = r5.xyz + r5.wyz;
    r3.w = tex2D(Texture2D_2, r0.xy).w;
    r4 = tex2D(Texture2D_1, r5.zw).xwyz;
    r0.x = dot(r1.wzz, float3(1.0, 1.0, 1.0));
    r5.y = dot(float4(1.0, 1.0, 1.0, -3.0), r1.wzzx);
    r0.x = (r0.x == 0.0) ? r4.x : r4.z;
    r0.y = dot(float4(1.0, 1.0, 1.0, -2.0), r1.wzzx);
    r3.y = r6.x * r1.y - 1.0;
    r4.x = (r0.y == 0.0) ? r4.w : r0.x;
    r0.y = (r5.y == 0.0) ? r4.y : r4.x;
    r3.z = max(r0.y, 0.0);
    r3.x = max(r3.x, (-255.0));
    r3.xz = min(r3.xz, float2(255.0, 0.3));
    r3.xz = r3.zx * float2(3.3333333, 0.003921569);
    r5.y = r3.x * r3.y + 1.0;
    r3.xy = -r5.yx + 1.0;
    ps = 0.3 * r3.x;
    r0.x = ps;
    ps = UniformScalar_6.x;
    r4.xw = -r0.yx + 1.0;
    r4.z = saturate(ps);
    ps = r3.z;
    r4.y = r5.y * r4.x;
    r4.x = ps;
    r3.w = r4.w * r3.w + r0.x;
    r3.w = r3.w * UniformScalar_9.x + UniformScalar_8.x;
    ps = 0.0;
    r4.zw = float2((r4.yz >= float2(0.8, 1.0)));
    r4.y = ps;
    r3.w = (r4.w > 0.0) ? r3.w : UniformScalar_8.x;
    r3.y = r3.y * r3.w + r5.x;
    r3.y = r3.y * r4.z - 0.003921569;
    ps = min(r4.x, r4.y);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.yyyy)) clip(-1.0);
    r3.y = ps;
    oC0.zw = abs(r3.yy);
    oC0.xy = max(r3.zz, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
