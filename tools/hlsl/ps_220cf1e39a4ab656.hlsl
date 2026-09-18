// ps_220cf1e39a4ab656.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 75 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000012C 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c10); // float
float4 UniformScalar_13 : register(c6); // float
float4 UniformScalar_14 : register(c7); // float
float4 UniformScalar_15 : register(c8); // float
float4 UniformScalar_16 : register(c9); // float
float4 UniformVector_0 : register(c0); // float4
float4 UniformVector_1 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
sampler2D Texture2D_0 : register(s0);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord5 : TEXCOORD5; // r1
    float4 texcoord6 : TEXCOORD6; // r2
    float4 texcoord7 : TEXCOORD7; // r3
    float4 color0 : COLOR0; // r4
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
    float4 r3 = In.texcoord7;
    float4 r4 = In.color0;
    float4 r5 = In.color2;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r4.yw = r0.yx - 0.5;
    r4.xz = r4.yw * UniformVector_1.yx;
    r4.yw = r4.yw * UniformVector_2.yx;
    r5 = r4 + float4(0.5, 0.5, 0.0, 0.0);
    r4 = r5.zwxy + r4;
    r4.xy = r4.xy + 0.5;
    r5.xyz = tex2D(Texture2D_0, r4.zw).xyz;
    r0.x = tex2D(Texture2D_0, r4.xy).w;
    r0.yzw = UniformScalar_13.xxx * UniformVector_3.xyz;
    r4.w = float((1.0 >= UniformScalar_15.x));
    ps = OpacityOverride.x;
    r4.x = float((1.0 > UniformScalar_15.x));
    r4.y = (-abs(r4.x) >= 0.0) ? r0.x : 0.0;
    ps = UniformScalar_16.x * ps;
    r5.w = r0.y * UniformScalar_14.x;
    r4.z = ps;
    ps = r5.w;
    r0.yzw = r0.yzw * r5.xyz;
    ps = r5.x * ps;
    r5.yzw = r0.yzw * UniformScalar_14.xxx;
    r5.x = ps;
    r4.y = (-abs(r4.w) >= 0.0) ? r0.x : r4.y;
    oC0.w = r4.z * r4.y;
    r4.xyz = (-abs(r4.xxx) >= 0.0) ? r5.yzw : 0.0;
    r4.xyz = (-abs(r4.www) >= 0.0) ? r5.xzw : r4.xyz;
    r4.xyz = r4.xyz + UniformVector_0.xyz;
    oC0.xyz = r4.xyz * r3.www + r3.xyz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
