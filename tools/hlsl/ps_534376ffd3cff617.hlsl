// ps_534376ffd3cff617.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 135 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 0000021C 10000D00 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c25); // float
float4 UniformScalar_11 : register(c15); // float
float4 UniformScalar_18 : register(c16); // float
float4 UniformScalar_19 : register(c17); // float
float4 UniformScalar_23 : register(c18); // float
float4 UniformScalar_29 : register(c19); // float
float4 UniformScalar_35 : register(c20); // float
float4 UniformScalar_36 : register(c21); // float
float4 UniformScalar_37 : register(c22); // float
float4 UniformScalar_38 : register(c23); // float
float4 UniformScalar_39 : register(c24); // float
float4 UniformScalar_6 : register(c13); // float
float4 UniformScalar_7 : register(c14); // float
float4 UniformVector_0 : register(c0); // float4
float4 UniformVector_1 : register(c3); // float4
float4 UniformVector_10 : register(c12); // float4
float4 UniformVector_2 : register(c4); // float4
float4 UniformVector_3 : register(c5); // float4
float4 UniformVector_4 : register(c6); // float4
float4 UniformVector_5 : register(c7); // float4
float4 UniformVector_6 : register(c8); // float4
float4 UniformVector_7 : register(c9); // float4
float4 UniformVector_8 : register(c10); // float4
float4 UniformVector_9 : register(c11); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);

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
    float4 r11 = 0.0;
    float4 r12 = 0.0;
    float4 r13 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r4.x = -r0.x + 1.0;
    r4.y = (UniformScalar_6.x > 0.0) ? 1.0 : 0.0;
    r6.w = OpacityOverride.x * UniformScalar_39.x;
    r4.z = (UniformScalar_6.x >= 0.0) ? 1.0 : 0.0;
    r4.y = (-abs(r4.z) >= 0.0) ? 0.0 : r4.y;
    r4.x = (r4.y > 0.0) ? r4.x : r0.x;
    r4.z = float((r4.y >= 0.0));
    r4.y = r0.y;
    r4.x = (-abs(r4.z) >= 0.0) ? r0.x : r4.x;
    r8 = tex2D(Texture2D_0, r4.xy);
    r2 = tex2D(Texture2D_2, r4.xy);
    r0 = tex2D(Texture2D_1, r4.xy).yzxw;
    r4.xyw = tex2D(Texture2D_3, r4.xy).xwy;
    ps = UniformScalar_37.x * r4.y;
    r4.z = r2.w + r0.w;
    r1.x = ps;
    ps = UniformVector_9.x * r4.w;
    r13.xyz = r4.xxx * UniformVector_10.xyz;
    r12.x = ps;
    ps = UniformVector_9.y * r4.w;
    r6.xyz = r4.www * UniformVector_7.xyz;
    r12.y = ps;
    ps = UniformVector_9.z * r4.w;
    r5.yzw = r4.www * UniformVector_5.xyz;
    r12.z = ps;
    ps = r0.z;
    r1.yzw = r2.xyz * UniformVector_4.xyz;
    r4.y = ps;
    ps = UniformVector_3.x * r4.y;
    r7.yzw = r0.zxy * UniformVector_2.xyz;
    r9.x = ps;
    ps = UniformVector_3.y * r0.x;
    r8.xyz = r8.xyz * UniformVector_1.xyz;
    r9.y = ps;
    ps = UniformVector_3.z * r0.y;
    r4.z = r4.z + r8.w;
    r9.z = ps;
    ps = UniformScalar_29.x * r5.y;
    r8.xyz = r8.xzy * UniformScalar_7.xxx;
    r7.x = ps;
    ps = UniformScalar_29.x * r5.z;
    r10.xyz = r7.yzw * UniformScalar_11.xxx;
    r7.y = ps;
    ps = UniformScalar_29.x * r5.w;
    r9.xyz = r9.xyz * UniformScalar_18.xxx;
    r7.z = ps;
    r11.xyz = r4.xxx * UniformVector_8.xyz - r6.xyz;
    r5.xyz = r13.xyz * UniformScalar_35.xxx - r12.xyz;
    r5.xyz = r5.xyz * r4.xxx + r12.xyz;
    r6.xyz = r11.xyz * r4.www + r6.xyz;
    r9.xyz = (UniformScalar_19.xxx >= 0.0) ? r10.xyz : r9.xyz;
    r10.xyz = r4.xxx * UniformVector_6.xyz - r7.xyz;
    r4.z = r4.z * UniformScalar_38.x + r1.x;
    oC0.w = r6.w * r4.z;
    r7.xyz = r10.xyz * r4.xxx + r7.xyz;
    r4.xyz = -r8.xzy + r9.xyz;
    r4.xyz = r4.xyz * r0.www + r8.xzy;
    r0.xyz = (UniformScalar_36.xxx > 0.0) ? r7.xyz : r6.xyz;
    r5.xyz = (UniformScalar_36.xxx >= 0.0) ? r0.xyz : r5.xyz;
    r0.xyz = r1.ywz * UniformScalar_23.xxx - r4.xzy;
    r4.xyz = r0.xyz * r2.www + r4.xzy;
    r5.xyz = -r4.xzy + r5.xyz;
    r4.xyz = r1.xxx * r5.xyz + r4.xzy;
    r4.xyz = r4.xyz + UniformVector_0.xyz;
    oC0.xyz = r4.xyz * r3.www + r3.xyz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
