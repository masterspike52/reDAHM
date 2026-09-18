// ps_b5baa3bfcd24cae8.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 117 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001D4 10000500 00000008 00000000 00004CA5 0007001F 00000021 0000F050 0000F155 00007256 0000F3A0 0000F4A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> COLOR0 (flags 0xF)
//   interpolator: r4 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 UniformScalar_20 : register(c8); // float
float4 UniformScalar_21 : register(c9); // float
float4 UniformScalar_6 : register(c7); // float
float4 UniformVector_2 : register(c3); // float4
float4 UniformVector_3 : register(c4); // float4
float4 UniformVector_4 : register(c5); // float4
float4 UniformVector_5 : register(c6); // float4
sampler2D Texture2D_0 : register(s0);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r3.xyz = UniformScalar_6.xxx * float3(1.19, 0.973, 1.04);
    r4.xy = r3.yy * r0.xy + UniformVector_3.xy;
    r3.xy = r3.xx * r0.xy + UniformVector_4.xy;
    r3.zw = r3.zz * r0.xy + UniformVector_2.xy;
    r1.xyz = tex2D(Texture2D_0, r3.zw).xyz;
    r3.xyw = tex2D(Texture2D_0, r3.xy).xyz;
    r4.yzw = tex2D(Texture2D_0, r4.xy).xyz;
    r4.x = UniformScalar_21.x - 0.003921569;
    r3.z = dot(r2.zxy, r2.zxy);
    r5.xyz = r3.xyw * 2.0 + r4.yzw;
    ps = rsqrt(abs(r3.z));
    r3.xy = UniformVector_5.yz * UniformVector_5.yz;
    r3.z = ps;
    r0.xyz = r3.zzz * r2.xyz;
    r4.yzw = r5.xyz + r4.yzw;
    r4.yzw = r4.yzw - 3.0;
    r4.yzw = r1.xyz * 2.0 + r4.yzw;
    r2.xy = r3.xy * r4.zw;
    r1.xyz = r4.yzw * UniformVector_5.xyz;
    r3.yzw = (float3(0.0, 0.0, 1.0) == 0.0) ? r1.zyy : UniformVector_5.xxx;
    r1.w = r1.x * r4.y;
    r3.x = dot(r2.yx, r4.wz) + 0.0;
    r3.x = r1.w * UniformVector_5.x + r3.x;
    ps = rsqrt(abs(r3.x));
    r3.z = dot(r1.zyw, r3.yzw);
    r3.x = ps;
    ps = rsqrt(abs(r3.z));
    r3.xy = r1.xy * r3.xx;
    r3.z = ps;
    ps = 4e+01 * r3.x;
    r1.xyz = r1.xyz * r3.zzz;
    r4.y = ps;
    ps = 4e+01 * r3.y;
    r4.w = dot(r1.zxy, r0.zxy);
    r4.z = ps;
    r3.xyz = max(r4.wyz, float3(0.0, -255.0, -255.0));
    ps = 1.0 - r3.x;
    r4.yz = min(r3.yz, 255.0);
    r3.y = ps;
    ps = log2(abs(r3.y));
    r3.xz = r4.yz * 0.003921569;
    r3.y = ps;
    ps = UniformScalar_20.x * r3.y;
    r4.z = -UniformScalar_21.x + 1.0;
    r4.y = ps;
    ps = pow(2.0, r4.y);
    r3.yw = min(r3.xz, 0.0);
    r4.y = ps;
    r4.x = r4.z * r4.y + r4.x;
    if (any(float4(0.0, 0.0, 0.0, 0.0) > r4.xxxx)) clip(-1.0);
    oC0.zw = abs(r3.yw);
    oC0.xy = max(r3.xz, 0.0);

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
