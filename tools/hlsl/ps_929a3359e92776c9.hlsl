// ps_929a3359e92776c9.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 231 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000039C 10000A00 00000008 00000000 00004CC6 000F003F 00000021 00003050 00003151 0000F255 00007356 0000F4A0 0000F5A1
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR1 (flags 0xF)
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
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
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
    float4 r1 = In.texcoord1;
    float4 r2 = In.texcoord5;
    float4 r3 = In.texcoord6;
    float4 r4 = In.color0;
    float4 r5 = In.color1;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.zw = r1.xy * 6.0;
    r6.x = tex2D(Texture2D_0, r0.zw).w;
    r2.y = tex2D(Texture2D_0, r1.xy).w;
    r2.x = 1.0;
    r10.w = UniformScalar_10.x * 4.0;
    r6.yzw = r5.xyz * 2.0 - 1.0;
    ps = r1.x;
    r0.w = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    r5 = r4.xywz * 2.0 - 1.0;
    ps = UniformVector_4.x * ps;
    r4.y = dot(r3.zxy, r3.zxy);
    r4.z = ps;
    ps = rsqrt(abs(r4.y));
    r4.x = -r1.y + 1.0;
    r4.y = ps;
    ps = UniformVector_4.y * r4.x;
    r4.w = dot(r5.wxy, r5.wxy);
    r4.x = ps;
    ps = rsqrt(abs(r0.w));
    r0.z = dot(r6.wyz, r6.wyz);
    r0.w = ps;
    ps = rsqrt(abs(r0.z));
    r9.xyz = r0.www * UniformVector_2.xyz;
    r0.z = ps;
    ps = (-0.5) + r4.z;
    r7.xyz = r4.yyy * r3.zxy;
    r4.y = ps;
    ps = rsqrt(abs(r4.w));
    r8.xyz = r6.ywz * r0.zzz;
    r4.w = ps;
    ps = (-0.5) + r4.x;
    r5.xyw = r5.xyw * r4.www;
    r4.w = ps;
    ps = LocalToWorldMatrix[2].x * r5.w;
    r2.zw = float2((r4.xz >= 0.5));
    r1.x = ps;
    ps = LocalToWorldMatrix[2].y * r5.w;
    r6.yz = r4.yw - r4.zx;
    r1.y = ps;
    ps = LocalToWorldMatrix[2].z * r5.w;
    r3.xyz = r5.wxy * r8.zyx;
    r1.z = ps;
    r3.xyz = r5.ywx * r8.yxz - r3.xyz;
    r10.xyz = r5.yyy * LocalToWorldMatrix[1].xyz + r1.xyz;
    r1.yz = r6.yz * r2.wz + r4.zx;
    r4.yzw = r5.xxx * LocalToWorldMatrix[0].xzy + r10.xzy;
    r10.xyz = r3.xyz * r5.zzz;
    ps = r7.x;
    r4.x = dot(r10.zxy, r10.zxy);
    r1.x = ps;
    ps = 0.0;
    r5.z = dot(r9.zxy, r4.zyw);
    r1.w = ps;
    ps = max(r1.x, r1.w);
    r0.z = r4.y + r4.y;
    r4.y = ps;
    ps = 1.0 - r4.y;
    r3.x = r0.z * r5.z;
    r0.w = ps;
    ps = rsqrt(abs(r4.x));
    r1.xw = r5.zz * r4.wz;
    r0.z = ps;
    ps = r1.x + r1.x;
    r5.xyz = r5.xwy * r7.xxx;
    r3.y = ps;
    ps = r1.w + r1.w;
    r4 = r10.wxzy * r0.wzzz;
    r3.z = ps;
    r3.xyz = r3.xyz - r9.xyz;
    r5.xyz = r4.ywz * r7.zzz + r5.xzy;
    r4.yzw = r8.xyz * r7.yyy + r5.xzy;
    r5.xyz = r4.zzz * LocalToWorldMatrix[2].xzy;
    r5.xyz = r4.www * LocalToWorldMatrix[1].xzy + r5.xyz;
    r5.xyz = r4.yyy * LocalToWorldMatrix[0].xyz + r5.xzy;
    r5.x = saturate(dot(r3.zxy, r5.zxy));
    ps = log2(r5.x);
    r5.z = UniformVector_1.x * UniformScalar_0.x;
    r5.x = ps;
    ps = log2(abs(r0.w));
    r5.y = r5.x * UniformScalar_1.x;
    r5.x = ps;
    ps = pow(2.0, r5.y);
    r5.x = r5.x * UniformScalar_7.x;
    r5.y = ps;
    ps = pow(2.0, r5.x);
    r1.x = r5.z * r5.y;
    r1.w = ps;
    r1.xzw = r1.xyz + r1.wyz;
    r4.w = tex2D(Texture2D_2, r0.xy).w;
    r5 = tex2D(Texture2D_1, r1.zw).xwyz;
    r0.y = dot(r2.wzz, float3(1.0, 1.0, 1.0));
    r0.x = dot(float4(1.0, 1.0, 1.0, -3.0), r2.wzzx);
    r0.y = (r0.y == 0.0) ? r5.x : r5.z;
    r0.z = dot(float4(1.0, 1.0, 1.0, -2.0), r2.wzzx);
    r4.y = r6.x * r2.y - 1.0;
    r5.x = (r0.z == 0.0) ? r5.w : r0.y;
    r0.y = (r0.x == 0.0) ? r5.y : r5.x;
    r4.z = max(r0.y, 0.0);
    r4.x = max(r4.x, (-255.0));
    r4.xz = min(r4.xz, float2(255.0, 0.3));
    r4.xz = r4.zx * float2(3.3333333, 0.003921569);
    r1.y = r4.x * r4.y + 1.0;
    r4.xy = -r1.yx + 1.0;
    ps = 0.3 * r4.x;
    r0.x = ps;
    ps = UniformScalar_6.x;
    r5.xw = -r0.yx + 1.0;
    r5.z = saturate(ps);
    ps = r4.z;
    r5.y = r1.y * r5.x;
    r5.x = ps;
    r4.w = r5.w * r4.w + r0.x;
    r4.w = r4.w * UniformScalar_9.x + UniformScalar_8.x;
    ps = 0.0;
    r5.zw = float2((r5.yz >= float2(0.8, 1.0)));
    r5.y = ps;
    r4.w = (r5.w > 0.0) ? r4.w : UniformScalar_8.x;
    r4.y = r4.y * r4.w + r1.x;
    r4.y = r4.y * r5.z - 0.003921569;
    ps = min(r5.x, r5.y);
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r4.yyyy)) clip(-1.0);
    r4.y = ps;
    oC0.zw = abs(r4.yy);
    oC0.xy = max(r4.zz, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
