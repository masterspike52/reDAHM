// ps_99251eb8e1d0f459.bin
// Xenos pixel shader decompiled to HLSL (D3D9 / SM3).
// Container flags 0x102A1100, 63 ucode dwords, 4 literal constant(s).
// Constant table creator: 2.0.6995.0 (ps_3_0)
// Shader header: 00000040 000000FC 10000400 00000004 00000000 000044A5 001F001F 00000001 00003050 0000F151 0000F255 00007356 0000F457
//   interpolator: r0 <-> TEXCOORD0 (flags 0x3)
//   interpolator: r1 <-> TEXCOORD1 (flags 0xF)
//   interpolator: r2 <-> TEXCOORD5 (flags 0xF)
//   interpolator: r3 <-> TEXCOORD6 (flags 0x7)
//   interpolator: r4 <-> TEXCOORD7 (flags 0xF)
// Definition header: 00000000 00000001 00000000 00000000
// Non-float definitions (raw): 00000000 00000000

#include "xenos_common.hlsli"

float4 OpacityOverride : register(c8); // float
float4 SCENE_COLOR_BIAS_FACTOR : register(c0); // float4
float4 UniformVector_0 : register(c3); // float4
float4 UniformVector_1 : register(c4); // float4
float4 UniformVector_2 : register(c5); // float4
float4 UniformVector_3 : register(c6); // float4
float4 UniformVector_4 : register(c7); // float4
sampler2D Texture2D_0 : register(s0);
sampler2D Texture2D_1 : register(s1);
sampler2D Texture2D_2 : register(s2);
sampler2D Texture2D_3 : register(s3);

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
    float4 oC0 = 0.0;
    float ps = 0.0;

    r0.zw = r0.xy * float2(5.0, 0.5) + UniformVector_2.xy;
    r3.yz = r0.xy * float2(48.0, 3.2) + UniformVector_3.xy;
    r2.xy = r0.xy * float2(2.5, 0.5) + UniformVector_1.xy;
    r3.xw = r0.xy * float2(8.0, 1.6) + UniformVector_4.xy;
    r2.w = tex2D(Texture2D_3, r0.xy).x;
    r3.x = tex2D(Texture2D_2, r3.xw).w;
    r2.xyz = tex2D(Texture2D_0, r2.xy).xyz;
    r0.y = tex2D(Texture2D_1, r3.yz).w;
    r0.xzw = tex2D(Texture2D_0, r0.zw).yxz;
    ps = 4.0 - r0.y;
    r2.xyz = r0.zxw + r2.xyz;
    r3.y = ps;
    r0.y = r3.y * r3.x + r0.y;
    ps = r4.w;
    r1 = r2 * r1;
    ps = SCENE_COLOR_BIAS_FACTOR.x * ps;
    r0.y = r1.w * r0.y;
    r2.x = ps;
    ps = abs(r0.y) * abs(r0.y);
    r1.yzw = r1.xyz + UniformVector_0.xyz;
    r1.x = ps;
    oC0.xyz = r2.xxx * r1.yzw;
    r0.y = r1.x * abs(r0.y);
    ps = OpacityOverride.x * r0.z;
    r0.y = min(r0.y, 1.0);
    r0.x = ps;
    oC0.w = r0.x * r0.y;

    PS_OUTPUT Out;
    Out.color0 = oC0;
    return Out;
}
