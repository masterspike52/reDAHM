// ps_ba5ad4d89fe19c5a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 108 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000001B0 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c14); // float
float4 UniformScalar_14 : register(c8); // float
float4 UniformScalar_21 : register(c9); // float
float4 UniformScalar_22 : register(c10); // float
float4 UniformScalar_23 : register(c11); // float
float4 UniformScalar_24 : register(c12); // float
float4 UniformScalar_25 : register(c13); // float
float4 UniformScalar_6 : register(c7); // float
float4 UniformVector_0 : register(c0); // float4
float4 UniformVector_1 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);

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

    r4.xy = r0.xy - 0.5;
    r4.z = dot(r4.xy, UniformVector_2.xy) + 0.5;
    r5.yz = r4.yx * UniformVector_1.yx;
    r5.xw = r4.yx * UniformVector_2.yx;
    r1 = r5 + float4(0.5, 0.5, 0.0, 0.0);
    r1 = r1.zwyx + r5.yxzw;
    r4.yw = r1.xy + 0.5;
    r2.yz = tex2D(Texture2D_0, r4.yw).zw;
    r5.xyz = tex2D(Texture2D_1, r0.xy).xyz;
    r4.x = tex2D(Texture2D_0, r1.zw).z;
    r4.y = tex2D(Texture2D_0, r4.yz).x;
    ps = (UniformScalar_24.x >= 0.0) ? 1.0 : 0.0;
    r1.x = float((UniformScalar_24.x > 0.0));
    r4.w = ps;
    ps = OpacityOverride.x;
    r0.x = UniformVector_3.x * UniformScalar_6.x;
    ps = UniformScalar_25.x * ps;
    r0.w = UniformScalar_14.x * UniformVector_4.x;
    r5.w = ps;
    ps = UniformVector_4.y * r4.x;
    r0.yz = UniformScalar_22.xx * UniformVector_4.yz;
    r1.y = ps;
    ps = UniformVector_4.z * r4.x;
    r5.xyz = r5.zxy * UniformScalar_21.xxx;
    r1.z = ps;
    ps = UniformScalar_6.x * r4.y;
    r1.yz = r1.yz * UniformScalar_14.xx;
    r4.z = ps;
    ps = UniformVector_4.x * r5.y;
    r2.xw = r0.xw * r4.yx;
    r0.x = ps;
    ps = UniformVector_4.y * r5.z;
    r0.zw = r5.zx * r0.yz;
    r0.y = ps;
    r4.xy = r4.zz * UniformVector_3.zy + r1.zy;
    ps = UniformVector_4.z * r5.x;
    r1.yz = r0.zw * UniformScalar_23.xx;
    r0.z = ps;
    r4.yz = (-abs(r1.xx) >= 0.0) ? r1.zy : r4.xy;
    ps = r2.x + r2.w;
    r0.xyz = r0.xyz * UniformScalar_22.xxx;
    r4.x = ps;
    ps = r2.z + r2.y;
    r0.xyz = r0.yzx * UniformScalar_23.xxx;
    r0.w = ps;
    r4.x = (-abs(r1.x) >= 0.0) ? r0.z : r4.x;
    r0.w = (-abs(r1.x) >= 0.0) ? r5.y : r0.w;
    r5.x = (-abs(r4.w) >= 0.0) ? r5.y : r0.w;
    oC0.w = r5.w * r5.x;
    r4.xyz = (-abs(r4.www) >= 0.0) ? r0.zyx : r4.xyz;
    r4.xyz = r4.xyz + UniformVector_0.xzy;
    oC0.xyz = r4.xzy * r3.www + r3.xyz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
