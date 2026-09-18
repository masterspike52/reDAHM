// ps_a2e3bf687df43ad6.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 69 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 00000114 10000600 00000008 00000000 00005CC6 000F003F 00000001 0000F050 0000F155 00007256 0000F357 0000F4A0 0000F5A2
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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r1.zw = r0.xy + UniformVector_5.xy;
    r4.xy = r0.wz + UniformVector_1.xy;
    r4.zw = r0.wz + UniformVector_2.xy;
    r5.xy = r0.wz * 2.0 + UniformVector_3.xy;
    ps = SCENE_COLOR_BIAS_FACTOR.x * r3.w;
    r1.xy = r0.xy + UniformVector_6.xy;
    r5.w = ps;
    r0.yzw = tex2D(Texture2D_0, r5.xy).xyz;
    r5.xyz = tex2D(Texture2D_0, r4.zw).xyz;
    r4.xyz = tex2D(Texture2D_0, r4.xy).yzx;
    r6.xyz = tex2D(Texture2D_1, r1.zw).xyz;
    r1.xyz = tex2D(Texture2D_1, r1.xy).xyz;
    r1.xyz = r6.xzy * r1.xzy + UniformVector_0.xzy;
    ps = UniformVector_4.y * r4.x;
    r4.w = dot(r2.zxy, r2.zxy);
    r0.x = ps;
    ps = rsqrt(abs(r4.w));
    r5.xyz = r0.zyw + r5.yxz;
    r4.w = ps;
    ps = UniformVector_4.z * r4.y;
    r4.w = r4.w * r2.z;
    r0.y = ps;
    ps = UniformVector_4.x * r5.y;
    r0.yz = r0.xy * r5.xz;
    r5.x = ps;
    ps = r5.x;
    r4.w = max(r4.w, 0.0);
    ps = r4.z * ps;
    r5.x = -r4.w + 1.0;
    r0.x = ps;
    ps = abs(r5.x) * abs(r5.x);
    r4.xzw = r1.xzy + r0.xyz;
    r4.y = ps;
    ps = OpacityOverride.x * r4.y;
    oC0.xyz = r5.www * r4.xzw;
    oC0.w = ps;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
