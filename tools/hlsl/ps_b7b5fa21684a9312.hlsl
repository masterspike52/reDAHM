// ps_b7b5fa21684a9312.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 138 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000228 10000900 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
//   interpolator: r0 <-> TEXCOORD0 (flags 0xF)
//   interpolator: r1 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r3 <-> TEXCOORD7 (flags 0xF)
//   interpolator: r4 <-> COLOR0 (flags 0xF)
//   interpolator: r5 <-> COLOR2 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c19); // float
float4 UniformScalar_0 : register(c8); // float
float4 UniformScalar_1 : register(c9); // float
float4 UniformScalar_10 : register(c12); // float
float4 UniformScalar_15 : register(c13); // float
float4 UniformScalar_16 : register(c14); // float
float4 UniformScalar_17 : register(c15); // float
float4 UniformScalar_2 : register(c10); // float
float4 UniformScalar_23 : register(c16); // float
float4 UniformScalar_24 : register(c17); // float
float4 UniformScalar_25 : register(c18); // float
float4 UniformScalar_9 : register(c11); // float
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
    float4 oC0 = 0.0;

    r5.yz = tex2D(Texture2D_0, r0.xy).yz;
    r4.yz = r0.xy * float2(0.06, 0.6) + UniformVector_4.xy;
    r0.x = float((r5.z >= UniformScalar_0.x));
    r5.x = (-abs(r4.x) > 0.0) ? 1.0 : 0.0;
    r0.y = float((r5.z >= UniformScalar_23.x));
    r4.x = UniformScalar_15.x * r4.y;
    r5.yz = saturate(r0.xy + r5.yy);
    r4.w = UniformScalar_15.x * r4.z;
    r2.xyz = tex2D(Texture2D_2, r4.xw).xyz;
    r7 = tex2D(Texture2D_3, r5.xz).wxyz;
    r5 = tex2D(Texture2D_1, r5.xy).yzxw;
    r0.z = OpacityOverride.x * UniformScalar_25.x;
    r4.x = (UniformScalar_2.x > 0.0) ? 1.0 : 0.0;
    r0.x = float((UniformScalar_0.x >= 1.0));
    r0.w = (UniformScalar_10.x > 0.0) ? 1.0 : 0.0;
    r0.y = float((UniformScalar_0.x > 1.0));
    r4.y = r5.w;
    r1.z = r7.x * UniformScalar_1.x;
    r1.y = UniformScalar_1.x * r4.y;
    r1.xw = float2((UniformScalar_10.xx >= float2(0.0, 1.0)));
    r4.y = r5.z;
    r6.xyz = r5.zxy * UniformVector_2.xyz;
    r7.x = UniformVector_1.x * r4.y;
    r8.xyz = r7.yzw * UniformVector_5.xyz;
    r7.y = UniformVector_1.y * r5.x;
    r4.yzw = r8.xyz * UniformVector_1.xyz;
    r7.z = UniformVector_1.z * r5.y;
    r6.xyz = (-abs(r0.www) >= 0.0) ? r5.zxy : r6.xyz;
    r6.xyz = (-abs(r1.xxx) >= 0.0) ? r5.zxy : r6.xyz;
    r7.xyz = r7.xyz * UniformScalar_9.xxx;
    r9.x = UniformScalar_24.x * r4.y;
    r7.xyz = (-abs(r4.xxx) >= 0.0) ? 0.0 : r7.xyz;
    r1.yz = -r1.yz + 1.0;
    r9.y = UniformScalar_24.x * r4.z;
    r1.yz = saturate(r1.yz * 1e+02);
    r9.z = UniformScalar_24.x * r4.w;
    r4.xy = -r1.zy + 1.0;
    r4.z = (UniformScalar_2.x >= 0.0) ? 1.0 : 0.0;
    r7.xyz = (-abs(r4.zzz) >= 0.0) ? 0.0 : r7.xyz;
    r9.xyz = (UniformScalar_17.xxx > 0.0) ? r9.xyz : 0.0;
    r1.xyz = (UniformScalar_17.xxx >= 0.0) ? r9.xyz : 0.0;
    r7.xyz = (-abs(r1.www) >= 0.0) ? r7.xyz : 0.0;
    oC0.w = r0.z * r4.y;
    r4.x = dot(r8.zxy, r4.xxx);
    r4.y = dot(r4.yyy, r5.yzx);
    r5.xyz = r7.xyz + r6.xyz;
    r2.xyz = r2.xyz * UniformVector_3.xyz + r5.xyz;
    r5.xyz = (UniformScalar_16.xxx > 0.0) ? r2.xyz : r5.xyz;
    r4.zw = -r4.xy + 1.0;
    r4.xw = saturate(r4.wz * (-2.0) + r4.yx);
    r4.xyz = r4.xxx * r5.xyz;
    r5.xyz = r4.www * r1.xyz + r4.xyz;
    r5.xyz = (r0.yyy > 0.0) ? r4.xyz : r5.xyz;
    r4.xyz = (r0.xxx > 0.0) ? r5.xyz : r4.xyz;
    r4.xyz = r4.xyz + UniformVector_0.xyz;
    oC0.xyz = r4.xyz * r3.www + r3.xyz;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
