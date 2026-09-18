// ps_c0d662fbd398aa68.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 243 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000003CC 10000A00 00000008 00000000 00005CC6 0007003F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A1 0000F5A2
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
float4 UniformVector_3 : register(c8); // float4
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

    ps = r0.w;
    r5.x = -r0.z + 1.0;
    ps = UniformVector_3.x * ps;
    r5.z = r5.x * UniformVector_3.y;
    r5.y = ps;
    r5.xw = r5.yz - 0.5;
    r9.xy = float2((r5.yz >= 0.5));
    ps = r0.w + r0.w;
    r1.xy = r5.xw - r5.yz;
    r5.x = ps;
    r5.yz = r1.xy * r9.xy + r5.yz;
    ps = r0.z + r0.z;
    r5.zw = r5.yz + r5.yz;
    r5.y = ps;
    r1.x = tex2D(Texture2D_2, r0.xy).w;
    r6 = tex2D(Texture2D_0, r5.zw);
    r5.xyz = tex2D(Texture2D_1, r5.xy).xyw;
    r0 = r3.yxzw * 2.0 - 1.0;
    r3.y = dot(UniformVector_2.zxy, UniformVector_2.zxy);
    r3.x = dot(r2.zxy, r2.zxy);
    r8.xyz = r4.xyz * 2.0 - 1.0;
    r3.z = dot(r8.zxy, r8.zxy);
    r1.yz = r5.xy * 2.0 - 1.0;
    ps = rsqrt(abs(r3.x));
    r1.w = r5.z - 1.0;
    r9.w = ps;
    ps = rsqrt(abs(r3.y));
    r3.x = dot(r0.zyx, r0.zyx);
    r3.w = ps;
    ps = rsqrt(abs(r3.x));
    r5.xzw = r9.www * r2.zxy;
    r3.x = ps;
    r4.yzw = (float3(0.0, 0.0, 1.0) == 0.0) ? r5.zww : r2.zzz;
    r7.yzw = r0.xyz * r3.xxx;
    r3.x = dot(r9.xyy, float3(1.0, 1.0, 1.0));
    r4.x = (r3.x == 0.0) ? r6.x : r6.y;
    r3.xy = r3.xx + float2(-2.0, -3.0);
    r3.x = (r3.x == 0.0) ? r6.z : r4.x;
    r3.y = (r3.y == 0.0) ? r6.w : r3.x;
    r3.x = max(r3.y, 0.0);
    r3.x = min(r3.x, 0.3);
    ps = 3.3333333 * r3.x;
    r2.xyz = r7.zyw * r5.xxx;
    r3.x = ps;
    ps = UniformScalar_6.x;
    r9.xyz = r3.xxx * r1.yzw;
    r4.x = saturate(ps);
    ps = UniformScalar_10.x;
    r10.xyz = r9.zxy + float3(1.0, 0.0, 0.0);
    r3.x = dot(r10.zy, r9.yx) + 1.0;
    ps = 4.0 * ps;
    r4.y = dot(r4.yzw, r9.xyw);
    r8.w = ps;
    ps = rsqrt(abs(r3.x));
    r10.w = max(r4.y, 0.0);
    r1.y = ps;
    ps = 1.0 - r3.y;
    r6.yz = -r10.xw + 1.0;
    r1.z = ps;
    ps = rsqrt(abs(r3.z));
    r4.zw = r10.xz * r1.zy;
    r6.x = ps;
    ps = log2(abs(r6.z));
    r4.y = r6.y * 0.3;
    r3.y = ps;
    ps = UniformVector_2.x * r3.w;
    r6 = r8.xzyw * r6.xxxz;
    r0.x = ps;
    ps = UniformVector_2.y * r3.w;
    r5.xy = float2((r4.xz >= float2(1.0, 0.8)));
    r0.y = ps;
    ps = r6.w;
    r8.xyz = r7.wyz * r6.zxy;
    r0.z = ps;
    r8.xyz = r7.ywz * r6.yxz - r8.xzy;
    ps = (-255.0);
    r8.xyz = r8.xzy * r0.www;
    r0.w = ps;
    ps = max(r0.z, r0.w);
    r3.z = dot(r8.yxz, r8.yxz);
    r3.x = ps;
    ps = rsqrt(abs(r3.z));
    r3.x = min(r3.x, 255.0);
    r3.z = ps;
    ps = r9.x;
    r8.xyz = r8.xzy * r3.zzz;
    r2.xyz = r8.xzy * r5.www + r2.xzy;
    ps = r1.y * ps;
    r4.xzw = r8.xzy * r4.www;
    r3.z = ps;
    r4.x = r6.x * r3.z + r4.x;
    r4.zw = r6.zy * r3.zz + r4.wz;
    r2.xyz = r6.xzy * r5.zzz + r2.xzy;
    ps = 1.0 - r4.y;
    r6.xyz = r2.zzz * LocalToWorldMatrix[2].xzy;
    r7.x = ps;
    r1 = r7.ywxz * r1.yyxy + r4.zwyx;
    r4.xyz = r2.yyy * LocalToWorldMatrix[1].xzy + r6.xyz;
    r4.xzw = r2.xxx * LocalToWorldMatrix[0].xyz + r4.xzy;
    ps = UniformVector_2.z * r3.w;
    r2.xyz = r1.yyy * LocalToWorldMatrix[2].xzy;
    r0.z = ps;
    r3.z = r1.z * UniformScalar_9.x + UniformScalar_8.x;
    r3.w = (r5.x > 0.0) ? r3.z : UniformScalar_8.x;
    r1.xyz = r1.xxx * LocalToWorldMatrix[1].xzy + r2.xyz;
    r1.xyz = r1.www * LocalToWorldMatrix[0].xyz + r1.xzy;
    ps = UniformVector_1.x;
    r3.z = dot(r0.zxy, r1.zxy);
    ps = UniformScalar_0.x * ps;
    r1.xyz = r3.zzz * r1.xyz;
    r4.y = ps;
    r0.xyz = r1.xyz * 2.0 - r0.xyz;
    ps = UniformScalar_7.x * r3.y;
    r3.z = saturate(dot(r0.zxy, r4.wxz));
    r3.y = ps;
    ps = log2(r3.z);
    r3.x = r3.x * 0.003921569;
    r3.z = ps;
    ps = pow(2.0, r3.y);
    r4.x = r3.z * UniformScalar_1.x;
    r3.y = ps;
    ps = pow(2.0, r4.x);
    r3.z = min(r3.x, 0.0);
    r4.x = ps;
    r3.y = r4.y * r4.x + r3.y;
    ps = 1.0 - r3.y;
    r4.x = ps;
    r3.y = r4.x * r3.w + r3.y;
    r3.y = r3.y * r5.y - 0.003921569;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.yyyy)) clip(-1.0);
    oC0.zw = abs(r3.zz);
    oC0.xy = max(r3.xx, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
