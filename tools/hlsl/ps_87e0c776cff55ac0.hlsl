// ps_87e0c776cff55ac0.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 69 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000114 10000600 00000004 00000000 00003CA5 001F001F 00000001 00003050 00003151 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0x3)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c10); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
float4 UniformVector_5 : register(c8); // float4
float4 UniformVector_6 : register(c9); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);

struct PS_INPUT
{
    float4 texcoord0 : TEXCOORD0; // r0
    float4 texcoord1 : TEXCOORD1; // r1
    float4 texcoord5 : TEXCOORD5; // r2
    float4 texcoord6 : TEXCOORD6; // r3
    float4 texcoord7 : TEXCOORD7; // r4
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
    float4 r4 = In.texcoord7;
    float4 r5 = 0.0;
    float4 r6 = 0.0;
    float4 oC0 = 0.0;
    float ps = 0.0;

    r5.zw = r0.xy + UniformVector_5.xy;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r4.w;
    r5.xy = r0.xy + UniformVector_6.xy;
    r1.w = ps;
    r0.xy = r1.xy + UniformVector_1.xy;
    r0.zw = r1.xy + UniformVector_2.xy;
    r1.xy = r1.xy * 2.0 + UniformVector_3.xy;
    r2.yzw = tex2D(Texture2D_0, r1.xy).xyz;
    r1.xyz = tex2D(Texture2D_0, r0.zw).xyz;
    r0.xyz = tex2D(Texture2D_0, r0.xy).yzx;
    r6.xyz = tex2D(Texture2D_1, r5.zw).xyz;
    r5.xyz = tex2D(Texture2D_1, r5.xy).xyz;
    r4.xyz = r6.xzy * r5.xzy + UniformVector_0.xzy;
    ps = UniformVector_4.y * r0.x;
    r0.w = dot(r3.zxy, r3.zxy);
    r2.x = ps;
    ps = rsqrt(abs(r0.w));
    r1.xyz = r2.zyw + r1.yxz;
    r0.w = ps;
    ps = UniformVector_4.z * r0.y;
    r0.w = r0.w * r3.z;
    r2.y = ps;
    ps = UniformVector_4.x * r1.y;
    r2.yz = r2.xy * r1.xz;
    r1.x = ps;
    ps = r1.x;
    r0.w = max(r0.w, 0.0);
    ps = r0.z * ps;
    r1.x = -r0.w + 1.0;
    r2.x = ps;
    ps = abs(r1.x) * abs(r1.x);
    r0.xzw = r4.xzy + r2.xyz;
    r0.y = ps;
    ps = OpacityOverride.x * r0.y;
    oC0.xyz = r1.www * r0.xzw;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
