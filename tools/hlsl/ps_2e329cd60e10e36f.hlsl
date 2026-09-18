// ps_2e329cd60e10e36f.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 102 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000198 10000A00 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
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
float4 UniformScalar_10 : register(c11); // float
float4 UniformScalar_11 : register(c12); // float
float4 UniformScalar_12 : register(c13); // float
float4 UniformScalar_7 : register(c8); // float
float4 UniformScalar_8 : register(c9); // float
float4 UniformScalar_9 : register(c10); // float
float4 UniformVector_0 : register(c0); // float4
float4 UniformVector_1 : register(c3); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);
sampler2D Texture2D_4 : register(s4);
sampler2D Texture2D_5 : register(s5);

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
    float4 r6 = 0.0;
    float4 r7 = 0.0;
    float4 r8 = 0.0;
    float4 r9 = 0.0;
    float4 r10 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r6 = tex2D(Texture2D_5, r0.xy);
    r7 = tex2D(Texture2D_4, r0.xy);
    r8 = tex2D(Texture2D_3, r0.xy);
    r10 = tex2D(Texture2D_2, r0.xy);
    r9 = tex2D(Texture2D_1, r0.xy);
    r4.x = tex2D(Texture2D_0, r0.xy).z;
    ps = (UniformScalar_11.x >= 0.0) ? 1.0 : 0.0;
    r5.w = float((UniformScalar_11.x > 0.0));
    r4.w = ps;
    ps = (UniformScalar_10.x >= 0.0) ? 1.0 : 0.0;
    r4.z = float((UniformScalar_9.x >= 1.0));
    r1.w = ps;
    ps = UniformScalar_7.x;
    r5.y = float((UniformScalar_9.x > 1.0));
    ps = UniformVector_1.x * ps;
    r4.y = float((UniformScalar_8.x > 1.0));
    r5.x = ps;
    ps = (UniformScalar_10.x > 0.0) ? 1.0 : 0.0;
    r5.x = r5.x * r4.x;
    r2.w = ps;
    r0 = (-abs(r4.yyyy) >= 0.0) ? r10.wyxz : r9.wyxz;
    ps = UniformVector_1.y * r4.x;
    r5.z = float((UniformScalar_8.x >= 1.0));
    r4.y = ps;
    r0 = (-abs(r5.zzzz) >= 0.0) ? r8.wyxz : r0;
    r0 = (-abs(r5.yyyy) >= 0.0) ? r7.wyxz : r0;
    r0 = (-abs(r4.zzzz) >= 0.0) ? r6.wyxz : r0;
    oC0.w = r0.x * OpacityOverride.x;
    ps = UniformVector_1.z * r4.x;
    r2.xyz = r0.www * UniformVector_2.xyz;
    r4.z = ps;
    ps = UniformScalar_7.x * r4.y;
    r6.xyz = r0.www * UniformVector_3.xyz;
    r5.y = ps;
    ps = UniformScalar_7.x * r4.z;
    r1.xyz = r0.zzz * UniformVector_5.xyz;
    r5.z = ps;
    r1.xyz = r0.yyy * UniformVector_4.xyz + r1.xyz;
    r4.xyz = (-abs(r2.www) >= 0.0) ? r1.xyz : r6.xyz;
    r1.xyz = (-abs(r1.www) >= 0.0) ? r1.xyz : r4.xyz;
    r4.xyz = (-abs(r5.www) >= 0.0) ? r1.xyz : r2.xyz;
    r4.xyz = (-abs(r4.www) >= 0.0) ? r1.xyz : r4.xyz;
    r4.xyz = r0.xxx * UniformVector_4.xyz + r4.xyz;
    r5.xyz = (UniformScalar_12.xxx > 0.0) ? r5.xyz : r4.xyz;
    r4.xyz = (UniformScalar_12.xxx >= 0.0) ? r5.xyz : r4.xyz;
    r4.xyz = r4.xyz + UniformVector_0.xyz;
    oC0.xyz = r4.xyz * r3.www + r3.xyz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
