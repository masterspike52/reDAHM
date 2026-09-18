// ps_ad361e88c06dd44a.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 57 ucode dwords, 0 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000000 000000E4 10000500 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c15); // float
float4 UniformScalar_13 : register(c6); // float
float4 UniformScalar_14 : register(c7); // float
float4 UniformScalar_15 : register(c8); // float
float4 UniformScalar_28 : register(c9); // float
float4 UniformScalar_29 : register(c10); // float
float4 UniformScalar_30 : register(c11); // float
float4 UniformScalar_43 : register(c12); // float
float4 UniformScalar_44 : register(c13); // float
float4 UniformScalar_45 : register(c14); // float
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

    r4.yz = r0.xy + UniformVector_1.xy;
    r4.xw = r0.xy + UniformVector_3.xy;
    r4.xw = r4.xw * UniformScalar_43.xx;
    ps = UniformScalar_13.x * r4.y;
    r5.yz = r0.xy + UniformVector_2.xy;
    r5.x = ps;
    ps = UniformScalar_13.x * r4.z;
    r5.yw = r5.yz * UniformScalar_28.xx;
    r5.z = ps;
    r5.y = tex2D(Texture2D_0, r5.yw).y;
    r5.z = tex2D(Texture2D_0, r5.xz).x;
    r5.x = tex2D(Texture2D_0, r4.xw).z;
    r0.y = UniformScalar_30.x * UniformScalar_29.x;
    ps = UniformScalar_15.x;
    r0.x = UniformScalar_45.x * UniformScalar_44.x;
    oC0.w = OpacityOverride.x;
    ps = UniformScalar_14.x * ps;
    r4.x = r0.x * r5.x;
    r0.z = ps;
    r4.y = dot(r0.zyx, r5.zyx);
    r4.yzw = r4.yyx + UniformVector_0.yzx;
    r4.x = dot(r0.zy, r5.zy) + r4.w;
    oC0.xyz = r4.xyz * r3.www + r3.xyz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
