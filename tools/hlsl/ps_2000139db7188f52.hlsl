// ps_2000139db7188f52.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 267 ucode dwords, 8 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000080 0000042C 10000900 00000008 00000000 00004CA5 0007001F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000003 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformScalar_1 : register(c10); // float
float4 UniformScalar_2 : register(c11); // float
float4 UniformScalar_27 : register(c15); // float
float4 UniformScalar_34 : register(c16); // float
float4 UniformScalar_35 : register(c17); // float
float4 UniformScalar_36 : register(c18); // float
float4 UniformScalar_37 : register(c19); // float
float4 UniformScalar_38 : register(c20); // float
float4 UniformScalar_4 : register(c12); // float
float4 UniformScalar_40 : register(c21); // float
float4 UniformScalar_41 : register(c22); // float
float4 UniformScalar_45 : register(c23); // float
float4 UniformScalar_52 : register(c24); // float
float4 UniformScalar_53 : register(c25); // float
float4 UniformScalar_54 : register(c26); // float
float4 UniformScalar_8 : register(c13); // float
float4 UniformScalar_9 : register(c14); // float
float4 UniformVector_3 : register(c3); // float4
float4 UniformVector_4 : register(c4); // float4
float4 UniformVector_5 : register(c5); // float4
float4 UniformVector_6 : register(c6); // float4
float4 UniformVector_7 : register(c7); // float4
float4 UniformVector_8 : register(c8); // float4
float4 UniformVector_9 : register(c9); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 color0 : COLOR0; // r3
    float4 color2 : COLOR2; // r4
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
    float4 r4 = In.color2;
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3.xy = r0.xy * UniformScalar_36.xx;
    r3.y = tex2D(Texture2D_3, r3.xy).x;
    r6.xy = r0.xy * UniformScalar_1.xx;
    r3.xz = UniformVector_3.xy * UniformScalar_8.xx;
    ps = UniformScalar_37.x * r3.y;
    r3.xz = r3.xz * UniformScalar_4.xx;
    r3.w = ps;
    r1.yzw = r3.wxz + r0.zxy;
    r5 = r1.zwzw * float4(1.03, 1.03, 1.01, 1.01);
    ps = r0.w;
    r4 = r1.zwzw * float4(1.09, 1.09, 1.07, 1.07);
    r1.x = ps;
    r3.xz = r4.zw * UniformScalar_9.xx + UniformVector_6.xy;
    r4.xz = r4.xy * UniformScalar_9.xx + UniformVector_7.xy;
    r4.yw = r5.xy * UniformScalar_27.xx + UniformVector_9.xy;
    r6.zw = r5.zw * UniformScalar_27.xx + UniformVector_8.xy;
    r7.xy = r5.xy * UniformScalar_9.xx + UniformVector_5.xy;
    r5.xy = r5.zw * UniformScalar_9.xx + UniformVector_4.xy;
    r5.xyz = tex2D(Texture2D_1, r5.xy).xyz;
    r7.xyz = tex2D(Texture2D_1, r7.xy).xyz;
    r9.xy = tex2D(Texture2D_2, r6.zw).xy;
    r3.w = tex2D(Texture2D_0, r6.xy).x;
    r4.yw = tex2D(Texture2D_2, r4.yw).xy;
    r8.xyz = tex2D(Texture2D_1, r4.xz).xyz;
    r6.xyz = tex2D(Texture2D_1, r3.xz).xyz;
    r1.xyz = tex2D(Texture2D_4, r1.xy).yxw;
    r4.x = tex2D(Texture2D_4, r0.wz).w;
    r3.x = dot(r2.zxy, r2.zxy);
    r4.z = r4.x * UniformScalar_53.x + UniformScalar_52.x;
    r8.z = r8.z * 2.0 + r6.z;
    ps = rsqrt(abs(r3.x));
    r0.yz = r4.yw + r4.yw;
    r3.z = ps;
    r3.x = r1.z * UniformScalar_38.x + UniformScalar_40.x;
    ps = (-1.0) + r3.w;
    r2.xyz = r3.zzz * r2.xzy;
    r3.z = ps;
    ps = UniformScalar_2.x * r3.z;
    r4.y = max(r2.y, 0.0);
    r0.x = ps;
    r0.yzw = r0.xyz + float3(1.0, -2.0, -2.0);
    r3.zw = r9.xy * 2.0 + r0.zw;
    r3.zw = r3.zw * UniformScalar_34.xx + r8.xy;
    r8.xy = r3.zw + r8.xy;
    r8.xyz = r8.xyz + r6.xyz;
    r6.z = r8.z + r7.z;
    r6.xy = r8.xy + r6.xy;
    r6.yzw = r6.xyz + r7.xyz;
    ps = r1.y + r1.y;
    r3.zw = r6.yz + r7.xy;
    r1.y = ps;
    ps = 1.0000007 * r3.x;
    r7.xy = r3.zw - 4.0;
    r6.x = ps;
    ps = r1.x + r1.x;
    r7.zw = r6.wx + float2(-4.0, 0.5);
    r1.w = ps;
    ps = 1.0 - r4.x;
    r6.xyz = r7.zxy + r5.zxy;
    r3.z = ps;
    ps = 1.0 - r4.y;
    r1.z = r6.x + r5.z;
    r3.x = ps;
    ps = abs(r3.x) * abs(r3.x);
    r8.xy = -r2.xz * 1.8;
    r0.x = ps;
    ps = UniformScalar_35.x * r0.y;
    r6.xw = -r0.yx + 1.0;
    r8.z = ps;
    ps = frac(r7.w);
    r0.xyz = r8.xyz * r6.www;
    r3.x = ps;
    ps = 6.2831855 * r3.x;
    r6.yz = r6.yz + r5.xy;
    r1.x = ps;
    ps = 1.0 - r3.y;
    r5.yzw = r1.ywx + float3(-1.0, -1.0, -3.1415927);
    r5.x = ps;
    ps = cos(r5.w);
    r0 = r0.xyzz * r6.xxyz;
    r3.x = ps;
    ps = (-1.0) * r3.x;
    r1.xy = r5.xz * r5.yx;
    r3.y = ps;
    ps = 1.0 * r3.x;
    r1.xyw = r1.xxy * float3(-1.0, 1.0, 1.0);
    r3.w = ps;
    r3.xyw = r1.yxw * r3.ywy;
    ps = r0.x + r0.z;
    r4.xyw = r3.xwy * r4.xxx;
    r3.x = ps;
    ps = r0.y + r0.w;
    r4.xyw = r4.xyw * r3.zzz;
    r3.y = ps;
    r1.xyw = r4.xyw * UniformScalar_41.xxx + r3.xyx;
    r3.x = dot(r1.zxy, r1.zxy);
    ps = rsqrt(abs(r3.x));
    r3.y = dot(r1.zyx, r1.zyw);
    r3.x = ps;
    ps = rsqrt(abs(r3.y));
    r3.y = ps;
    ps = r1.y;
    r3.xzw = r1.xyz * r3.xxx;
    ps = r3.y * ps;
    r3.w = dot(r2.yxz, r3.wxz);
    r3.x = ps;
    ps = 4.0 * r3.x;
    r3.z = ps;
    r4.yw = r3.yz * UniformScalar_54.xx;
    r3.x = r4.y * r1.x;
    ps = 4.0 * r3.x;
    r4.x = ps;
    r3.xy = max(r4.xw, (-255.0));
    r3.yz = min(r3.xy, 255.0);
    r3.yzw = r3.wyz * float3(0.5, 0.003921569, 0.003921569);
    ps = 0.5 + r3.y;
    r3.x = ps;
    ps = abs(r3.x) * abs(r3.x);
    r3.x = ps;
    r3.x = -r3.x * r3.x + 1.0;
    ps = log2(abs(r3.x));
    r3.y = ps;
    ps = UniformScalar_45.x * r3.y;
    r3.x = ps;
    ps = pow(2.0, r3.x);
    r4.xy = min(r3.zw, 0.0);
    r3.x = ps;
    ps = 0.7 * r3.x;
    r3.x = ps;
    ps = 1.0 - r3.x;
    r4.w = ps;
    r3.x = r4.w * r4.z + r3.x;
    ps = (-0.003921569) - -r3.x;
    r3.x = ps;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r3.xxxx)) clip(-1.0);
    oC0.zw = abs(r4.xy);
    oC0.xy = max(r3.zw, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
